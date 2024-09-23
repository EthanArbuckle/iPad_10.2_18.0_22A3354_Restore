@implementation GEOMapService

- (id)serializedClientMetadataForTraits:(id)a3
{
  id v3;
  GEOPDClientMetadata *v4;
  void *v5;

  v3 = a3;
  v4 = -[GEOPDClientMetadata initWithTraits:]([GEOPDClientMetadata alloc], "initWithTraits:", v3);

  -[GEOPDClientMetadata data](v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_countryCodeChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("GEOMapServiceSerializedClientMetadataDidInvalidateNotification"), self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("GEOMapServiceSerializedClientMetadataForSiriDidInvalidateNotification"), 0);

}

- (id)defaultTraits
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__GEOMapService_defaultTraits__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  if (qword_1ECDBBEC0 != -1)
    dispatch_once(&qword_1ECDBBEC0, block);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__38;
  v22 = __Block_byref_object_dispose__38;
  v23 = 0;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  geo_isolate_sync_data();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v19[5], "setDisplayRegion:", v3);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  objc_msgSend((id)v19[5], "transitScheduleFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highFrequencyFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureWithDefaultStartTime:duration:numAdditionalDepartures:", 4, v6, v15[3]);
  objc_msgSend(v7, "lowFrequencyFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithDefaultStartTime:duration:numAdditionalDepartures:", 4, v6, v15[3]);
  objc_msgSend(v9, "timeRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v7, "setOperatingHoursRange:", v11);

  v12 = (id)v19[5];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v12;
}

+ (id)sharedService
{
  if (qword_1ECDBBE98 != -1)
    dispatch_once(&qword_1ECDBBE98, &__block_literal_global_81);
  return (id)_MergedGlobals_231;
}

void __30__GEOMapService_defaultTraits__block_invoke_3()
{
  qword_1ECDBBEB0 = GEOConfigGetDouble(GeoServicesConfig_DefaultTimeFilterDuration, (uint64_t)off_1EDF4E418);
}

- (id)ticketForPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _GEOPhoneNumbersTicket *v10;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[_GEOPhoneNumbersTicket initWithPhoneNumbers:allowCellularDataForLookup:traits:]([_GEOPhoneNumbersTicket alloc], "initWithPhoneNumbers:allowCellularDataForLookup:traits:", v8, v6, v9);

  return v10;
}

- (id)_cl_ticketForForwardGeocodeAddressDictionary:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setIsAPICall:", 1);
  -[GEOMapService ticketForForwardGeocodeAddressDictionary:maxResults:traits:](self, "ticketForForwardGeocodeAddressDictionary:maxResults:traits:", v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ticketForForwardGeocodeAddressDictionary:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOAddress *v10;
  void *v11;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[GEOAddress initWithAddressDictionary:]([GEOAddress alloc], "initWithAddressDictionary:", v8);
  -[GEOMapService ticketForForwardGeocodeAddress:maxResults:traits:](self, "ticketForForwardGeocodeAddress:maxResults:traits:", v10, v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)ticketForForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  _GEOPlaceRequestTicket *v11;

  LODWORD(v6) = a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v6 <= 1)
    v6 = 1;
  else
    v6 = v6;
  v10 = -[GEOPDPlaceRequest initWithForwardGeocodeAddress:maxResults:traits:]([GEOPDPlaceRequest alloc], "initWithForwardGeocodeAddress:maxResults:traits:", v8, v6, v9);
  v11 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v10, v9);

  return v11;
}

- (id)ticketForDatasetCheckWithTraits:(id)a3
{
  id v4;
  id v5;
  _GEOPlaceRequestTicket *v6;

  v4 = a3;
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPassABClientMetadata, (uint64_t)off_1EDF4E498))
  {
    if (!v4)
    {
      -[GEOMapService defaultTraits](self, "defaultTraits");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = -[GEOPDPlaceRequest initForDatasetCheckWithTraits:]([GEOPDPlaceRequest alloc], "initForDatasetCheckWithTraits:", v4);
    v6 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v5, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)ticketForReverseGeocodeLocation:(id)a3 traits:(id)a4
{
  int v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v6 = GeoServicesConfig_RevGeoRequestShouldAlwaysPreserveRequestedLatLong;
  v7 = off_1EDF4E478;
  v8 = a4;
  v9 = a3;
  -[GEOMapService ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:](self, "ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:", v9, GEOConfigGetBOOL(v6, (uint64_t)v7), 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ticketForReverseGeocodeLocation:(id)a3 preserveOriginalLocation:(BOOL)a4 placeTypeLimit:(int)a5 traits:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  id v11;
  _BOOL8 v12;
  GEOPDPlaceRequest *v13;
  _GEOReverseGeocodeRequestTicket *v14;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (!v11)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setIsAPICall:", 1);
  objc_msgSend(v11, "setAnalyticsOptOut:", 1);
  v12 = objc_msgSend(v10, "referenceFrame") == 1;
  v13 = -[GEOPDPlaceRequest initWithReverseGeocodeLocation:includeEntryPoints:preserveOriginalLocation:placeTypeLimit:traits:]([GEOPDPlaceRequest alloc], "initWithReverseGeocodeLocation:includeEntryPoints:preserveOriginalLocation:placeTypeLimit:traits:", v10, 1, v8, v7, v11);
  v14 = -[_GEOReverseGeocodeRequestTicket initWithRequest:shiftLocationsIfNeeded:traits:]([_GEOReverseGeocodeRequestTicket alloc], "initWithRequest:shiftLocationsIfNeeded:traits:", v13, v12, v11);

  return v14;
}

- (id)handleForMapItem:(id)a3
{
  return +[GEOMapItemHandle handleDataForMapItem:](GEOMapItemHandle, "handleDataForMapItem:", a3);
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_5()
{
  return objc_msgSend((id)qword_1ECDBBEA0, "setHttpRequestPriority:", GEOConfigGetUint64(GeoServicesConfig_DefaultRequestPriority, (uint64_t)off_1EDF4E428));
}

void __30__GEOMapService_sharedService__block_invoke()
{
  GEOMapService *v0;
  void *v1;

  v0 = objc_alloc_init(GEOMapService);
  v1 = (void *)_MergedGlobals_231;
  _MergedGlobals_231 = (uint64_t)v0;

}

- (GEOMapService)init
{
  GEOMapService *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  GEOMapService *v6;
  NSObject *v7;
  int *p_experimentsChangedToken;
  GEOMapService *v9;
  GEOMapService *v10;
  _QWORD v12[4];
  GEOMapService *v13;
  _QWORD handler[4];
  GEOMapService *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GEOMapService;
  v2 = -[GEOMapService init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__countryCodeChanged_, CFSTR("GEOCountryConfigurationCountryCodeDidChangeNotification"), 0);

    v2->_preferredLanguagesLock._os_unfair_lock_opaque = 0;
    v2->_overriddenResultProviderID = -[GEOMapService _loadOverriddenResultProviderID](v2, "_loadOverriddenResultProviderID");
    v2->_handleCacheLock._os_unfair_lock_opaque = 0;
    v5 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __21__GEOMapService_init__block_invoke;
    handler[3] = &unk_1E1C0A260;
    v6 = v2;
    v15 = v6;
    v7 = MEMORY[0x1E0C80D38];
    notify_register_dispatch("com.apple.GeoServices.additionalEnabledMarketsChanged", &v2->_additionalEnabledMarketsChangedToken, MEMORY[0x1E0C80D38], handler);
    p_experimentsChangedToken = &v6->_experimentsChangedToken;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __21__GEOMapService_init__block_invoke_2;
    v12[3] = &unk_1E1C0A260;
    v9 = v6;
    v13 = v9;
    notify_register_dispatch("com.apple.GeoServices.experimentsChanged", p_experimentsChangedToken, v7, v12);

    v10 = v9;
  }

  return v2;
}

- (int)_loadOverriddenResultProviderID
{
  return GEOConfigGetInteger(GeoServicesConfig_OverriddedResultProviderID, (uint64_t)off_1EDF4E3D8);
}

void __30__GEOMapService_defaultTraits__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  GEOTraitsPhotoSize *v10;
  GEOTraitsPhotoSize *v11;
  uint64_t v12;
  uint64_t v13;
  GEOTraitsPhotoSize *v14;
  void *v15;
  void *v16;
  GEOTraitsPhotoSize *v17;
  uint64_t v18;
  void *v19;
  GEOMapServiceTraits *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  char v43;
  GEOTraitsTransitScheduleFilter *v44;
  void *v45;
  GEOTraitsTransitScheduleModeFilter *v46;
  GEOTraitsTransitScheduleModeFilter *v47;
  void *global_queue;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = geo_isolater_create();
  v3 = (void *)qword_1ECDBBEA8;
  qword_1ECDBBEA8 = v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECDBBEB8;
  qword_1ECDBBEB8 = v4;

  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceScreenScale");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(GEOTraitsPhotoSize);
  -[GEOTraitsPhotoSize setWidth:](v10, "setWidth:", 600);
  -[GEOTraitsPhotoSize setHeight:](v10, "setHeight:", 400);
  objc_msgSend(v9, "addObject:", v10);
  v11 = objc_alloc_init(GEOTraitsPhotoSize);

  if (v8 == 1.0)
    v12 = 100;
  else
    v12 = 248;
  if (v8 == 1.0)
    v13 = 100;
  else
    v13 = 186;
  -[GEOTraitsPhotoSize setWidth:](v11, "setWidth:", v12);
  -[GEOTraitsPhotoSize setHeight:](v11, "setHeight:", v13);
  objc_msgSend(v9, "addObject:", v11);
  if (v8 >= 3.0)
  {
    v14 = objc_alloc_init(GEOTraitsPhotoSize);

    -[GEOTraitsPhotoSize setWidth:](v14, "setWidth:", 1200);
    -[GEOTraitsPhotoSize setHeight:](v14, "setHeight:", 800);
    objc_msgSend(v9, "addObject:", v14);
    v11 = v14;
  }
  v15 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(GEOTraitsPhotoSize);
  if (v8 == 1.0)
    v18 = 30;
  else
    v18 = 60;
  -[GEOTraitsPhotoSize setWidth:](v17, "setWidth:", v18);
  -[GEOTraitsPhotoSize setHeight:](v17, "setHeight:", v18);
  objc_msgSend(v16, "addObject:", v17);
  v19 = (void *)objc_msgSend(v16, "copy");

  v20 = objc_alloc_init(GEOMapServiceTraits);
  v21 = (void *)qword_1ECDBBEA0;
  qword_1ECDBBEA0 = (uint64_t)v20;

  GEOApplicationIdentifierOrProcessName();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECDBBEA0, "setAppIdentifier:", v22);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "infoDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECDBBEA0, "setAppMajorVersion:", v24);

  objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECDBBEA0, "setAppMinorVersion:", v25);

  objc_msgSend(*(id *)(a1 + 32), "_preferredLanguages");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");
  objc_msgSend((id)qword_1ECDBBEA0, "setDeviceDisplayLanguages:", v27);

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v28 = v15;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v60 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend((id)qword_1ECDBBEA0, "photoSizes");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "containsObject:", v33);

        if ((v35 & 1) == 0)
          objc_msgSend((id)qword_1ECDBBEA0, "addPhotoSizes:", v33);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v30);
  }

  if ((objc_msgSend((id)qword_1ECDBBEA0, "hasPhotosCount") & 1) == 0)
    objc_msgSend((id)qword_1ECDBBEA0, "setPhotosCount:", GEOConfigGetUInteger(GeoServicesConfig_DefaultNumberOfPhotosToRequest, (uint64_t)off_1EDF4E3F8));
  if ((objc_msgSend((id)qword_1ECDBBEA0, "hasRatingsCount") & 1) == 0)
    objc_msgSend((id)qword_1ECDBBEA0, "setRatingsCount:", 4);
  if ((objc_msgSend((id)qword_1ECDBBEA0, "hasPhotoAlbumCount") & 1) == 0)
    objc_msgSend((id)qword_1ECDBBEA0, "setPhotoAlbumCount:", GEOConfigGetUInteger(GeoServicesConfig_DefaultNumberOfPhotoAlbumsToRequest, (uint64_t)off_1EDF4E408));
  if ((objc_msgSend((id)qword_1ECDBBEA0, "hasRelatedPlaceItemCount") & 1) == 0)
    objc_msgSend((id)qword_1ECDBBEA0, "setRelatedPlaceItemCount:", 18);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v36 = v19;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend((id)qword_1ECDBBEA0, "reviewUserPhotoSizes");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "containsObject:", v41);

        if ((v43 & 1) == 0)
          objc_msgSend((id)qword_1ECDBBEA0, "addReviewUserPhotoSizes:", v41);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v38);
  }

  if ((objc_msgSend((id)qword_1ECDBBEA0, "hasReviewUserPhotosCount") & 1) == 0)
    objc_msgSend((id)qword_1ECDBBEA0, "setReviewUserPhotosCount:", 3);
  if ((objc_msgSend((id)qword_1ECDBBEA0, "hasTransitScheduleFilter") & 1) == 0)
  {
    v44 = objc_alloc_init(GEOTraitsTransitScheduleFilter);
    objc_msgSend((id)qword_1ECDBBEA0, "setTransitScheduleFilter:", v44);

  }
  objc_msgSend((id)qword_1ECDBBEA0, "transitScheduleFilter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "hasHighFrequencyFilter") & 1) == 0)
  {
    v46 = objc_alloc_init(GEOTraitsTransitScheduleModeFilter);
    objc_msgSend(v45, "setHighFrequencyFilter:", v46);

  }
  if ((objc_msgSend(v45, "hasLowFrequencyFilter") & 1) == 0)
  {
    v47 = objc_alloc_init(GEOTraitsTransitScheduleModeFilter);
    objc_msgSend(v45, "setLowFrequencyFilter:", v47);

  }
  geo_isolate_sync();
  global_queue = (void *)geo_get_global_queue();
  _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DefaultTimeFilterDuration, (uint64_t)off_1EDF4E418, global_queue, &__block_literal_global_37_2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ECDBBEB8, "addObject:", v49);
  geo_isolate_sync();
  v50 = (void *)geo_get_global_queue();
  _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DefaultRequestPriority, (uint64_t)off_1EDF4E428, v50, &__block_literal_global_39_1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ECDBBEB8, "addObject:", v51);
  geo_isolate_sync();
  v52 = (void *)geo_get_global_queue();
  _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DefaultBrandFallbackSupport, (uint64_t)off_1EDF4E438, v52, &__block_literal_global_41);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ECDBBEB8, "addObject:", v53);
  objc_msgSend((id)qword_1ECDBBEA0, "addSupportedAutocompleteListType:", 1);

}

- (id)_preferredLanguages
{
  os_unfair_lock_s *p_preferredLanguagesLock;
  NSArray *preferredLanguages;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  p_preferredLanguagesLock = &self->_preferredLanguagesLock;
  os_unfair_lock_lock(&self->_preferredLanguagesLock);
  preferredLanguages = self->_preferredLanguages;
  if (!preferredLanguages)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    v7 = self->_preferredLanguages;
    self->_preferredLanguages = v6;

    preferredLanguages = self->_preferredLanguages;
  }
  v8 = preferredLanguages;
  os_unfair_lock_unlock(p_preferredLanguagesLock);
  return v8;
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_7()
{
  return objc_msgSend((id)qword_1ECDBBEA0, "setSupportsBrandFallback:", GEOConfigGetBOOL(GeoServicesConfig_DefaultBrandFallbackSupport, (uint64_t)off_1EDF4E438));
}

- (id)serializedClientMetadataForParsec
{
  GEOPDClientMetadata *v3;
  void *v4;
  GEOPDClientMetadata *v5;
  GEOPDClientMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = [GEOPDClientMetadata alloc];
  -[GEOMapService defaultTraits](self, "defaultTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPDClientMetadata initWithTraits:](v3, "initWithTraits:", v4);

  v6 = objc_alloc_init(GEOPDClientMetadata);
  -[GEOPDClientMetadata additionalEnabledMarkets](v5, "additionalEnabledMarkets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientMetadata setAdditionalEnabledMarkets:](v6, "setAdditionalEnabledMarkets:", v7);

  -[GEOPDClientMetadata setRequiredVersion:](v6, "setRequiredVersion:", -[GEOPDClientMetadata requiredVersion](v5, "requiredVersion"));
  -[GEOPDClientMetadata setResultListAttributionSupport:](v6, "setResultListAttributionSupport:", -[GEOPDClientMetadata resultListAttributionSupport](v5, "resultListAttributionSupport"));
  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_parsecClientMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientMetadata setAbClientMetadata:](v6, "setAbClientMetadata:", v9);

  -[GEOPDClientMetadata setEnablePreflightVenues:](v6, "setEnablePreflightVenues:", -[GEOPDClientMetadata enablePreflightVenues](v5, "enablePreflightVenues"));
  -[GEOPDClientMetadata businessChatPreflightIdentifiers](v5, "businessChatPreflightIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientMetadata setBusinessChatPreflightIdentifiers:](v6, "setBusinessChatPreflightIdentifiers:", v10);

  -[GEOPDClientMetadata data](v6, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)ticketForReverseGeocodeLocation:(id)a3 placeTypeLimit:(int)a4 traits:(id)a5
{
  uint64_t v5;
  int v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v5 = *(_QWORD *)&a4;
  v8 = GeoServicesConfig_RevGeoRequestShouldAlwaysPreserveRequestedLatLong;
  v9 = off_1EDF4E478;
  v10 = a5;
  v11 = a3;
  -[GEOMapService ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:](self, "ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:", v11, GEOConfigGetBOOL(v8, (uint64_t)v9), v5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ticketForIdentifiers:(id)a3 traits:(id)a4
{
  return -[GEOMapService ticketForIdentifiers:resultProviderID:contentProvider:traits:](self, "ticketForIdentifiers:resultProviderID:contentProvider:traits:", a3, 0, 0, a4);
}

- (id)ticketForIdentifiers:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  unsigned int overriddenResultProviderID;
  _GEOIdentifiersTicket *v12;

  LODWORD(v7) = a4;
  v9 = a3;
  v10 = a6;
  overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (overriddenResultProviderID)
    v7 = overriddenResultProviderID;
  else
    v7 = v7;
  v12 = -[_GEOIdentifiersTicket initWithIdentifiers:resultProviderID:contentProvider:traits:options:]([_GEOIdentifiersTicket alloc], "initWithIdentifiers:resultProviderID:contentProvider:traits:options:", v9, v7, 0, v10, 7);

  return v12;
}

- (id)_ticketForLegacyBatchReverseGeocodeLocations:(id)a3 locationShifter:(id)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8
{
  id v13;
  id v14;
  id v15;
  GEOBatchRevGeocodeRequest *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _DWORD *v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  GEOCoarseLocationMetadata *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _GEOLegacyBatchReverseGeocodeTicket *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = objc_alloc_init(GEOBatchRevGeocodeRequest);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeRequest setLocations:](v16, "setLocations:", v17);

  +[GEOGeoServiceTag defaultTag](GEOGeoServiceTag, "defaultTag");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeRequest addServiceTag:](v16, "addServiceTag:", v18);

  v19 = a6;
  v20 = malloc_type_malloc(4 * a6, 0x100004052888210uLL);
  v21 = v20;
  if (a6)
  {
    v22 = v20;
    v23 = v19;
    do
    {
      v24 = *a5++;
      *v22++ = _PlaceTypeForMapItemPlaceType(v24);
      --v23;
    }
    while (v23);
  }
  -[GEOBatchRevGeocodeRequest setAdditionalPlaceTypes:count:](v16, "setAdditionalPlaceTypes:count:", v21, v19);
  free(v21);
  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "countryCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeRequest setDeviceCountryCode:](v16, "setDeviceCountryCode:", v26);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeRequest setDisplayRegion:](v16, "setDisplayRegion:", v28);

  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deviceCountrySKUForServiceRequests");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeRequest setDeviceSku:](v16, "setDeviceSku:", v30);

  if (a7 && a7 < 44)
  {
    v31 = objc_alloc_init(GEOCoarseLocationMetadata);
    -[GEOCoarseLocationMetadata setType:](v31, "setType:", 1);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[GEOBatchRevGeocodeRequest locations](v16, "locations", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v40;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v40 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v36++), "setCoarseMetadata:", v31);
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v34);
    }

  }
  v37 = -[_GEOLegacyBatchReverseGeocodeTicket initWithBatchReverseGeocodeRequest:locationShifter:traits:]([_GEOLegacyBatchReverseGeocodeTicket alloc], "initWithBatchReverseGeocodeRequest:locationShifter:traits:", v16, v14, v15);

  return v37;
}

uint64_t __21__GEOMapService_init__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GEOMapServiceSerializedClientMetadataDidInvalidateNotification"), 0);

  return objc_msgSend(*(id *)(a1 + 32), "_sendInvalidateDataToSiriAndParSec");
}

uint64_t __21__GEOMapService_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendInvalidateDataToSiriAndParSec");
}

- (os_unfair_lock_s)handleCache
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  id v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1 + 9;
    os_unfair_lock_lock_with_options();
    if (!*(_QWORD *)&v1[10]._os_unfair_lock_opaque)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      v4 = *(void **)&v1[10]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[10]._os_unfair_lock_opaque = v3;

      objc_msgSend(*(id *)&v1[10]._os_unfair_lock_opaque, "setCountLimit:", GEOConfigGetUInteger(GeoServicesConfig_MapItemHandleCacheMaxItemCount, (uint64_t)off_1EDF4E3B8));
      objc_msgSend(*(id *)&v1[10]._os_unfair_lock_opaque, "setTotalCostLimit:", GEOConfigGetUInteger(GeoServicesConfig_MapItemHandleCacheMaxItemCost, (uint64_t)off_1EDF4E3C8));
    }
    os_unfair_lock_unlock(v2);
    a1 = (os_unfair_lock_s *)*(id *)&v1[10]._os_unfair_lock_opaque;
  }
  return a1;
}

- (void)_sendInvalidateDataToSiriAndParSec
{
  void *v2;
  void *v3;
  GEOSiriSyncHandlerHelper *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GEOMapServiceSerializedClientMetadataForParsecDidInvalidateNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("GEOMapServiceSerializedClientMetadataForSiriDidInvalidateNotification"), 0);

  v4 = objc_alloc_init(GEOSiriSyncHandlerHelper);
  -[GEOSiriSyncHandlerHelper notifySiriIfNecessary](v4, "notifySiriIfNecessary");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  notify_cancel(self->_additionalEnabledMarketsChangedToken);
  notify_cancel(self->_experimentsChangedToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GEOMapService;
  -[GEOMapService dealloc](&v4, sel_dealloc);
}

- (int)localSearchProviderID
{
  NSObject *v3;
  int overriddenResultProviderID;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_overriddenResultProviderID)
    return GEOConfigGetInteger(GeoServicesConfig_VoltaireSearchURLProviderID, (uint64_t)off_1EDF4E3E8);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    overriddenResultProviderID = self->_overriddenResultProviderID;
    v6[0] = 67109120;
    v6[1] = overriddenResultProviderID;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "IMPORTANT: Using an overridden resultProviderID of %d", (uint8_t *)v6, 8u);
  }

  return self->_overriddenResultProviderID;
}

- (void)_localeChanged:(id)a3
{
  os_unfair_lock_s *p_preferredLanguagesLock;
  NSArray *preferredLanguages;
  void *v6;
  id v7;

  p_preferredLanguagesLock = &self->_preferredLanguagesLock;
  os_unfair_lock_lock_with_options();
  preferredLanguages = self->_preferredLanguages;
  self->_preferredLanguages = 0;

  os_unfair_lock_unlock(p_preferredLanguagesLock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("GEOMapServiceSerializedClientMetadataDidInvalidateNotification"), self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("GEOMapServiceSerializedClientMetadataForSiriDidInvalidateNotification"), 0);

}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_2()
{
  return geo_isolate_sync();
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_4()
{
  return geo_isolate_sync();
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_6()
{
  return geo_isolate_sync();
}

double __30__GEOMapService_defaultTraits__block_invoke_43(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double result;

  v2 = objc_msgSend((id)qword_1ECDBBEA0, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = *(double *)&qword_1ECDBBEB0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = qword_1ECDBBEB0;
  return result;
}

- (void)setDefaultTraitsHardwareIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (!qword_1ECDBBEA0)
    v5 = -[GEOMapService defaultTraits](self, "defaultTraits");
  v6 = v4;
  geo_isolate_sync_data();

}

void __52__GEOMapService_setDefaultTraitsHardwareIdentifier___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend((id)qword_1ECDBBEA0, "setHardwareIdentifier:", v1);

}

- (id)defaultBackgroundTraits
{
  void *v2;

  -[GEOMapService defaultTraits](self, "defaultTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequestPriority:", 1);
  objc_msgSend(v2, "setHttpRequestPriority:", GEOConfigGetUint64(GeoServicesConfig_DefaultBackgroundRequestPriority, (uint64_t)off_1EDF4E448));
  return v2;
}

- (id)defaultUserInitiatedTraits
{
  void *v2;

  -[GEOMapService defaultTraits](self, "defaultTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequestPriority:", 2);
  objc_msgSend(v2, "setHttpRequestPriority:", GEOConfigGetUint64(GeoServicesConfig_UserInitiatedRequestPriority, (uint64_t)off_1EDF4E458));
  return v2;
}

- (void)setDefaultTraits:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!qword_1ECDBBEA0)
  {
    v5 = -[GEOMapService defaultTraits](self, "defaultTraits");
    v4 = v8;
  }
  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)qword_1ECDBBEA0;
  qword_1ECDBBEA0 = v6;

}

- (id)ticketForMUIDs:(id)a3 traits:(id)a4
{
  return -[GEOMapService ticketForMUIDs:resultProviderID:contentProvider:traits:](self, "ticketForMUIDs:resultProviderID:contentProvider:traits:", a3, 0, 0, a4);
}

- (id)ticketForMUIDs:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  unsigned int overriddenResultProviderID;
  _GEOIdentifiersTicket *v14;

  LODWORD(v8) = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v12)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (overriddenResultProviderID)
    v8 = overriddenResultProviderID;
  else
    v8 = v8;
  v14 = -[_GEOIdentifiersTicket initWithMUIDs:resultProviderID:contentProvider:traits:options:]([_GEOIdentifiersTicket alloc], "initWithMUIDs:resultProviderID:contentProvider:traits:options:", v10, v8, v11, v12, 7);

  return v14;
}

- (id)ticketForFreshIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  unsigned int overriddenResultProviderID;
  _GEOIdentifiersTicket *v14;
  void *v15;
  _GEOIdentifiersTicket *v16;
  _QWORD v18[2];

  LODWORD(v8) = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v12)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (overriddenResultProviderID)
    v8 = overriddenResultProviderID;
  else
    v8 = v8;
  v14 = [_GEOIdentifiersTicket alloc];
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_GEOIdentifiersTicket initWithIdentifiers:resultProviderID:contentProvider:traits:options:](v14, "initWithIdentifiers:resultProviderID:contentProvider:traits:options:", v15, v8, v11, v12, 1);

  return v16;
}

- (id)ticketForNonExpiredIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int overriddenResultProviderID;
  _GEOIdentifiersTicket *v15;
  _GEOIdentifiersTicket *v16;
  void *v17;
  _GEOIdentifiersTicket *v18;
  _QWORD v20[2];

  LODWORD(v8) = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  overriddenResultProviderID = self->_overriddenResultProviderID;
  if (overriddenResultProviderID)
    v8 = overriddenResultProviderID;
  else
    v8 = v8;
  if (!v12)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = [_GEOIdentifiersTicket alloc];
  v16 = v15;
  if (v10)
  {
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_GEOIdentifiersTicket initWithIdentifiers:resultProviderID:contentProvider:traits:options:](v16, "initWithIdentifiers:resultProviderID:contentProvider:traits:options:", v17, v8, v11, v13, 3);

  }
  else
  {
    v18 = -[_GEOIdentifiersTicket initWithIdentifiers:resultProviderID:contentProvider:traits:options:](v15, "initWithIdentifiers:resultProviderID:contentProvider:traits:options:", 0, v8, v11, v13, 3);
  }

  return v18;
}

- (id)ticketForFreshComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 contentProvider:(id)a6 traits:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned int overriddenResultProviderID;
  _GEOComponentsTicket *v17;

  LODWORD(v9) = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v15)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (overriddenResultProviderID)
    v9 = overriddenResultProviderID;
  else
    v9 = v9;
  v17 = -[_GEOComponentsTicket initWithComponents:identifier:resultProviderID:contentProvider:traits:]([_GEOComponentsTicket alloc], "initWithComponents:identifier:resultProviderID:contentProvider:traits:", v12, v13, v9, v14, v15);

  return v17;
}

- (id)ticketForFreshBusinessClaimComponentWithIdentifier:(id)a3 resultProviderID:(int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v6 = *(_QWORD *)&a4;
  v15[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v14[0] = &unk_1E1E811D8;
  v14[1] = &unk_1E1E81208;
  v15[0] = &unk_1E1E811F0;
  v15[1] = &unk_1E1E811F0;
  v14[2] = &unk_1E1E81220;
  v14[3] = &unk_1E1E81238;
  v15[2] = &unk_1E1E811F0;
  v15[3] = &unk_1E1E811F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1EDF4E468))
  {
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E1E811F0, &unk_1E1E81250);

    v10 = v11;
  }
  -[GEOMapService ticketForFreshComponents:identifier:resultProviderID:contentProvider:traits:](self, "ticketForFreshComponents:identifier:resultProviderID:contentProvider:traits:", v10, v8, v6, 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ticketForExternalBusinessID:(id)a3 contentProvider:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOPDPlaceRequest *v11;
  _GEOPlaceRequestTicket *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[GEOPDPlaceRequest initWithExternalBusinessID:contentProvider:traits:]([GEOPDPlaceRequest alloc], "initWithExternalBusinessID:contentProvider:traits:", v8, v9, v10);
  v12 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v11, v10);

  return v12;
}

- (id)ticketForTransitIdentifiers:(id)a3 endDateForPlacecardSchedulesForThisBatch:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "timeIntervalSinceNow");
  if (v11 > 0.0)
  {
    v12 = v11;
    objc_msgSend(v10, "transitScheduleFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "highFrequencyFilter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDuration:", v12);

    objc_msgSend(v10, "transitScheduleFilter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lowFrequencyFilter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDuration:", v12);

  }
  -[GEOMapService ticketForIdentifiers:traits:](self, "ticketForIdentifiers:traits:", v8, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)ticketForForwardGeocodeString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  _GEOPlaceRequestTicket *v11;

  LODWORD(v6) = a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v6 <= 1)
    v6 = 1;
  else
    v6 = v6;
  v10 = -[GEOPDPlaceRequest initWithForwardGeocodeAddressString:maxResults:traits:]([GEOPDPlaceRequest alloc], "initWithForwardGeocodeAddressString:maxResults:traits:", v8, v6, v9);
  v11 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v10, v9);

  return v11;
}

- (id)ticketForForwardGeocodePostalAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOAddress *v10;
  void *v11;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[GEOAddress initWithPostalAddress:]([GEOAddress alloc], "initWithPostalAddress:", v8);
  -[GEOMapService ticketForForwardGeocodeAddress:maxResults:traits:](self, "ticketForForwardGeocodeAddress:maxResults:traits:", v10, v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_cl_ticketForForwardGeocodeString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setIsAPICall:", 1);
  -[GEOMapService ticketForForwardGeocodeString:maxResults:traits:](self, "ticketForForwardGeocodeString:maxResults:traits:", v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cl_ticketForForwardGeocodePostalAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setIsAPICall:", 1);
  -[GEOMapService ticketForForwardGeocodePostalAddress:maxResults:traits:](self, "ticketForForwardGeocodePostalAddress:maxResults:traits:", v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  return -[GEOMapService ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:traits:](self, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:traits:", 1, a4, a5, a3.var0, a3.var1);
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 traits:(id)a6
{
  return -[GEOMapService ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", 1, a4, a5, a6, a3.var0, a3.var1);
}

- (id)_searchable_ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  double var1;
  double var0;
  id v12;
  GEOPDPlaceRequest *v13;
  _GEOReverseGeocodeRequestTicket *v14;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v12 = a7;
  v13 = -[GEOPDPlaceRequest initWithReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:]([GEOPDPlaceRequest alloc], "initWithReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:", v9, v7, v12, var0, var1);
  v14 = -[_GEOReverseGeocodeRequestTicket initWithRequest:shiftLocationsIfNeeded:traits:]([_GEOReverseGeocodeRequestTicket alloc], "initWithRequest:shiftLocationsIfNeeded:traits:", v13, v8, v12);

  return v14;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 traits:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double var1;
  double var0;
  int v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a5;
  v7 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = GeoServicesConfig_RevGeoRequestShouldAlwaysPreserveRequestedLatLong;
  v12 = off_1EDF4E478;
  v13 = a6;
  -[GEOMapService ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v7, v6, GEOConfigGetBOOL(v11, (uint64_t)v12), v13, var0, var1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  double var1;
  double var0;
  id v13;
  void *v14;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v13 = a7;
  if (!v13)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[GEOMapService _searchable_ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "_searchable_ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v9, v8, v7, v13, var0, var1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 floor:(int)a4 includeEntryPoints:(BOOL)a5 shiftLocationsIfNeeded:(BOOL)a6 preserveOriginalLocation:(BOOL)a7 traits:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  double var1;
  double var0;
  id v15;
  void *v16;

  v8 = a7;
  v9 = a6;
  v10 = a5;
  v11 = *(_QWORD *)&a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v15 = a8;
  if (!v15)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[GEOMapService _searchable_ticketForReverseGeocodeCoordinate:floor:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "_searchable_ticketForReverseGeocodeCoordinate:floor:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v11, v10, v9, v8, v15, var0, var1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_searchable_ticketForReverseGeocodeCoordinate:(id)a3 floor:(int)a4 includeEntryPoints:(BOOL)a5 shiftLocationsIfNeeded:(BOOL)a6 preserveOriginalLocation:(BOOL)a7 traits:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  double var1;
  double var0;
  id v14;
  GEOPDPlaceRequest *v15;
  _GEOReverseGeocodeRequestTicket *v16;

  v8 = a7;
  v9 = a6;
  v10 = a5;
  v11 = *(_QWORD *)&a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v14 = a8;
  v15 = -[GEOPDPlaceRequest initWithReverseGeocodeCoordinate:floorOrdinal:includeEntryPoints:preserveOriginalLocation:traits:]([GEOPDPlaceRequest alloc], "initWithReverseGeocodeCoordinate:floorOrdinal:includeEntryPoints:preserveOriginalLocation:traits:", v11, v10, v8, v14, var0, var1);
  v16 = -[_GEOReverseGeocodeRequestTicket initWithRequest:shiftLocationsIfNeeded:traits:]([_GEOReverseGeocodeRequestTicket alloc], "initWithRequest:shiftLocationsIfNeeded:traits:", v15, v9, v14);

  return v16;
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  return -[GEOMapService ticketForBatchReverseGeocodeLocations:shiftLocationsIfNeeded:additionalPlaceTypes:additionalPlaceTypesCount:traits:](self, "ticketForBatchReverseGeocodeLocations:shiftLocationsIfNeeded:additionalPlaceTypes:additionalPlaceTypesCount:traits:", a3, a4, 0, 0, a5);
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 traits:(id)a7
{
  return -[GEOMapService ticketForBatchReverseGeocodeLocations:shiftLocationsIfNeeded:additionalPlaceTypes:additionalPlaceTypesCount:placeTypeLimit:traits:](self, "ticketForBatchReverseGeocodeLocations:shiftLocationsIfNeeded:additionalPlaceTypes:additionalPlaceTypesCount:placeTypeLimit:traits:", a3, a4, a5, *(_QWORD *)&a6, 0, a7);
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8
{
  void *v8;

  if (a4)
    v8 = &__block_literal_global_61;
  else
    v8 = 0;
  return -[GEOMapService ticketForBatchReverseGeocodeLocations:locationShifter:additionalPlaceTypes:additionalPlaceTypesCount:placeTypeLimit:traits:](self, "ticketForBatchReverseGeocodeLocations:locationShifter:additionalPlaceTypes:additionalPlaceTypesCount:placeTypeLimit:traits:", a3, v8, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8);
}

GEOLocationShifter *__147__GEOMapService_ticketForBatchReverseGeocodeLocations_shiftLocationsIfNeeded_additionalPlaceTypes_additionalPlaceTypesCount_placeTypeLimit_traits___block_invoke()
{
  return objc_alloc_init(GEOLocationShifter);
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 locationShifter:(id)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  GEOCoarseLocationMetadata *v18;
  GEOCoarseLocationMetadata *v19;
  uint64_t v20;
  GEOPDPlaceRequest *v21;
  _GEOBatchReverseGeocodeRequestTicket *v22;
  _QWORD v24[4];
  GEOCoarseLocationMetadata *v25;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (!v16)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "setAnalyticsOptOut:", 1);
  if (GEOConfigGetBOOL(GeoServicesConfig_BatchRevGeoUsePlaceRequest, (uint64_t)off_1EDF4E488)
    && (GEOGetURLWithSource(55, 0), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    if ((_DWORD)v9 && (int)v9 <= 43)
    {
      v18 = objc_alloc_init(GEOCoarseLocationMetadata);
      -[GEOCoarseLocationMetadata setType:](v18, "setType:", 1);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __140__GEOMapService_ticketForBatchReverseGeocodeLocations_locationShifter_additionalPlaceTypes_additionalPlaceTypesCount_placeTypeLimit_traits___block_invoke;
      v24[3] = &unk_1E1C0A2A8;
      v25 = v18;
      v19 = v18;
      objc_msgSend(v14, "_geo_map:", v24);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v20;
    }
    v21 = -[GEOPDPlaceRequest initWithBatchReverseGeocodeLocations:additionalPlaceTypes:additionalPlaceTypesCount:traits:]([GEOPDPlaceRequest alloc], "initWithBatchReverseGeocodeLocations:additionalPlaceTypes:additionalPlaceTypesCount:traits:", v14, a5, v10, v16);
    v22 = -[_GEOBatchReverseGeocodeRequestTicket initWithRequest:locationShifter:traits:]([_GEOBatchReverseGeocodeRequestTicket alloc], "initWithRequest:locationShifter:traits:", v21, v15, v16);

  }
  else
  {
    -[GEOMapService _ticketForLegacyBatchReverseGeocodeLocations:locationShifter:additionalPlaceTypes:additionalPlaceTypesCount:placeTypeLimit:traits:](self, "_ticketForLegacyBatchReverseGeocodeLocations:locationShifter:additionalPlaceTypes:additionalPlaceTypesCount:placeTypeLimit:traits:", v14, v15, a5, v10, v9, v16);
    v22 = (_GEOBatchReverseGeocodeRequestTicket *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

id __140__GEOMapService_ticketForBatchReverseGeocodeLocations_locationShifter_additionalPlaceTypes_additionalPlaceTypesCount_placeTypeLimit_traits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (objc_msgSend(v3, "hasCoarseMetadata"))
  {
    v4 = v3;
  }
  else
  {
    v4 = (id)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setCoarseMetadata:", *(_QWORD *)(a1 + 32));
  }

  return v4;
}

- (id)ticketForAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOPDPlaceRequest *v14;
  _GEOPlaceRequestTicket *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = -[GEOPDPlaceRequest initWithAirportCode:terminalCode:gateCode:traits:]([GEOPDPlaceRequest alloc], "initWithAirportCode:terminalCode:gateCode:traits:", v10, v11, v12, v13);
  v15 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v14, v13);

  return v15;
}

- (id)ticketForExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6 traits:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  GEOPDPlaceRequest *v17;
  _GEOPlaceRequestTicket *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = -[GEOPDPlaceRequest initWithExternalTransitStationCodes:sourceID:transactionDate:transactionLocation:traits:]([GEOPDPlaceRequest alloc], "initWithExternalTransitStationCodes:sourceID:transactionDate:transactionLocation:traits:", v12, v13, v14, v15, v16);
  v18 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v17, v16);

  return v18;
}

- (id)ticketForSpatialLookupParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOSpatialLookupBatchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  GEOSpatialLookupRequest *v19;
  GEOLatLng *v20;
  GEOLatLng *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _GEOBatchSpatialLookupTicket *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v7;
  v8 = objc_alloc_init(GEOSpatialLookupBatchRequest);
  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSpatialLookupBatchRequest setDeviceCountryCode:](v8, "setDeviceCountryCode:", v10);

  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceCountrySKUForServiceRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSpatialLookupBatchRequest setDeviceSku:](v8, "setDeviceSku:", v12);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v17);
        v19 = objc_alloc_init(GEOSpatialLookupRequest);
        v20 = [GEOLatLng alloc];
        objc_msgSend(v18, "coordinate");
        v21 = -[GEOLatLng initWithCoordinate:](v20, "initWithCoordinate:");
        -[GEOSpatialLookupRequest setCenter:](v19, "setCenter:", v21);

        objc_msgSend(v18, "radius");
        if (v22 > 0.0)
        {
          objc_msgSend(v18, "radius");
          -[GEOSpatialLookupRequest setRadius:](v19, "setRadius:", (int)v23);
        }
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v18, "categories");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v33;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v33 != v27)
                objc_enumerationMutation(v24);
              -[GEOSpatialLookupRequest addCategory:](v19, "addCategory:", _GEOPDSpatialLookupCategoryForCategory(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v28++), "integerValue")));
            }
            while (v26 != v28);
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v26);
        }

        -[GEOSpatialLookupBatchRequest addRequest:](v8, "addRequest:", v19);
        ++v17;
      }
      while (v17 != v15);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v15);
  }

  v29 = -[_GEOBatchSpatialLookupTicket initWithRequest:forParameters:traits:]([_GEOBatchSpatialLookupTicket alloc], "initWithRequest:forParameters:traits:", v8, v13, v31);
  return v29;
}

- (unint64_t)maxParametersCountForSpatialPlaceLookup
{
  return +[_GEOMapServiceSpatialPlaceLookupTicket maxParametersCount](_GEOMapServiceSpatialPlaceLookupTicket, "maxParametersCount");
}

- (id)ticketForSpatialPlaceLookupParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  _GEOMapServiceSpatialPlaceLookupTicket *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (!v7)
    {
      -[GEOMapService defaultTraits](self, "defaultTraits");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = -[GEOPDPlaceRequest initWithSpatialPlaceLookupParameters:traits:]([GEOPDPlaceRequest alloc], "initWithSpatialPlaceLookupParameters:traits:", v6, v7);
    v9 = -[_GEOMapServiceSpatialPlaceLookupTicket initWithRequest:parameters:traits:]([_GEOMapServiceSpatialPlaceLookupTicket alloc], "initWithRequest:parameters:traits:", v8, v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)maxParametersCountForSpatialEventLookup
{
  return +[_GEOMapServiceSpatialEventLookupTicket maxParametersCount](_GEOMapServiceSpatialEventLookupTicket, "maxParametersCount");
}

- (id)ticketForSpatialEventLookupParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  _GEOMapServiceSpatialEventLookupTicket *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (!v7)
    {
      -[GEOMapService defaultTraits](self, "defaultTraits");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = -[GEOPDPlaceRequest initWithSpatialEventLookupParameters:traits:]([GEOPDPlaceRequest alloc], "initWithSpatialEventLookupParameters:traits:", v6, v7);
    v9 = -[_GEOMapServiceSpatialEventLookupTicket initWithRequest:parameters:traits:]([_GEOMapServiceSpatialEventLookupTicket alloc], "initWithRequest:parameters:traits:", v8, v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)ticketForFeedbackRequestParameters:(id)a3 placeForProblemContext:(id)a4 userCredentials:(id)a5 pushToken:(id)a6 allowContactBackAtEmailAddress:(id)a7 traits:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _GEORPFeedbackTicket *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v19)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = -[_GEORPFeedbackTicket initWithFeedbackRequestParameters:placeForProblemContext:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:]([_GEORPFeedbackTicket alloc], "initWithFeedbackRequestParameters:placeForProblemContext:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:", v14, v15, v16, v17, v18, v19);

  return v20;
}

- (id)ticketForFeedbackRequestData:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  _GEORPFeedbackTicket *v8;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[_GEORPFeedbackTicket initWithFeedbackRequestData:traits:]([_GEORPFeedbackTicket alloc], "initWithFeedbackRequestData:traits:", v6, v7);

  return v8;
}

- (id)ticketForFeedbackRequest:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  _GEORPFeedbackTicket *v8;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[_GEORPFeedbackTicket initWithFeedbackRequest:traits:]([_GEORPFeedbackTicket alloc], "initWithFeedbackRequest:traits:", v6, v7);

  return v8;
}

- (id)ticketForPlaceLookupWithSearchCategory:(id)a3 parentMuid:(unint64_t)a4 traits:(id)a5
{
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  void *v11;
  GEOPDPlaceRequest *v12;
  _GEOPlaceSearchRequestTicket *v13;

  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = [GEOPDPlaceRequest alloc];
  objc_msgSend(v8, "_suggestionEntryMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEOPDPlaceRequest initWithCategoryMetadata:parentMuid:traits:](v10, "initWithCategoryMetadata:parentMuid:traits:", v11, a4, v9);

  v13 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v12, v9);
  return v13;
}

- (id)ticketForSearchPoisForBrandMUID:(unint64_t)a3 traits:(id)a4
{
  id v6;
  GEOPDPlaceRequest *v7;
  _GEOPlaceSearchRequestTicket *v8;

  v6 = a4;
  if (!v6)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[GEOPDPlaceRequest initWithBrandMUID:traits:]([GEOPDPlaceRequest alloc], "initWithBrandMUID:traits:", a3, v6);
  v8 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v7, v6);

  return v8;
}

- (id)ticketForTransitScheduleAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  GEOPDPlaceRequest *v15;
  _GEOPlaceSearchRequestTicket *v16;

  v9 = a6;
  v13 = a8;
  v14 = a7;
  v15 = -[GEOPDPlaceRequest initWithTransitScheduleAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:]([GEOPDPlaceRequest alloc], "initWithTransitScheduleAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, v14, v13);

  v16 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v15, v13);
  return v16;
}

- (id)ticketForUpdatedTransitScheduleDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  GEOPDPlaceRequest *v15;
  _GEOPlaceSearchRequestTicket *v16;

  v9 = a6;
  v13 = a8;
  v14 = a7;
  v15 = -[GEOPDPlaceRequest initWithUpdatedTransitScheduleDetailsAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:]([GEOPDPlaceRequest alloc], "initWithUpdatedTransitScheduleDetailsAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, v14, v13);

  v16 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v15, v13);
  return v16;
}

- (id)ticketForTransitDeparturesAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 traits:(id)a7
{
  _BOOL8 v7;
  id v11;
  GEOPDPlaceRequest *v12;
  _GEOPlaceSearchRequestTicket *v13;

  v7 = a6;
  v11 = a7;
  v12 = -[GEOPDPlaceRequest initWithTransitDeparturesAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:]([GEOPDPlaceRequest alloc], "initWithTransitDeparturesAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v7, 0, v11);
  v13 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v12, v11);

  return v13;
}

- (id)ticketForTransitTripDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  GEOPDPlaceRequest *v15;
  _GEOPlaceSearchRequestTicket *v16;

  v9 = a6;
  v13 = a8;
  v14 = a7;
  v15 = -[GEOPDPlaceRequest initWithTransitTripDetailsAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:]([GEOPDPlaceRequest alloc], "initWithTransitTripDetailsAtStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, v14, v13);

  v16 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v15, v13);
  return v16;
}

- (id)ticketForTransitTripIdentifiers:(id)a3 traits:(id)a4
{
  id v5;
  id v6;
  GEOPDPlaceRequest *v7;
  _GEOPlaceSearchRequestTicket *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOPDPlaceRequest initWithTripIds:traits:]([GEOPDPlaceRequest alloc], "initWithTripIds:traits:", v6, v5);

  v8 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v7, v5);
  return v8;
}

- (id)ticketForNearbyTransitDeparturesWithLookupOrigin:(id)a3 userLocation:(id)a4 traits:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  _GEOPlaceSearchRequestTicket *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[GEOPDPlaceRequest initWithNearbyTransitDeparturesWithLookupOrigin:userLocation:traits:]([GEOPDPlaceRequest alloc], "initWithNearbyTransitDeparturesWithLookupOrigin:userLocation:traits:", v9, v8, v7);

  v11 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v10, v7);
  return v11;
}

- (id)ticketForNearbyTransitPaymentInfoForLocations:(id)a3 traits:(id)a4
{
  id v5;
  id v6;
  id v7;
  _GEOPlaceSearchRequestTicket *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOPDPlaceRequest initForNearbyTransitPaymentLookupAtLocations:traits:]([GEOPDPlaceRequest alloc], "initForNearbyTransitPaymentLookupAtLocations:traits:", v6, v5);

  v8 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v7, v5);
  return v8;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  return -[GEOMapService ticketForSearchQuery:completionItem:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:maxResults:traits:searchSessionData:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  return -[GEOMapService ticketForSearchQuery:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", a3, a4, 0, *(_QWORD *)&a5, 0, a6, a7);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7
{
  return -[GEOMapService ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:", a3, a4, a5, *(_QWORD *)&a6, a7, 0);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7 searchSessionData:(id)a8
{
  return -[GEOMapService ticketForSearchQuery:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", a3, a4, a5, *(_QWORD *)&a6, 0, a7, a8);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8
{
  return -[GEOMapService ticketForSearchQuery:completionItem:relatedSearchSuggestion:retainedSearch:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:relatedSearchSuggestion:retainedSearch:maxResults:traits:searchSessionData:", a3, a4, a5, a6, *(_QWORD *)&a7, a8, 0);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8 searchSessionData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  GEOPDPlaceRequest *v22;
  void *v23;
  void *v24;
  void *v25;
  GEOPDPlaceRequest *v26;
  id v27;
  _GEOPlaceSearchRequestTicket *v28;
  _GEOPlaceSearchRequestTicket *v29;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;

  v33 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  if (!v18)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7 <= 1)
    v20 = 1;
  else
    v20 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "entry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v22 = [GEOPDPlaceRequest alloc];
  v32 = v16;
  objc_msgSend(v16, "_suggestionEntryMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_retainedSearchMetadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  LOBYTE(v31) = 0;
  v26 = -[GEOPDPlaceRequest initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:](v22, "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:", v33, v23, v24, v21, v25, v20, MEMORY[0x1E0C9AA60], v31, v18, 0, &v34, v19);
  v27 = v34;

  if (v26)
    v28 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v26, v18);
  else
    v28 = -[_GEOFailedTicket initWithError:traits:]([_GEOFailedSearchTicket alloc], "initWithError:traits:", v27, v18);
  v29 = v28;

  return v29;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 suppressResultsRequiringAttribution:(BOOL)a7 traits:(id)a8
{
  return -[GEOMapService ticketForSearchQuery:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, 0);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 suppressResultsRequiringAttribution:(BOOL)a7 traits:(id)a8 searchSessionData:(id)a9
{
  return -[GEOMapService ticketForSearchQuery:filters:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:](self, "ticketForSearchQuery:filters:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", a3, MEMORY[0x1E0C9AA60], a4, a5, *(_QWORD *)&a6, a7, a8, a9);
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 completionItem:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 suppressResultsRequiringAttribution:(BOOL)a8 traits:(id)a9
{
  return -[GEOMapService ticketForSearchQuery:filters:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:](self, "ticketForSearchQuery:filters:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", a3, a4, a5, a6, *(_QWORD *)&a7, a8, a9, 0);
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 completionItem:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 suppressResultsRequiringAttribution:(BOOL)a8 traits:(id)a9 searchSessionData:(id)a10
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  GEOPDRecentRouteInfo *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  GEOPDPlaceRequest *v27;
  void *v28;
  void *v29;
  void *v30;
  GEOPDRecentRouteInfo *v31;
  void *v32;
  GEOPDPlaceRequest *v33;
  id v34;
  _GEOPlaceSearchRequestTicket *v35;
  _GEOPlaceSearchRequestTicket *v36;
  uint64_t v38;
  GEOPDRecentRouteInfo *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v15 = a3;
  v44 = a4;
  v16 = a5;
  v43 = a6;
  v17 = a9;
  v42 = a10;
  if (!v17)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7 <= 1)
    v18 = 1;
  else
    v18 = a7;
  if (objc_msgSend(v17, "navigating") && objc_msgSend(v17, "hasAddStopRouteInfo"))
  {
    v19 = objc_alloc_init(GEOPDRecentRouteInfo);
    objc_msgSend(v17, "addStopRouteInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "zilchData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v20, "zilchData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDRecentRouteInfo addZilchPointSegment:]((uint64_t)v19, v22);

    }
    objc_msgSend(v20, "originalWaypointRouteRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDRecentRouteInfo setOriginalWaypointRoute:]((uint64_t)v19, v23);

    objc_msgSend(v20, "sessionState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDRecentRouteInfo setSessionState:]((uint64_t)v19, v24);

    objc_msgSend(v20, "routeId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDRecentRouteInfo setRouteId:]((uint64_t)v19, v25);

  }
  else
  {
    v19 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "entry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  v27 = [GEOPDPlaceRequest alloc];
  objc_msgSend(v16, "entryMetadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v16;
  objc_msgSend(v16, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_retainedSearchMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v31 = v19;
  v39 = v19;
  LOBYTE(v38) = a8;
  v32 = v15;
  v33 = -[GEOPDPlaceRequest initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:](v27, "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:", v15, v28, v29, v26, v30, v18, v44, v38, v17, v39, &v45, v42);
  v34 = v45;

  if (v33)
    v35 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v33, v17);
  else
    v35 = -[_GEOFailedSearchTicket initWithError:searchQuery:traits:]([_GEOFailedSearchTicket alloc], "initWithError:searchQuery:traits:", v34, v32, v17);
  v36 = v35;

  return v36;
}

- (id)ticketForMapItemToRefine:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  _GEOPlaceRequestTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initWithMapItemToRefine:traits:]([GEOPDPlaceRequest alloc], "initWithMapItemToRefine:traits:", v6, v7);
  v9 = -[_GEOPlaceRequestTicket initWithRequest:traits:mapItemToRefine:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:mapItemToRefine:", v8, v7, v6);

  return v9;
}

- (id)ticketForPlaceRefinementRequestWithCoordinate:(id *)a3 addressLine:(id)a4 placeName:(id)a5 traits:(id)a6
{
  id v10;
  id v11;
  id v12;
  GEOPDPlaceRefinementParameters *v13;
  double var1;
  GEOPDPlaceRefinementParameters *v15;
  GEOLatLng *v16;
  void *v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(GEOPDPlaceRefinementParameters);
  v15 = v13;
  if (v10)
  {
    -[GEOPDPlaceRefinementParameters clearFormattedAddressLineHints]((uint64_t)v13);
    -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:]((uint64_t)v15, v10);
  }
  if (v11)
    -[GEOPDPlaceRefinementParameters setPlaceNameHint:]((uint64_t)v15, v11);
  if (a3)
  {
    var1 = a3->var1;
    if (var1 >= -180.0 && var1 <= 180.0)
    {
      var1 = a3->var0;
      if (a3->var0 >= -90.0 && var1 <= 90.0)
      {
        v16 = objc_alloc_init(GEOLatLng);
        -[GEOLatLng setLat:](v16, "setLat:", a3->var0);
        -[GEOLatLng setLng:](v16, "setLng:", a3->var1);
        -[GEOPDPlaceRefinementParameters setLocationHint:]((uint64_t)v15, v16);

      }
    }
  }
  -[GEOMapService ticketForPlaceRefinementRequestParameters:traits:](self, "ticketForPlaceRefinementRequestParameters:traits:", v15, v12, var1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)ticketForPlaceRefinementRequestParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  _GEOPlaceRequestTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initWithPlaceRefinementParameters:traits:]([GEOPDPlaceRequest alloc], "initWithPlaceRefinementParameters:traits:", v6, v7);
  v9 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v8, v7);

  return v9;
}

- (id)ticketForVendorSpecificPlaceRefinementRequestParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  _GEOPlaceRequestTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initWithVendorSpecificPlaceRefinementParameters:traits:]([GEOPDPlaceRequest alloc], "initWithVendorSpecificPlaceRefinementParameters:traits:", v6, v7);
  v9 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v8, v7);

  return v9;
}

- (id)ticketForCanonicalLocationSearchQueryString:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  _GEOPlaceRequestTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initWithCanonicalLocationSearchQueryString:traits:]([GEOPDPlaceRequest alloc], "initWithCanonicalLocationSearchQueryString:traits:", v6, v7);
  v9 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v8, v7);

  return v9;
}

- (id)ticketForURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8
{
  uint64_t v9;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unsigned int overriddenResultProviderID;
  GEOPDPlaceRequest *v20;
  GEOPDPlaceRequest *v21;
  id v22;
  _GEOFailedSearchTicket *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  GEOPDPlaceRequest *v29;
  GEOPDPlaceRequest *v30;
  uint64_t v32;
  id v33;

  v9 = *(_QWORD *)&a7;
  LODWORD(v11) = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = v17;
  overriddenResultProviderID = self->_overriddenResultProviderID;
  if (overriddenResultProviderID)
    v11 = overriddenResultProviderID;
  else
    v11 = v11;
  if (!v17)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v15, "muid"))
  {
    v20 = -[GEOPDPlaceRequest initWithSearchURLQuery:identifier:resultProviderId:contentProvider:maxResults:traits:]([GEOPDPlaceRequest alloc], "initWithSearchURLQuery:identifier:resultProviderId:contentProvider:maxResults:traits:", v14, v15, v11, v16, v9, v18);
  }
  else
  {
    v24 = objc_msgSend(v14, "length");
    objc_msgSend(v15, "coordinate");
    v27 = v25;
    if (!v24)
    {
      -[GEOMapService _searchable_ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "_searchable_ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", 1, 0, 0, v18, v25);
      v23 = (_GEOFailedSearchTicket *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v28 = fabs(v26 + 180.0);
    v29 = [GEOPDPlaceRequest alloc];
    v30 = v29;
    if (v28 < 0.00000001 && fabs(v27 + 180.0) < 0.00000001)
    {
      v33 = 0;
      LOBYTE(v32) = 0;
      v21 = -[GEOPDPlaceRequest initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:](v29, "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:", v14, 0, 0, 0, 0, v9, MEMORY[0x1E0C9AA60], v32, v18, 0, &v33, 0);
      v22 = v33;
      if (v21)
        goto LABEL_9;
LABEL_14:
      v23 = -[_GEOFailedSearchTicket initWithError:searchQuery:traits:]([_GEOFailedSearchTicket alloc], "initWithError:searchQuery:traits:", v22, v14, v18);
      goto LABEL_15;
    }
    objc_msgSend(v15, "coordinate");
    v20 = -[GEOPDPlaceRequest initWithSearchURLQuery:coordinate:maxResults:traits:](v30, "initWithSearchURLQuery:coordinate:maxResults:traits:", v14, v9, v18);
  }
  v21 = v20;
  v22 = 0;
  if (!v20)
    goto LABEL_14;
LABEL_9:
  v23 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v21, v18);

LABEL_15:
LABEL_16:

  return v23;
}

- (id)_ticketForAutocompleteFragment:(id)a3 type:(int)a4 traits:(id)a5 filters:(id)a6 retainedSearch:(id)a7 tappedQuerySuggestion:(id)a8 sessionData:(id)a9
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  GEOPDPlaceRequest *v21;
  void *v22;
  GEOPDPlaceRequest *v23;
  id v24;
  _GEOPlaceSearchAutocompleteTicket *v25;
  _GEOPlaceSearchAutocompleteTicket *v26;
  id v28;

  v13 = *(_QWORD *)&a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!v16)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = [GEOPDPlaceRequest alloc];
  objc_msgSend(v18, "_retainedSearchMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v23 = -[GEOPDPlaceRequest initWithAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:error:](v21, "initWithAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:error:", v15, v13, v16, v17, v22, v19, v20, &v28);
  v24 = v28;

  if (v23)
    v25 = -[_GEOPlaceSearchAutocompleteTicket initWithRequest:traits:searchQuery:sessionData:]([_GEOPlaceSearchAutocompleteTicket alloc], "initWithRequest:traits:searchQuery:sessionData:", v23, v16, v15, v20);
  else
    v25 = -[_GEOFailedCompletionTicket initWithError:searchQuery:traits:]([_GEOFailedCompletionTicket alloc], "initWithError:searchQuery:traits:", v24, v15, v16);
  v26 = v25;

  return v26;
}

- (id)ticketForVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  _GEOPlacePhotoLookupTicket *v13;

  length = a5.length;
  location = a5.location;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[_GEOPlacePhotoLookupTicket initWithVendorIdentifier:mapItemIdentifier:range:traits:]([_GEOPlacePhotoLookupTicket alloc], "initWithVendorIdentifier:mapItemIdentifier:range:traits:", v12, v11, location, length, v10);

  return v13;
}

- (id)ticketForCategoryIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  _GEOPlaceComingledPhotoLookupTicket *v13;

  length = a5.length;
  location = a5.location;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[_GEOPlaceComingledPhotoLookupTicket initWithPhotoCategoryIdentifier:mapItemIdentifier:range:traits:]([_GEOPlaceComingledPhotoLookupTicket alloc], "initWithPhotoCategoryIdentifier:mapItemIdentifier:range:traits:", v12, v11, location, length, v10);

  return v13;
}

- (id)ticketForInterleavedInstantSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 0, a6, a4, 0, 0, a5);
}

- (id)ticketForInterleavedAutoCompleteSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 1, a6, a4, 0, 0, a5);
}

- (id)ticketForInterleavedLocalitiesAndLandmarksSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 2, a5, 0, 0, 0, a4);
}

- (id)ticketForInterleavedAutoCompleteWithBrowseSearchFragment:(id)a3 filters:(id)a4 retainedSearch:(id)a5 tappedQuerySuggestion:(id)a6 sessionData:(id)a7 traits:(id)a8
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 3, a8, a4, a5, a6, a7);
}

- (id)ticketForInterleavedAutoCompletePoiAddressOnly:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 9, a5, 0, 0, 0, a4);
}

- (id)ticketForSectionedInstantSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 0, a6, 0, 0, 0, a5);
}

- (id)ticketForSectionedAutoCompleteSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 1, a6, a4, 0, 0, a5);
}

- (id)ticketForSectionedLocalitiesAndLandmarksSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 2, a5, 0, 0, 0, a4);
}

- (id)ticketForOfflineRegionSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return -[GEOMapService _ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:](self, "_ticketForAutocompleteFragment:type:traits:filters:retainedSearch:tappedQuerySuggestion:sessionData:", a3, 8, a5, 0, 0, 0, a4);
}

- (id)ticketForCategoryListWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _GEOPlaceSearchCategoryTicket *v8;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[GEOPDPlaceRequest initForCategoryListWithTraits:isFromNoQueryState:]([GEOPDPlaceRequest alloc], "initForCategoryListWithTraits:isFromNoQueryState:", v6, v4);
  v8 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOPlaceSearchCategoryTicket alloc], "initWithRequest:traits:", v7, v6);

  return v8;
}

- (id)ticketForDFRCategoryListWithTraits:(id)a3
{
  return 0;
}

- (id)ticketForSearchFieldPlaceholderWithTraits:(id)a3
{
  id v4;
  id v5;
  _GEOPlaceSearchPlaceholderTicket *v6;

  v4 = a3;
  if (!v4)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[GEOPDPlaceRequest initForSearchFieldPlaceholderWithTraits:]([GEOPDPlaceRequest alloc], "initForSearchFieldPlaceholderWithTraits:", v4);
  v6 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOPlaceSearchPlaceholderTicket alloc], "initWithRequest:traits:", v5, v4);

  return v6;
}

- (id)ticketForTransitLines:(id)a3 withTraits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  _GEOTransitLineTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initWithIdentifiers:resultProviderID:traits:]([GEOPDPlaceRequest alloc], "initWithIdentifiers:resultProviderID:traits:", v6, 0, v7);
  v9 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOTransitLineTicket alloc], "initWithRequest:traits:", v8, v7);

  return v9;
}

- (id)ticketForNearestTransitStation:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  id v11;
  _GEOPlaceRequestTicket *v12;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[GEOPDPlaceRequest initForNearestTransitStationWithLine:coordinate:traits:]([GEOPDPlaceRequest alloc], "initForNearestTransitStationWithLine:coordinate:traits:", v9, v10, var0, var1);
  v12 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v11, v10);

  return v12;
}

- (id)ticketforCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5 searchSessionData:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  GEOPDPlaceRequest *v16;
  _GEOPlaceRequestTicket *p_super;
  GEOPDPlaceRequest *v18;
  void *v19;
  void *v20;
  GEOPDPlaceRequest *v21;
  id v22;
  _GEOPlaceSearchRequestTicket *v23;
  uint64_t v25;
  id v26;

  LODWORD(v8) = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8 <= 1)
    v8 = 1;
  else
    v8 = v8;
  objc_msgSend(v10, "_autocompleteEntry");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = (void *)v13,
        objc_msgSend(v10, "_suggestionEntryMetadata"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    v18 = [GEOPDPlaceRequest alloc];
    objc_msgSend(v10, "displayString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_autocompleteEntry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    LOBYTE(v25) = 0;
    v21 = -[GEOPDPlaceRequest initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:](v18, "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:", v19, 0, 0, v20, 0, v8, MEMORY[0x1E0C9AA60], v25, v11, 0, &v26, v12);
    v22 = v26;

    if (v21)
      v23 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v21, v11);
    else
      v23 = -[_GEOFailedTicket initWithError:traits:]([_GEOFailedTicket alloc], "initWithError:traits:", v22, v11);
    p_super = &v23->super;

  }
  else
  {
    v16 = -[GEOPDPlaceRequest initWithCategory:maxResults:traits:searchSessionData:]([GEOPDPlaceRequest alloc], "initWithCategory:maxResults:traits:searchSessionData:", v10, v8, v11, v12);
    p_super = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v16, v11);

  }
  return p_super;
}

- (id)searchAroundPOITicketWithIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  GEOPDPlaceRequest *v13;
  _GEOPlaceSearchRequestTicket *v14;
  _GEOPlaceSearchRequestTicket *v15;

  LODWORD(v7) = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v12)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v7 <= 1)
    v7 = 1;
  else
    v7 = v7;
  v13 = -[GEOPDPlaceRequest initWithGeoMapItemIdentifier:categoryID:maxResults:traits:searchSessionData:]([GEOPDPlaceRequest alloc], "initWithGeoMapItemIdentifier:categoryID:maxResults:traits:searchSessionData:", v10, v11, v7, v12, 0);
  if (v13)
    v14 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceSearchRequestTicket alloc], "initWithRequest:traits:", v13, v12);
  else
    v14 = -[_GEOFailedTicket initWithError:traits:]([_GEOFailedTicket alloc], "initWithError:traits:", 0, v12);
  v15 = v14;

  return v15;
}

- (id)ticketForSearchAlongRouteWithCategory:(id)a3 searchQuery:(id)a4 completionItem:(id)a5 originalWaypointRouteData:(id)a6 zilchData:(id)a7 sessionState:(id)a8 routeId:(id)a9 routeAttributes:(id)a10 maxResults:(unsigned int)a11 traits:(id)a12 searchSessionData:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  GEOPDRecentRouteInfo *v26;
  GEOPDRecentRouteInfo *v27;
  void *v28;
  GEOPDPlaceRequest *v29;
  void *v30;
  id v31;
  id v32;
  GEOPDPlaceRequest *v33;
  void *v34;
  void *v35;
  GEOPDPlaceRequest *v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  _GEOPlaceRequestTicket *v42;
  uint64_t v44;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  GEOPDPlaceRequest *v58;

  v52 = a3;
  v51 = a4;
  v50 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a12;
  v24 = a13;
  if (!v23)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a11 <= 1)
    v25 = 1;
  else
    v25 = a11;
  v26 = objc_alloc_init(GEOPDRecentRouteInfo);
  v27 = v26;
  if (v19)
    -[GEOPDRecentRouteInfo addZilchPointSegment:]((uint64_t)v26, v19);
  -[GEOPDRecentRouteInfo setOriginalWaypointRoute:]((uint64_t)v27, v18);
  -[GEOPDRecentRouteInfo setSessionState:]((uint64_t)v27, v20);
  -[GEOPDRecentRouteInfo setRouteId:]((uint64_t)v27, v21);
  objc_msgSend(v23, "useOnlineToOfflineFailoverRequestModeIfAllowed");
  v28 = v52;
  v49 = v18;
  v47 = v21;
  if (v52)
  {
    v29 = -[GEOPDPlaceRequest initWithCategory:routeInfo:maxResults:traits:searchSessionData:]([GEOPDPlaceRequest alloc], "initWithCategory:routeInfo:maxResults:traits:searchSessionData:", v52, v27, v25, v23, v24);
  }
  else
  {
    v46 = v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v50, "entry");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v31 = v22;
    v32 = v20;
    v33 = [GEOPDPlaceRequest alloc];
    objc_msgSend(v50, "entryMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "metadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v44) = 0;
    v36 = v33;
    v20 = v32;
    v22 = v31;
    v29 = -[GEOPDPlaceRequest initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:](v36, "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:", v51, v34, v35, v30, 0, v25, MEMORY[0x1E0C9AA60], v44, v23, v27, 0, v24);

    v28 = 0;
    v19 = v46;
  }
  v48 = v20;
  if (v22)
  {
    v37 = v24;
    v38 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke;
    v55[3] = &unk_1E1C0A2F8;
    v39 = v22;
    v56 = v39;
    v57 = v28;
    v58 = v29;
    v40 = (void *)MEMORY[0x18D765024](v55);
    v53[0] = v38;
    v24 = v37;
    v53[1] = 3221225472;
    v53[2] = __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_3;
    v53[3] = &unk_1E1C0A320;
    v54 = v39;
    v41 = (void *)MEMORY[0x18D765024](v53);

  }
  else
  {
    v40 = 0;
    v41 = 0;
  }
  v42 = -[_GEOPlaceRequestTicket initWithRequest:traits:preSubmitUpdateRequestBlock:retryForErrorBlock:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:preSubmitUpdateRequestBlock:retryForErrorBlock:", v29, v23, v40, v41);

  return v42;
}

void __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *global_queue;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  global_queue = (void *)geo_get_global_queue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_2;
  v7[3] = &unk_1E1C0A2D0;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "buildRouteAttributes:result:", global_queue, v7);

}

void __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  id *v8;
  id *v9;
  GEOPDETAFilter *v10;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "placeRequestParameters");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    -[GEOPDPlaceRequestParameters categorySearchParameters](v7);
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters etaFilter](v9);
    v10 = (GEOPDETAFilter *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_7;
    v10 = objc_alloc_init(GEOPDETAFilter);
    objc_msgSend(*(id *)(a1 + 40), "placeRequestParameters");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters categorySearchParameters](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setEtaFilter:]((uint64_t)v12, v10);
  }
  else
  {
    -[GEOPDPlaceRequestParameters searchParameters](v7);
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters etaFilter](v13);
    v10 = (GEOPDETAFilter *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_7;
    v10 = objc_alloc_init(GEOPDETAFilter);
    objc_msgSend(*(id *)(a1 + 40), "placeRequestParameters");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters searchParameters](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setEtaFilter:]((uint64_t)v12, v10);
  }

LABEL_7:
  objc_msgSend(v18, "automobileOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[GEOPDETAFilter automobileOptions]((id *)&v10->super.super.isa);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[GEOPDETAFilter automobileOptions]((id *)&v10->super.super.isa);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "automobileOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mergeFrom:", v17);

    }
    else
    {
      objc_msgSend(v18, "automobileOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDETAFilter setAutomobileOptions:]((uint64_t)v10, v16);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldRetryForError:", a2);
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  return -[GEOMapService ticketForSearchQuery:filters:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:filters:maxResults:traits:searchSessionData:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  return -[GEOMapService ticketForSearchQuery:filters:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:](self, "ticketForSearchQuery:filters:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", a3, a4, *(_QWORD *)&a5, 0, a6, a7);
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 suppressResultsRequiringAttribution:(BOOL)a6 traits:(id)a7
{
  return -[GEOMapService ticketForSearchQuery:filters:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:](self, "ticketForSearchQuery:filters:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", a3, a4, *(_QWORD *)&a5, a6, a7, 0);
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 suppressResultsRequiringAttribution:(BOOL)a6 traits:(id)a7 searchSessionData:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  GEOPDPlaceRequest *v18;
  id v19;
  _GEOPlaceRequestTicket *v20;
  _GEOPlaceRequestTicket *v21;
  uint64_t v23;
  id v24;

  LODWORD(v11) = a5;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  if (!v16)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11 <= 1)
    v11 = 1;
  else
    v11 = v11;
  v24 = 0;
  LOBYTE(v23) = a6;
  v18 = -[GEOPDPlaceRequest initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:]([GEOPDPlaceRequest alloc], "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:suppressResultsRequiringAttribution:traits:routeInfo:error:searchSessionData:", v14, 0, 0, 0, 0, v11, v15, v23, v16, 0, &v24, v17);
  v19 = v24;
  if (v18)
    v20 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v18, v16);
  else
    v20 = -[_GEOFailedTicket initWithError:traits:]([_GEOFailedTicket alloc], "initWithError:traits:", v19, v16);
  v21 = v20;

  return v21;
}

- (id)ticketForSearchCategory:(id)a3 venueIdentifier:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  _GEOPlaceRequestTicket *v14;
  GEOPDPlaceRequest *v15;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  v14 = 0;
  if (v10 && v11)
  {
    if (!v12)
    {
      -[GEOMapService defaultTraits](self, "defaultTraits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = -[GEOPDPlaceRequest initWithSearchCategory:venueIdentifier:maxResults:traits:]([GEOPDPlaceRequest alloc], "initWithSearchCategory:venueIdentifier:maxResults:traits:", v10, v11, v7, v13);
    v14 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v15, v13);

  }
  return v14;
}

- (id)ticketForBrandLookupWithIMessageUid:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  _GEOPlaceRequestTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initForBrandLookupWithIMessageUid:traits:]([GEOPDPlaceRequest alloc], "initForBrandLookupWithIMessageUid:traits:", v6, v7);
  v9 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v8, v7);

  return v9;
}

- (id)ticketForWifiFingerprintWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 traits:(id)a6
{
  return -[GEOMapService ticketForWifiFingerprintWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:](self, "ticketForWifiFingerprintWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:", a3, a4, *(_QWORD *)&a5, 0, 0, a6);
}

- (id)ticketForWifiFingerprintWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 entryTime:(unint64_t)a6 exitTime:(unint64_t)a7 traits:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  _GEOPlaceRequestTicket *v18;

  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (!v16)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = -[GEOPDPlaceRequest initForWifiFingerprintLookupWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:]([GEOPDPlaceRequest alloc], "initForWifiFingerprintLookupWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:", v14, v15, v11, a6, a7, v16);
  v18 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v17, v16);

  return v18;
}

- (id)ticketForGeoIpLookupForIpAddr:(id)a3
{
  id v3;
  _GEOMapServiceGeoIpLookupTicket *v4;

  v3 = a3;
  v4 = -[_GEOMapServiceGeoIpLookupTicket initWithIpAddress:]([_GEOMapServiceGeoIpLookupTicket alloc], "initWithIpAddress:", v3);

  return v4;
}

- (id)ticketForTerritoryForLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _GEOTerritoryLookupRequestTicket *v10;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v9, "hasRequestPriority") & 1) == 0
    && GEOConfigGetBOOL(GeoServicesConfig_TerritoryLookupUsesBackgroundDispatcher, (uint64_t)off_1EDF4E4A8))
  {
    objc_msgSend(v9, "setRequestPriority:", 1);
    objc_msgSend(v9, "setHttpRequestPriority:", GEOConfigGetUint64(GeoServicesConfig_DefaultBackgroundRequestPriority, (uint64_t)off_1EDF4E448));
  }
  v10 = -[_GEOTerritoryLookupRequestTicket initWithLatLngs:shiftLocationsIfNeeded:traits:]([_GEOTerritoryLookupRequestTicket alloc], "initWithLatLngs:shiftLocationsIfNeeded:traits:", v8, v6, v9);

  return v10;
}

- (id)ticketForOfflineRegionNameSuggestionWithRegion:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  _GEOPlaceRequestTicket *v9;

  v6 = a4;
  v7 = a3;
  if (!v6)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initForOfflineRegionNameSuggestionWithRegion:traits:]([GEOPDPlaceRequest alloc], "initForOfflineRegionNameSuggestionWithRegion:traits:", v7, v6);

  v9 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v8, v6);
  return v9;
}

- (id)ticketForSearchCapabilitiesWithTraits:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _GEOMapServiceSearchCapabilitiesTicket *v7;

  v4 = a3;
  if (!v4)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v4, "requestMode") != 4)
  {
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v5, "setRequestMode:", 4);
    v4 = v5;
  }
  v6 = -[GEOPDPlaceRequest initForSearchCapabilitiesWithTraits:]([GEOPDPlaceRequest alloc], "initForSearchCapabilitiesWithTraits:", v4);
  v7 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOMapServiceSearchCapabilitiesTicket alloc], "initWithRequest:traits:", v6, v4);

  return v7;
}

- (id)_ticketForRefreshingHandle:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  void *v9;
  uint64_t v10;
  GEOPDPlaceRequest *v11;
  void *v12;
  void *v13;
  _GEOPlaceRequestTicket *v14;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v6, "hasPlaceRequestData"))
  {
    v8 = [GEOPDPlaceRequest alloc];
    objc_msgSend(v6, "placeRequestData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOPDPlaceRequest initWithInitialRequestData:traits:](v8, "initWithInitialRequestData:traits:", v9, v7);
  }
  else
  {
    if (!objc_msgSend(v6, "hasPlaceRefinementParameters"))
    {
      v14 = 0;
      goto LABEL_9;
    }
    v11 = [GEOPDPlaceRequest alloc];
    objc_msgSend(v6, "placeRefinementParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOPDPlaceRequest initWithPlaceRefinementParameters:traits:](v11, "initWithPlaceRefinementParameters:traits:", v9, v7);
  }
  v12 = (void *)v10;

  objc_msgSend(v6, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHandleData:", v13);

  v14 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v12, v7);
LABEL_9:

  return v14;
}

- (id)ticketForSearchHomeWithTraits:(id)a3
{
  id v4;
  id v5;
  _GEOSearchHomeTicket *v6;

  v4 = a3;
  if (!v4)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[GEOPDPlaceRequest initForSearchHomeWithTraits:]([GEOPDPlaceRequest alloc], "initForSearchHomeWithTraits:", v4);
  v6 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOSearchHomeTicket alloc], "initWithRequest:traits:", v5, v4);

  return v6;
}

- (id)ticketForPublisherViewPublisherIdentifier:(id)a3 keywordFilter:(id)a4 addressFilter:(id)a5 batchSize:(unsigned int)a6 withTraits:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _GEOPublisherViewTicket *v17;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (!v15)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = -[GEOPDPlaceRequest initPublisherViewWithPublisherIdentifier:keywordFilter:addressFilter:batchSize:withTraits:]([GEOPDPlaceRequest alloc], "initPublisherViewWithPublisherIdentifier:keywordFilter:addressFilter:batchSize:withTraits:", v12, v13, v14, v8, v15);
  v17 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOPublisherViewTicket alloc], "initWithRequest:traits:", v16, v15);

  return v17;
}

- (id)ticketForGuideHomeWithFilter:(id)a3 guideLocation:(id)a4 withTraits:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOPDPlaceRequest *v11;
  _GEOGuideHomeViewTicket *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[GEOPDPlaceRequest initWithGuideHomeWithFilter:guideLocation:withTraits:]([GEOPDPlaceRequest alloc], "initWithGuideHomeWithFilter:guideLocation:withTraits:", v8, v9, v10);
  v12 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOGuideHomeViewTicket alloc], "initWithRequest:traits:", v11, v10);

  return v12;
}

- (id)ticketForCuratedCollections:(id)a3 isBatchLookup:(BOOL)a4 overrideSuppress:(BOOL)a5 traits:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  _GEOCuratedCollectionTicket *v13;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (!v11)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = -[GEOPDPlaceRequest initForCuratedCollectionLookupWithIdentifiers:isBatchLookup:overrideSuppress:traits:]([GEOPDPlaceRequest alloc], "initForCuratedCollectionLookupWithIdentifiers:isBatchLookup:overrideSuppress:traits:", v10, v8, v7, v11);
  v13 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOCuratedCollectionTicket alloc], "initWithRequest:traits:", v12, v11);
  -[GEOAbstractTicket setCachePolicy:](v13, "setCachePolicy:", 4);

  return v13;
}

- (id)ticketForCuratedCollectionItems:(id)a3 collection:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _GEOCuratedCollectionItemsTicket *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[GEOPDPlaceRequest initForCuratedCollectionItemLookupWithIdentifiers:collectionIdentifier:traits:]([GEOPDPlaceRequest alloc], "initForCuratedCollectionItemLookupWithIdentifiers:collectionIdentifier:traits:", v8, v9, v10);
  v12 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOCuratedCollectionItemsTicket alloc], "initWithRequest:traits:", v11, v10);
  -[GEOAbstractTicket setCachePolicy:](v12, "setCachePolicy:", 4);

  return v12;
}

- (id)ticketForAllCollectionViewWithBatchSize:(unsigned int)a3 keywordFilter:(id)a4 addressFilter:(id)a5 withTraits:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  GEOPDPlaceRequest *v13;
  _GEOAllCollectionViewTicket *v14;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[GEOPDPlaceRequest initWithAllCollectionViewWithBatchSize:keywordFilter:addressFilter:withTraits:]([GEOPDPlaceRequest alloc], "initWithAllCollectionViewWithBatchSize:keywordFilter:addressFilter:withTraits:", v8, v10, v11, v12);
  v14 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOAllCollectionViewTicket alloc], "initWithRequest:traits:", v13, v12);

  return v14;
}

- (id)ticketForCitySelectorViewWithTraits:(id)a3 batchSize:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  _GEOCitySelectorViewTicket *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (!v6)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[GEOPDPlaceRequest initCitySelectorViewWithTraits:batchSize:]([GEOPDPlaceRequest alloc], "initCitySelectorViewWithTraits:batchSize:", v6, v4);
  v8 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOCitySelectorViewTicket alloc], "initWithRequest:traits:", v7, v6);

  return v8;
}

- (id)ticketForPlaceEnrichmentWithEnrichmentInfo:(id)a3 mapsIdentifier:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _GEOPlaceEnrichmentTicket *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[GEOPDPlaceRequest initPlaceEnrichmentWithEnrichmentInfo:mapsIdentifier:traits:]([GEOPDPlaceRequest alloc], "initPlaceEnrichmentWithEnrichmentInfo:mapsIdentifier:traits:", v8, v9, v10);
  v12 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOPlaceEnrichmentTicket alloc], "initWithRequest:traits:", v11, v10);

  return v12;
}

- (id)ticketForRefreshingEVChargersWithIdentifiers:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  _GEOPlaceEVChargerTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initEVChargerRefreshRequestWithMapsIdentifier:traits:]([GEOPDPlaceRequest alloc], "initEVChargerRefreshRequestWithMapsIdentifier:traits:", v6, v7);
  v9 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOPlaceEVChargerTicket alloc], "initWithRequest:traits:", v8, v7);
  -[GEOAbstractTicket setCachePolicy:](v9, "setCachePolicy:", 4);

  return v9;
}

- (id)ticketForGuideLocationLookupWithIds:(id)a3 identifiers:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _GEOGuideLocationsLookupTicket *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[GEOPDPlaceRequest initForGuideLocationLookupWithIdentifiers:traits:]([GEOPDPlaceRequest alloc], "initForGuideLocationLookupWithIdentifiers:traits:", v9, v10);
  v12 = -[_GEOGuideLocationsLookupTicket initWithRequest:traits:guideLocationsEntries:]([_GEOGuideLocationsLookupTicket alloc], "initWithRequest:traits:guideLocationsEntries:", v11, v10, v8);

  return v12;
}

- (id)ticketForMapsHomeWithTraits:(id)a3
{
  id v4;
  id v5;
  _GEOMapsHomeTicket *v6;

  v4 = a3;
  if (!v4)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[GEOPDPlaceRequest initForMapsHomeWithTraits:]([GEOPDPlaceRequest alloc], "initForMapsHomeWithTraits:", v4);
  v6 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOMapsHomeTicket alloc], "initWithRequest:traits:", v5, v4);

  return v6;
}

- (id)ticketForHikingIntroTipWithMapItemIdentifier:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  _GEOHikingIntroTipTicket *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[GEOPDPlaceRequest initForHikingIntroTipWithMapItemIdentifier:traits:]([GEOPDPlaceRequest alloc], "initForHikingIntroTipWithMapItemIdentifier:traits:", v6, v7);
  v9 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:]([_GEOHikingIntroTipTicket alloc], "initWithRequest:traits:", v8, v7);

  return v9;
}

- (void)trackSerializedPlaceData:(id)a3
{
  id v3;
  void *v4;
  GEOPDPlace *v5;

  v3 = a3;
  v5 = -[GEOPDPlace initWithData:]([GEOPDPlace alloc], "initWithData:", v3);

  if (v5)
  {
    +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackPlaceData:", v5);

  }
}

- (void)trackMapItem:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF9CF08);
  v4 = v7;
  if (v3)
  {
    objc_msgSend(v7, "_placeData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trackPlaceData:", v5);

    }
    v4 = v7;
  }

}

- (void)_resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 cachePolicy:(unint64_t)a5 completionHandler:(id)a6
{
  -[GEOMapService _resolveMapItemFromHandle:withTraits:cachePolicy:coordinateOnlyRefinement:completionHandler:](self, "_resolveMapItemFromHandle:withTraits:cachePolicy:coordinateOnlyRefinement:completionHandler:", a3, a4, a5, 0, a6);
}

- (id)_cachedMapItemForHandle:(id)a3 enforceMaxAge:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double Double;
  NSObject *v14;
  _BOOL4 v15;
  GEOMapItemStorage *v16;
  GEOMapItemStorage *v17;
  void *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEOMapService handleCache]((os_unfair_lock_s *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    Double = GEOConfigGetDouble(GeoServicesConfig_MapItemHandleCacheMaxItemAge, (uint64_t)off_1EDF4E4B8);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v12 >= Double && a4)
    {
      if (v15)
      {
        v20 = 138477827;
        v21 = v6;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Client-side cache hit was too old (ignoring cached value) for handle: %{private}@", (uint8_t *)&v20, 0xCu);
      }
      v16 = 0;
    }
    else
    {
      if (v15)
      {
        v20 = 138477827;
        v21 = v6;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Client-side cache hit for handle: %{private}@", (uint8_t *)&v20, 0xCu);
      }

      v17 = [GEOMapItemStorage alloc];
      objc_msgSend(v8, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GEOMapItemStorage initWithData:](v17, "initWithData:", v18);

      objc_msgSend(v6, "clientAttributes");
      v14 = objc_claimAutoreleasedReturnValue();
      -[GEOMapItemStorage setClientAttributes:](v16, "setClientAttributes:", v14);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 cachePolicy:(unint64_t)a5 coordinateOnlyRefinement:(BOOL)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  void (**v15)(id, _QWORD, GEOMapItemHandle *);
  GEOMapItemHandle *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  GEOMapItemHandle *v24;
  void *v25;
  const __CFString *v26;
  GEOMapItemHandle *v27;
  void *v28;
  NSObject *v29;
  GEOMapItemHandle *v30;
  GEOMapItemHandle *v31;
  NSObject *v32;
  GEOMapItemHandle *v33;
  _QWORD v34[4];
  GEOMapItemHandle *v35;
  GEOMapService *v36;
  void (**v37)(id, _QWORD, GEOMapItemHandle *);
  unint64_t v38;
  uint8_t buf[4];
  GEOMapItemHandle *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = (void (**)(id, _QWORD, GEOMapItemHandle *))a7;
  if (v15)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("handle cannot be nil"));
      v16 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v16);
LABEL_31:

      goto LABEL_32;
    }
    v16 = -[GEOMapItemHandle initWithData:]([GEOMapItemHandle alloc], "initWithData:", v13);
    -[GEOMapItemHandle placeRefinementParameters](v16, "placeRefinementParameters");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      *(_WORD *)(v17 + 108) |= 0x1000u;
      *(_WORD *)(v17 + 108) |= 0x10u;
      *(_BYTE *)(v17 + 104) = a6;
    }

    if (v16 && a5 != 1 && a5 != 4)
    {
      -[GEOMapService _cachedMapItemForHandle:enforceMaxAge:](self, "_cachedMapItemForHandle:enforceMaxAge:", v16, a5 < 2);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        v15[2](v15, v18, 0);
LABEL_30:

        goto LABEL_31;
      }
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v40 = v16;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, "Client-side cache miss for handle: %{private}@", buf, 0xCu);
      }

    }
    if (-[GEOMapItemHandle handleType](v16, "handleType") == 1)
    {
      if (a5 != 3)
      {
        +[GEOMapService sharedService](GEOMapService, "sharedService");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_ticketForRefreshingHandle:traits:", v16, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v30 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v30;
            v41 = 2114;
            v42 = CFSTR("mapItemHandle is invalid");
            _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "%{public}@ was unable to resolve mapItemHandle because %{public}@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("mapItemHandle is invalid"));
          v31 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
          v15[2](v15, 0, v31);

        }
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke;
        v34[3] = &unk_1E1C0A370;
        v38 = a5;
        v35 = v16;
        v36 = self;
        v37 = v15;
        objc_msgSend(v19, "submitWithHandler:networkActivity:", v34, 0);

        goto LABEL_30;
      }
      _mapItemFromHandleContents(v16);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        ((void (**)(id, __CFString *, GEOMapItemHandle *))v15)[2](v15, v21, 0);
LABEL_24:

        goto LABEL_31;
      }
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v33 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        v41 = 2114;
        v42 = CFSTR("mapItemHandle is invalid");
        _os_log_impl(&dword_1885A9000, v32, OS_LOG_TYPE_ERROR, "%{public}@ was unable to resolve mapItemHandle because %{public}@", buf, 0x16u);

      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = CFSTR("mapItemHandle is invalid");
    }
    else
    {
      v22 = CFSTR("mapItemHandle had an unexpected handleType");
      if (!v16)
        v22 = CFSTR("mapItemHandle was nil");
      v21 = v22;
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v24 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "%{public}@ was unable to resolve mapItemHandle because %{public}@", buf, 0x16u);

      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = v21;
    }
    objc_msgSend(v25, "GEOErrorWithCode:reason:", -13, v26);
    v27 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v27);

    goto LABEL_24;
  }
LABEL_32:

}

void __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v10;
  _GEOMapItemHandleCacheData *v11;
  void *v12;
  void *v13;
  _GEOMapItemHandleCacheData *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceRefinementParameters"))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke_2;
      v18[3] = &unk_1E1C0A348;
      v19 = *(id *)(a1 + 32);
      +[GEOMapItemBuilder buildWithSetterBlock:](GEOMapItemBuilder, "buildWithSetterBlock:", v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7 != 1 && v7 != 4 && v6 != 0)
  {
    +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [_GEOMapItemHandleCacheData alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_GEOMapItemHandleCacheData initWithTimestamp:data:](v11, "initWithTimestamp:data:", v12, v13);

    -[GEOMapService handleCache](*(os_unfair_lock_s **)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:cost:", v14, *(_QWORD *)(a1 + 32), -[_GEOMapItemHandleCacheData cost](v14, "cost"));

LABEL_15:
    +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClientAttributes:", v17);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  if (v6)
    goto LABEL_15;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_16:

}

void __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  GEOAddress *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "placeRefinementParameters");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRefinementParameters locationHint](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLatlng:", v4);

  -[GEOPDPlaceRefinementParameters formattedAddressLineHints](v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    v7 = objc_alloc_init(GEOAddress);
    objc_msgSend(v13, "setAddress:", v7);

    -[GEOPDPlaceRefinementParameters formattedAddressLineHints](v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFormattedAddressLines:", v8);

    -[GEOPDPlaceRefinementParameters addressHint](v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStructuredAddress:", v10);

    goto LABEL_5;
  }
  -[GEOPDPlaceRefinementParameters addressHint](v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
LABEL_5:
  -[GEOPDPlaceRefinementParameters placeNameHint](v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", v12);

}

- (void)resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 useCache:(BOOL)a5 coordinateOnlyRefinement:(BOOL)a6 completionHandler:(id)a7
{
  -[GEOMapService _resolveMapItemFromHandle:withTraits:cachePolicy:coordinateOnlyRefinement:completionHandler:](self, "_resolveMapItemFromHandle:withTraits:cachePolicy:coordinateOnlyRefinement:completionHandler:", a3, a4, !a5, a6, a7);
}

- (void)resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 useCache:(BOOL)a5 completionHandler:(id)a6
{
  -[GEOMapService _resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:](self, "_resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:", a3, a4, !a5, a6);
}

- (void)resolveMapItemFromHandle:(id)a3 completionHandler:(id)a4
{
  -[GEOMapService _resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:](self, "_resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:", a3, 0, 0, a4);
}

- (void)resolveMapItemFromHandle:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
  -[GEOMapService _resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:](self, "_resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:", a3, a4, 0, a5);
}

- (void)resolveMapItemLocallyFromHandle:(id)a3 completionHandler:(id)a4
{
  -[GEOMapService _resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:](self, "_resolveMapItemFromHandle:withTraits:cachePolicy:completionHandler:", a3, 0, 3, a4);
}

- (id)locallyResolvedMapItemFromHandle:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapItemHandle *v7;
  GEOMapItemHandle *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a3;
  if (v6)
  {
    v7 = -[GEOMapItemHandle initWithData:]([GEOMapItemHandle alloc], "initWithData:", v6);
    v8 = v7;
    if (v7)
    {
      -[GEOMapItemHandle placeRefinementParameters](v7, "placeRefinementParameters");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        *(_WORD *)(v9 + 108) |= 0x1000u;
        *(_WORD *)(v9 + 108) |= 0x10u;
        *(_BYTE *)(v9 + 104) = 0;
      }

      -[GEOMapService _cachedMapItemForHandle:enforceMaxAge:](self, "_cachedMapItemForHandle:enforceMaxAge:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        _mapItemFromHandleContents(v8);
        v11 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v11;
        if (a4)
        {
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("mapItemHandle is invalid"));
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v12 = v10;

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("mapItemHandle is invalid"));
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("handle cannot be nil"));
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_geoMapItemsForResponseData:(id)a3 handler:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  GEOPDPlaceResponse *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id *v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = (void (**)(id, _QWORD, void *))a4;
  if (v5)
  {
    if (!objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0, v7);
LABEL_14:

      goto LABEL_15;
    }
    v6 = -[GEOPDPlaceResponse initWithData:]([GEOPDPlaceResponse alloc], "initWithData:", v15);
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, 0);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0, v9);
      goto LABEL_13;
    }
    if (-[GEOPDPlaceResponse hasGlobalResult](v6, "hasGlobalResult"))
    {
      objc_msgSend(v7, "globalResult");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (_QWORD *)v8;
      if (!v8)
      {
        v11 = 0;
        goto LABEL_8;
      }
      -[GEOPDPlaceGlobalResult _readCategorySearchResult](v8);
      v10 = v9[17];

      if (v10)
      {
        objc_msgSend(v7, "globalResult");
        v11 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult categorySearchResult](v11);
        v12 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDCategorySearchResult resultDetourInfos](v12);
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

LABEL_8:
LABEL_11:
        objc_msgSend(v7, "resultsWithResultType:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_disambiguationLabels");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _attributedGeoMapItemsForPlaceDatasWithHandler(0, v13, v14, v9, 0, 0, v5);

LABEL_13:
        goto LABEL_14;
      }
    }
    v9 = 0;
    goto LABEL_11;
  }
LABEL_15:

}

- (id)_geoMapItemForData:(id)a3
{
  id v3;
  GEOMapItemStorage *v4;
  GEOMapItemStorage *v5;
  GEOMapItemStorage *v6;
  GEOPDPlace *v7;
  GEOPDPlace *v8;
  GEOPlaceResult *v9;
  GEOPlaceResult *v10;
  GEOPlace *v11;
  GEOPlace *v12;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[GEOMapItemStorage initWithData:]([GEOMapItemStorage alloc], "initWithData:", v3);
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v7 = -[GEOPDPlace initWithData:]([GEOPDPlace alloc], "initWithData:", v3);
      v8 = v7;
      if (v7)
      {
        -[GEOPDPlace geoMapItem](v7, "geoMapItem");
        v6 = (GEOMapItemStorage *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = -[GEOPlaceResult initWithData:]([GEOPlaceResult alloc], "initWithData:", v3);
        v10 = v9;
        if (v9)
        {
          -[GEOPlaceResult geoMapItem](v9, "geoMapItem");
          v6 = (GEOMapItemStorage *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = -[GEOPlace initWithData:]([GEOPlace alloc], "initWithData:", v3);
          v12 = v11;
          if (v11)
          {
            -[GEOPlace geoMapItem](v11, "geoMapItem");
            v6 = (GEOMapItemStorage *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v6 = 0;
          }

        }
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_geoMapItemsForPlacesInDetails:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "placesCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "places", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "geoMapItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)_attributedGeoMapItemsForPlaceDatasWithType:(int)a3 placeDatas:(id)a4 disambiguationLabels:(id)a5 handler:(id)a6
{
  _attributedGeoMapItemsForPlaceDatasWithHandler(*(uint64_t *)&a3, a4, a5, 0, 0, 0, a6);
}

+ (BOOL)shouldResolveAttribution
{
  return _shouldResolveAttribution;
}

+ (void)setShouldResolveAttribution:(BOOL)a3
{
  _shouldResolveAttribution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleCacheDelegate, 0);
  objc_storeStrong((id *)&self->_handleCache, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
}

- (id)serializedClientMetadataForSiri
{
  GEOPDClientMetadata *v3;
  void *v4;
  GEOPDClientMetadata *v5;
  GEOPDClientMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = [GEOPDClientMetadata alloc];
  -[GEOMapService defaultTraits](self, "defaultTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPDClientMetadata initWithTraits:](v3, "initWithTraits:", v4);

  v6 = objc_alloc_init(GEOPDClientMetadata);
  -[GEOPDClientMetadata additionalEnabledMarkets](v5, "additionalEnabledMarkets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientMetadata setAdditionalEnabledMarkets:](v6, "setAdditionalEnabledMarkets:", v7);

  -[GEOPDClientMetadata setRequiredVersion:](v6, "setRequiredVersion:", -[GEOPDClientMetadata requiredVersion](v5, "requiredVersion"));
  -[GEOPDClientMetadata setResultListAttributionSupport:](v6, "setResultListAttributionSupport:", -[GEOPDClientMetadata resultListAttributionSupport](v5, "resultListAttributionSupport"));
  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_siriClientMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientMetadata setAbClientMetadata:](v6, "setAbClientMetadata:", v9);

  -[GEOPDClientMetadata setEnablePreflightVenues:](v6, "setEnablePreflightVenues:", -[GEOPDClientMetadata enablePreflightVenues](v5, "enablePreflightVenues"));
  -[GEOPDClientMetadata businessChatPreflightIdentifiers](v5, "businessChatPreflightIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientMetadata setBusinessChatPreflightIdentifiers:](v6, "setBusinessChatPreflightIdentifiers:", v10);

  -[GEOPDClientMetadata data](v6, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)serializedETAFilterForSiriWithRouteAttributes:(id)a3
{
  void *v3;
  void *v4;

  +[GEOPDETAFilter etaFilterForRouteAttributes:](GEOPDETAFilter, "etaFilterForRouteAttributes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serializedSearchEvChargingParametersForSiriFromPorts:(id)a3
{
  id v3;
  GEOPDSSearchEvChargingParameters *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
  -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v4, v3);

  -[GEOPDSSearchEvChargingParameters data](v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ticketForMerchantCode:(id)a3 rawMerchantCode:(id)a4 industryCategory:(id)a5 industryCode:(id)a6 paymentNetwork:(id)a7 transactionDate:(id)a8 transactionLocation:(id)a9 traits:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  GEOPDPlaceRequest *v24;
  _GEOPlaceRequestTicket *v25;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if (!v23)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = -[GEOPDPlaceRequest initWithMerchantCode:rawMerchantCode:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:traits:]([GEOPDPlaceRequest alloc], "initWithMerchantCode:rawMerchantCode:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:traits:", v16, v17, v18, v19, v20, v21, v22, v23);
  v25 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v24, v23);

  return v25;
}

- (id)ticketForMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 fuzzyMatched:(id)a34 coarseLocationUsed:(id)a35 bankTransactionType:(int)a36 bankTransactionStatus:(int)a37 bankAnonymisedUserId:(id)a38 otherBankTransactionLocations:(id)a39 bankTransactionDescription:(id)a40 bankTransactionTimestamp:(id)a41 bankRawMerchantCode:(id)a42 bankIndustryCategory:(id)a43 bankIndustryCode:(id)a44 bankTransactionCurrencyCode:(id)a45 bankMerchantInfo:(id)a46 baaCerts:(id)a47 baaSignature:(id)a48 bankBrandMUIDFallbackEnabled:(id)a49 bankIdentifier:(id)a50 bankTransactionDescriptionClean:(id)a51 bankPIIRedactionIsApplied:(id)a52 bankRotationPeriodsSinceEpoch:(id)a53 traits:(id)a54
{
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  GEOPDPlaceRequest *v69;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  _GEOPlaceRequestTicket *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;

  v116 = a3;
  v115 = a4;
  v114 = a5;
  v113 = a6;
  v112 = a7;
  v111 = a8;
  v109 = a9;
  v108 = a10;
  v107 = a11;
  v106 = a12;
  v105 = a14;
  v101 = a15;
  v104 = a16;
  v103 = a17;
  v99 = a18;
  v102 = a19;
  v96 = a20;
  v100 = a21;
  v94 = a22;
  v98 = a23;
  v91 = a24;
  v97 = a25;
  v88 = a26;
  v95 = a27;
  v86 = a28;
  v93 = a29;
  v85 = a30;
  v92 = a31;
  v84 = a32;
  v90 = a33;
  v83 = a34;
  v89 = a35;
  v82 = a38;
  v87 = a39;
  v81 = a40;
  v75 = a41;
  v58 = a42;
  v76 = a43;
  v59 = a44;
  v77 = a45;
  v60 = a46;
  v78 = a47;
  v61 = a48;
  v62 = a49;
  v63 = a50;
  v64 = a51;
  v65 = a52;
  v66 = a53;
  v67 = a54;
  if (!v67)
  {
    -[GEOMapService defaultTraits](self, "defaultTraits");
    v67 = (id)objc_claimAutoreleasedReturnValue();
  }
  v73 = v65;
  v79 = v65;
  v68 = v64;
  LODWORD(v72) = a36;
  HIDWORD(v72) = a36;
  LODWORD(v71) = a13;
  v69 = -[GEOPDPlaceRequest initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:]([GEOPDPlaceRequest alloc], "initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", v116, v115, v114, v113, v112, v111, v109, v108, v107,
          v106,
          v71,
          v105,
          v101,
          v104,
          v103,
          v99,
          v102,
          v96,
          v100,
          v94,
          v98,
          v91,
          v97,
          v88,
          v95,
          v86,
          v93,
          v85,
          v92,
          v84,
          v90,
          v83,
          v89,
          v72,
          v82,
          v87,
          v81,
          v75,
          v58,
          v76,
          v59,
          v77,
          v60,
          v78,
          v61,
          v62,
          v63,
          v64,
          v73,
          v66,
          v67);
  v80 = -[_GEOPlaceRequestTicket initWithRequest:traits:]([_GEOPlaceRequestTicket alloc], "initWithRequest:traits:", v69, v67);

  return v80;
}

- (id)ticketForWiFiQualityNetworkServiceRequest:(id)a3
{
  id v3;
  GEOWiFiQualityServiceRequest *v4;
  GEOPDClientMetadata *v5;
  void *v6;
  void *v7;
  GEOPDClientMetadata *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _GEOMapServiceWiFiQualityLookupTicket *v14;
  void *v15;
  void *v16;
  _GEOMapServiceWiFiQualityLookupTicket *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(GEOWiFiQualityServiceRequest);
  v5 = [GEOPDClientMetadata alloc];
  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[GEOPDClientMetadata initWithTraits:](v5, "initWithTraits:", v7);
  -[GEOWiFiQualityServiceRequest setClientMetadata:](v4, "setClientMetadata:", v8);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        -[GEOWiFiQualityServiceRequest addNetworkSearches:](v4, "addNetworkSearches:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13++), (_QWORD)v19);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v14 = [_GEOMapServiceWiFiQualityLookupTicket alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_GEOMapServiceWiFiQualityLookupTicket initWithRequest:requestId:](v14, "initWithRequest:requestId:", v4, v16);

  return v17;
}

- (id)ticketForWiFiQualityLocationServiceRequest:(id)a3
{
  return 0;
}

- (id)ticketForWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4
{
  id v5;
  id v6;
  _GEOMapServiceWiFiQualityLookupTicket *v7;
  void *v8;
  void *v9;
  _GEOMapServiceWiFiQualityLookupTicket *v10;

  v5 = a4;
  v6 = a3;
  v7 = [_GEOMapServiceWiFiQualityLookupTicket alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_GEOMapServiceWiFiQualityLookupTicket initWithTileKey:eTag:requestId:](v7, "initWithTileKey:eTag:requestId:", v6, v5, v9);

  return v10;
}

- (double)wiFiQualitySearchRadiusMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_WifiQualitySearchRadiusMeters, (uint64_t)off_1EDF4DC78);
}

- (int64_t)wiFiQualitySearchZoomLevel
{
  return GEOConfigGetInteger(GeoServicesConfig_WifiQualitySearchZoom, (uint64_t)off_1EDF4DCB8);
}

- (double)wiFiQualitySmallSearchRadiusMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_WiFiQualitySmallSearchRadiusMeters, (uint64_t)off_1EDF4DC88);
}

@end
