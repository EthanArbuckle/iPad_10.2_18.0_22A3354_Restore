@implementation _GEOPlaceDataItem

- (int)referenceFrame
{
  return -[GEOPDPlace referenceFrame](self->_placeData, "referenceFrame");
}

- (NSTimeZone)timezone
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__53;
  v8 = __Block_byref_object_dispose__53;
  v9 = 0;
  geo_reentrant_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSTimeZone *)v2;
}

- (GEOMapRegion)geoFenceMapRegion
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  GEOMapRegion *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (-[GEOPDBounds _readMapRegion](v3), *(_QWORD *)(v4 + 32))
    && (-[GEOPDBounds mapRegion]((id *)v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isValid"),
        v5,
        v6))
  {
    -[GEOPDBounds mapRegion]((id *)v4);
    v7 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_GEOPlaceDataItem coordinate](self, "coordinate");
    if (fabs(v9 + 180.0) >= 0.00000001 || fabs(v8 + 180.0) >= 0.00000001)
    {
      +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", self->_placeData);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (-[GEOPDPlaceInfo _readCenter](v10), *(_QWORD *)(v11 + 40)))
      {
        -[_GEOPlaceDataItem addressObject](self, "addressObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "hasKnownAccuracy"))
        {
          -[_GEOPlaceDataItem addressObject](self, "addressObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "knownAccuracy"))
            v14 = 100.0;
          else
            v14 = 50.0;

        }
        else
        {
          v14 = 100.0;
        }

        -[GEOPDPlaceInfo center]((id *)v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "coordinate");
        v18 = GEOMapRectMakeWithRadialDistance(v16, v17, v14);
        v20 = v19;
        v22 = v21;
        v24 = v23;

        v7 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v18, v20, v22, v24);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (GEOPDPlace)_placeData
{
  return self->_placeData;
}

- (BOOL)isValid
{
  GEOPDPlace *placeData;

  placeData = self->_placeData;
  if (placeData)
    LOBYTE(placeData) = -[GEOPDPlace statusCodeIsValid](placeData, "statusCodeIsValid");
  return (char)placeData;
}

- (GEOMapItemClientAttributes)_clientAttributes
{
  return 0;
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 detourInfo:(id)a4 additionalPlaceDatas:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _GEOPlaceDataItem *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "_geo_compactMap:", &__block_literal_global_102);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_GEOPlaceDataItem initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:](self, "initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:", v9, 0, 0, v8, 0, v10);

  return v11;
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 attributionMap:(id)a4 disambiguationLabel:(id)a5 detourInfo:(id)a6 externalTransitStationCode:(id)a7 additionalPlaces:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _GEOPlaceDataItem *v20;
  GEOMapItemIdentifier *v21;
  GEOMapItemIdentifier *identifier;
  uint64_t v23;
  geo_isolater *lazyIvarIsolater;
  uint64_t v25;
  geo_reentrant_isolater *lazyReentrantIvarIsolater;
  NSMapTable *v27;
  void *attributionMap;
  void *v29;
  GEOMapItemDetourInfo *v30;
  GEOMapItemDetourInfo *detourInfo;
  uint64_t v32;
  NSData *externalTransitStationCode;
  _GEOPlaceDataItem *v34;
  _GEOPlaceDataItem *v36;
  id v37;
  _QWORD v38[4];
  _GEOPlaceDataItem *v39;
  objc_super v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v37 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v40.receiver = self;
  v40.super_class = (Class)_GEOPlaceDataItem;
  v20 = -[_GEOPlaceDataItem init](&v40, sel_init);
  if (v20)
  {
    v21 = -[GEOMapItemIdentifier initWithPlace:]([GEOMapItemIdentifier alloc], "initWithPlace:", v15);
    identifier = v20->_identifier;
    v20->_identifier = v21;

    objc_storeStrong((id *)&v20->_placeData, a3);
    v23 = geo_isolater_create_with_format();
    lazyIvarIsolater = v20->_lazyIvarIsolater;
    v20->_lazyIvarIsolater = (geo_isolater *)v23;

    v36 = v20;
    v25 = geo_reentrant_isolater_create_with_format();
    lazyReentrantIvarIsolater = v20->_lazyReentrantIvarIsolater;
    v20->_lazyReentrantIvarIsolater = (geo_reentrant_isolater *)v25;

    if (v16)
    {
      v27 = (NSMapTable *)v16;
      attributionMap = v20->_attributionMap;
      v20->_attributionMap = v27;
    }
    else
    {
      v41[0] = v20->_placeData;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1, v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _attributionsToRequestForPlaceDatas(v29);
      attributionMap = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(attributionMap, "count"))
      {
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __129___GEOPlaceDataItem_initWithPlaceData_attributionMap_disambiguationLabel_detourInfo_externalTransitStationCode_additionalPlaces___block_invoke;
        v38[3] = &unk_1E1C0CFE8;
        v39 = v20;
        _loadAttributions(attributionMap, v38);

      }
    }

    objc_storeStrong((id *)&v20->_disambiguationLabel, a5);
    if (v17)
    {
      v30 = -[GEOMapItemDetourInfo initWithResultDetourInfo:]([GEOMapItemDetourInfo alloc], "initWithResultDetourInfo:", v17);
      detourInfo = v20->_detourInfo;
      v20->_detourInfo = v30;

    }
    v32 = objc_msgSend(v18, "copy", v36);
    externalTransitStationCode = v20->_externalTransitStationCode;
    v20->_externalTransitStationCode = (NSData *)v32;

    objc_storeStrong((id *)&v20->_additionalPlaces, a8);
    v34 = v20;
  }

  return v20;
}

- (NSArray)_additionalPlaceInfos
{
  return self->_additionalPlaces;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return self->_detourInfo;
}

- (int)_resultProviderID
{
  GEOPDPlace *placeData;

  placeData = self->_placeData;
  if (placeData && -[GEOPDPlace hasResultProviderId](placeData, "hasResultProviderId"))
    return -[GEOPDPlace resultProviderId](self->_placeData, "resultProviderId");
  else
    return 0;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  id *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", self->_placeData);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[GEOPDPlaceInfo _readEnhancedCenter](v3);
    if (*(_QWORD *)(v4 + 48))
    {
      -[GEOPDPlaceInfo enhancedCenter]((id *)v4);
      v5 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = v5;
      objc_msgSend(v5, "coordinate");
      v8 = v7;
      v10 = v9;
      goto LABEL_7;
    }
    -[GEOPDPlaceInfo _readCenter](v4);
    if (*(_QWORD *)(v4 + 40))
    {
      -[GEOPDPlaceInfo center]((id *)v4);
      v5 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:](GEOPDSpatialLookupResult, "spatialLookupResultForPlaceData:", self->_placeData);
  v13 = objc_claimAutoreleasedReturnValue();
  v6 = (id *)v13;
  if (v13 && (-[GEOPDSpatialLookupResult _readCenter](v13), v6[7]))
  {
    -[GEOPDSpatialLookupResult center](v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinate");
    v8 = v15;
    v10 = v16;
  }
  else
  {
    +[GEOPDRoadAccessInfo roadAccessInfoForPlaceData:](GEOPDRoadAccessInfo, "roadAccessInfoForPlaceData:", self->_placeData);
    v17 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v17;
    if (v17
      && objc_msgSend(*(id *)(v17 + 16), "count")
      && (-[GEOPDRoadAccessInfo roadAccessPointAtIndex:]((id *)v14, 0),
          (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = v18;
      objc_msgSend(v18, "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "coordinate");
      v8 = v21;
      v10 = v22;

    }
    else
    {
      -[_GEOPlaceDataItem _iso3166Value]((uint64_t)self);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v8 = 0xC066800000000000;
      if (v23)
      {
        -[GEOPDISO3166Code _readLocation](v23);
        v10 = 0xC066800000000000;
        if (*(_QWORD *)(v24 + 32))
        {
          -[GEOPDISO3166Code location]((id *)v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "coordinate");
          v8 = v26;
          v10 = v27;

        }
      }
      else
      {
        v10 = 0xC066800000000000;
      }

    }
  }

LABEL_7:
  v11 = *(double *)&v8;
  v12 = *(double *)&v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (BOOL)isDisputed
{
  return -[GEOPDPlace isDisputed](self->_placeData, "isDisputed");
}

- (unint64_t)_muid
{
  return -[GEOMapItemIdentifier muid](self->_identifier, "muid");
}

- (NSArray)areasOfInterest
{
  void *v2;
  void *v3;
  void *v4;

  -[_GEOPlaceDataItem geoAddress](self, "geoAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "structuredAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "areaOfInterests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSDictionary)addressDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_GEOPlaceDataItem geoAddress](self, "geoAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    -[_GEOPlaceDataItem name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Name"));
    }

  }
  return (NSDictionary *)v4;
}

- (GEOAddress)geoAddress
{
  return (GEOAddress *)+[GEOAddress geoAddressForPlaceData:](GEOAddress, "geoAddressForPlaceData:", self->_placeData);
}

- (NSString)name
{
  geo_isolate_sync();
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritizedBusinessHours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_lazyReentrantIvarIsolater, 0);
  objc_storeStrong((id *)&self->_allPhotoAttributions, 0);
  objc_storeStrong((id *)&self->_relatedPlacesByComponentId, 0);
  objc_storeStrong((id *)&self->_placecardLayoutData, 0);
  objc_storeStrong((id *)&self->_captionedPhotoAlbums, 0);
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_additionalPlaces, 0);
  objc_storeStrong((id *)&self->_venueInfo, 0);
  objc_storeStrong((id *)&self->_storefrontPresentationInfo, 0);
  objc_storeStrong((id *)&self->_storefrontInfo, 0);
  objc_storeStrong((id *)&self->_encyclopedicInfo, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_lazyIvarIsolater, 0);
  objc_storeStrong((id *)&self->_externalTransitStationCode, 0);
  objc_storeStrong((id *)&self->_detourInfo, 0);
  objc_storeStrong((id *)&self->_disambiguationLabel, 0);
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)_iso3166SubdivisionCode
{
  id *v2;
  void *v3;

  -[_GEOPlaceDataItem _iso3166Value]((uint64_t)self);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDISO3166Code subdivisonCode](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_iso3166CountryCode
{
  id *v2;
  void *v3;

  -[_GEOPlaceDataItem _iso3166Value]((uint64_t)self);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDISO3166Code countryCode](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_iso3166Value
{
  id *v1;
  void *v2;
  id *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "componentOfType:options:", 77, 3);
    v1 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponent values](v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentValue iso3166Code](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)addressObject
{
  geo_isolate_sync();
  return self->_addressObject;
}

- (int)_placeType
{
  geo_isolate_sync();
  return self->_placeType;
}

- (GEOMapItemIdentifier)_identifier
{
  return self->_identifier;
}

- (int)_addressGeocodeAccuracy
{
  void *v3;
  int v4;
  void *v5;
  unsigned int v6;
  int v7;

  -[_GEOPlaceDataItem addressObject](self, "addressObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasKnownAccuracy");

  if (!v4)
    return -1;
  -[_GEOPlaceDataItem addressObject](self, "addressObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "knownAccuracy");
  if (v6 >= 6)
    v7 = -1;
  else
    v7 = v6;

  return v7;
}

- (NSString)_poiCategory
{
  void *v2;
  void *v3;
  void *v4;

  -[_GEOPlaceDataItem _styleAttributes](self, "_styleAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "categoryForPOIType:", objc_msgSend(v2, "poiType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  void *v2;
  GEOFeatureStyleAttributes *v3;

  -[_GEOPlaceDataItem _placeDataStyleAttributes](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOFeatureStyleAttributes initWithPlaceDataStyleAttributes:]([GEOFeatureStyleAttributes alloc], "initWithPlaceDataStyleAttributes:", v2);
  else
    v3 = 0;

  return v3;
}

- (_QWORD)_placeDataStyleAttributes
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__53;
    v13 = __Block_byref_object_dispose__53;
    v14 = 0;
    v2 = MEMORY[0x1E0C809B0];
    v3 = (void *)a1[3];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke;
    v8[3] = &unk_1E1C09718;
    v8[4] = &v9;
    objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 16, v8);
    v4 = (void *)v10[5];
    if (!v4)
    {
      v5 = (void *)v1[3];
      v7[0] = v2;
      v7[1] = 3221225472;
      v7[2] = __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke_2;
      v7[3] = &unk_1E1C09718;
      v7[4] = &v9;
      objc_msgSend(v5, "enumerateValidComponentValuesOfType:usingBlock:", 1, v7);
      v4 = (void *)v10[5];
    }
    v1 = v4;
    _Block_object_dispose(&v9, 8);

  }
  return v1;
}

- (int)_wifiFingerprintLabelType
{
  uint64_t v2;
  int v3;
  int v4;

  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (*(_BYTE *)(v2 + 28) & 2) != 0)
  {
    v4 = *(_DWORD *)(v2 + 20);
    if (v4 == 2)
      v3 = 2;
    else
      v3 = v4 == 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unsigned)_wifiFingerprintConfidence
{
  uint64_t v2;
  unsigned int v3;

  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (*(_BYTE *)(v2 + 28) & 1) != 0)
    v3 = *(_DWORD *)(v2 + 16);
  else
    v3 = 0;

  return v3;
}

- (id)_wifiFingerprintComponent
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 24), "components");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    v5 = &OBJC_IVAR___GEOXPCReply__methodName;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v1);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v7 && (*(_WORD *)(v7 + 100) & 0x80) != 0 && *(_DWORD *)(v7 + v5[732]) == 51)
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          -[GEOPDComponent values]((id *)v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v17;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v17 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
                if (v13 && *(_QWORD *)(v13 + 760))
                {
                  -[GEOPDComponentValue wifiFingerprint]((id *)v13);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_25;
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v10)
                continue;
              break;
            }
          }

          v5 = &OBJC_IVAR___GEOXPCReply__methodName;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 0;
    }
    while (v3);
  }
  else
  {
    v14 = 0;
  }
LABEL_25:

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_GEOPlaceDataItem;
  -[_GEOPlaceDataItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlace formattedText](self->_placeData, "formattedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ PlaceData: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_relatedPlacesByComponentId
{
  geo_isolate_sync();
  return self->_relatedPlacesByComponentId;
}

- (NSArray)_relatedPlaceLists
{
  void *v2;
  void *v3;
  void *v4;

  -[_GEOPlaceDataItem _relatedPlacesByComponentId](self, "_relatedPlacesByComponentId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3
{
  return -[_GEOPlaceDataItem initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:](self, "initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:", a3, 0, 0, 0, 0, 0);
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 detourInfo:(id)a4
{
  return -[_GEOPlaceDataItem initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:](self, "initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:", a3, 0, 0, a4, 0, 0);
}

- (unint64_t)hash
{
  return -[GEOPDPlace hash](self->_placeData, "hash");
}

- (BOOL)isEqualToMapItem:(id)a3
{
  GEOPDPlace *placeData;
  void *v4;

  placeData = self->_placeData;
  objc_msgSend(a3, "_placeData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(placeData) = -[GEOPDPlace isEqual:](placeData, "isEqual:", v4);

  return (char)placeData;
}

- (NSString)secondaryName
{
  return (NSString *)-[GEOPDPlace secondaryName](self->_placeData, "secondaryName");
}

- (NSString)secondarySpokenName
{
  return (NSString *)-[GEOPDPlace secondarySpokenName](self->_placeData, "secondarySpokenName");
}

- (BOOL)_hasBusinessHours
{
  void *v2;
  BOOL v3;

  +[GEOPDBusinessHours businessHoursForPlaceData:](GEOPDBusinessHours, "businessHoursForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)_businessHours
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__53;
  v8 = __Block_byref_object_dispose__53;
  v9 = 0;
  geo_reentrant_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (BOOL)_hasLinkedServices
{
  void *v2;
  BOOL v3;

  +[GEOPDLinkedService linkedServicesForPlaceData:](GEOPDLinkedService, "linkedServicesForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)_linkedServices
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOLinkedService *v11;
  void *v12;
  GEOLinkedService *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[GEOPDLinkedService linkedServicesForPlaceData:](GEOPDLinkedService, "linkedServicesForPlaceData:", self->_placeData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [GEOLinkedService alloc];
        -[_GEOPlaceDataItem timezone](self, "timezone", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[GEOLinkedService initWithGEOPDLinkedService:timeZone:](v11, "initWithGEOPDLinkedService:timeZone:", v10, v12);

        if (v13)
          objc_msgSend(v4, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v14;
}

- (GEOAssociatedApp)_associatedApp
{
  void *v2;
  GEOAssociatedApp *v3;

  +[GEOPDAssociatedApp associatedAppForPlaceData:](GEOPDAssociatedApp, "associatedAppForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOAssociatedApp initWithGEOPDAssociatedApp:]([GEOAssociatedApp alloc], "initWithGEOPDAssociatedApp:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOPriceDescription)_priceDescription
{
  void *v2;
  GEOPriceDescription *v3;

  +[GEOPDPriceDescription priceDescriptionForPlaceData:](GEOPDPriceDescription, "priceDescriptionForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOPriceDescription initWithGEOPDPriceDescription:]([GEOPriceDescription alloc], "initWithGEOPDPriceDescription:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)spokenNameForLocale:(id)a3
{
  return -[GEOPDPlace spokenNameForLocale:](self->_placeData, "spokenNameForLocale:", a3);
}

- (NSData)encodedData
{
  return (NSData *)-[GEOPDPlace data](self->_placeData, "data");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)labelCoordinate
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 0xC066800000000000;
  if (v2)
  {
    -[GEOPDPlaceInfo _readLabelPoint](v2);
    v5 = 0xC066800000000000;
    if (*(_QWORD *)(v3 + 56))
    {
      -[GEOPDPlaceInfo labelPoint]((id *)v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "coordinate");
      v4 = v7;
      v5 = v8;

    }
  }
  else
  {
    v5 = 0xC066800000000000;
  }

  v9 = *(double *)&v4;
  v10 = *(double *)&v5;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (NSArray)spatialMappedCategories
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int v7;
  void *v8;

  +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:](GEOPDSpatialLookupResult, "spatialLookupResultForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)v2;
  if (v2 && (-[GEOPDSpatialLookupResult _readMappedCategorys](v2), v3[4]))
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[GEOPDSpatialLookupResult _readMappedCategorys]((uint64_t)v3);
    objc_msgSend(v4, "arrayWithCapacity:", v3[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSpatialLookupResult _readMappedCategorys]((uint64_t)v3);
    if (v3[4])
    {
      v6 = 0;
      do
      {
        v7 = -[GEOPDSpatialLookupResult mappedCategoryAtIndex:]((uint64_t)v3, v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", _GEOSpatialLookupCategoryForGEOPDCategory(v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v6;
        -[GEOPDSpatialLookupResult _readMappedCategorys]((uint64_t)v3);
      }
      while (v6 < v3[4]);
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  id *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", self->_placeData);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[GEOPDPlaceInfo _readEnhancedCenter](v3);
    if (*(_QWORD *)(v4 + 48))
    {
      -[GEOPDPlaceInfo enhancedCenter]((id *)v4);
      v5 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = v5;
      objc_msgSend(v5, "coordinate");
      v8 = v7;
      v10 = v9;
      goto LABEL_7;
    }
    -[GEOPDPlaceInfo _readCenter](v4);
    if (*(_QWORD *)(v4 + 40))
    {
      -[GEOPDPlaceInfo center]((id *)v4);
      v5 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:](GEOPDSpatialLookupResult, "spatialLookupResultForPlaceData:", self->_placeData);
  v13 = objc_claimAutoreleasedReturnValue();
  v6 = (id *)v13;
  v8 = 0xC066800000000000;
  if (v13 && (-[GEOPDSpatialLookupResult _readCenter](v13), v6[7]))
  {
    -[GEOPDSpatialLookupResult center](v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinate");
    v8 = v15;
    v10 = v16;

  }
  else
  {
    v10 = 0xC066800000000000;
  }
LABEL_7:

  v11 = *(double *)&v8;
  v12 = *(double *)&v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (GEOMapRegion)displayMapRegion
{
  void *v3;
  void *v4;
  GEOMapRegion *v5;
  double v6;
  double v7;
  GEOMapRegion *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[_GEOPlaceDataItem displayMapRegionOrNil](self, "displayMapRegionOrNil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
LABEL_7:
    v8 = v5;
    goto LABEL_8;
  }
  -[_GEOPlaceDataItem coordinate](self, "coordinate");
  if (fabs(v7 + 180.0) >= 0.00000001 || fabs(v6 + 180.0) >= 0.00000001)
  {
    v9 = GEOMapRectMakeWithRadialDistance(v6, v7, 10000.0);
    v5 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v9, v10, v11, v12);
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_9;
  -[GEOPDBounds _readDisplayMapRegion](v2);
  if (!*(_QWORD *)(v3 + 24)
    || (-[GEOPDBounds displayMapRegion]((id *)v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isValid"),
        v4,
        !v5))
  {
    -[GEOPDBounds _readMapRegion](v3);
    if (*(_QWORD *)(v3 + 32))
    {
      -[GEOPDBounds mapRegion]((id *)v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isValid");

      if (v8)
      {
        -[GEOPDBounds mapRegion]((id *)v3);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  -[GEOPDBounds displayMapRegion]((id *)v3);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (void *)v6;
LABEL_10:

  return (GEOMapRegion *)v9;
}

- (GEOMapRegion)offlineDownloadRegion
{
  GEOPDPlace *placeData;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53;
  v15 = __Block_byref_object_dispose__53;
  v16 = 0;
  placeData = self->_placeData;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42___GEOPlaceDataItem_offlineDownloadRegion__block_invoke;
  v10[3] = &unk_1E1C09718;
  v10[4] = &v11;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 42, v10);
  v4 = v12[5];
  if (v4
    && (-[GEOPDOfflineArea _readMapRegion](v12[5]), *(_QWORD *)(v4 + 32))
    && (-[GEOPDOfflineArea mapRegion]((id *)v12[5]),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isValid"),
        v5,
        v6))
  {
    -[GEOPDOfflineArea mapRegion]((id *)v12[5]);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_GEOPlaceDataItem displayMapRegion](self, "displayMapRegion");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  _Block_object_dispose(&v11, 8);

  return (GEOMapRegion *)v8;
}

- (BOOL)supportsOfflineMaps
{
  GEOPDPlace *placeData;
  uint64_t v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__53;
  v11 = __Block_byref_object_dispose__53;
  v12 = 0;
  placeData = self->_placeData;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40___GEOPlaceDataItem_supportsOfflineMaps__block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 44, v6);
  v3 = v8[5];
  v4 = v3 && (*(_BYTE *)(v3 + 24) & 2) != 0 && *(_BYTE *)(v3 + 20) != 0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)hasDisplayMinZoom
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (v2[68] >> 1) & 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (float)displayMinZoom
{
  float *v2;
  float v3;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[16];
  else
    v3 = 0.0;

  return v3;
}

- (BOOL)hasDisplayMaxZoom
{
  _BYTE *v2;
  BOOL v3;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[68] & 1;
  else
    v3 = 0;

  return v3;
}

- (float)displayMaxZoom
{
  float *v2;
  float v3;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[15];
  else
    v3 = 0.0;

  return v3;
}

- (GEOMapRegion)geoFenceMapRegionOrNil
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (-[GEOPDBounds _readMapRegion](v2), *(_QWORD *)(v3 + 32)))
  {
    -[GEOPDBounds mapRegion]((id *)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isValid"))
    {
      -[GEOPDBounds mapRegion]((id *)v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (GEOMapRegion *)v5;
}

- (int)mapDisplayType
{
  return -[GEOPDPlace mapDisplayType](self->_placeData, "mapDisplayType");
}

- (GEOLocalizedString)disclaimerText
{
  void *v2;
  void *v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disclaimerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOLocalizedString *)v3;
}

- (GEOPDURLData)urlData
{
  void *v2;
  void *v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPDURLData *)v3;
}

- (int)contactAddressType
{
  return 0;
}

- (NSString)contactName
{
  return 0;
}

- (NSString)contactSpokenName
{
  return 0;
}

- (BOOL)contactIsMe
{
  return 0;
}

- (NSString)eventName
{
  return 0;
}

- (NSDate)eventDate
{
  return 0;
}

- (BOOL)isEventAllDay
{
  return 0;
}

- (BOOL)_hasResolvablePartialInformation
{
  uint64_t v2;
  BOOL v3;

  +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2 && (*(_WORD *)(v2 + 92) & 4) != 0 && *(_BYTE *)(v2 + 88) != 0;

  return v3;
}

- (BOOL)_responseStatusIsIncomplete
{
  return -[GEOPDPlace status](self->_placeData, "status") == 2;
}

- (BOOL)_isPartiallyClientized
{
  return -[GEOPDPlace isPartiallyClientizedSearchResult](self->_placeData, "isPartiallyClientizedSearchResult");
}

- (GEOPlace)_place
{
  geo_isolate_sync();
  return self->_place;
}

- (GEOPlaceResult)_placeResult
{
  return 0;
}

- (NSData)_placeDataAsData
{
  void *v2;
  void *v3;

  -[_GEOPlaceDataItem _placeData](self, "_placeData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)_spokenAddressForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_GEOPlaceDataItem addressObject](self, "addressObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spokenAddressForLocale:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unsigned int v14;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (-[GEOPDBounds _readMapRegion](v5), !*(_QWORD *)(v6 + 32))
    || (-[GEOPDBounds mapRegion]((id *)v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isValid"),
        v7,
        !v8))
  {
    +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasType"))
    {
      -[_GEOPlaceDataItem addressObject](self, "addressObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "hasKnownAccuracy") & 1) != 0)
      {
        -[_GEOPlaceDataItem addressObject](self, "addressObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "knownAccuracy");

        if (v13)
          goto LABEL_13;
      }
      else
      {

      }
      v14 = -[_GEOPlaceDataItem _placeType](self, "_placeType");
      v9 = 0;
      if (v14 > 0x11 || ((1 << v14) & 0x29500) == 0)
        goto LABEL_14;
      if (!a3)
      {
        -[_GEOPlaceDataItem geoFenceMapRegion](self, "geoFenceMapRegion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
LABEL_13:
    v9 = 0;
LABEL_14:

    goto LABEL_15;
  }
  -[GEOPDBounds mapRegion]((id *)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v9;
}

- (NSArray)_roadAccessPoints
{
  id *v2;
  void *v3;

  +[GEOPDRoadAccessInfo roadAccessInfoForPlaceData:](GEOPDRoadAccessInfo, "roadAccessInfoForPlaceData:", self->_placeData);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRoadAccessInfo roadAccessPoints](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_hasResultProviderID
{
  GEOPDPlace *placeData;

  placeData = self->_placeData;
  if (placeData)
    LOBYTE(placeData) = -[GEOPDPlace hasResultProviderId](placeData, "hasResultProviderId");
  return (char)placeData;
}

- (GEOMapItemIdentifier)transitStationIdentifier
{
  GEOPDPlace *placeData;
  uint64_t v4;
  uint64_t v5;
  GEOMapItemIdentifier *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  placeData = self->_placeData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45___GEOPlaceDataItem_transitStationIdentifier__block_invoke;
  v11[3] = &unk_1E1C09718;
  v11[4] = &v12;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 21, v11);
  v4 = v13[5];
  if (v4 && (*(_BYTE *)(v4 + 24) & 1) != 0)
  {
    v6 = [GEOMapItemIdentifier alloc];
    v7 = v13[5];
    if (v7)
      v8 = *(_QWORD *)(v7 + 16);
    else
      v8 = 0;
    -[_GEOPlaceDataItem coordinate](self, "coordinate");
    v5 = -[GEOMapItemIdentifier initWithMUID:coordinate:](v6, "initWithMUID:coordinate:", v8);
  }
  else
  {
    -[_GEOPlaceDataItem _identifier](self, "_identifier");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v5;
  _Block_object_dispose(&v12, 8);

  return (GEOMapItemIdentifier *)v9;
}

- (BOOL)_isTransitDisplayFeature
{
  void *v3;
  char v4;

  if (self->_isTransitDisplayFeature)
    return 1;
  -[_GEOPlaceDataItem _styleAttributes](self, "_styleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTransit");

  return v4;
}

- (BOOL)_hasTransit
{
  void *v3;
  BOOL v4;
  void *v5;

  +[GEOPDTransitInfo transitInfoForPlaceData:](GEOPDTransitInfo, "transitInfoForPlaceData:", self->_placeData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    +[GEOPDTransitInfoSnippet transitInfoSnippetForPlaceData:](GEOPDTransitInfoSnippet, "transitInfoSnippetForPlaceData:", self->_placeData);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  id *v3;
  GEOPDPlace *placeData;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  _GEOMapItemTransitInfoSnippet *v12;
  GEOComposedRoute *v13;
  void *v14;
  GEOComposedRoute *v15;
  void *v16;
  _GEOMapItemTransitInfo *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;

  +[GEOPDTransitInfo transitInfoForPlaceData:](GEOPDTransitInfo, "transitInfoForPlaceData:", self->_placeData);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  placeData = self->_placeData;
  if (v3)
  {
    +[GEOPDTransitSchedule transitScheduleForPlaceData:](GEOPDTransitSchedule, "transitScheduleForPlaceData:", placeData);
    v5 = objc_claimAutoreleasedReturnValue();
    v26 = 0;
    +[GEOPDTransitIncident transitIncidentsForPlaceData:hasTransitIncidentComponent:](GEOPDTransitIncident, "transitIncidentsForPlaceData:hasTransitIncidentComponent:", self->_placeData, &v26);
    v6 = objc_claimAutoreleasedReturnValue();
    +[GEOPDTransitIncident transitIncidentsTTLExpirationDateForPlaceData:](GEOPDTransitIncident, "transitIncidentsTTLExpirationDateForPlaceData:", self->_placeData);
    v7 = objc_claimAutoreleasedReturnValue();
    +[_GEOTransitTripStop transitTripStopsForPlaceData:](_GEOTransitTripStop, "transitTripStopsForPlaceData:", self->_placeData);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOPDTransitTripGeometry transitTripGeometryForPlaceData:](GEOPDTransitTripGeometry, "transitTripGeometryForPlaceData:", self->_placeData);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      v10 = v9 == 0;
    else
      v10 = 1;
    v24 = (void *)v6;
    v25 = (void *)v5;
    v23 = (void *)v7;
    if (v10)
    {
      v15 = 0;
    }
    else
    {
      v13 = [GEOComposedRoute alloc];
      -[GEOPDTransitInfo lineAtIndex:](v3, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[GEOComposedRoute initWithTransitGeometry:andLine:andStops:](v13, "initWithTransitGeometry:andLine:andStops:", v9, v14, v8);

    }
    +[GEOPDTransitNearbySchedule transitNearbyScheduleForPlaceData:](GEOPDTransitNearbySchedule, "transitNearbyScheduleForPlaceData:", self->_placeData);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [_GEOMapItemTransitInfo alloc];
    -[_GEOPlaceDataItem timezone](self, "timezone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;
    v20 = -[_GEOPlaceDataItem _resultProviderID](self, "_resultProviderID");
    -[_GEOPlaceDataItem coordinate](self, "coordinate");
    LODWORD(v22) = v20;
    v12 = -[_GEOMapItemTransitInfo initWithTransitInfo:schedule:timeZone:incidents:hasTransitIncidentComponent:incidentExpirationDate:providerID:coordinate:transitStops:composedRoute:nearbySchedule:](v17, "initWithTransitInfo:schedule:timeZone:incidents:hasTransitIncidentComponent:incidentExpirationDate:providerID:coordinate:transitStops:composedRoute:nearbySchedule:", v3, v25, v18, v24, v19, v23, v22, v8, v15, v16);

  }
  else
  {
    +[GEOPDTransitInfoSnippet transitInfoSnippetForPlaceData:](GEOPDTransitInfoSnippet, "transitInfoSnippetForPlaceData:", placeData);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = -[_GEOMapItemTransitInfoSnippet initWithTransitInfoSnippet:]([_GEOMapItemTransitInfoSnippet alloc], "initWithTransitInfoSnippet:", v11);
    else
      v12 = 0;

  }
  return (GEOMapItemTransitInfo *)v12;
}

- (GEOTransitAttribution)_transitAttribution
{
  void *v2;
  _GEOMapItemTransitAttribution *v3;

  +[GEOPDTransitAttribution transitAttributionForPlaceData:](GEOPDTransitAttribution, "transitAttributionForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[_GEOMapItemTransitAttribution initWithTransitAttribution:]([_GEOMapItemTransitAttribution alloc], "initWithTransitAttribution:", v2);
  else
    v3 = 0;

  return (GEOTransitAttribution *)v3;
}

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  return (GEOTransitVehiclePosition *)+[GEOPBTransitVehiclePosition transitVehiclePositionForPlaceData:](GEOPBTransitVehiclePosition, "transitVehiclePositionForPlaceData:", self->_placeData);
}

- (NSArray)supportedTransitPaymentMethods
{
  GEOPDPlace *placeData;
  id *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__53;
  v12 = __Block_byref_object_dispose__53;
  v13 = 0;
  placeData = self->_placeData;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___GEOPlaceDataItem_supportedTransitPaymentMethods__block_invoke;
  v7[3] = &unk_1E1C09718;
  v7[4] = &v8;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 91, v7);
  v3 = (id *)v9[5];
  if (v3)
  {
    -[GEOPDTransitPaymentMethodInfo paymentMethods](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_58_1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSArray)transitPaymentMethodSuggestions
{
  GEOPDPlace *placeData;
  id *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__53;
  v12 = __Block_byref_object_dispose__53;
  v13 = 0;
  placeData = self->_placeData;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___GEOPlaceDataItem_transitPaymentMethodSuggestions__block_invoke;
  v7[3] = &unk_1E1C09718;
  v7[4] = &v8;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 91, v7);
  v3 = (id *)v9[5];
  if (v3)
  {
    -[GEOPDTransitPaymentMethodInfo paymentMethodSuggestions](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_61_0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (double)cachingRadiusMeters
{
  GEOPDPlace *placeData;
  uint64_t v3;
  double v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__53;
  v11 = __Block_byref_object_dispose__53;
  v12 = 0;
  placeData = self->_placeData;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40___GEOPlaceDataItem_cachingRadiusMeters__block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 91, v6);
  v3 = v8[5];
  if (v3)
    v4 = *(double *)(v3 + 24);
  else
    v4 = 0.0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_hasFlyover
{
  void *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _flyover](self, "_flyover");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (GEOPDFlyover)_flyover
{
  return (GEOPDFlyover *)+[GEOPDFlyover flyoverForPlaceData:](GEOPDFlyover, "flyoverForPlaceData:", self->_placeData);
}

- (NSString)_flyoverAnnouncementMessage
{
  void *v2;
  void *v3;

  -[_GEOPlaceDataItem _flyover](self, "_flyover");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestLocalizedAnnouncementMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOMuninViewState)_muninViewState
{
  return 0;
}

- (GEOStorefrontInfo)_storefrontInfo
{
  geo_isolate_sync();
  return self->_storefrontInfo;
}

- (GEOStorefrontPresentationInfo)_storefrontPresentationInfo
{
  geo_isolate_sync();
  return self->_storefrontPresentationInfo;
}

- (BOOL)_hasMUID
{
  return -[GEOMapItemIdentifier muid](self->_identifier, "muid") != 0;
}

- (NSSet)_alternateIdentifiers
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__53;
  v8 = __Block_byref_object_dispose__53;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSSet *)v2;
}

- (int)_placeDisplayType
{
  return -[GEOPDPlace placeDisplayType](self->_placeData, "placeDisplayType");
}

- (BOOL)_hasAreaInMeters
{
  _WORD *v2;
  __int16 v3;

  +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", self->_placeData);
  v2 = (_WORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[46] & 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (double)_areaInMeters
{
  double *v2;
  double v3;

  +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", self->_placeData);
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[3];
  else
    v3 = 0.0;

  return v3;
}

- (NSString)_businessURL
{
  return (NSString *)-[GEOPDPlace businessURL](self->_placeData, "businessURL");
}

- (BOOL)_hasUserRatingScore
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  if (self)
  {
    if (-[_GEOPlaceDataItem _hasAppleRatings](self, "_hasAppleRatings"))
      v3 = 4;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  +[GEOPDRating ratingForPlaceData:type:](GEOPDRating, "ratingForPlaceData:type:", self->_placeData, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4 && (*(_BYTE *)(v4 + 48) & 2) != 0 && *(_DWORD *)(v4 + 40) > 0;

  return v5;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  if (self)
  {
    if (-[_GEOPlaceDataItem _hasAppleRatings](self, "_hasAppleRatings"))
    {
      -[_GEOPlaceDataItem _overallAppleRating](self, "_overallAppleRating");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "numberOfRatingsUsedForScore");
      goto LABEL_7;
    }
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  +[GEOPDRating ratingForPlaceData:type:](GEOPDRating, "ratingForPlaceData:type:", self->_placeData, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v6;
  if (v6)
    v4 = *(_DWORD *)(v6 + 40);
  else
    v4 = 0;
LABEL_7:

  return v4;
}

- (float)_normalizedUserRatingScore
{
  void *v3;
  double v4;
  double v5;
  float v6;
  float v7;
  uint64_t v8;
  double v9;

  if (!self)
    return 0.0;
  if (-[_GEOPlaceDataItem _hasAppleRatings](self, "_hasAppleRatings"))
  {
    -[_GEOPlaceDataItem _overallAppleRating](self, "_overallAppleRating");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "percentage");
    v5 = v4;

    v6 = v5;
    return v6 * 100.0;
  }
  else
  {
    +[GEOPDRating ratingForPlaceData:type:](GEOPDRating, "ratingForPlaceData:type:", self->_placeData, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(double *)(v8 + 32);
      if ((*(_BYTE *)(v8 + 48) & 1) != 0)
        v9 = v9 * (5.0 / *(double *)(v8 + 24));
    }
    else
    {
      v9 = 0.0;
    }
    v7 = v9;

  }
  return v7;
}

- (BOOL)_hasPriceRange
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  +[GEOPDRating ratingForPlaceData:type:](GEOPDRating, "ratingForPlaceData:type:", self->_placeData, 3);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (v2[48] >> 1) & 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (unsigned)_priceRange
{
  double *v2;
  double v3;
  unsigned int v4;

  +[GEOPDRating ratingForPlaceData:type:](GEOPDRating, "ratingForPlaceData:type:", self->_placeData, 3);
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[4];
  else
    v3 = 0.0;
  v4 = vcvtmd_u64_f64(v3);

  return v4;
}

- (unsigned)_maxScoreForPriceRange
{
  uint64_t v2;
  double v3;
  unsigned int v4;

  +[GEOPDRating ratingForPlaceData:type:](GEOPDRating, "ratingForPlaceData:type:", self->_placeData, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 5.0;
    if ((*(_BYTE *)(v2 + 48) & 1) != 0)
      v3 = *(double *)(v2 + 24);
  }
  else
  {
    v3 = 0.0;
  }
  v4 = vcvtmd_u64_f64(v3);

  return v4;
}

- (NSString)_resultSnippetLocationString
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[GEOPDResultSnippet resultSnippetForPlaceData:](GEOPDResultSnippet, "resultSnippetForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (-[GEOPDResultSnippet _readLocationString](v2), *(_QWORD *)(v3 + 48)))
  {
    -[GEOPDResultSnippet locationString]((id *)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (unsigned)_resultSnippetDistanceDisplayThreshold
{
  uint64_t v2;
  unsigned int v3;

  +[GEOPDResultSnippet resultSnippetForPlaceData:](GEOPDResultSnippet, "resultSnippetForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (*(_WORD *)(v2 + 96) & 1) != 0)
    v3 = *(_DWORD *)(v2 + 92);
  else
    v3 = -1;

  return v3;
}

- (NSArray)_childItems
{
  geo_isolate_sync();
  return self->_childItems;
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  +[GEOPDCategory categoryNamesForPlaceData:type:](GEOPDCategory, "categoryNamesForPlaceData:type:", self->_placeData, *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    +[GEOPDResultSnippet resultSnippetForPlaceData:](GEOPDResultSnippet, "resultSnippetForPlaceData:", self->_placeData);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (-[GEOPDResultSnippet _readCategory](v6), *(_QWORD *)(v7 + 24)))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      -[GEOPDResultSnippet category]((id *)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayWithObject:", v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  BOOL v4;
  uint64_t v5;
  _QWORD *v6;

  if (+[GEOPDCategory hasCategoryNamesForPlaceData:type:](GEOPDCategory, "hasCategoryNamesForPlaceData:type:", self->_placeData, *(_QWORD *)&a3))
  {
    return 1;
  }
  +[GEOPDResultSnippet resultSnippetForPlaceData:](GEOPDResultSnippet, "resultSnippetForPlaceData:", self->_placeData);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)v5;
  if (v5)
  {
    -[GEOPDResultSnippet _readCategory](v5);
    v4 = v6[3] != 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_hasAnyAmenities
{
  void *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _amenities](self, "_amenities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)_amenities
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[GEOPDAmenities stringBasedAmenityValuesForPlaceData:](GEOPDAmenities, "stringBasedAmenityValuesForPlaceData:", self->_placeData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    +[GEOAmenityItem amenityItemsFromPDAmenityItems:](GEOAmenityItem, "amenityItemsFromPDAmenityItems:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  if (objc_msgSend(v3, "count"))
  {
    v6 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    +[GEOPDAmenities enumBasedAmenityValuesForPlaceData:](GEOPDAmenities, "enumBasedAmenityValuesForPlaceData:", self->_placeData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      +[GEOAmenityItem amenityItemsFromPDAmenityItems:](GEOAmenityItem, "amenityItemsFromPDAmenityItems:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

    }
    v6 = (void *)objc_msgSend(v3, "copy");

  }
  return (NSArray *)v6;
}

- (BOOL)_hasOperatingHours
{
  return +[GEOPDHours operatingHoursAvailableForPlaceData:](GEOPDHours, "operatingHoursAvailableForPlaceData:", self->_placeData);
}

- (BOOL)_hasCurrentOperatingHours
{
  GEOPDPlace *placeData;
  void *v3;
  BOOL v4;

  placeData = self->_placeData;
  -[_GEOPlaceDataItem timezone](self, "timezone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[GEOPDHours currentOperatingHoursAvailableForPlaceData:withTimeZone:](GEOPDHours, "currentOperatingHoursAvailableForPlaceData:withTimeZone:", placeData, v3);

  return v4;
}

- (unint64_t)_openingHoursOptions
{
  GEOBusinessHours *businessHours;
  void *v4;
  void *v5;
  unint64_t v6;

  geo_isolate_sync();
  businessHours = self->_businessHours;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOPlaceDataItem timezone](self, "timezone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[GEOMapItemOpenState _geoMapItemOpeningHoursOptionsForBusinessHours:compareDate:timeZone:](GEOMapItemOpenState, "_geoMapItemOpeningHoursOptionsForBusinessHours:compareDate:timeZone:", businessHours, v4, v5);

  return v6;
}

- (BOOL)_hasEncyclopedicInfo
{
  void *v3;
  BOOL v4;
  void *v5;

  +[GEOPDTextBlock textBlockForPlaceData:](GEOPDTextBlock, "textBlockForPlaceData:", self->_placeData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    +[GEOPDFactoid factoidsForPlaceData:](GEOPDFactoid, "factoidsForPlaceData:", self->_placeData);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  if (!-[_GEOPlaceDataItem _hasEncyclopedicInfo](self, "_hasEncyclopedicInfo"))
    return (GEOEncyclopedicInfo *)0;
  geo_isolate_sync();
  return (GEOEncyclopedicInfo *)self->_encyclopedicInfo;
}

- (BOOL)_hasTelephone
{
  void *v2;
  BOOL v3;

  -[GEOPDPlace phoneNumbers](self->_placeData, "phoneNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSString)_telephone
{
  void *v2;
  void *v3;

  -[GEOPDPlace phoneNumbers](self->_placeData, "phoneNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_optsOutOfTelephoneAds
{
  GEOPDPlace *placeData;
  void *v3;

  placeData = self->_placeData;
  -[_GEOPlaceDataItem _telephone](self, "_telephone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(placeData) = -[GEOPDPlace phoneNumberOptsOutOfAds:](placeData, "phoneNumberOptsOutOfAds:", v3);

  return (char)placeData;
}

- (NSString)_disambiguationName
{
  return (NSString *)-[GEOPDMultiLocalizedString bestLocalizedName](self->_disambiguationLabel, "bestLocalizedName");
}

- (GEOInlineRapEnablement)_inlineRapEnablement
{
  void *v2;
  GEOInlineRapEnablement *v3;
  void *v4;
  GEOInlineRapEnablement *v5;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [GEOInlineRapEnablement alloc];
  objc_msgSend(v2, "inlineRapEnablement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOInlineRapEnablement initWithEnablement:](v3, "initWithEnablement:", v4);

  return v5;
}

- (BOOL)_needsAttribution
{
  return -[NSMapTable count](self->_attributionMap, "count") != 0;
}

- (NSURL)_webURL
{
  void *v2;
  void *v3;

  -[_GEOPlaceDataItem _attribution](self, "_attribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)_providerURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[_GEOPlaceDataItem _webURL](self, "_webURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScheme:", v5);

    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHost:", v6);

    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSURL *)v7;
}

- (NSString)_vendorID
{
  id *v2;
  void *v3;

  +[GEOPDAttribution attributionForPlaceDataEntity:](GEOPDAttribution, "attributionForPlaceDataEntity:", self->_placeData);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAttribution vendorId](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_poiSurveyURLString
{
  void *v3;

  if (-[_GEOPlaceDataItem _hasMUID](self, "_hasMUID")
    && -[GEOPDPlace hasResultProviderId](self->_placeData, "hasResultProviderId"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("skyline://poi?businessID=%llu&providerID=%u"), -[_GEOPlaceDataItem _muid](self, "_muid"), -[GEOPDPlace resultProviderId](self->_placeData, "resultProviderId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)_poiPinpointURLString
{
  __CFString *v3;
  uint64_t v5;

  if (-[_GEOPlaceDataItem _hasMUID](self, "_hasMUID")
    && -[GEOPDPlace hasResultProviderId](self->_placeData, "hasResultProviderId"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pinpoint://poi?businessID=%llu&providerID=%u"), -[_GEOPlaceDataItem _muid](self, "_muid"), -[GEOPDPlace resultProviderId](self->_placeData, "resultProviderId"));
  }
  else
  {
    if (!-[_GEOPlaceDataItem _hasMUID](self, "_hasMUID"))
    {
      v3 = CFSTR("pinpoint://launch");
      return (NSString *)v3;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pinpoint://poi?businessID=%llu"), -[_GEOPlaceDataItem _muid](self, "_muid"), v5);
  }
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v3;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  id *v3;
  id *v4;
  NSMapTable *attributionMap;
  void *v6;
  void *v7;
  void *v8;

  +[GEOPDAttribution attributionForPlaceDataEntity:](GEOPDAttribution, "attributionForPlaceDataEntity:", self->_placeData);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    attributionMap = self->_attributionMap;
    -[GEOPDAttribution vendorId](v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "hasAttributionRequirement:", 1))
    {
      +[GEOMapItemAttribution attributionWithDataAttribution:searchInfo:class:](GEOMapItemAttribution, "attributionWithDataAttribution:searchInfo:class:", v4, v7, objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (GEOMapItemPlaceAttribution *)v8;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  void *v2;
  void *v3;

  -[_GEOPlaceDataItem _allPhotoAttributions](self, "_allPhotoAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemPhotosAttribution *)v3;
}

- (NSArray)_allPhotoAttributions
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__53;
  v8 = __Block_byref_object_dispose__53;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (void)_refreshPhotoAttributions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id *v11;
  void *v12;
  char v13;
  NSMapTable *attributionMap;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *allPhotoAttributions;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _fetchPhotoRelatedDataAttributionsForPlaceData(self->_placeData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[GEOPDAttribution vendorId](v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "containsObject:", v12, (_QWORD)v21);

        if ((v13 & 1) == 0)
        {
          attributionMap = self->_attributionMap;
          -[GEOPDAttribution vendorId](v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 && objc_msgSend(v16, "hasAttributionRequirement:", 3))
          {
            +[GEOMapItemAttribution attributionWithDataAttribution:searchInfo:class:](GEOMapItemAttribution, "attributionWithDataAttribution:searchInfo:class:", v11, v16, objc_opt_class());
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v17);

            -[GEOPDAttribution vendorId](v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v18);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v19 = (NSArray *)objc_msgSend(v4, "copy");
  allPhotoAttributions = self->_allPhotoAttributions;
  self->_allPhotoAttributions = v19;

}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  id *v3;
  id *v4;
  NSMapTable *attributionMap;
  void *v6;
  void *v7;
  void *v8;

  +[GEOPDAttribution attributionForPlaceDataReview:](GEOPDAttribution, "attributionForPlaceDataReview:", self->_placeData);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    attributionMap = self->_attributionMap;
    -[GEOPDAttribution vendorId](v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "hasAttributionRequirement:", 2))
    {
      +[GEOMapItemAttribution attributionWithDataAttribution:searchInfo:class:](GEOMapItemAttribution, "attributionWithDataAttribution:searchInfo:class:", v4, v7, objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (GEOMapItemReviewsAttribution *)v8;
}

- (unint64_t)_customIconID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_GEOPlaceDataItem _placeDataStyleAttributes](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "customIconId");
  else
    v4 = 0;

  return v4;
}

- (NSString)_mapsCategoryId
{
  void *v2;
  void *v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapsCategoryId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_asPlaceInfo
{
  return -[GEOMapItemAdditionalPlaceInfo initWithMapItem:]([GEOMapItemAdditionalPlaceInfo alloc], "initWithMapItem:", self);
}

- (NSArray)_reviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _GEOPlaceDataReview *v12;
  _GEOPlaceDataReview *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[GEOPDReview reviewsForPlaceData:](GEOPDReview, "reviewsForPlaceData:", self->_placeData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12 = [_GEOPlaceDataReview alloc];
          v13 = -[_GEOPlaceDataReview initWithPlaceData:review:](v12, "initWithPlaceData:review:", self->_placeData, v11, (_QWORD)v15);
          objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)_tips
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOMapItemTip *v11;
  GEOMapItemTip *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[GEOPDTip tipsForPlaceData:](GEOPDTip, "tipsForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [GEOMapItemTip alloc];
          v12 = -[GEOMapItemTip initWithGEOPDTip:](v11, "initWithGEOPDTip:", v10, (_QWORD)v14);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSArray)_photos
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id *v18;
  void *v19;
  id *v20;
  _GEOPlaceDataPhoto *v21;
  void *v22;
  _GEOPlaceDataPhoto *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  _GEOPlaceDataPhoto *v29;
  void *v30;
  void *v31;
  _GEOPlaceDataPhoto *v32;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_GEOPlaceDataItem _allPhotoAttributions](self, "_allPhotoAttributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v9, "providerID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v6);
  }
  +[GEOPDAttribution componentLevelAttributionForPlaceDataPhotos:](GEOPDAttribution, "componentLevelAttributionForPlaceDataPhotos:", self->_placeData);
  v11 = objc_claimAutoreleasedReturnValue();
  +[GEOPDCaptionedPhoto captionedPhotosForPlaceData:](GEOPDCaptionedPhoto, "captionedPhotosForPlaceData:", self->_placeData);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
  {
    +[GEOPDPhoto photosForPlaceData:](GEOPDPhoto, "photosForPlaceData:", self->_placeData);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count"))
    {
      v36 = 0;
      goto LABEL_35;
    }
    v34 = v12;
    v35 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = v13;
    v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v13);
          v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          v29 = [_GEOPlaceDataPhoto alloc];
          -[GEOPDAttribution vendorId]((id *)v11);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[_GEOPlaceDataPhoto initWithPhoto:attribution:](v29, "initWithPhoto:attribution:", v28, v31);

          if (v32)
            objc_msgSend(v36, "addObject:", v32);

        }
        v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v25);
    }

    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v14)
  {
    v15 = v14;
    v34 = v12;
    v35 = v4;
    v16 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        v18 = *(id **)(*((_QWORD *)&v41 + 1) + 8 * k);
        if (v11 && (-[GEOPDAttribution _readVendorId](v11), *(_QWORD *)(v11 + 56)))
        {
          -[GEOPDAttribution vendorId]((id *)v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[GEOPDCaptionedPhoto attribution](v18);
          v20 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDAttribution vendorId](v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v21 = [_GEOPlaceDataPhoto alloc];
        objc_msgSend(v3, "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:attribution:](v21, "initWithCaptionedPhoto:attribution:", v18, v22);

        if (v23)
          objc_msgSend(v36, "addObject:", v23);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v15);
LABEL_34:
    v12 = v34;
    v4 = v35;
  }
LABEL_35:

  return (NSArray *)v36;
}

- (id)_mapItemByStrippingOptionalData
{
  id v3;
  void *v4;

  v3 = -[GEOPDPlace copyWithStrippedOptionalData](self->_placeData, "copyWithStrippedOptionalData");
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:", v3, self->_attributionMap, self->_disambiguationLabel, 0, 0, 0);

  return v4;
}

- (id)_mapItemBySettingIsTransitDisplayFeature:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE *v13;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[GEOPDPlace copy](self->_placeData, "copy");
  v7 = (void *)-[NSMapTable copy](self->_attributionMap, "copy");
  v8 = (void *)-[GEOPDMultiLocalizedString copy](self->_disambiguationLabel, "copy");
  -[GEOMapItemDetourInfo _detourInfo](self->_detourInfo, "_detourInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = (void *)-[NSData copy](self->_externalTransitStationCode, "copy");
  v12 = (void *)-[NSArray copy](self->_additionalPlaces, "copy");
  v13 = (_BYTE *)objc_msgSend(v5, "initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:", v6, v7, v8, v10, v11, v12);

  v13[56] = a3;
  return v13;
}

- (BOOL)_hasPOIClaim
{
  void *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _poiClaim](self, "_poiClaim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (GEOPOIClaim)_poiClaim
{
  void *v2;
  GEOPOIClaim *v3;

  +[GEOPDPOIClaim poiClaimForPlaceData:](GEOPDPOIClaim, "poiClaimForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOPOIClaim initWithPOIClaim:]([GEOPOIClaim alloc], "initWithPOIClaim:", v2);

  return v3;
}

- (GEOBusinessAssets)businessAssets
{
  return +[GEOBusinessAssets businessAssetsWithPlaceData:](GEOBusinessAssets, "businessAssetsWithPlaceData:", self->_placeData);
}

- (BOOL)_hasFeatureLink
{
  void *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _featureLink](self, "_featureLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (GEORestaurantFeaturesLink)_featureLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GEOPDRestaurantReservationLink *v7;
  GEORestaurantFeaturesLink *v8;

  +[GEOPDRestaurantReservationLink reservationLinkForPlaceData:](GEOPDRestaurantReservationLink, "reservationLinkForPlaceData:", self->_placeData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_GEOPlaceDataItem _hasMUID](self, "_hasMUID"))
  {
    _getValue(GeoServicesConfig_RestaurantReservationLinkForMUID, (uint64_t)off_1EDF4D468, 1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), -[_GEOPlaceDataItem _muid](self, "_muid"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[GEOPDRestaurantReservationLink initWithData:]([GEOPDRestaurantReservationLink alloc], "initWithData:", v6);

        v3 = v7;
      }

    }
  }
  if (v3)
    v8 = -[GEORestaurantFeaturesLink initWithRestaurantReservationLink:attributionMap:]([GEORestaurantFeaturesLink alloc], "initWithRestaurantReservationLink:attributionMap:", v3, self->_attributionMap);
  else
    v8 = 0;

  return v8;
}

- (int)_parsecSectionType
{
  void *v2;
  int v3;
  int v4;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "searchSection");
  if (v3 == 1)
    v4 = 1;
  else
    v4 = 2 * (v3 == 2);

  return v4;
}

- (BOOL)_isStandaloneBrand
{
  return -[GEOPDPlace isStandAloneBrand](self->_placeData, "isStandAloneBrand");
}

- (GEOMessageLink)_messageLink
{
  void *v2;
  GEOMessageLink *v3;

  +[GEOPDMessageLink messageLinkForPlaceData:](GEOPDMessageLink, "messageLinkForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOMessageLink initWithMessageLink:]([GEOMessageLink alloc], "initWithMessageLink:", v2);
  else
    v3 = 0;

  return v3;
}

- (NSArray)_quickLinks
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GEOQuickLink *v10;
  GEOQuickLink *v11;
  void *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[GEOPDQuickLinkItem quickLinksForPlaceData:](GEOPDQuickLinkItem, "quickLinksForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = [GEOQuickLink alloc];
        v11 = -[GEOQuickLink initWithQuickLink:](v10, "initWithQuickLink:", v9, (_QWORD)v15);
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v12 = v3;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (NSArray)_secondaryQuickLinks
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GEOQuickLink *v10;
  GEOQuickLink *v11;
  void *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[GEOPDQuickLinkItem secondaryQuickLinksForPlaceData:](GEOPDQuickLinkItem, "secondaryQuickLinksForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = [GEOQuickLink alloc];
        v11 = -[GEOQuickLink initWithQuickLink:](v10, "initWithQuickLink:", v9, (_QWORD)v15);
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v12 = v3;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (NSArray)_placeCollections
{
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id *v11;
  GEOPlaceCollection *v12;
  void *v13;
  void *v14;
  GEOPlaceCollection *v15;
  void *v16;
  NSArray *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[GEOPDPlaceCollection collectionComponentsForPlaceData:](GEOPDPlaceCollection, "collectionComponentsForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v2;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v22 = v4;
        v5 = *(id **)(*((_QWORD *)&v27 + 1) + 8 * v4);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[GEOPDComponent values](v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(v6);
              v11 = *(id **)(*((_QWORD *)&v23 + 1) + 8 * i);
              v12 = [GEOPlaceCollection alloc];
              -[GEOPDComponentValue placeCollection](v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOPDComponent attribution](v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = -[GEOPlaceCollection initWithCollection:usingAttribution:](v12, "initWithCollection:usingAttribution:", v13, v14);

              if (v15)
                objc_msgSend(v3, "addObject:", v15);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v8);
        }

        v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v3, "count"))
    v16 = v3;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (NSArray)_searchResultPhotoCarousel
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _GEOPlaceDataPhoto *v10;
  _GEOPlaceDataPhoto *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[GEOPDSearchResultPlacePhoto searchResultPhotosFromPlaceData:](GEOPDSearchResultPlacePhoto, "searchResultPhotosFromPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          v10 = [_GEOPlaceDataPhoto alloc];
          v11 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v10, "initWithCaptionedPhoto:", v9, (_QWORD)v13);
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (GEOExploreGuides)_exploreGuides
{
  id *v2;
  void *v3;
  uint64_t v4;
  GEOExploreGuides *v5;
  void *v6;
  GEOExploreGuides *v7;

  +[GEOPDExploreGuides exploreGuideComponentFromPlaceData:](GEOPDExploreGuides, "exploreGuideComponentFromPlaceData:", self->_placeData);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent values](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4 && *(_QWORD *)(v4 + 216))
  {
    v5 = [GEOExploreGuides alloc];
    -[GEOPDComponentValue exploreGuides]((id *)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOExploreGuides initWithExploreGuides:](v5, "initWithExploreGuides:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)_placeCollectionsIds
{
  id *v2;
  void *v3;
  id *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;

  +[GEOPDCollectionIds collectionIdComponentForPlaceData:](GEOPDCollectionIds, "collectionIdComponentForPlaceData:", self->_placeData);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent values](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (id *)v4[18];
    -[GEOPDCollectionIds collectionIds](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      v8 = (void *)objc_msgSend(v7, "copy");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (BOOL)_hasPlaceCollectionPullQuotes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_GEOPlaceDataItem _placeCollections](self, "_placeCollections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "publisherBlockQuote");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)_placeCollectionPullQuotes
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_GEOPlaceDataItem _placeCollections](self, "_placeCollections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "publisherBlockQuote");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "publisherBlockQuote");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v12 = (void *)objc_msgSend(v3, "copy");
  else
    v12 = 0;

  return (NSArray *)v12;
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[_GEOPlaceDataItem _relatedPlacesByComponentId](self, "_relatedPlacesByComponentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_hasEVCharger
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_GEOPlaceDataItem _placeData](self, "_placeData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOEVCharger chargerFromPlaceData:](GEOEVCharger, "chargerFromPlaceData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (GEOEVCharger)_evCharger
{
  void *v2;
  void *v3;

  -[_GEOPlaceDataItem _placeData](self, "_placeData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOEVCharger chargerFromPlaceData:](GEOEVCharger, "chargerFromPlaceData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOEVCharger *)v3;
}

- (id)_firstRelatedPlaceListForType:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_GEOPlaceDataItem _relatedPlaceLists](self, "_relatedPlaceLists", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (GEOPlacecardLayoutData)_placecardLayoutData
{
  geo_isolate_sync();
  return self->_placecardLayoutData;
}

- (BOOL)_hasBrandMUID
{
  return -[GEOPDPlace hasBrandMUID](self->_placeData, "hasBrandMUID");
}

- (unint64_t)_brandMUID
{
  return -[GEOPDPlace brandMUID](self->_placeData, "brandMUID");
}

- (BOOL)hasExpiredComponents
{
  return -[GEOPDPlace hasExpiredComponentsAsOf:](self->_placeData, "hasExpiredComponentsAsOf:", CFAbsoluteTimeGetCurrent());
}

- (id)shortAddress
{
  void *v3;
  void *v4;
  void *v5;

  if (-[_GEOPlaceDataItem _venueFeatureType](self, "_venueFeatureType") != 4)
    goto LABEL_4;
  -[_GEOPlaceDataItem addressObject](self, "addressObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "venueShortAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {

LABEL_4:
    -[_GEOPlaceDataItem addressObject](self, "addressObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)weatherDisplayName
{
  void *v2;
  void *v3;

  -[_GEOPlaceDataItem addressObject](self, "addressObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weatherDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSData)externalTransitStationCode
{
  return self->_externalTransitStationCode;
}

- (BOOL)_hasVenueFeatureType
{
  void *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _venueInfo](self, "_venueInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)_venueFeatureType
{
  void *v3;
  void *v4;
  int v5;

  -[_GEOPlaceDataItem _venueInfo](self, "_venueInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_GEOPlaceDataItem _venueInfo](self, "_venueInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "venueFeatureType");

  return v5;
}

- (GEOMapItemVenueInfo)_venueInfo
{
  geo_isolate_sync();
  return self->_venueInfo;
}

- (NSArray)_browseCategories
{
  uint64_t v3;
  GEOPDPlace *placeData;
  GEOPDPlace *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GEOSearchCategory *v12;
  GEOSearchCategory *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__53;
  v26 = __Block_byref_object_dispose__53;
  v27 = 0;
  v3 = MEMORY[0x1E0C809B0];
  placeData = self->_placeData;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __38___GEOPlaceDataItem__browseCategories__block_invoke;
  v21[3] = &unk_1E1C09718;
  v21[4] = &v22;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 54, v21);
  if (v23[5]
    || (v5 = self->_placeData,
        v20[0] = v3,
        v20[1] = 3221225472,
        v20[2] = __38___GEOPlaceDataItem__browseCategories__block_invoke_2,
        v20[3] = &unk_1E1C09718,
        v20[4] = &v22,
        -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](v5, "enumerateValidComponentValuesOfType:usingBlock:", 70, v20), v23[5]))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[GEOPDBrowseCategories browseCategorys]((id *)v23[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v12 = [GEOSearchCategory alloc];
          v13 = -[GEOSearchCategory initWithBrowseCategory:](v12, "initWithBrowseCategory:", v11, (_QWORD)v16);
          if (v13)
            objc_msgSend(v6, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
      }
      while (v8);
    }

    v14 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v14 = 0;
  }
  _Block_object_dispose(&v22, 8);

  return (NSArray *)v14;
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  GEOPDPlace *placeData;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  GEOMiniBrowseCategories *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__53;
  v14 = __Block_byref_object_dispose__53;
  v15 = 0;
  placeData = self->_placeData;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42___GEOPlaceDataItem__miniBrowseCategories__block_invoke;
  v9[3] = &unk_1E1C09718;
  v9[4] = &v10;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 72, v9);
  v3 = (id *)v11[5];
  if (v3
    && (-[GEOPDMiniBrowseCategories miniBrowseCategorys](v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[GEOPDMiniBrowseCategories miniBrowseCategorys]((id *)v11[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDMiniBrowseCategories topChildNames]((id *)v11[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOMiniBrowseCategories initWithMiniPDBrowseCategories:topChildNames:]([GEOMiniBrowseCategories alloc], "initWithMiniPDBrowseCategories:topChildNames:", v5, v6);

  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (int)_placeDisplayStyle
{
  void *v2;
  int v3;
  int v4;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayStyle");
  if (v3 == 2)
    v4 = 2;
  else
    v4 = v3 == 1;

  return v4;
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  void *v3;
  GEOAnnotatedItemList *v4;
  id *v5;
  id *v6;
  NSMapTable *attributionMap;
  void *v8;
  void *v9;
  void *v10;
  GEOAnnotatedItemList *v11;

  +[GEOPDAnnotatedItemList annotatedItemListForPlaceData:](GEOPDAnnotatedItemList, "annotatedItemListForPlaceData:", self->_placeData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [GEOAnnotatedItemList alloc];
    +[GEOPDAttribution attributionForAnnotatedItemList:placeData:](GEOPDAttribution, "attributionForAnnotatedItemList:placeData:", v3, self->_placeData);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      attributionMap = self->_attributionMap;
      -[GEOPDAttribution vendorId](v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[GEOMapItemAttribution attributionWithDataAttribution:searchInfo:class:](GEOMapItemAttribution, "attributionWithDataAttribution:searchInfo:class:", v6, v9, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    v11 = -[GEOAnnotatedItemList initWithAnnotatedItemList:attribution:](v4, "initWithAnnotatedItemList:attribution:", v3, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_hasWifiFingerprintConfidence
{
  _BYTE *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[28] & 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)_hasWifiFingerprintLabelType
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (v2[28] >> 1) & 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (BOOL)_hasWifiFingerprintLabelStatusCode
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (v2[28] >> 2) & 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (int)_wifiFingerprintLabelStatusCode
{
  uint64_t v2;
  int v3;
  int v4;

  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2 || (*(_BYTE *)(v2 + 28) & 4) == 0)
  {
    v3 = 1;
    goto LABEL_16;
  }
  v4 = *(_DWORD *)(v2 + 24);
  if (v4 > 29)
  {
    if (v4 > 49)
    {
      v3 = *(_DWORD *)(v2 + 24);
      if (v4 != 50)
      {
        v3 = 1;
        if (v4 == 60)
          v3 = 51;
      }
    }
    else
    {
      if (v4 == 30)
        goto LABEL_15;
      v3 = 1;
      if (v4 == 40)
        goto LABEL_15;
    }
  }
  else
  {
    if (v4 <= 4)
    {
      if (v4)
      {
        v3 = 1;
        if (v4 != 2)
          goto LABEL_16;
      }
LABEL_15:
      v3 = *(_DWORD *)(v2 + 24);
      goto LABEL_16;
    }
    if (v4 == 5)
      goto LABEL_15;
    v3 = 1;
    if (v4 == 20)
      goto LABEL_15;
  }
LABEL_16:

  return v3;
}

- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return -[_GEOPlaceDataItem _bestBrandIconOfType:size:allowSmaller:]((uint64_t)self, 1, a4, a3.width, a3.height);
}

- (id)_bestBrandIconOfType:(unsigned int)a3 size:(double)a4 allowSmaller:(double)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _BYTE *v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  _GEOPlaceDataPhoto *v30;
  id *v31;
  void *v32;
  _GEOPlaceDataPhoto *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "components");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = &OBJC_IVAR___GEOXPCReply__methodName;
      v12 = &OBJC_IVAR___GEOXPCReply__methodName;
      v13 = *(_QWORD *)v45;
      v38 = v8;
      v36 = *(_QWORD *)v45;
      do
      {
        v14 = 0;
        v37 = v10;
        do
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v8);
          v15 = *(id **)(*((_QWORD *)&v44 + 1) + 8 * v14);
          if (v15 && (*(_WORD *)((_BYTE *)v15 + v11[731]) & 0x80) != 0 && *(_DWORD *)((char *)v15 + v12[732]) == 52)
          {
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            -[GEOPDComponent values](v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v41;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v41 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v20);
                  if (v21)
                  {
                    if (*(_QWORD *)(v21 + 304))
                    {
                      -[GEOPDComponentValue icon](*(id **)(*((_QWORD *)&v40 + 1) + 8 * v20));
                      v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                      if (v22)
                      {
                        v23 = v22[2];

                        if (v23)
                        {
                          -[GEOPDComponentValue icon]((id *)v21);
                          v24 = (_BYTE *)objc_claimAutoreleasedReturnValue();
                          v25 = v24;
                          if (!v24 || (v24[28] & 1) == 0)
                          {

LABEL_36:
                            v30 = [_GEOPlaceDataPhoto alloc];
                            -[GEOPDComponentValue icon]((id *)v21);
                            v31 = (id *)objc_claimAutoreleasedReturnValue();
                            -[GEOPDIcon image](v31);
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            v33 = -[_GEOPlaceDataPhoto initWithPhoto:](v30, "initWithPhoto:", v32);

                            -[_GEOPlaceDataPhoto bestPhotoForSize:allowSmaller:](v33, "bestPhotoForSize:allowSmaller:", a3, a4, a5);
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v34, "url");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();

                            v8 = v38;
                            goto LABEL_37;
                          }
                          -[GEOPDComponentValue icon]((id *)v21);
                          v26 = objc_claimAutoreleasedReturnValue();
                          if (v26 && (*(_BYTE *)(v26 + 28) & 1) != 0)
                            v27 = *(_DWORD *)(v26 + 24);
                          else
                            v27 = 0;

                          if (v27 == a2)
                            goto LABEL_36;
                        }
                      }
                    }
                  }
                  ++v20;
                }
                while (v18 != v20);
                v28 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                v18 = v28;
              }
              while (v28);
            }

            v8 = v38;
            v13 = v36;
            v10 = v37;
            v11 = &OBJC_IVAR___GEOXPCReply__methodName;
            v12 = &OBJC_IVAR___GEOXPCReply__methodName;
          }
          ++v14;
        }
        while (v14 != v10);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        v29 = 0;
      }
      while (v10);
    }
    else
    {
      v29 = 0;
    }
LABEL_37:

  }
  else
  {
    v29 = 0;
  }
  return v29;
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return -[_GEOPlaceDataItem _bestBrandIconOfType:size:allowSmaller:]((uint64_t)self, 2, a4, a3.width, a3.height);
}

- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return -[_GEOPlaceDataItem _bestBrandIconOfType:size:allowSmaller:]((uint64_t)self, 3, a4, a3.width, a3.height);
}

- (GEOMapItemContainedPlace)_containedPlace
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int *v7;
  uint64_t i;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  GEOMapItemContainedPlace *v16;
  GEOMapItemContainedPlace *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[GEOPDPlace components](self->_placeData, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v6 = &OBJC_IVAR___GEOXPCReply__methodName;
    v7 = &OBJC_IVAR___GEOXPCReply__methodName;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v9 = *(id **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (v9 && (*(_WORD *)((_BYTE *)v9 + v6[731]) & 0x80) != 0 && *(_DWORD *)((char *)v9 + v7[732]) == 50)
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          -[GEOPDComponent values](v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v21;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v21 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
                if (v15 && *(_QWORD *)(v15 + 152))
                {
                  v17 = [GEOMapItemContainedPlace alloc];
                  -[GEOPDComponentValue containedPlace]((id *)v15);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = -[GEOMapItemContainedPlace initWithContainedPlace:](v17, "initWithContainedPlace:", v18);

                  goto LABEL_24;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v12)
                continue;
              break;
            }
          }

          v6 = &OBJC_IVAR___GEOXPCReply__methodName;
          v7 = &OBJC_IVAR___GEOXPCReply__methodName;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v16 = 0;
    }
    while (v4);
  }
  else
  {
    v16 = 0;
  }
LABEL_24:

  return v16;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[GEOPDPlace components](self->_placeData, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    v6 = &OBJC_IVAR___GEOXPCReply__methodName;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v8 && (*(_WORD *)(v8 + 100) & 0x80) != 0 && *(_DWORD *)(v8 + v6[732]) == 50)
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          -[GEOPDComponent values]((id *)v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v18;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v18 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
                if (v14 && *(_QWORD *)(v14 + 152))
                {

                  v15 = 1;
                  goto LABEL_24;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              if (v11)
                continue;
              break;
            }
          }

          v6 = &OBJC_IVAR___GEOXPCReply__methodName;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v4);
  }
  else
  {
    v15 = 0;
  }
LABEL_24:

  return v15;
}

- (id)_groundViewLabel
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 24), "components");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    v5 = &OBJC_IVAR___GEOXPCReply__methodName;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v1);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v7 && (*(_WORD *)(v7 + 100) & 0x80) != 0 && *(_DWORD *)(v7 + v5[732]) == 56)
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          -[GEOPDComponent values]((id *)v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v17;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v17 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
                if (v13 && *(_QWORD *)(v13 + 256))
                {
                  -[GEOPDComponentValue groundViewLabel]((id *)v13);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_25;
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v10)
                continue;
              break;
            }
          }

          v5 = &OBJC_IVAR___GEOXPCReply__methodName;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 0;
    }
    while (v3);
  }
  else
  {
    v14 = 0;
  }
LABEL_25:

  return v14;
}

- (BOOL)_hasGroundViewLocationId
{
  _BYTE *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _groundViewLabel]((uint64_t)self);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[32] & 1;
  else
    v3 = 0;

  return v3;
}

- (unint64_t)_groundViewLocationId
{
  _QWORD *v2;
  unint64_t v3;

  -[_GEOPlaceDataItem _groundViewLabel]((uint64_t)self);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[3];
  else
    v3 = 0;

  return v3;
}

- (void)iterateGroundViewsWithBlock:(id)a3
{
  void (**v4)(id, void *, void *, void *, double, double);
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, void *, double, double))a3;
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[_GEOPlaceDataItem _groundViewLabel]((uint64_t)self);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDGroundViewLabel groundViewLabelInfos](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          if (v11 && (~*(unsigned __int8 *)(v11 + 76) & 3) == 0)
          {
            v12 = *(double *)(v11 + 56);
            v13 = *(double *)(v11 + 24);
            -[GEOPDGroundViewLabelInfo localityName](*(id **)(*((_QWORD *)&v17 + 1) + 8 * v10));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDGroundViewLabelInfo locationName]((id *)v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDGroundViewLabelInfo secondaryLocationName]((id *)v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v14, v15, v16, v12, v13);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)hasVenueCapacity
{
  void *v2;
  char v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapacity");

  return v3;
}

- (int64_t)venueCapacity
{
  void *v2;
  int64_t v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasCapacity"))
    v3 = (int)objc_msgSend(v2, "capacity");
  else
    v3 = 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (NSArray)spatialMappedPlaceCategories
{
  return 0;
}

- (GEOStyleAttributes)_walletPlaceStyling
{
  uint64_t v3;
  GEOPDPlace *placeData;
  void *v5;
  GEOPDPlace *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53;
  v15 = __Block_byref_object_dispose__53;
  v16 = 0;
  v3 = MEMORY[0x1E0C809B0];
  placeData = self->_placeData;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke;
  v10[3] = &unk_1E1C09718;
  v10[4] = &v11;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](placeData, "enumerateValidComponentValuesOfType:usingBlock:", 16, v10);
  v5 = (void *)v12[5];
  if (!v5)
  {
    v6 = self->_placeData;
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke_2;
    v9[3] = &unk_1E1C09718;
    v9[4] = &v11;
    -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](v6, "enumerateValidComponentValuesOfType:usingBlock:", 1, v9);
    v5 = (void *)v12[5];
  }
  v7 = v5;
  _Block_object_dispose(&v11, 8);

  return (GEOStyleAttributes *)v7;
}

- (NSString)_walletPlaceLocalizedString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "names");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)_walletPlaceLocalizedStringLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "names");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (GEOStyleAttributes)_walletCategoryStyling
{
  void *v2;
  void *v3;

  -[_GEOPlaceDataItem _walletCategoryIdentifier](self, "_walletCategoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOWalletCategoryStylingMapResource styleAttributesForWalletCategory:](GEOWalletCategoryStylingMapResource, "styleAttributesForWalletCategory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOStyleAttributes *)v3;
}

- (NSString)_walletCategoryLocalizedString
{
  return 0;
}

- (NSString)_walletCategoryLocalizedStringLocale
{
  return 0;
}

- (NSString)_walletMapsCategoryIdentifier
{
  void *v2;
  void *v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapsCategoryId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_walletCategoryIdentifier
{
  void *v2;
  void *v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "walletCategoryId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_enableRAPLightweightFeedback
{
  void *v2;
  char v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableRapLightweightFeedback");

  return v3;
}

- (NSArray)_alternateSearchableNames
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "alternateSearchableNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "stringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

- (BOOL)_showSuggestAnEditButton
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  -[GEOPDPlace componentOfType:options:](self->_placeData, "componentOfType:options:", 41, 0);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent values](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();

  if (!v4 || !*(_QWORD *)(v4 + 480))
    goto LABEL_8;
  -[GEOPDComponentValue rap]((id *)v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5 || (*(_BYTE *)(v5 + 20) & 1) == 0)
  {

LABEL_8:
    v7 = 1;
    goto LABEL_9;
  }
  v6 = *(_DWORD *)(v5 + 16);

  if (v6 != 1)
    goto LABEL_8;
  v7 = 0;
LABEL_9:

  return v7;
}

- (int)_RAPFlowType
{
  int result;

  result = -[GEOPDPlace rapFlowType](self->_placeData, "rapFlowType");
  if ((result - 1) >= 7)
    return 0;
  return result;
}

- (BOOL)_hasAppleRatings
{
  void *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _appleRatings](self, "_appleRatings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)_appleRatings
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GEOAppleRating *v10;
  GEOAppleRating *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[GEOPDRating ratingListForPlaceData:type:](GEOPDRating, "ratingListForPlaceData:type:", self->_placeData, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
          v10 = [GEOAppleRating alloc];
          v11 = -[GEOAppleRating initWithRating:](v10, "initWithRating:", v9, (_QWORD)v14);
          objc_msgSend(v3, "addObject:", v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    v12 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v12 = 0;
  }

  return (NSArray *)v12;
}

- (GEOAppleRating)_overallAppleRating
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_GEOPlaceDataItem _appleRatings](self, "_appleRatings", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v6, "ratingType"))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (GEOAppleRating *)v3;
}

- (GEOPlaceQuestionnaire)_placeQuestionnaire
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  GEOPlaceQuestionnaire *v6;

  -[GEOPDPlace successfulComponentWithValuesOfType:](self->_placeData, "successfulComponentWithValuesOfType:", 73);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent values](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  -[GEOPDComponentValue placeQuestionnaire](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOPlaceQuestionnaire initWithGEOPDPlaceQuestionnaire:]([GEOPlaceQuestionnaire alloc], "initWithGEOPDPlaceQuestionnaire:", v5);

  return v6;
}

- (BOOL)_hasPlaceQuestionnaire
{
  void *v2;
  BOOL v3;

  -[GEOPDPlace successfulComponentWithValuesOfType:](self->_placeData, "successfulComponentWithValuesOfType:", 73);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSArray)_identifierHistory
{
  id *v3;
  void *v4;
  id *v5;
  id *v6;
  void *v7;
  void *v8;

  if (-[_GEOPlaceDataItem _hasPlaceQuestionnaire](self, "_hasPlaceQuestionnaire"))
  {
    -[GEOPDPlace successfulComponentWithValuesOfType:](self->_placeData, "successfulComponentWithValuesOfType:", 73);
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponent values](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (id *)objc_claimAutoreleasedReturnValue();

    -[GEOPDComponentValue placeQuestionnaire](v5);
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceQuestionnaireResult historicalMapsIds](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (unint64_t)_totalPhotoCount
{
  int *v2;
  unint64_t v3;

  -[GEOPDPlace componentOfType:options:](self->_placeData, "componentOfType:options:", 26, 3);
  v2 = (int *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[23];
  else
    v3 = 0;

  return v3;
}

- (BOOL)_canDownloadMorePhotos
{
  _GEOPlaceDataItem *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  -[_GEOPlaceDataItem _photos](self, "_photos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 < -[_GEOPlaceDataItem _totalPhotoCount](v2, "_totalPhotoCount");

  return (char)v2;
}

- (BOOL)_hasCaptionedPhotoAlbum
{
  void *v2;
  BOOL v3;

  -[_GEOPlaceDataItem _captionedPhotoAlbums](self, "_captionedPhotoAlbums");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)_captionedPhotoAlbums
{
  geo_isolate_sync();
  return self->_captionedPhotoAlbums;
}

- (NSString)_bestAvailableCountryCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_GEOPlaceDataItem _iso3166CountryCode](self, "_iso3166CountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_GEOPlaceDataItem addressObject](self, "addressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = v3;

  return (NSString *)v7;
}

- (BOOL)_hasEnclosingPlace
{
  void *v2;
  BOOL v3;

  -[GEOPDPlace successfulComponentWithValuesOfType:](self->_placeData, "successfulComponentWithValuesOfType:", 83);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (GEOEnclosingPlace)_enclosingPlace
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  GEOEnclosingPlace *v6;

  -[GEOPDPlace componentOfType:options:](self->_placeData, "componentOfType:options:", 83, 3);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent values](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponentValue containmentPlace](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GEOEnclosingPlace initWithContainmentPlace:]([GEOEnclosingPlace alloc], "initWithContainmentPlace:", v5);
  return v6;
}

- (BOOL)_hasAreaHighlightId
{
  void *v2;
  char v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAreaHighlightId");

  return v3;
}

- (unint64_t)_areaHighlightId
{
  void *v2;
  unint64_t v3;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areaHighlightId");

  return v3;
}

- (BOOL)_hasPlaceDescription
{
  void *v2;
  BOOL v3;

  -[GEOPDPlace successfulComponentWithValuesOfType:](self->_placeData, "successfulComponentWithValuesOfType:", 86);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)_placeDescription
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;

  -[GEOPDPlace successfulComponentWithValuesOfType:](self->_placeData, "successfulComponentWithValuesOfType:", 86);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent values](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  -[GEOPDComponentValue about](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedPlaceDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  void *v2;
  GEOEnhancedPlacement *v3;

  +[GEOPDEnhancedPlacement enhancedPlacementWithPlaceData:](GEOPDEnhancedPlacement, "enhancedPlacementWithPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOEnhancedPlacement initWithGEOPDEnhancedPlacement:]([GEOEnhancedPlacement alloc], "initWithGEOPDEnhancedPlacement:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOLabelGeometry)_labelGeometry
{
  void *v2;
  GEOLabelGeometry *v3;

  +[GEOPDLabelGeometry labelGeometryWithPlaceData:](GEOPDLabelGeometry, "labelGeometryWithPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOLabelGeometry initWithGEOPDLabelGeometry:]([GEOLabelGeometry alloc], "initWithGEOPDLabelGeometry:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOViewportFrame)_viewportFrame
{
  uint64_t v2;
  uint64_t v3;
  GEOViewportFrame *v4;
  void *v5;
  GEOViewportFrame *v6;

  +[GEOPDBounds boundsInfoForPlaceData:](GEOPDBounds, "boundsInfoForPlaceData:", self->_placeData);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (-[GEOPDBounds _readViewportFrame](v2), *(_QWORD *)(v3 + 40)))
  {
    v4 = [GEOViewportFrame alloc];
    -[GEOPDBounds viewportFrame]((id *)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOViewportFrame initWithGEOPDViewportFrame:](v4, "initWithGEOPDViewportFrame:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  void *v2;
  GEOEnrichmentInfo *v3;

  +[GEOPDEnrichmentInfo enrichmentInfoWithPlaceData:](GEOPDEnrichmentInfo, "enrichmentInfoWithPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOEnrichmentInfo initWithEnrichmentInfo:]([GEOEnrichmentInfo alloc], "initWithEnrichmentInfo:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOEnrichmentData)_enrichmentData
{
  void *v2;
  GEOEnrichmentData *v3;

  +[GEOPDEnrichmentData enrichmentDataWithPlaceData:](GEOPDEnrichmentData, "enrichmentDataWithPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOEnrichmentData initWithEnrichmentData:]([GEOEnrichmentData alloc], "initWithEnrichmentData:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOTrailHead)_trailHead
{
  void *v2;
  GEOTrailHead *v3;

  +[GEOPDTrailHead trailHeadWithPlaceData:](GEOPDTrailHead, "trailHeadWithPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOTrailHead initWithTrailHead:]([GEOTrailHead alloc], "initWithTrailHead:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOHikeSummary)_hikeSummary
{
  void *v2;
  GEOHikeSummary *v3;

  +[GEOPDHikeSummary hikeSummaryWithPlaceData:](GEOPDHikeSummary, "hikeSummaryWithPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOHikeSummary initWithPDHikeSummary:]([GEOHikeSummary alloc], "initWithPDHikeSummary:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  return +[GEOPDHikeAssociatedInfo hikeAssociatedInfoWithPlaceData:](GEOPDHikeAssociatedInfo, "hikeAssociatedInfoWithPlaceData:", self->_placeData);
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  return +[GEOPDHikeGeometry hikeGeometryWithPlaceData:](GEOPDHikeGeometry, "hikeGeometryWithPlaceData:", self->_placeData);
}

- (int)_hikeGeometryElevationModel
{
  uint64_t v2;
  int v3;

  -[GEOPDPlace successfulComponentWithValuesOfType:](self->_placeData, "successfulComponentWithValuesOfType:", 106);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (*(_WORD *)(v2 + 100) & 8) != 0)
    v3 = *(_DWORD *)(v2 + 72);
  else
    v3 = 0;

  return v3;
}

- (NSArray)_externalActionLinks
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  GEOPlaceExternalAction *v11;
  GEOPlaceExternalAction *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[GEOPDPlace componentOfType:options:](self->_placeData, "componentOfType:options:", 94, 3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOPDComponent values](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDComponentValue actionData](*(id **)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [GEOPlaceExternalAction alloc];
        v12 = -[GEOPlaceExternalAction initWithActionData:attributionMap:](v11, "initWithActionData:attributionMap:", v10, self->_attributionMap, (_QWORD)v15);
        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

- (float)_photosMemoryScore
{
  void *v2;
  float v3;
  float v4;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -1.0;
  if (objc_msgSend(v2, "hasPhotosMemoryScore"))
  {
    objc_msgSend(v2, "photosMemoryScore");
    v3 = v4;
  }

  return v3;
}

- (GEOTooltip)_tooltip
{
  void *v2;
  GEOTooltip *v3;

  +[GEOPDTooltip tooltipFromPlaceData:](GEOPDTooltip, "tooltipFromPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOTooltip initWithPDTooltip:]([GEOTooltip alloc], "initWithPDTooltip:", v2);

  return v3;
}

- (int)_placeCategoryType
{
  void *v2;
  int v3;
  int v4;

  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", self->_placeData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "placeCategoryType");
  if ((v3 - 1) >= 4)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

@end
