@implementation MKMapService

- (id)ticketForPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _MKTicket *v12;

  v5 = a4;
  v7 = (void *)MEMORY[0x1E0D27218];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ticketForPhoneNumbers:allowCellularDataForLookup:traits:", v9, v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v11);
  return v12;
}

+ (id)sharedService
{
  if (qword_1ECE2DA28 != -1)
    dispatch_once(&qword_1ECE2DA28, &__block_literal_global_46);
  return (id)_MergedGlobals_147;
}

void __29__MKMapService_sharedService__block_invoke()
{
  MKMapService *v0;
  void *v1;

  v0 = objc_alloc_init(MKMapService);
  v1 = (void *)_MergedGlobals_147;
  _MergedGlobals_147 = (uint64_t)v0;

}

- (id)defaultTraits
{
  return -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", 0);
}

- (id)defaultTraitsWithTransportType:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[MKMapService defaultTraits](self, "defaultTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 - 1 > 3)
    v6 = 0;
  else
    v6 = dword_18B2A9D30[a3 - 1];
  objc_msgSend(v4, "addTransportType:", v6);
  return v5;
}

- (id)defaultTraitsWithTraits:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultTraits");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v3, "hasDeviceLocation") & 1) == 0)
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasLocation") && (objc_msgSend(v5, "isLastLocationStale") & 1) == 0)
    {
      objc_msgSend(v5, "currentLocation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDeviceLocation:", v6);

    }
  }
  if ((objc_msgSend(v3, "hasDeviceKeyboardLocale") & 1) == 0)
  {
    _deviceKeyboardLanguageIfAvailable();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceKeyboardLocale:", v7);

  }
  if ((objc_msgSend(v3, "hasDevicePlatform") & 1) == 0)
    objc_msgSend(v3, "setDevicePlatform:", 1);
  return v3;
}

- (id)defaultTraitsForAnalyticsWithTraits:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultTraits");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v3, "hasDeviceKeyboardLocale") & 1) == 0)
  {
    _deviceKeyboardLanguageIfAvailable();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceKeyboardLocale:", v5);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && (objc_msgSend(v3, "hasDeviceBatteryState") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isBatteryMonitoringEnabled") & 1) != 0)
    {
      v7 = objc_msgSend(v6, "batteryState") - 1;
      if (v7 < 3)
        v8 = (v7 + 1);
      else
        v8 = 0;
      objc_msgSend(v3, "setDeviceBatteryState:", v8);
    }
    else
    {
      objc_msgSend(v6, "setBatteryMonitoringEnabled:", 1);
      v9 = objc_msgSend(v6, "batteryState") - 1;
      if (v9 < 3)
        v10 = (v9 + 1);
      else
        v10 = 0;
      objc_msgSend(v3, "setDeviceBatteryState:", v10);
      objc_msgSend(v6, "setBatteryMonitoringEnabled:", 0);
    }

  }
  return v3;
}

- (id)ticketForMUIDs:(id)a3 traits:(id)a4
{
  return -[MKMapService ticketForMUIDs:resultProviderID:contentProvider:traits:](self, "ticketForMUIDs:resultProviderID:contentProvider:traits:", a3, 0, 0, a4);
}

- (id)ticketForMUIDs:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _MKTicket *v15;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForMUIDs:resultProviderID:contentProvider:traits:", v11, v7, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)ticketForIdentifiers:(id)a3 traits:(id)a4
{
  return -[MKMapService ticketForIdentifiers:resultProviderID:contentProvider:traits:](self, "ticketForIdentifiers:resultProviderID:contentProvider:traits:", a3, 0, 0, a4);
}

- (id)ticketForIdentifiers:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _MKTicket *v16;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "ticketForIdentifiers:resultProviderID:contentProvider:traits:", v14, v7, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v15);
  return v16;
}

- (id)ticketForFreshIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _MKTicket *v16;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "geoMapItemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "ticketForFreshIdentifier:resultProviderID:contentProvider:traits:", v14, v7, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v15);
  return v16;
}

- (id)ticketForNonExpiredIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _MKTicket *v16;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "geoMapItemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "ticketForNonExpiredIdentifier:resultProviderID:contentProvider:traits:", v14, v7, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v15);
  return v16;
}

- (id)ticketForFreshBusinessClaimComponentWithIdentifier:(id)a3 resultProviderID:(int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _MKTicket *v13;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geoMapItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ticketForFreshBusinessClaimComponentWithIdentifier:resultProviderID:traits:", v11, v6, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v12);
  return v13;
}

- (id)ticketForExternalBusinessID:(id)a3 contentProvider:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _MKTicket *v13;

  v8 = a4;
  v9 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ticketForExternalBusinessID:contentProvider:traits:", v9, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v12);
  return v13;
}

- (id)ticketForForwardGeocodeAddress:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _MKTicket *v10;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForForwardGeocodeAddress:maxResults:traits:", v6, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v9);
  return v10;
}

- (id)ticketForForwardGeocodeString:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _MKTicket *v10;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForForwardGeocodeString:maxResults:traits:", v6, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v9);
  return v10;
}

- (id)ticketForForwardGeocodeAddressDictionary:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _MKTicket *v10;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForForwardGeocodeAddressDictionary:maxResults:traits:", v6, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v9);
  return v10;
}

- (id)_ticketForReverseGeocodeCoordinate:(CLLocationCoordinate2D)a3 includeEntryPoints:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 traits:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double longitude;
  double latitude;
  void *v10;
  void *v11;
  void *v12;
  _MKTicket *v13;

  v6 = a5;
  v7 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v7, 0, v6, v10, latitude, longitude);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v12);
  return v13;
}

- (id)_ticketForReverseGeocodeCoordinate:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 includeEntryPoints:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  double longitude;
  double latitude;
  void *v12;
  void *v13;
  void *v14;
  _MKTicket *v15;

  v7 = a6;
  v8 = a5;
  v9 = *(_QWORD *)&a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForReverseGeocodeCoordinate:floor:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v9, v8, 0, v7, v12, latitude, longitude);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)ticketForReverseGeocodeCoordinate:(CLLocationCoordinate2D)a3 traits:(id)a4
{
  return -[MKMapService _ticketForReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:](self, "_ticketForReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:", 1, 0, a4, a3.latitude, a3.longitude);
}

- (id)ticketForReverseGeocodeLocation:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKTicket *v11;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v6);

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ticketForReverseGeocodeLocation:traits:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v10);
  return v11;
}

- (id)ticketForReverseGeocodeDroppedPinCoordinate:(CLLocationCoordinate2D)a3 traits:(id)a4
{
  return -[MKMapService _ticketForReverseGeocodeDroppedPinCoordinate:floorOrdinal:traits:](self, "_ticketForReverseGeocodeDroppedPinCoordinate:floorOrdinal:traits:", 0, a4, a3.latitude, a3.longitude);
}

- (id)ticketForReverseGeocodeDroppedPinCoordinate:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 traits:(id)a5
{
  uint64_t v5;
  double longitude;
  double latitude;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  objc_msgSend(v9, "numberWithInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapService _ticketForReverseGeocodeDroppedPinCoordinate:floorOrdinal:traits:](self, "_ticketForReverseGeocodeDroppedPinCoordinate:floorOrdinal:traits:", v11, v10, latitude, longitude);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_ticketForReverseGeocodeDroppedPinCoordinate:(CLLocationCoordinate2D)a3 floorOrdinal:(id)a4 traits:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a4;
  v10 = a5;
  if (v9 && (objc_msgSend(v9, "integerValue"), (NSIntegerIsValidFloorOrdinal() & 1) != 0))
  {
    -[MKMapService _ticketForReverseGeocodeCoordinate:floorOrdinal:includeEntryPoints:preserveOriginalLocation:traits:](self, "_ticketForReverseGeocodeCoordinate:floorOrdinal:includeEntryPoints:preserveOriginalLocation:traits:", objc_msgSend(v9, "intValue"), 0, 1, v10, latitude, longitude);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKMapService _ticketForReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:](self, "_ticketForReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:", 0, 1, v10, latitude, longitude);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (id)ticketForMapItemToRefine:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKTicket *v11;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ticketForMapItemToRefine:traits:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v10);
  return v11;
}

- (id)ticketForPlaceRefinementRequestWithCoordinate:(CLLocationCoordinate2D *)a3 addressLine:(id)a4 placeName:(id)a5 traits:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _MKTicket *v15;

  v10 = a5;
  v11 = a4;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForPlaceRefinementRequestWithCoordinate:addressLine:placeName:traits:", a3, v11, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)ticketForCanonicalLocationSearchQueryString:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _MKTicket *v10;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForCanonicalLocationSearchQueryString:traits:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v9);
  return v10;
}

- (id)ticketForMerchantCode:(id)a3 rawMerchantCode:(id)a4 industryCategory:(id)a5 industryCode:(id)a6 paymentNetwork:(id)a7 transactionDate:(id)a8 transactionLocation:(id)a9 traits:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _MKTicket *v27;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ticketForMerchantCode:rawMerchantCode:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:traits:", v23, v22, v21, v20, v19, v18, v17, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v26);
  return v27;
}

- (id)ticketForExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6 traits:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _MKTicket *v19;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ticketForExternalTransitStationCodes:sourceID:transactionDate:transactionLocation:traits:", v15, v14, v13, v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v18);
  return v19;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  return -[MKMapService ticketForSearchQuery:completionItem:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:maxResults:traits:searchSessionData:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  return -[MKMapService ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:", a3, a4, 0, *(_QWORD *)&a5, a6, a7);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7
{
  return -[MKMapService ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:", a3, a4, a5, *(_QWORD *)&a6, a7, 0);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7 searchSessionData:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _MKSearchTicket *v21;

  v9 = *(_QWORD *)&a6;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:", v17, v16, v15, v9, v18, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[_MKSearchTicket initWithSearchTicket:]([_MKSearchTicket alloc], "initWithSearchTicket:", v20);
  return v21;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7
{
  return -[MKMapService ticketForSearchQuery:completionItem:relatedSearchSuggestion:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:relatedSearchSuggestion:maxResults:traits:searchSessionData:", a3, a4, a5, *(_QWORD *)&a6, a7, 0);
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7 searchSessionData:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _MKSearchTicket *v21;

  v9 = *(_QWORD *)&a6;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ticketForSearchQuery:completionItem:relatedSearchSuggestion:retainedSearch:maxResults:traits:searchSessionData:", v17, v16, v15, 0, v9, v18, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[_MKSearchTicket initWithSearchTicket:]([_MKSearchTicket alloc], "initWithSearchTicket:", v20);
  return v21;
}

- (id)ticketForURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _MKSearchTicket *v21;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a5;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "geoMapItemIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "ticketForURLQuery:identifier:resultProviderId:contentProvider:maxResults:traits:", v16, v19, v10, v14, v9, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[_MKSearchTicket initWithSearchTicket:]([_MKSearchTicket alloc], "initWithSearchTicket:", v20);
  return v21;
}

- (id)ticketForSearchPoisForBrandMUID:(unint64_t)a3 traits:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _MKSearchTicket *v8;

  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ticketForSearchPoisForBrandMUID:traits:", a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_MKSearchTicket initWithSearchTicket:]([_MKSearchTicket alloc], "initWithSearchTicket:", v7);
  return v8;
}

- (id)ticketForPlaceLookupWithSearchCategory:(id)a3 parentMuid:(unint64_t)a4 traits:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _MKSearchTicket *v12;

  v8 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ticketForPlaceLookupWithSearchCategory:parentMuid:traits:", v8, a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_MKTicket initWithTicket:]([_MKSearchTicket alloc], "initWithTicket:", v11);
  return v12;
}

- (id)ticketForCategoryListWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  _MKCategoriesTicket *v8;

  v4 = a4;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ticketForCategoryListWithTraits:isFromNoQueryState:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_MKCategoriesTicket initWithTicket:]([_MKCategoriesTicket alloc], "initWithTicket:", v7);
  return v8;
}

- (id)ticketForTransitScheduleAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _MKTicket *v18;

  v9 = a6;
  v14 = a7;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ticketForTransitScheduleAtStation:line:referenceTripID:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v17);
  return v18;
}

- (id)ticketForTransitTripDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _MKTicket *v18;

  v9 = a6;
  v14 = a7;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ticketForTransitTripDetailsAtStation:line:referenceTripID:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v17);
  return v18;
}

- (id)ticketForTransitDeparturesAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 traits:(id)a7
{
  _BOOL8 v7;
  void *v11;
  void *v12;
  void *v13;
  _MKTicket *v14;

  v7 = a6;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ticketForTransitDeparturesAtStation:line:referenceTripID:includeAllDirectionNames:traits:", a3, a4, a5, v7, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v13);
  return v14;
}

- (id)ticketForUpdatedTransitScheduleDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _MKTicket *v18;

  v9 = a6;
  v14 = a7;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ticketForUpdatedTransitScheduleDetailsAtStation:line:referenceTripID:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v17);
  return v18;
}

- (id)ticketForNearbyTransitDeparturesWithLookupOrigin:(id)a3 userLocation:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _MKTicket *v13;

  v8 = a4;
  v9 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ticketForNearbyTransitDeparturesWithLookupOrigin:userLocation:traits:", v9, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v12);
  return v13;
}

- (id)ticketForRelatedPlaceList:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKTicket *v11;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ticketForIdentifiers:traits:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v10);
  return v11;
}

- (id)ticketForCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  return -[MKMapService ticketForCategory:maxResults:traits:searchSessionData:](self, "ticketForCategory:maxResults:traits:searchSessionData:", a3, *(_QWORD *)&a4, a5, 0);
}

- (id)ticketForCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5 searchSessionData:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _MKTicket *v15;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketforCategory:maxResults:traits:searchSessionData:", v11, v7, v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)searchAroundPOITicketWithIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _MKSearchTicket *v16;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "geoMapItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchAroundPOITicketWithIdentifier:categoryID:maxResults:traits:", v13, v10, v7, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_MKTicket initWithTicket:]([_MKSearchTicket alloc], "initWithTicket:", v15);
  return v16;
}

- (id)ticketForSearchAlongRouteWithCategory:(id)a3 searchQuery:(id)a4 completionItem:(id)a5 originalWaypointRouteData:(id)a6 zilchData:(id)a7 sessionState:(id)a8 routeId:(id)a9 routeAttributes:(id)a10 maxResults:(unsigned int)a11 traits:(id)a12 searchSessionData:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _MKTicket *v25;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v34;

  v32 = a13;
  v31 = a10;
  v29 = a9;
  v30 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v28 = a4;
  v22 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = a11;
  objc_msgSend(v23, "ticketForSearchAlongRouteWithCategory:searchQuery:completionItem:originalWaypointRouteData:zilchData:sessionState:routeId:routeAttributes:maxResults:traits:searchSessionData:", v22, v28, v21, v20, v19, v30, v29, v31, v27, v34, v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v24);
  return v25;
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  return -[MKMapService ticketForSearchQuery:filters:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:filters:maxResults:traits:searchSessionData:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _MKTicket *v18;

  v8 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ticketForSearchQuery:filters:maxResults:traits:searchSessionData:", v14, v13, v8, v15, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v17);
  return v18;
}

- (id)ticketForSearchCategory:(id)a3 venueIdentifier:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _MKTicket *v15;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForSearchCategory:venueIdentifier:maxResults:traits:", v11, v10, v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)ticketForSearchFieldPlaceholderWithTraits:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _MKSearchFieldPlaceholderTicket *v6;

  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ticketForSearchFieldPlaceholderWithTraits:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_MKSearchFieldPlaceholderTicket initWithTicket:]([_MKSearchFieldPlaceholderTicket alloc], "initWithTicket:", v5);
  return v6;
}

- (id)ticketForSearchFieldOfflinePlaceholderWithTraits:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _MKSearchFieldOfflinePlaceholderTicket *v6;

  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ticketForSearchCapabilitiesWithTraits:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_MKSearchFieldOfflinePlaceholderTicket initWithTicket:]([_MKSearchFieldOfflinePlaceholderTicket alloc], "initWithTicket:", v5);
  return v6;
}

- (id)_mk_ticketForSearchQuery:(id)a3 completionItem:(id)a4 traits:(id)a5 filters:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t Integer;
  void *v15;
  void *v16;
  _MKSearchTicket *v17;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsAPICall:", 1);
  Integer = GEOConfigGetInteger();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ticketForSearchQuery:filters:completionItem:retainedSearch:maxResults:suppressResultsRequiringAttribution:traits:searchSessionData:", v12, v10, v11, 0, Integer, 1, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[_MKSearchTicket initWithSearchTicket:]([_MKSearchTicket alloc], "initWithSearchTicket:", v16);
  return v17;
}

- (void)_mapItemsForResponseData:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D27218];
    v7 = a3;
    objc_msgSend(v6, "sharedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__MKMapService__mapItemsForResponseData_handler___block_invoke;
    v9[3] = &unk_1E20D8000;
    v10 = v5;
    objc_msgSend(v8, "_geoMapItemsForResponseData:handler:", v7, v9);

  }
}

void __49__MKMapService__mapItemsForResponseData_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (**v3)(_QWORD, _QWORD);

  v3 = *(void (***)(_QWORD, _QWORD))(a1 + 32);
  if (a3)
    v3[2](*(_QWORD *)(a1 + 32), 0);
  else
    _mapItemsForGeoMapItemsWithHandler(a2, v3);
}

- (id)ticketForFeedbackRequestParameters:(id)a3 mapItemForProblemContext:(id)a4 userCredentials:(id)a5 pushToken:(id)a6 allowContactBackAtEmailAddress:(id)a7 traits:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _MKFeedbackReportTicket *v23;

  v13 = (void *)MEMORY[0x1E0D27218];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v13, "sharedService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_geoMapItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "ticketForFeedbackRequestParameters:placeForProblemContext:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:", v19, v21, v17, v16, v15, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[_MKFeedbackReportTicket initWithFeedbackReportTicket:]([_MKFeedbackReportTicket alloc], "initWithFeedbackReportTicket:", v22);
  return v23;
}

- (id)ticketForFeedbackRequest:(id)a3 traits:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _MKFeedbackReportTicket *v10;

  v5 = (void *)MEMORY[0x1E0D27218];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForFeedbackRequest:traits:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKFeedbackReportTicket initWithFeedbackReportTicket:]([_MKFeedbackReportTicket alloc], "initWithFeedbackReportTicket:", v9);
  return v10;
}

- (id)ticketForFeedbackRequestData:(id)a3 traits:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _MKFeedbackReportTicket *v10;

  v5 = (void *)MEMORY[0x1E0D27218];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForFeedbackRequestData:traits:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKFeedbackReportTicket initWithFeedbackReportTicket:]([_MKFeedbackReportTicket alloc], "initWithFeedbackReportTicket:", v9);
  return v10;
}

- (id)ticketForBrandLookupWithIMessageUid:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _MKTicket *v10;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForBrandLookupWithIMessageUid:traits:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v9);
  return v10;
}

- (id)mapItemsForPlacesInDetails:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geoMapItemsForPlacesInDetails:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)ticketForChildPlace:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _MKTicket *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForIdentifiers:traits:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v11);
  return v12;
}

- (id)ticketForTransitLines:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKTransitLineTicket *v11;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ticketForTransitLines:withTraits:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_MKTransitLineTicket initWithTicket:]([_MKTransitLineTicket alloc], "initWithTicket:", v10);
  return v11;
}

- (id)ticketForNearestTransitStation:(id)a3 coordinate:(CLLocationCoordinate2D)a4 traits:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _MKTicket *v14;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geoMapItemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "ticketForNearestTransitStation:coordinate:traits:", v12, v10, latitude, longitude);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[_MKTicket initWithTicket:]([_MKTicket alloc], "initWithTicket:", v13);
  return v14;
}

- (id)ticketForSearchHomeWithTraits:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _MKSearchHomeTicket *v6;

  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ticketForSearchHomeWithTraits:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_MKSearchHomeTicket initWithTicket:]([_MKSearchHomeTicket alloc], "initWithTicket:", v5);
  return v6;
}

- (id)ticketForPublisherViewPublisherIdentifier:(id)a3 keywordFilter:(id)a4 addressFilter:(id)a5 batchSize:(unsigned int)a6 withTraits:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _MKPublisherViewTicket *v19;

  v8 = *(_QWORD *)&a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "geoMapItemIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "ticketForPublisherViewPublisherIdentifier:keywordFilter:addressFilter:batchSize:withTraits:", v17, v13, v12, v8, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[_MKPublisherViewTicket initWithTicket:]([_MKPublisherViewTicket alloc], "initWithTicket:", v18);
  return v19;
}

- (id)ticketForGuideHomeWithFilter:(id)a3 guideLocation:(id)a4 withTraits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _MKGuideHomeViewTicket *v13;

  v8 = a4;
  v9 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ticketForGuideHomeWithFilter:guideLocation:withTraits:", v9, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_MKGuideHomeViewTicket initWithTicket:]([_MKGuideHomeViewTicket alloc], "initWithTicket:", v12);
  return v13;
}

- (id)ticketForCuratedCollections:(id)a3 isBatchLookup:(BOOL)a4 overrideSuppress:(BOOL)a5 traits:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _MKCuratedCollectionTicket *v15;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ticketForCuratedCollections:isBatchLookup:overrideSuppress:traits:", v13, v8, v7, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKCuratedCollectionTicket initWithTicket:]([_MKCuratedCollectionTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)ticketForCuratedCollections:(id)a3 isBatchLookup:(BOOL)a4 traits:(id)a5
{
  return -[MKMapService ticketForCuratedCollections:isBatchLookup:overrideSuppress:traits:](self, "ticketForCuratedCollections:isBatchLookup:overrideSuppress:traits:", a3, a4, 0, a5);
}

- (id)ticketForCuratedCollectionItems:(id)a3 collection:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _MKCuratedCollectionItemsTicket *v15;

  v8 = a4;
  v9 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "geoMapItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "ticketForCuratedCollectionItems:collection:traits:", v12, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKCuratedCollectionItemsTicket initWithTicket:]([_MKCuratedCollectionItemsTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)ticketForAllCollectionViewWithBatchSize:(unsigned int)a3 keywordFilter:(id)a4 addressFilter:(id)a5 withTraits:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _MKAllCollectionsViewTicket *v15;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a4;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForAllCollectionViewWithBatchSize:keywordFilter:addressFilter:withTraits:", v8, v11, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKAllCollectionsViewTicket initWithTicket:]([_MKAllCollectionsViewTicket alloc], "initWithTicket:", v14);
  return v15;
}

- (id)ticketForCitySelectorViewWithTraits:(id)a3 batchSize:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _MKCitySelectorViewTicket *v8;

  v4 = *(_QWORD *)&a4;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ticketForCitySelectorViewWithTraits:batchSize:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_MKCitySelectorViewTicket initWithTicket:]([_MKCitySelectorViewTicket alloc], "initWithTicket:", v7);
  return v8;
}

- (id)ticketForPlaceEnrichmentWithEnrichmentInfo:(id)a3 mapsIdentifier:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _MKPlaceEnrichmentTicket *v14;

  v8 = a4;
  v9 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geoMapItemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "ticketForPlaceEnrichmentWithEnrichmentInfo:mapsIdentifier:traits:", v9, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[_MKPlaceEnrichmentTicket initWithTicket:]([_MKPlaceEnrichmentTicket alloc], "initWithTicket:", v13);
  return v14;
}

- (id)ticketForRefreshingEVChargersWithIdentifiers:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKPlaceEVChargerTicket *v11;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ticketForRefreshingEVChargersWithIdentifiers:traits:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_MKPlaceEVChargerTicket initWithTicket:]([_MKPlaceEVChargerTicket alloc], "initWithTicket:", v10);
  return v11;
}

- (id)ticketForSpatialPlaceLookupWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4 pointOfInterestFilter:(id)a5 maxResultCount:(int64_t)a6
{
  double longitude;
  double latitude;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _MKSpatialPlaceLookupTicket *v15;
  void *v16;
  void *v17;
  void *v18;
  _MKSpatialPlaceLookupTicket *v19;
  _QWORD v21[2];

  longitude = a3.longitude;
  latitude = a3.latitude;
  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0D27570];
  v11 = a5;
  v12 = [v10 alloc];
  objc_msgSend(v11, "_geoPOICategoryFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithCoordinate:radius:poiCategoryFilter:maxResultCount:", v13, a6, latitude, longitude, a4);
  v15 = [_MKSpatialPlaceLookupTicket alloc];
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ticketForSpatialPlaceLookupParameters:traits:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_MKSpatialPlaceLookupTicket initWithTicket:](v15, "initWithTicket:", v18);

  return v19;
}

- (id)ticketForSpatialPlaceLookupWithMapRegion:(id)a3 pointOfInterestFilter:(id)a4 maxResultCount:(int64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _MKSpatialPlaceLookupTicket *v13;
  void *v14;
  void *v15;
  void *v16;
  _MKSpatialPlaceLookupTicket *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D27570];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  objc_msgSend(v8, "_geoPOICategoryFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithMapRegion:poiCategoryFilter:maxResultCount:", v9, v11, a5);
  v13 = [_MKSpatialPlaceLookupTicket alloc];
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ticketForSpatialPlaceLookupParameters:traits:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_MKSpatialPlaceLookupTicket initWithTicket:](v13, "initWithTicket:", v16);

  return v17;
}

- (id)ticketForHikingIntroTip:(id)a3 traits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKPlaceHikingIntroTipTicket *v11;

  v6 = a3;
  -[MKMapService defaultTraitsWithTraits:](self, "defaultTraitsWithTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoMapItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ticketForHikingIntroTipWithMapItemIdentifier:traits:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_MKPlaceHikingIntroTipTicket initWithTicket:]([_MKPlaceHikingIntroTipTicket alloc], "initWithTicket:", v10);
  return v11;
}

- (int)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int)a3
{
  self->_deviceOrientation = a3;
}

- (void)siriAnalyticsDonation:(int)a3 target:(int)a4 resultIndex:(int)a5 mapItem:(id)a6 searchCategory:(id)a7 searchQueryString:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  MKSiriInteraction *v16;

  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = -[MKSiriInteraction initWithGEOUIAction:target:mapItem:resultIndex:searchCategory:searchQueryString:]([MKSiriInteraction alloc], "initWithGEOUIAction:target:mapItem:resultIndex:searchCategory:searchQueryString:", v12, v11, v15, v10, v14, v13);

  -[MKSiriInteraction donateIfWanted](v16, "donateIfWanted");
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v6, v5, 0xFFFFFFFFLL, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", v6, v5, v8);

}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 queryString:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0xFFFFFFFFLL, 0, 0, a5);
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", v6, v5, 0);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapRegion:(id)a6 zoomLevel:(double)a7 mapType:(int)a8
{
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:mapRegion:zoomLevel:mapType:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, *(_QWORD *)&a8, a7);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 routeDetails:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a5;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v8, v7, objc_msgSend(v10, "resultIndex"), 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:routeDetails:", v8, v7, v11, v10);

}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v13 = a6;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v11, v10, v8, v13, 0, 0);
  v14 = (void *)MEMORY[0x1E0D27338];
  objc_msgSend(v13, "_geoMapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "actionDetailsWithMapItem:timestamp:resultIndex:", v15, v8, a7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:placeActionDetails:", v11, 0, 0, v16);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8 mapRegion:(id)a9 zoomLevel:(double)a10 mapType:(int)a11
{
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v12 = *(_QWORD *)&a8;
  v15 = *(_QWORD *)&a4;
  v16 = *(_QWORD *)&a3;
  v18 = a9;
  v19 = a6;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v16, v15, v12, v19, 0, 0);
  v20 = (void *)MEMORY[0x1E0D27338];
  objc_msgSend(v19, "_geoMapItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "actionDetailsWithMapItem:timestamp:resultIndex:", v21, v12, a7);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:placeActionDetails:mapRegion:zoomLevel:mapType:", v16, v15, 0, v22, v18, a11, a10);
}

- (void)captureUserAction:(int)a3 flyoverAnimationID:(unint64_t)a4
{
  uint64_t v4;

  LODWORD(v4) = 0;
  objc_msgSend(MEMORY[0x1E0D263E8], "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", *(_QWORD *)&a3, 0, 0, 0, 0xFFFFFFFFLL, 0, 0.0, 0, a4, 0, 0, v4, 0, 0, 0, 0);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 placeActionDetails:(id)a5 mapItem:(id)a6 resultIndex:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v10, v9, v7, a6, 0, 0);
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:placeActionDetails:", v10, v9, 0, v12);

}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 placeActionDetails:(id)a6
{
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:placeActionDetails:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6);
}

- (void)capturePlaceCardUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8 targetID:(unint64_t)a9 providerID:(id)a10 animationID:(unint64_t)a11 actionURL:(id)a12 photoID:(id)a13 placeCardType:(int)a14 localizedMapItemCategory:(id)a15 availableActions:(id)a16 unactionableUIElements:(id)a17
{
  uint64_t v17;

  LODWORD(v17) = a14;
  -[MKMapService capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:](self, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, *(_QWORD *)&a8, a9, a7, a10, a11, a12, a13, v17, a15, a16, a17,
    0,
    MEMORY[0x1E0C9AA60],
    0);
}

- (void)capturePlaceCardUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8 targetID:(unint64_t)a9 providerID:(id)a10 animationID:(unint64_t)a11 actionURL:(id)a12 photoID:(id)a13 placeCardType:(int)a14 localizedMapItemCategory:(id)a15 availableActions:(id)a16 unactionableUIElements:(id)a17 modules:(id)a18 commingledPhotoProviderIDs:(id)a19 actionRichProviderId:(id)a20
{
  uint64_t v20;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v32;
  id v33;
  id v35;
  void *v39;
  id v40;
  id v41;

  v20 = *(_QWORD *)&a8;
  v35 = a20;
  v33 = a19;
  v30 = a18;
  v29 = a17;
  v23 = a16;
  v28 = a15;
  v27 = a13;
  v41 = a12;
  v40 = a10;
  v24 = a6;
  v26 = a5;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", a3, a4, v20, v24, 0, 0);
  v32 = (void *)MEMORY[0x1E0D263E8];
  objc_msgSend(v24, "_geoMapItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v25) = a14;
  objc_msgSend(v32, "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledRichProviderIds:actionRichProviderId:", a3, a4, v26, v39, v20, a9, a7, v40, a11, v41, v27, v25, v28, v23, v29,
    v30,
    v33,
    v35);

}

- (void)captureTransitPlaceCardUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8 targetID:(unint64_t)a9 providerID:(id)a10 animationID:(unint64_t)a11 transitCardCategory:(int)a12 transitSystem:(id)a13 transitDepartureSequence:(id)a14 transitIncident:(id)a15
{
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v31;

  v18 = *(_QWORD *)&a4;
  v19 = *(_QWORD *)&a3;
  v21 = a15;
  v22 = a14;
  v23 = a13;
  v24 = a10;
  v25 = a6;
  v26 = a5;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v19, v18, a8, v25, 0, 0);
  v27 = (void *)MEMORY[0x1E0D263E8];
  objc_msgSend(v25, "_geoMapItem");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v28) = a12;
  objc_msgSend(v27, "captureTransitPlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", v19, v18, v26, v31, a8, a9, a7, v24, a11, v28, v23, v22, v21);

}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 categoriesDisplayed:(id)a6 categorySelected:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v10, v9, 0xFFFFFFFFLL, 0, v12, 0);
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:categoriesDisplayed:categorySelected:", v10, v9, v14, v13, v12);

}

- (void)capturePlaceCardUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 placeCardType:(int)a8 categoriesDisplayed:(id)a9 categorySelected:(id)a10
{
  uint64_t v11;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;

  v11 = *(_QWORD *)&a8;
  v15 = *(_QWORD *)&a4;
  v16 = *(_QWORD *)&a3;
  v18 = a10;
  v19 = a9;
  v20 = a6;
  v21 = a5;
  -[MKMapService siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:](self, "siriAnalyticsDonation:target:resultIndex:mapItem:searchCategory:searchQueryString:", v16, v15, 0xFFFFFFFFLL, v20, v18, 0);
  v22 = (void *)MEMORY[0x1E0D263E8];
  objc_msgSend(v20, "_geoMapItem");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "capturePlaceCardUserAction:target:value:mapItem:timestamp:placeCardType:categoriesDisplayed:categorySelected:", v16, v15, v21, v23, v11, v19, a7, v18);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 transitStep:(id)a6
{
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:transitStep:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6);
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 withAnalyticsMessageValues:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", v6, v5, v7);

  }
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 forAdvisory:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  objc_msgSend(a5, "analyticsMessageValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapService _captureUserAction:onTarget:withAnalyticsMessageValues:](self, "_captureUserAction:onTarget:withAnalyticsMessageValues:", v6, v5, v8);

}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 forAdvisoryItem:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  objc_msgSend(a5, "analyticsMessageValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapService _captureUserAction:onTarget:withAnalyticsMessageValues:](self, "_captureUserAction:onTarget:withAnalyticsMessageValues:", v6, v5, v8);

}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 forAdvisoryItems:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "analyticsMessageValues", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "analyticsMessageValues");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  -[MKMapService _captureUserAction:onTarget:withAnalyticsMessageValues:](self, "_captureUserAction:onTarget:withAnalyticsMessageValues:", v6, v5, v9);
}

- (id)feedbackTicketForWalletRAPReport:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _MKFeedbackReportTicket *v8;

  v3 = (void *)MEMORY[0x1E0D27218];
  v4 = a3;
  objc_msgSend(v3, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ticketForFeedbackRequestParameters:placeForProblemContext:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:", v6, 0, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_MKFeedbackReportTicket initWithFeedbackReportTicket:]([_MKFeedbackReportTicket alloc], "initWithFeedbackReportTicket:", v7);
  return v8;
}

- (id)feedbackTicketForFitnessRAPReport:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _MKFeedbackReportTicket *v8;

  v3 = (void *)MEMORY[0x1E0D27218];
  v4 = a3;
  objc_msgSend(v3, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ticketForFeedbackRequestParameters:placeForProblemContext:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:", v6, 0, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_MKFeedbackReportTicket initWithFeedbackReportTicket:]([_MKFeedbackReportTicket alloc], "initWithFeedbackReportTicket:", v7);
  return v8;
}

- (id)ticketForWalletMerchantLookupRequest:(id)a3 traits:(id)a4
{
  id v5;
  id v6;
  _mkMapServiceWalletMerchantTicket *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_mkMapServiceWalletMerchantTicket initWithRequest:traits:]([_mkMapServiceWalletMerchantTicket alloc], "initWithRequest:traits:", v6, v5);

  return v7;
}

- (id)stylingForWalletCategory:(id)a3
{
  void *v3;
  MKWalletMerchantStylingInfo *v4;

  objc_msgSend(MEMORY[0x1E0D27700], "styleAttributesForWalletCategory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[MKWalletMerchantStylingInfo initWithStyleAttributes:]([MKWalletMerchantStylingInfo alloc], "initWithStyleAttributes:", v3);
  else
    v4 = 0;

  return v4;
}

@end
