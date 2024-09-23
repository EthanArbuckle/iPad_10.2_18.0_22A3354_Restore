@implementation MUPlaceDataAvailability

- (MUPlaceDataAvailability)initWithMapItem:(id)a3 options:(unint64_t)a4
{
  id v7;
  MUPlaceDataAvailability *v8;
  MUPlaceDataAvailability *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceDataAvailability;
  v8 = -[MUPlaceDataAvailability init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_placeCardOptions = a4;
    v9->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
    v9->_hikingIOSEnabled = MapsFeature_IsEnabled_HikingiOS();
  }

  return v9;
}

- (BOOL)supportsPhotoSlider
{
  MKMapItem *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t placeCardOptions;
  char v9;
  char v10;

  v3 = self->_mapItem;
  -[MKMapItem place](v3, "place");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstBusiness");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "photosCount"))
  {
    v6 = 1;
  }
  else
  {
    -[MKMapItem _geoMapItem](v3, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "_hasCaptionedPhotoAlbum");

  }
  if (MapKitIdiomIsMacCatalyst())
  {
    placeCardOptions = self->_placeCardOptions;
    v9 = -[MKMapItem _hasLookAroundStorefront](v3, "_hasLookAroundStorefront");
    if ((placeCardOptions & 0x2000000) != 0)
      v10 = 0;
    else
      v10 = v9;
    v6 |= v10;
  }

  return v6;
}

- (BOOL)supportsAmenities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MKMapItem _amenities](self->_mapItem, "_amenities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (!objc_msgSend(v7, "isApplePayAmenity") || (objc_msgSend(v7, "isAmenityPresent") & 1) != 0)
        {
          v8 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)supportsRelatedPlaces
{
  void *v2;
  BOOL v3;

  if ((self->_placeCardOptions & 0x4000000) != 0)
    return 0;
  -[MKMapItem _relatedPlaceLists](self->_mapItem, "_relatedPlaceLists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)supportsHeaderContainment
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_containedPlace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)suportsOfficialApp
{
  BOOL v2;
  void *v3;

  if ((self->_placeCardOptions & 0x20) == 0)
    return 0;
  -[MKMapItem _preferedAppAdamID](self->_mapItem, "_preferedAppAdamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (BOOL)supportsHours
{
  MKMapItem *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = self->_mapItem;
  -[MKMapItem timeZone](v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    LOBYTE(v3) = (-[MKMapItem _isMapItemTypeBrand](v2, "_isMapItemTypeBrand") & 1) == 0
              && (-[MKMapItem _businessHours](v2, "_businessHours"),
                  v4 = (void *)objc_claimAutoreleasedReturnValue(),
                  v5 = objc_msgSend(v4, "count"),
                  v4,
                  v5);

  return (char)v3;
}

- (BOOL)supportsCuratedGuidesCarousel
{
  BOOL v2;
  void *v3;

  if ((self->_placeCardOptions & 0x40000000) == 0)
    return 0;
  -[MKMapItem _placeCollections](self->_mapItem, "_placeCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count") != 0;

  return v2;
}

- (BOOL)supportsEncyclopedicDescription
{
  void *v2;
  char v3;

  -[MKMapItem _encyclopedicInfo](self->_mapItem, "_encyclopedicInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasTextBlock");

  return v3;
}

- (BOOL)supportsWebContent
{
  return (BYTE3(self->_placeCardOptions) >> 5) & 1;
}

- (BOOL)supportsVenueTextInfo
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[MKMapItem _hasVenueFeatureType](self->_mapItem, "_hasVenueFeatureType")
    || -[MKMapItem _venueFeatureType](self->_mapItem, "_venueFeatureType") != 2)
  {
    return 0;
  }
  -[MKMapItem _venueInfo](self->_mapItem, "_venueInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)supportsAnnotatedPhotos
{
  void *v2;
  BOOL v3;

  -[MKMapItem _annotatedItemList](self->_mapItem, "_annotatedItemList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = displayStyleForAnnotatedItemList() == 1;

  return v3;
}

- (BOOL)supportsAnnotatedTextList
{
  void *v2;
  BOOL v3;

  -[MKMapItem _annotatedItemList](self->_mapItem, "_annotatedItemList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = displayStyleForAnnotatedItemList() == 2;

  return v3;
}

- (BOOL)_hasAppleRatingsCategories
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appleRatings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "ratingType") == 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)shouldShowRatingsAndReviewsModule
{
  _BOOL4 v3;
  BOOL result;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v3 = -[MUPlaceDataAvailability supportsAppleRatings](self, "supportsAppleRatings");
  if (v3 && -[MUPlaceDataAvailability _hasAppleRatingsCategories](self, "_hasAppleRatingsCategories"))
    return 1;
  -[MKMapItem _reviews](self->_mapItem, "_reviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[MKMapItem _hasUserRatingScore](self->_mapItem, "_hasUserRatingScore");
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_hasPlaceCollectionPullQuotes");

  -[MKMapItem _tips](self->_mapItem, "_tips");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  result = 1;
  if ((v3 | v7 ^ 1) == 1)
  {
    if (v11)
      v12 = 1;
    else
      v12 = v9;
    return v6 || v12;
  }
  return result;
}

- (BOOL)supportsAppleRatings
{
  return objc_msgSend(MEMORY[0x1E0CC18A8], "shouldShowAppleRatingsForMapItem:", self->_mapItem);
}

- (BOOL)supportsBrowseCategory
{
  int v3;
  MKMapItem *mapItem;
  int v5;

  v3 = -[MKMapItem _browseCategory_isVenueItem](self->_mapItem, "_browseCategory_isVenueItem");
  mapItem = self->_mapItem;
  if (!v3)
  {
    v5 = -[MKMapItem _browseCategory_canDisplayBrowseCategoriesForPlace](mapItem, "_browseCategory_canDisplayBrowseCategoriesForPlace");
    if (!v5)
      return v5;
    return (BYTE2(self->_placeCardOptions) >> 1) & 1;
  }
  if ((-[MKMapItem _browseCategory_canDisplayBrowseCategoriesForVenue](mapItem, "_browseCategory_canDisplayBrowseCategoriesForVenue") & 1) != 0)return (BYTE2(self->_placeCardOptions) >> 1) & 1;
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)supportsPlaceAttribution
{
  void *v3;
  void *v4;
  BOOL v5;

  if ((GEOConfigGetBOOL() & 1) != 0
    || !-[MKMapItem _needsAttribution](self->_mapItem, "_needsAttribution"))
  {
    return 0;
  }
  -[MKMapItem _attribution](self->_mapItem, "_attribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)supportsInlineMap
{
  double v4;
  double v5;
  BOOL v6;

  if ((self->_placeCardOptions & 1) != 0
    || (-[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand") & 1) != 0)
  {
    return 0;
  }
  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  v6 = v5 >= -180.0;
  if (v5 > 180.0)
    v6 = 0;
  if (v4 < -90.0)
    v6 = 0;
  return v4 <= 90.0 && v6;
}

- (BOOL)supportsInlinePOIMap
{
  int v3;

  if ((self->_placeCardOptions & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand");
    if (v3)
      LOBYTE(v3) = -[MKMapItem _isStandAloneBrand](self->_mapItem, "_isStandAloneBrand") ^ 1;
  }
  return v3;
}

- (BOOL)isTransitItem
{
  return -[MKMapItem _isMapItemTypeTransit](self->_mapItem, "_isMapItemTypeTransit");
}

- (BOOL)allowTransitLineSelection
{
  return BYTE1(self->_placeCardOptions) & 1;
}

- (BOOL)hasRatingsOrReviews
{
  void *v3;
  uint64_t v4;
  BOOL result;

  -[MKMapItem _reviews](self->_mapItem, "_reviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  result = -[MKMapItem _hasUserRatingScore](self->_mapItem, "_hasUserRatingScore");
  if (v4)
    return 1;
  return result;
}

- (BOOL)supportsReportAnIssue
{
  if ((self->_placeCardOptions & 0x40) != 0)
    return 0;
  else
    return _MKRAPIsAvailable();
}

- (BOOL)supportsInlineReportAnIssue
{
  if ((self->_placeCardOptions & 0x400000000) == 0
    && MapsFeature_IsEnabled_RAPSydney()
    && (self->_placeCardOptions & 0x20000000) != 0
    && -[MUPlaceDataAvailability supportsReportAnIssue](self, "supportsReportAnIssue"))
  {
    return -[MKMapItem _isMapItemTypeBusiness](self->_mapItem, "_isMapItemTypeBusiness");
  }
  else
  {
    return 0;
  }
}

- (BOOL)supportsReportsInReview
{
  return (self->_placeCardOptions & 0x400000000) == 0
      && MapsFeature_IsEnabled_RAPSydney()
      && (self->_placeCardOptions & 0x20000000) != 0
      && -[MUPlaceDataAvailability supportsReportAnIssue](self, "supportsReportAnIssue");
}

- (BOOL)supportsShowingCoordinates
{
  MKMapItem *v2;
  void *v3;
  int v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v12;
  double v13;
  CLLocationDegrees v14;
  double v15;
  CLLocationDegrees v16;
  CLLocationCoordinate2D v17;

  v2 = self->_mapItem;
  -[MKMapItem _geoMapItem](v2, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_placeType");

  if (v4 != 5 && v4 != 10)
  {
    v6 = (void *)MEMORY[0x1E0D27178];
    -[MKMapItem _geoMapItem](v2, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coordinate");
    if (objc_msgSend(v6, "isLocationShiftRequiredForCoordinate:"))
    {

    }
    else
    {
      -[MKMapItem _geoMapItem](v2, "_geoMapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "referenceFrame");

      if (v9 != 2)
      {
        -[MKMapItem _geoMapItem](v2, "_geoMapItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "coordinate");
        v14 = v13;
        v16 = v15;

        v17 = CLLocationCoordinate2DMake(v14, v16);
        v10 = CLLocationCoordinate2DIsValid(v17);
        goto LABEL_9;
      }
    }
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)supportsMessageHours
{
  MKMapItem *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v2 = self->_mapItem;
  -[MKMapItem _geoMapItem](v2, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_messageLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  if (!-[MKMapItem _isMapItemTypeBrand](v2, "_isMapItemTypeBrand"))
    goto LABEL_6;
  -[MKMapItem _messageBusinessHours](v2, "_messageBusinessHours");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v7 = (void *)v6;
  -[MKMapItem _geoMapItem](v2, "_geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_messageLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = 1;
  else
LABEL_6:
    v11 = 0;

  return v11;
}

- (BOOL)supportsPlaceDescription
{
  void *v2;
  char v3;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasPlaceDescription");

  return v3;
}

- (BOOL)supportsCallToAction
{
  return objc_msgSend(MEMORY[0x1E0CC18A8], "shouldShowCallToActionForMapItem:options:", self->_mapItem, self->_placeCardOptions);
}

- (BOOL)supportsAddingPhotos
{
  return objc_msgSend(MEMORY[0x1E0CC18A8], "shouldShowPhotosCallToActionForMapItem:", self->_mapItem);
}

- (BOOL)supportsPhotoOnlyDataCollection
{
  void *v2;
  void *v3;
  char v4;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeQuestionnaire");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "canCollectRatings") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "canCollectPhotos");

  return v4;
}

- (BOOL)showEditAddressForHome
{
  _BOOL4 v2;

  if (self->_myPlacesEnabled)
    LOBYTE(v2) = 0;
  else
    return (BYTE2(self->_placeCardOptions) >> 3) & 1;
  return v2;
}

- (BOOL)supportsPlaceEnrichment
{
  void *v3;
  unint64_t placeCardOptions;
  BOOL result;

  -[MKMapItem _enrichmentInfo](self->_mapItem, "_enrichmentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  result = 0;
  if (v3)
  {
    placeCardOptions = self->_placeCardOptions;

    if ((placeCardOptions & 0x20000000) != 0)
      return 1;
  }
  return result;
}

- (BOOL)canShowDirections
{
  if ((self->_placeCardOptions & 8) != 0)
    return 0;
  else
    return -[MKMapItem _canGetDirections](self->_mapItem, "_canGetDirections");
}

- (BOOL)supportsInlineRatings
{
  int IsEnabled_SydneyARP;
  void *v4;
  int v5;
  void *v6;
  int v7;

  IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP();
  if (IsEnabled_SydneyARP)
  {
    IsEnabled_SydneyARP = GEOConfigGetBOOL();
    if (IsEnabled_SydneyARP)
    {
      -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_hasUserRatingScore");

      -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_hasAppleRatings");

      if (!v5 || v7)
      {
        IsEnabled_SydneyARP = -[MUPlaceDataAvailability supportsCallToAction](self, "supportsCallToAction");
        if (IsEnabled_SydneyARP)
          LOBYTE(IsEnabled_SydneyARP) = !-[MUPlaceDataAvailability supportsPhotoOnlyDataCollection](self, "supportsPhotoOnlyDataCollection");
      }
      else
      {
        LOBYTE(IsEnabled_SydneyARP) = 0;
      }
    }
  }
  return IsEnabled_SydneyARP;
}

- (BOOL)supportsSharing
{
  return -[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand") ^ 1;
}

- (BOOL)supportsMessagesForBusiness
{
  void *v2;
  BOOL v3;

  -[MKMapItem _messageURLString](self->_mapItem, "_messageURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)supportsEVCharging
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!MapsFeature_IsEnabled_RealTimeEVCharger())
    return 0;
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_evCharger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plugs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count") != 0;
  return v6;
}

- (BOOL)supportsHikingTrails
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKMapItem _trailHead](self->_mapItem, "_trailHead");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)supportsHikingTip
{
  return self->_hikingIOSEnabled;
}

- (BOOL)supportsPlaceNotes
{
  return self->_myPlacesEnabled && +[MapsUIUtilities isMapsProcess](MapsUIUtilities, "isMapsProcess");
}

- (BOOL)isRouteCreationAvailable
{
  _BOOL4 v2;

  if (self->_hikingIOSEnabled)
    return (BYTE5(self->_placeCardOptions) >> 2) & 1;
  else
    LOBYTE(v2) = 0;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
