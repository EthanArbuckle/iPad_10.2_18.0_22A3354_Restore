@implementation GEOBaseMapItem

- (BOOL)isEqualToMapItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEOBaseMapItem;
  return -[GEOBaseMapItem isEqual:](&v4, sel_isEqual_, a3);
}

- (BOOL)isValid
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (id)spokenNameForLocale:(id)a3
{
  return 0;
}

- (NSString)secondaryName
{
  return 0;
}

- (NSString)secondarySpokenName
{
  return 0;
}

- (NSData)encodedData
{
  return 0;
}

- (BOOL)isDisputed
{
  return 0;
}

- (int)referenceFrame
{
  -[GEOBaseMapItem coordinate](self, "coordinate");
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = -180.0;
  v3 = -180.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)labelCoordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = -180.0;
  v3 = -180.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (GEOMapRegion)displayMapRegion
{
  return 0;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  return 0;
}

- (GEOMapRegion)offlineDownloadRegion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[GEOBaseMapItem displayMapRegion](self, "displayMapRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEOBaseMapItem geoFenceMapRegion](self, "geoFenceMapRegion");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (GEOMapRegion *)v6;
}

- (BOOL)supportsOfflineMaps
{
  return 0;
}

- (BOOL)hasDisplayMinZoom
{
  return 0;
}

- (float)displayMinZoom
{
  return 0.0;
}

- (BOOL)hasDisplayMaxZoom
{
  return 0;
}

- (float)displayMaxZoom
{
  return 0.0;
}

- (GEOMapRegion)geoFenceMapRegion
{
  return 0;
}

- (GEOMapRegion)geoFenceMapRegionOrNil
{
  return 0;
}

- (NSDictionary)addressDictionary
{
  return 0;
}

- (NSArray)areasOfInterest
{
  return 0;
}

- (NSTimeZone)timezone
{
  return 0;
}

- (int)mapDisplayType
{
  return 0;
}

- (GEOLocalizedString)disclaimerText
{
  return 0;
}

- (GEOPDURLData)urlData
{
  return 0;
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

- (BOOL)_isPartiallyClientized
{
  return 0;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (BOOL)_hasTravelTimeForTransportType:(int)a3
{
  return 0;
}

- (int)_placeType
{
  return 0;
}

- (GEOPlace)_place
{
  return 0;
}

- (GEOPlaceResult)_placeResult
{
  return 0;
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
  return 0;
}

- (int)_addressGeocodeAccuracy
{
  return -1;
}

- (id)_spokenAddressForLocale:(id)a3
{
  return 0;
}

- (unsigned)_travelTimeForTransportType:(int)a3
{
  return 0;
}

- (unsigned)_travelDistanceForTransportType:(int)a3
{
  return 0;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  return 0;
}

- (NSArray)_roadAccessPoints
{
  return 0;
}

- (BOOL)_hasResultProviderID
{
  return 0;
}

- (int)_resultProviderID
{
  return 0;
}

- (BOOL)_isTransitDisplayFeature
{
  void *v2;
  char v3;

  -[GEOBaseMapItem _styleAttributes](self, "_styleAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransit");

  return v3;
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

- (id)_transitAttributionSummaries
{
  return 0;
}

- (void)loadTransitAttributionDetails:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  return 0;
}

- (NSArray)supportedTransitPaymentMethods
{
  return 0;
}

- (NSArray)transitPaymentMethodSuggestions
{
  return 0;
}

- (double)cachingRadiusMeters
{
  return 0.0;
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

- (GEOMuninViewState)_muninViewState
{
  return 0;
}

- (GEOStorefrontInfo)_storefrontInfo
{
  return 0;
}

- (GEOStorefrontPresentationInfo)_storefrontPresentationInfo
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
  GEOMapItemIdentifier *v3;
  unint64_t v4;
  uint64_t v5;
  GEOMapItemIdentifier *v6;

  if (-[GEOBaseMapItem _hasMUID](self, "_hasMUID"))
  {
    v3 = [GEOMapItemIdentifier alloc];
    v4 = -[GEOBaseMapItem _muid](self, "_muid");
    v5 = -[GEOBaseMapItem _resultProviderID](self, "_resultProviderID");
    -[GEOBaseMapItem coordinate](self, "coordinate");
    v6 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v3, "initWithMUID:resultProviderID:coordinate:", v4, v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSSet)_alternateIdentifiers
{
  return 0;
}

- (int)_placeDisplayType
{
  return 0;
}

- (BOOL)_hasAreaInMeters
{
  return 0;
}

- (double)_areaInMeters
{
  return 0.0;
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

- (unsigned)_maxScoreForPriceRange
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

- (NSArray)_childItems
{
  return 0;
}

- (BOOL)_hasTelephone
{
  return 0;
}

- (NSString)_telephone
{
  return 0;
}

- (BOOL)_optsOutOfTelephoneAds
{
  return 0;
}

- (NSString)_disambiguationName
{
  return 0;
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

- (GEOInlineRapEnablement)_inlineRapEnablement
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

- (int)_recommendedTransportType
{
  return 4;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  return 0;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  return 0;
}

- (NSArray)_allPhotoAttributions
{
  return 0;
}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  return 0;
}

- (NSString)_poiCategory
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

- (NSString)_mapsCategoryId
{
  return 0;
}

- (NSArray)_additionalPlaceInfos
{
  return 0;
}

- (id)_asPlaceInfo
{
  return 0;
}

- (NSArray)_reviews
{
  return 0;
}

- (NSArray)_tips
{
  return 0;
}

- (NSArray)_photos
{
  return 0;
}

- (BOOL)_hasPOIClaim
{
  return 0;
}

- (GEOPOIClaim)_poiClaim
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

- (int)_parsecSectionType
{
  return 0;
}

- (BOOL)_isStandaloneBrand
{
  return 0;
}

- (BOOL)_hasBrandMUID
{
  return 0;
}

- (unint64_t)_brandMUID
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

- (GEOExploreGuides)_exploreGuides
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

- (NSArray)_placeCollectionsIds
{
  return 0;
}

- (BOOL)_hasPlaceCollectionPullQuotes
{
  return 0;
}

- (NSArray)_placeCollectionPullQuotes
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

- (id)_firstRelatedPlaceListForType:(int)a3
{
  return 0;
}

- (BOOL)_hasEVCharger
{
  return 0;
}

- (GEOEVCharger)_evCharger
{
  return 0;
}

- (GEOPlacecardLayoutData)_placecardLayoutData
{
  return 0;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return 0;
}

- (BOOL)hasExpiredComponents
{
  return 0;
}

- (id)addressObject
{
  return 0;
}

- (id)shortAddress
{
  return 0;
}

- (id)weatherDisplayName
{
  return 0;
}

- (NSData)externalTransitStationCode
{
  return 0;
}

- (GEOAssociatedApp)_associatedApp
{
  return 0;
}

- (BOOL)_hasBusinessHours
{
  return 0;
}

- (NSArray)_businessHours
{
  return 0;
}

- (GEOBusinessAssets)businessAssets
{
  return 0;
}

- (BOOL)_hasLinkedServices
{
  return 0;
}

- (NSArray)_linkedServices
{
  return 0;
}

- (BOOL)_hasVenueFeatureType
{
  return 0;
}

- (int)_venueFeatureType
{
  return 0;
}

- (GEOMapItemVenueInfo)_venueInfo
{
  return 0;
}

- (NSArray)_browseCategories
{
  return 0;
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  return 0;
}

- (int)_placeDisplayStyle
{
  return 0;
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  return 0;
}

- (BOOL)_hasWifiFingerprintConfidence
{
  return 0;
}

- (unsigned)_wifiFingerprintConfidence
{
  return 0;
}

- (BOOL)_hasWifiFingerprintLabelType
{
  return 0;
}

- (int)_wifiFingerprintLabelType
{
  return 0;
}

- (BOOL)_hasWifiFingerprintLabelStatusCode
{
  return 0;
}

- (int)_wifiFingerprintLabelStatusCode
{
  return 5;
}

- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return 0;
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return 0;
}

- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return 0;
}

- (GEOPriceDescription)_priceDescription
{
  return 0;
}

- (GEOMapItemContainedPlace)_containedPlace
{
  return 0;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  return 0;
}

- (BOOL)_hasGroundViewLocationId
{
  return 0;
}

- (unint64_t)_groundViewLocationId
{
  return 0;
}

- (BOOL)hasVenueCapacity
{
  return 0;
}

- (int64_t)venueCapacity
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)spatialMappedPlaceCategories
{
  return 0;
}

- (NSString)_walletCategoryIdentifier
{
  return 0;
}

- (NSString)_walletMapsCategoryIdentifier
{
  return 0;
}

- (NSString)_walletCategoryLocalizedStringLocale
{
  return 0;
}

- (NSString)_walletCategoryLocalizedString
{
  return 0;
}

- (GEOStyleAttributes)_walletCategoryStyling
{
  return 0;
}

- (NSString)_walletPlaceLocalizedStringLocale
{
  return 0;
}

- (NSString)_walletPlaceLocalizedString
{
  return 0;
}

- (GEOStyleAttributes)_walletPlaceStyling
{
  return 0;
}

- (BOOL)_enableRAPLightweightFeedback
{
  return 0;
}

- (BOOL)_showSuggestAnEditButton
{
  return 0;
}

- (int)_RAPFlowType
{
  return 0;
}

- (NSArray)_alternateSearchableNames
{
  return 0;
}

- (BOOL)_hasAppleRatings
{
  return 0;
}

- (NSArray)_appleRatings
{
  return 0;
}

- (GEOAppleRating)_overallAppleRating
{
  return 0;
}

- (GEOPlaceQuestionnaire)_placeQuestionnaire
{
  return 0;
}

- (BOOL)_hasPlaceQuestionnaire
{
  return 0;
}

- (NSArray)_identifierHistory
{
  return 0;
}

- (BOOL)_canDownloadMorePhotos
{
  return 0;
}

- (unint64_t)_totalPhotoCount
{
  return 0;
}

- (NSArray)_captionedPhotoAlbums
{
  return 0;
}

- (BOOL)_hasCaptionedPhotoAlbum
{
  return 0;
}

- (NSString)_iso3166CountryCode
{
  return 0;
}

- (NSString)_iso3166SubdivisionCode
{
  return 0;
}

- (NSString)_bestAvailableCountryCode
{
  return 0;
}

- (BOOL)_hasEnclosingPlace
{
  return 0;
}

- (GEOEnclosingPlace)_enclosingPlace
{
  return 0;
}

- (BOOL)_hasAreaHighlightId
{
  return 0;
}

- (unint64_t)_areaHighlightId
{
  return 0;
}

- (BOOL)_hasPlaceDescription
{
  return 0;
}

- (NSString)_placeDescription
{
  return 0;
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  return 0;
}

- (GEOLabelGeometry)_labelGeometry
{
  return 0;
}

- (GEOViewportFrame)_viewportFrame
{
  return 0;
}

- (NSArray)_externalActionLinks
{
  return 0;
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  return 0;
}

- (GEOEnrichmentData)_enrichmentData
{
  return 0;
}

- (GEOTrailHead)_trailHead
{
  return 0;
}

- (GEOHikeSummary)_hikeSummary
{
  return 0;
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  return 0;
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  return 0;
}

- (int)_hikeGeometryElevationModel
{
  return 0;
}

- (GEOTooltip)_tooltip
{
  return 0;
}

- (float)_photosMemoryScore
{
  return -1.0;
}

- (int)_placeCategoryType
{
  return 0;
}

@end
