@implementation _GEOPlaceItem

- (_GEOPlaceItem)initWithPlaceResult:(id)a3
{
  id v5;
  _GEOPlaceItem *v6;
  uint64_t v7;
  GEOPlace *place;
  uint64_t v9;
  geo_isolater *lazyIvarIsolater;
  _GEOPlaceItem *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GEOPlaceItem;
  v6 = -[_GEOPlaceItem init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "place");
    v7 = objc_claimAutoreleasedReturnValue();
    place = v6->_place;
    v6->_place = (GEOPlace *)v7;

    objc_storeStrong((id *)&v6->_placeResult, a3);
    v9 = geo_isolater_create_with_format();
    lazyIvarIsolater = v6->_lazyIvarIsolater;
    v6->_lazyIvarIsolater = (geo_isolater *)v9;

    v11 = v6;
  }

  return v6;
}

- (_GEOPlaceItem)initWithPlace:(id)a3
{
  id v5;
  _GEOPlaceItem *v6;
  _GEOPlaceItem *v7;
  uint64_t v8;
  geo_isolater *lazyIvarIsolater;
  _GEOPlaceItem *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOPlaceItem;
  v6 = -[_GEOPlaceItem init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_place, a3);
    v8 = geo_isolater_create_with_format();
    lazyIvarIsolater = v7->_lazyIvarIsolater;
    v7->_lazyIvarIsolater = (geo_isolater *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_placeResult)
  {
    v9.receiver = self;
    v9.super_class = (Class)_GEOPlaceItem;
    -[_GEOPlaceItem description](&v9, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceResult formattedText](self->_placeResult, "formattedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ PlaceResult: %@"), v4, v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_GEOPlaceItem;
    -[_GEOPlaceItem description](&v8, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlace formattedText](self->_place, "formattedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Place: %@"), v4, v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  return -[GEOPlace hash](self->_place, "hash");
}

- (BOOL)isEqualToMapItem:(id)a3
{
  GEOPlace *place;
  void *v4;

  place = self->_place;
  objc_msgSend(a3, "_place");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(place) = -[GEOPlace isEqual:](place, "isEqual:", v4);

  return (char)place;
}

- (BOOL)isValid
{
  return self->_place || self->_placeResult != 0;
}

- (int)referenceFrame
{
  return -[GEOPlace referenceFrame](self->_place, "referenceFrame");
}

- (NSString)name
{
  return (NSString *)-[GEOPlace bestName](self->_place, "bestName");
}

- (id)spokenNameForLocale:(id)a3
{
  return -[GEOPlace spokenName](self->_place, "spokenName", a3);
}

- (NSData)encodedData
{
  void *placeResult;

  if (self->_placeResult)
    placeResult = self->_placeResult;
  else
    placeResult = self->_place;
  objc_msgSend(placeResult, "data");
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDisputed
{
  return -[GEOPlace isDisputed](self->_place, "isDisputed");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOPlace coordinate](self->_place, "coordinate");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[GEOPlace hasCenter](self->_place, "hasCenter"))
  {
    -[GEOPlace center](self->_place, "center");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinate");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v7 = 0xC066800000000000;
    v5 = 0xC066800000000000;
  }
  v8 = *(double *)&v5;
  v9 = *(double *)&v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (GEOMapRegion)displayMapRegion
{
  _BOOL4 v3;
  GEOPlace *place;
  GEOMapRegion *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = -[GEOPlace hasMapRegion](self->_place, "hasMapRegion");
  place = self->_place;
  if (v3)
  {
    -[GEOPlace mapRegion](place, "mapRegion");
    v5 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOPlace coordinate](place, "coordinate");
    if (fabs(v7 + 180.0) >= 0.00000001 || fabs(v6 + 180.0) >= 0.00000001)
    {
      v8 = GEOMapRectMakeWithRadialDistance(v6, v7, 10000.0);
      v5 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v8, v9, v10, v11);
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  void *v3;

  if (-[GEOPlace hasMapRegion](self->_place, "hasMapRegion"))
  {
    -[GEOPlace mapRegion](self->_place, "mapRegion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOMapRegion *)v3;
}

- (NSDictionary)addressDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEOPlace address](self->_place, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    -[_GEOPlaceItem name](self, "name");
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

- (NSArray)areasOfInterest
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOPlace address](self->_place, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "structuredAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "areaOfInterests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSTimeZone)timezone
{
  id v3;
  id *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E80]);
  -[GEOPlace timezone](self->_place, "timezone");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOTimezone identifier](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:", v5);

  return (NSTimeZone *)v6;
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

- (GEOPDPlace)_placeData
{
  return 0;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 0;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (int)_placeType
{
  return _MapItemPlaceTypeForPlaceType(-[GEOPlace type](self->_place, "type"));
}

- (GEOPlace)_place
{
  return self->_place;
}

- (GEOPlaceResult)_placeResult
{
  return self->_placeResult;
}

- (GEOMapItemClientAttributes)_clientAttributes
{
  return 0;
}

- (NSData)_placeDataAsData
{
  return 0;
}

- (GEOAddress)geoAddress
{
  return -[GEOPlace address](self->_place, "address");
}

- (NSArray)_tips
{
  return 0;
}

- (BOOL)hasExpiredComponents
{
  return 0;
}

- (id)addressObject
{
  geo_isolate_sync();
  return self->_addressObject;
}

- (id)weatherDisplayName
{
  void *v2;
  void *v3;

  -[_GEOPlaceItem addressObject](self, "addressObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weatherDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSData)externalTransitStationCode
{
  return 0;
}

- (int)_addressGeocodeAccuracy
{
  int result;

  if (!-[GEOPlace hasAddressGeocodeAccuracy](self->_place, "hasAddressGeocodeAccuracy"))
    return -1;
  result = -[GEOPlace addressGeocodeAccuracy](self->_place, "addressGeocodeAccuracy");
  if (result >= 6)
    return -1;
  return result;
}

- (id)_spokenAddressForLocale:(id)a3
{
  return -[GEOPlace spokenAddress](self->_place, "spokenAddress", a3);
}

- (int)_recommendedTransportType
{
  return 4;
}

- (BOOL)_hasTravelTimeForTransportType:(int)a3
{
  return -[GEOPlaceResult hasTravelTime](self->_placeResult, "hasTravelTime", *(_QWORD *)&a3);
}

- (unsigned)_travelTimeForTransportType:(int)a3
{
  unsigned int result;

  result = -[GEOPlaceResult hasTravelTime](self->_placeResult, "hasTravelTime", *(_QWORD *)&a3);
  if (result)
    return -[GEOPlaceResult travelTime](self->_placeResult, "travelTime");
  return result;
}

- (unsigned)_travelDistanceForTransportType:(int)a3
{
  unsigned int result;

  result = -[GEOPlaceResult hasTravelDistance](self->_placeResult, "hasTravelDistance", *(_QWORD *)&a3);
  if (result)
    return -[GEOPlaceResult travelDistance](self->_placeResult, "travelDistance");
  return result;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  return -[GEOPlace arrivalMapRegionForTransportType:](self->_place, "arrivalMapRegionForTransportType:", *(_QWORD *)&a3);
}

- (NSArray)_roadAccessPoints
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GEORoadAccessPoint *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[GEOPlace entryPointsCount](self->_place, "entryPointsCount"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[GEOPlace entryPointsCount](self->_place, "entryPointsCount"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[GEOPlace entryPoints](self->_place, "entryPoints", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          v10 = objc_alloc_init(GEORoadAccessPoint);
          -[GEORoadAccessPoint setLocation:](v10, "setLocation:", v9);
          -[GEORoadAccessPoint setDrivingDirection:](v10, "setDrivingDirection:", 1);
          -[GEORoadAccessPoint setWalkingDirection:](v10, "setWalkingDirection:", 1);
          objc_msgSend(v3, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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

- (BOOL)_hasResultProviderID
{
  GEOPlace *place;

  place = self->_place;
  if (place)
    LOBYTE(place) = -[GEOPlace hasLocalSearchProviderID](place, "hasLocalSearchProviderID");
  return (char)place;
}

- (int)_resultProviderID
{
  GEOPlace *place;

  place = self->_place;
  if (place && -[GEOPlace hasLocalSearchProviderID](place, "hasLocalSearchProviderID"))
    return -[GEOPlace localSearchProviderID](self->_place, "localSearchProviderID");
  else
    return 0;
}

- (BOOL)_hasTransit
{
  return 0;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  return 0;
}

- (GEOTransitAttribution)_transitAttribution
{
  return 0;
}

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  return 0;
}

- (BOOL)_hasFlyover
{
  return 0;
}

- (GEOPDFlyover)_flyover
{
  return 0;
}

- (NSString)_flyoverAnnouncementMessage
{
  return 0;
}

- (BOOL)_hasMUID
{
  return 0;
}

- (unint64_t)_muid
{
  return 0;
}

- (GEOMapItemIdentifier)_identifier
{
  return 0;
}

- (BOOL)_hasAreaInMeters
{
  return -[GEOPlace hasArea](self->_place, "hasArea");
}

- (double)_areaInMeters
{
  double result;

  -[GEOPlace area](self->_place, "area");
  return result;
}

- (NSString)_businessURL
{
  return 0;
}

- (BOOL)_hasUserRatingScore
{
  return 0;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  return 0;
}

- (float)_normalizedUserRatingScore
{
  return 0.0;
}

- (BOOL)_hasPriceRange
{
  return 0;
}

- (unsigned)_priceRange
{
  return 0;
}

- (NSString)_resultSnippetLocationString
{
  return 0;
}

- (unsigned)_resultSnippetDistanceDisplayThreshold
{
  return -1;
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  return 0;
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  return 0;
}

- (BOOL)_hasAnyAmenities
{
  return 0;
}

- (NSArray)_amenities
{
  return 0;
}

- (BOOL)_hasOperatingHours
{
  return 0;
}

- (BOOL)_hasCurrentOperatingHours
{
  return 0;
}

- (BOOL)_hasTelephone
{
  return 0;
}

- (BOOL)_optsOutOfTelephoneAds
{
  return 0;
}

- (NSString)_telephone
{
  return 0;
}

- (NSString)_disambiguationName
{
  return 0;
}

- (unint64_t)_openingHoursOptions
{
  return 1;
}

- (BOOL)_hasEncyclopedicInfo
{
  return 0;
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  return 0;
}

- (BOOL)_needsAttribution
{
  return 0;
}

- (NSURL)_webURL
{
  return 0;
}

- (NSURL)_providerURL
{
  return 0;
}

- (NSString)_vendorID
{
  return 0;
}

- (id)_urlForPhotoWithUID:(id)a3
{
  return 0;
}

- (id)_urlForReview:(id)a3
{
  return 0;
}

- (id)_urlForWritingAReview
{
  return 0;
}

- (NSString)_poiSurveyURLString
{
  return 0;
}

- (NSString)_poiPinpointURLString
{
  return 0;
}

- (id)_yelpID
{
  return 0;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  return 0;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  return 0;
}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  return 0;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return 0;
}

- (unint64_t)_customIconID
{
  return 0;
}

- (NSArray)_additionalPlaceInfos
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  GEOMapItemAdditionalPlaceInfo *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[GEOPlaceResult additionalPlacesCount](self->_placeResult, "additionalPlacesCount"))
  {
    -[GEOPlaceResult additionalPlaces](self->_placeResult, "additionalPlaces");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOPlaceResult additionalPlacesCount](self->_placeResult, "additionalPlacesCount"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[GEOPlaceResult additionalPlaces](self->_placeResult, "additionalPlaces", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            v9 = -[GEOMapItemAdditionalPlaceInfo initWithPlace:]([GEOMapItemAdditionalPlaceInfo alloc], "initWithPlace:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
            objc_msgSend(v3, "addObject:", v9);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (id)_asPlaceInfo
{
  GEOMapItemAdditionalPlaceInfo *v2;

  if (self->_place)
    v2 = -[GEOMapItemAdditionalPlaceInfo initWithPlace:]([GEOMapItemAdditionalPlaceInfo alloc], "initWithPlace:", self->_place);
  else
    v2 = 0;
  return v2;
}

- (NSArray)_reviews
{
  return 0;
}

- (NSArray)_photos
{
  return 0;
}

- (BOOL)_hasBusinessClaim
{
  return 0;
}

- (id)_businessClaim
{
  return 0;
}

- (NSArray)spatialMappedCategories
{
  return 0;
}

- (BOOL)_hasFeatureLink
{
  return 0;
}

- (GEORestaurantFeaturesLink)_featureLink
{
  return 0;
}

- (GEOMessageLink)_messageLink
{
  return 0;
}

- (NSArray)_quickLinks
{
  return 0;
}

- (NSArray)_secondaryQuickLinks
{
  return 0;
}

- (NSArray)_placeCollections
{
  return 0;
}

- (NSArray)_searchResultPhotoCarousel
{
  return 0;
}

- (NSArray)_relatedPlaceLists
{
  return 0;
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  return 0;
}

- (id)_placecardLayoutConfiguration
{
  return 0;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return 0;
}

- (GEOAssociatedApp)_associatedApp
{
  return 0;
}

- (int)_parsecSectionType
{
  return 0;
}

- (GEOPriceDescription)_priceDescription
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_lazyIvarIsolater, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeResult, 0);
}

@end
