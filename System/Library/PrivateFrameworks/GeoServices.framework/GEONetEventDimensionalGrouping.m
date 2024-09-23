@implementation GEONetEventDimensionalGrouping

- (GEONetEventDimensionalGrouping)init
{
  GEONetEventDimensionalGrouping *v2;
  GEONetEventDimensionalGrouping *v3;
  GEONetEventDimensionalGrouping *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONetEventDimensionalGrouping;
  v2 = -[GEONetEventDimensionalGrouping init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONetEventDimensionalGrouping)initWithData:(id)a3
{
  GEONetEventDimensionalGrouping *v3;
  GEONetEventDimensionalGrouping *v4;
  GEONetEventDimensionalGrouping *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEONetEventDimensionalGrouping;
  v3 = -[GEONetEventDimensionalGrouping initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)year
{
  return self->_year;
}

- (void)setYear:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800400u;
  self->_year = a3;
}

- (void)setHasYear:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8389632;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasYear
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)month
{
  return self->_month;
}

- (void)setMonth:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800020u;
  self->_month = a3;
}

- (void)setHasMonth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388640;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasMonth
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (unsigned)day
{
  return self->_day;
}

- (void)setDay:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800008u;
  self->_day = a3;
}

- (void)setHasDay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388616;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDay
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)usedCellular
{
  return self->_usedCellular;
}

- (void)setUsedCellular:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x802000u;
  self->_usedCellular = a3;
}

- (void)setHasUsedCellular:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8396800;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasUsedCellular
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasAppId
{
  -[GEONetEventDimensionalGrouping _readAppId]((uint64_t)self);
  return self->_appId != 0;
}

- (NSString)appId
{
  -[GEONetEventDimensionalGrouping _readAppId]((uint64_t)self);
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x804000u;
  objc_storeStrong((id *)&self->_appId, a3);
}

- (void)_readRequestingAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 158) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestingAppId_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestingAppId
{
  -[GEONetEventDimensionalGrouping _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEONetEventDimensionalGrouping _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x880000u;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (void)_readCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCountryCode
{
  -[GEONetEventDimensionalGrouping _readCountryCode]((uint64_t)self);
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEONetEventDimensionalGrouping _readCountryCode]((uint64_t)self);
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x808000u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (int)networkService
{
  os_unfair_lock_s *p_readerLock;
  $4318C9330A95675F510920386E4F36BC flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_networkService;
  else
    return 0;
}

- (void)setNetworkService:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800040u;
  self->_networkService = a3;
}

- (void)setHasNetworkService:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388672;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasNetworkService
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)networkServiceAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x1D && ((0x1FFF7FFFu >> a3) & 1) != 0)
  {
    v3 = off_1E1C23298[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsNetworkService:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_SERVICE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REVERSE_GEOCODER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORWARD_GEOCODER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_ETA")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIMPLE_ETA")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTIONS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_REVGEO")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MATCH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_INIT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_UPDATE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_DATA")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_LOADER")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_MESSAGE_USAGE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_SHIFT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AB_ASSIGN")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANIFEST")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYNC")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_QUALITY")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_DEFAULTS")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUNIN_RESOURCE")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JUNCTION_VIEW")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_TILE")) & 1) != 0)
  {
    v4 = 27;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT")))
  {
    v4 = 28;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)placeType
{
  os_unfair_lock_s *p_readerLock;
  $4318C9330A95675F510920386E4F36BC flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x80) != 0)
    return self->_placeType;
  else
    return 0;
}

- (void)setPlaceType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800080u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388736;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFF7FFF7F | v3);
}

- (BOOL)hasPlaceType
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)placeTypeAsString:(int)a3
{
  if (a3 < 0x3F)
    return off_1E1C23380[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
  {
    v4 = 61;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
  {
    v4 = 62;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)tileSetId
{
  return self->_tileSetId;
}

- (void)setTileSetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800100u;
  self->_tileSetId = a3;
}

- (void)setHasTileSetId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388864;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasTileSetId
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unsigned)dataSetId
{
  return self->_dataSetId;
}

- (void)setDataSetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800004u;
  self->_dataSetId = a3;
}

- (void)setHasDataSetId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388612;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataSetId
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)tileSetStyle
{
  os_unfair_lock_s *p_readerLock;
  $4318C9330A95675F510920386E4F36BC flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0)
    return self->_tileSetStyle;
  else
    return 0;
}

- (void)setTileSetStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800200u;
  self->_tileSetStyle = a3;
}

- (void)setHasTileSetStyle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8389120;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasTileSetStyle
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)tileSetStyleAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("RASTER_STANDARD");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("VECTOR_STANDARD");
      return v3;
    case 2:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
    case 3:
      return CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
    case 4:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
    case 5:
      return CFSTR("RASTER_STANDARD_BACKGROUND");
    case 6:
      return CFSTR("RASTER_HYBRID");
    case 7:
      return CFSTR("RASTER_SATELLITE");
    case 8:
      return CFSTR("RASTER_TERRAIN");
    case 11:
      return CFSTR("VECTOR_BUILDINGS");
    case 12:
      return CFSTR("VECTOR_TRAFFIC");
    case 13:
      return CFSTR("VECTOR_POI");
    case 14:
      return CFSTR("SPUTNIK_METADATA");
    case 15:
      return CFSTR("SPUTNIK_C3M");
    case 16:
      return CFSTR("SPUTNIK_DSM");
    case 17:
      return CFSTR("SPUTNIK_DSM_GLOBAL");
    case 18:
      return CFSTR("VECTOR_REALISTIC");
    case 19:
      return CFSTR("VECTOR_LEGACY_REALISTIC");
    case 20:
      return CFSTR("VECTOR_ROADS");
    case 21:
      return CFSTR("RASTER_VEGETATION");
    case 22:
      return CFSTR("VECTOR_TRAFFIC_SKELETON");
    case 23:
      return CFSTR("RASTER_COASTLINE_MASK");
    case 24:
      return CFSTR("RASTER_HILLSHADE");
    case 25:
      return CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
    case 26:
      return CFSTR("VECTOR_TRAFFIC_STATIC");
    case 27:
      return CFSTR("RASTER_COASTLINE_DROP_MASK");
    case 28:
      return CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
    case 29:
      return CFSTR("VECTOR_SPEED_PROFILES");
    case 30:
      return CFSTR("VECTOR_VENUES");
    case 31:
      return CFSTR("RASTER_DOWN_SAMPLED");
    case 32:
      return CFSTR("RASTER_COLOR_BALANCED");
    case 33:
      return CFSTR("RASTER_SATELLITE_NIGHT");
    case 34:
      return CFSTR("SPUTNIK_VECTOR_BORDER");
    case 35:
      return CFSTR("RASTER_SATELLITE_DIGITIZE");
    case 36:
      return CFSTR("RASTER_HILLSHADE_PARKS");
    case 37:
      return CFSTR("VECTOR_TRANSIT");
    case 38:
      return CFSTR("RASTER_STANDARD_BASE");
    case 39:
      return CFSTR("RASTER_STANDARD_LABELS");
    case 40:
      return CFSTR("RASTER_HYBRID_ROADS");
    case 41:
      return CFSTR("RASTER_HYBRID_LABELS");
    case 42:
      return CFSTR("FLYOVER_C3M_MESH");
    case 43:
      return CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
    case 44:
      return CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
    case 45:
      return CFSTR("RASTER_SATELLITE_ASTC");
    case 46:
      return CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
    case 47:
      return CFSTR("VECTOR_TRANSIT_SELECTION");
    case 48:
      return CFSTR("VECTOR_COVERAGE");
    case 52:
      return CFSTR("FLYOVER_METADATA");
    case 53:
      return CFSTR("VECTOR_ROAD_NETWORK");
    case 54:
      return CFSTR("VECTOR_LAND_COVER");
    case 55:
      return CFSTR("VECTOR_DEBUG");
    case 56:
      return CFSTR("VECTOR_STREET_POI");
    case 57:
      return CFSTR("MUNIN_METADATA");
    case 58:
      return CFSTR("VECTOR_SPR_MERCATOR");
    case 59:
      return CFSTR("VECTOR_SPR_MODELS");
    case 60:
      return CFSTR("VECTOR_SPR_MATERIALS");
    case 61:
      return CFSTR("VECTOR_SPR_METADATA");
    case 62:
      return CFSTR("VECTOR_TRACKS");
    case 63:
      return CFSTR("VECTOR_RESERVED_2");
    case 64:
      return CFSTR("VECTOR_STREET_LANDMARKS");
    case 65:
      return CFSTR("COARSE_LOCATION_POLYGONS");
    case 66:
      return CFSTR("VECTOR_SPR_ROADS");
    case 67:
      return CFSTR("VECTOR_SPR_STANDARD");
    case 68:
      return CFSTR("VECTOR_POI_V2");
    case 69:
      return CFSTR("VECTOR_POLYGON_SELECTION");
    case 70:
      return CFSTR("VL_METADATA");
    case 71:
      return CFSTR("VL_DATA");
    case 72:
      return CFSTR("PROACTIVE_APP_CLIP");
    case 73:
      return CFSTR("VECTOR_BUILDINGS_V2");
    case 74:
      return CFSTR("POI_BUSYNESS");
    case 75:
      return CFSTR("POI_DP_BUSYNESS");
    case 76:
      return CFSTR("SMART_INTERFACE_SELECTION");
    case 77:
      return CFSTR("VECTOR_ASSETS");
    case 78:
      return CFSTR("SPR_ASSET_METADATA");
    case 79:
      return CFSTR("VECTOR_SPR_POLAR");
    case 80:
      return CFSTR("SMART_DATA_MODE");
    case 81:
      return CFSTR("CELLULAR_PERFORMANCE_SCORE");
    case 82:
      return CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
    case 83:
      return CFSTR("VECTOR_TOPOGRAPHIC");
    case 84:
      return CFSTR("VECTOR_POI_V2_UPDATE");
    case 85:
      return CFSTR("VECTOR_LIVE_DATA_UPDATES");
    case 86:
      return CFSTR("VECTOR_TRAFFIC_V2");
    case 87:
      return CFSTR("VECTOR_ROAD_SELECTION");
    case 88:
      return CFSTR("VECTOR_REGION_METADATA");
    case 89:
      return CFSTR("RAY_TRACING");
    case 90:
      return CFSTR("VECTOR_CONTOURS");
    case 91:
      return CFSTR("RASTER_SATELLITE_POLAR");
    case 92:
      return CFSTR("VMAP4_ELEVATION");
    case 93:
      return CFSTR("VMAP4_ELEVATION_POLAR");
    case 94:
      return CFSTR("CELLULAR_COVERAGE_PLMN");
    case 95:
      return CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
    case 96:
      return CFSTR("UNUSED_96");
    case 97:
      return CFSTR("UNUSED_97");
    case 98:
      return CFSTR("UNUSED_98");
    case 99:
      return CFSTR("UNUSED_99");
    case 100:
      return CFSTR("UNUSED_100");
    case 101:
      return CFSTR("UNUSED_101");
    case 102:
      return CFSTR("UNUSED_102");
    case 103:
      return CFSTR("UNUSED_103");
    case 104:
      return CFSTR("UNUSED_104");
    case 105:
      return CFSTR("UNUSED_105");
    case 106:
      return CFSTR("UNUSED_106");
    case 107:
      return CFSTR("UNUSED_107");
    case 108:
      return CFSTR("UNUSED_108");
    case 109:
      return CFSTR("UNUSED_109");
    case 110:
      return CFSTR("UNUSED_110");
    case 111:
      return CFSTR("UNUSED_111");
    case 112:
      return CFSTR("UNUSED_112");
    case 113:
      return CFSTR("UNUSED_113");
    case 114:
      return CFSTR("UNUSED_114");
    case 115:
      return CFSTR("UNUSED_115");
    case 116:
      return CFSTR("UNUSED_116");
    case 117:
      return CFSTR("UNUSED_117");
    case 118:
      return CFSTR("UNUSED_118");
    case 119:
      return CFSTR("UNUSED_119");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsTileSetStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
  {
    v4 = 92;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
  {
    v4 = 93;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
  {
    v4 = 94;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
  {
    v4 = 112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
  {
    v4 = 113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
  {
    v4 = 114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
  {
    v4 = 115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
  {
    v4 = 116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
  {
    v4 = 117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
  {
    v4 = 118;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_119")))
  {
    v4 = 119;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSvcIp
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 158) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSvcIp_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasSvcIp
{
  -[GEONetEventDimensionalGrouping _readSvcIp]((uint64_t)self);
  return self->_svcIp != 0;
}

- (NSString)svcIp
{
  -[GEONetEventDimensionalGrouping _readSvcIp]((uint64_t)self);
  return self->_svcIp;
}

- (void)setSvcIp:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA00000u;
  objc_storeStrong((id *)&self->_svcIp, a3);
}

- (void)_readErrorDomain
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readErrorDomain_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasErrorDomain
{
  -[GEONetEventDimensionalGrouping _readErrorDomain]((uint64_t)self);
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  -[GEONetEventDimensionalGrouping _readErrorDomain]((uint64_t)self);
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x810000u;
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x800001u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x800000);
}

- (BOOL)hasErrorCode
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readManifestEnv
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManifestEnv_tags_8493);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasManifestEnv
{
  -[GEONetEventDimensionalGrouping _readManifestEnv]((uint64_t)self);
  return self->_manifestEnv != 0;
}

- (NSString)manifestEnv
{
  -[GEONetEventDimensionalGrouping _readManifestEnv]((uint64_t)self);
  return self->_manifestEnv;
}

- (void)setManifestEnv:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x840000u;
  objc_storeStrong((id *)&self->_manifestEnv, a3);
}

- (unsigned)httpResponseCode
{
  return self->_httpResponseCode;
}

- (void)setHttpResponseCode:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800010u;
  self->_httpResponseCode = a3;
}

- (void)setHasHttpResponseCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388624;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasHttpResponseCode
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x801000u;
  self->_reusedConnection = a3;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8392704;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasReusedConnection
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800800u;
  self->_isBackground = a3;
}

- (void)setHasIsBackground:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8390656;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsBackground
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readLatencyStats
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatencyStats_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasLatencyStats
{
  -[GEONetEventDimensionalGrouping _readLatencyStats]((uint64_t)self);
  return self->_latencyStats != 0;
}

- (GEONetEventAggregateStats)latencyStats
{
  -[GEONetEventDimensionalGrouping _readLatencyStats]((uint64_t)self);
  return self->_latencyStats;
}

- (void)setLatencyStats:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x820000u;
  objc_storeStrong((id *)&self->_latencyStats, a3);
}

- (void)_readTxBytesStats
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 158) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTxBytesStats_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasTxBytesStats
{
  -[GEONetEventDimensionalGrouping _readTxBytesStats]((uint64_t)self);
  return self->_txBytesStats != 0;
}

- (GEONetEventAggregateStats)txBytesStats
{
  -[GEONetEventDimensionalGrouping _readTxBytesStats]((uint64_t)self);
  return self->_txBytesStats;
}

- (void)setTxBytesStats:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC00000u;
  objc_storeStrong((id *)&self->_txBytesStats, a3);
}

- (void)_readRxBytesStats
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 158) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRxBytesStats_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRxBytesStats
{
  -[GEONetEventDimensionalGrouping _readRxBytesStats]((uint64_t)self);
  return self->_rxBytesStats != 0;
}

- (GEONetEventAggregateStats)rxBytesStats
{
  -[GEONetEventDimensionalGrouping _readRxBytesStats]((uint64_t)self);
  return self->_rxBytesStats;
}

- (void)setRxBytesStats:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x900000u;
  objc_storeStrong((id *)&self->_rxBytesStats, a3);
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x800002u;
  self->_eventCount = a3;
}

- (void)setHasEventCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388610;
  else
    v3 = 0x800000;
  self->_flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasEventCount
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEONetEventDimensionalGrouping;
  -[GEONetEventDimensionalGrouping description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONetEventDimensionalGrouping dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetEventDimensionalGrouping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  int v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  id v59;
  void *v60;
  const __CFString *v61;
  id v62;

  if (!a1)
  {
    v62 = 0;
    return v62;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 156);
  if ((v5 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("year"));

    v5 = *(_DWORD *)(a1 + 156);
  }
  if ((v5 & 0x20) == 0)
  {
    if ((v5 & 8) == 0)
      goto LABEL_6;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 120));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("day"));

    if ((*(_DWORD *)(a1 + 156) & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("month"));

  v5 = *(_DWORD *)(a1 + 156);
  if ((v5 & 8) != 0)
    goto LABEL_33;
LABEL_6:
  if ((v5 & 0x2000) == 0)
    goto LABEL_11;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 154));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v8 = CFSTR("usedCellular");
  else
    v8 = CFSTR("used_cellular");
  objc_msgSend(v4, "setObject:forKey:", v7, v8);

LABEL_11:
  objc_msgSend((id)a1, "appId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("appId");
    else
      v10 = CFSTR("app_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend((id)a1, "requestingAppId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("requestingAppId");
    else
      v12 = CFSTR("requesting_app_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  objc_msgSend((id)a1, "countryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("countryCode");
    else
      v14 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  v15 = *(_DWORD *)(a1 + 156);
  if ((v15 & 0x40) != 0)
  {
    v18 = *(int *)(a1 + 132);
    if (v18 < 0x1D && ((0x1FFF7FFFu >> v18) & 1) != 0)
    {
      v19 = off_1E1C23298[v18];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v20 = CFSTR("networkService");
    else
      v20 = CFSTR("network_service");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    v15 = *(_DWORD *)(a1 + 156);
    if ((v15 & 0x80) == 0)
    {
LABEL_28:
      if ((v15 & 0x100) == 0)
        goto LABEL_29;
      goto LABEL_50;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_28;
  }
  v21 = *(int *)(a1 + 136);
  if (v21 >= 0x3F)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 136));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E1C23380[v21];
  }
  if (a2)
    v23 = CFSTR("placeType");
  else
    v23 = CFSTR("place_type");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v15 = *(_DWORD *)(a1 + 156);
  if ((v15 & 0x100) == 0)
  {
LABEL_29:
    if ((v15 & 4) == 0)
      goto LABEL_30;
LABEL_54:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 116));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("dataSetId");
    else
      v27 = CFSTR("data_set_id");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    if ((*(_DWORD *)(a1 + 156) & 0x200) == 0)
      goto LABEL_178;
    goto LABEL_58;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("tileSetId");
  else
    v25 = CFSTR("tile_set_id");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v15 = *(_DWORD *)(a1 + 156);
  if ((v15 & 4) != 0)
    goto LABEL_54;
LABEL_30:
  if ((v15 & 0x200) == 0)
    goto LABEL_178;
LABEL_58:
  v28 = CFSTR("RASTER_STANDARD");
  switch(*(_DWORD *)(a1 + 144))
  {
    case 0:
      break;
    case 1:
      v28 = CFSTR("VECTOR_STANDARD");
      break;
    case 2:
      v28 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
      break;
    case 3:
      v28 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
      break;
    case 4:
      v28 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
      break;
    case 5:
      v28 = CFSTR("RASTER_STANDARD_BACKGROUND");
      break;
    case 6:
      v28 = CFSTR("RASTER_HYBRID");
      break;
    case 7:
      v28 = CFSTR("RASTER_SATELLITE");
      break;
    case 8:
      v28 = CFSTR("RASTER_TERRAIN");
      break;
    case 0xB:
      v28 = CFSTR("VECTOR_BUILDINGS");
      break;
    case 0xC:
      v28 = CFSTR("VECTOR_TRAFFIC");
      break;
    case 0xD:
      v28 = CFSTR("VECTOR_POI");
      break;
    case 0xE:
      v28 = CFSTR("SPUTNIK_METADATA");
      break;
    case 0xF:
      v28 = CFSTR("SPUTNIK_C3M");
      break;
    case 0x10:
      v28 = CFSTR("SPUTNIK_DSM");
      break;
    case 0x11:
      v28 = CFSTR("SPUTNIK_DSM_GLOBAL");
      break;
    case 0x12:
      v28 = CFSTR("VECTOR_REALISTIC");
      break;
    case 0x13:
      v28 = CFSTR("VECTOR_LEGACY_REALISTIC");
      break;
    case 0x14:
      v28 = CFSTR("VECTOR_ROADS");
      break;
    case 0x15:
      v28 = CFSTR("RASTER_VEGETATION");
      break;
    case 0x16:
      v28 = CFSTR("VECTOR_TRAFFIC_SKELETON");
      break;
    case 0x17:
      v28 = CFSTR("RASTER_COASTLINE_MASK");
      break;
    case 0x18:
      v28 = CFSTR("RASTER_HILLSHADE");
      break;
    case 0x19:
      v28 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
      break;
    case 0x1A:
      v28 = CFSTR("VECTOR_TRAFFIC_STATIC");
      break;
    case 0x1B:
      v28 = CFSTR("RASTER_COASTLINE_DROP_MASK");
      break;
    case 0x1C:
      v28 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
      break;
    case 0x1D:
      v28 = CFSTR("VECTOR_SPEED_PROFILES");
      break;
    case 0x1E:
      v28 = CFSTR("VECTOR_VENUES");
      break;
    case 0x1F:
      v28 = CFSTR("RASTER_DOWN_SAMPLED");
      break;
    case 0x20:
      v28 = CFSTR("RASTER_COLOR_BALANCED");
      break;
    case 0x21:
      v28 = CFSTR("RASTER_SATELLITE_NIGHT");
      break;
    case 0x22:
      v28 = CFSTR("SPUTNIK_VECTOR_BORDER");
      break;
    case 0x23:
      v28 = CFSTR("RASTER_SATELLITE_DIGITIZE");
      break;
    case 0x24:
      v28 = CFSTR("RASTER_HILLSHADE_PARKS");
      break;
    case 0x25:
      v28 = CFSTR("VECTOR_TRANSIT");
      break;
    case 0x26:
      v28 = CFSTR("RASTER_STANDARD_BASE");
      break;
    case 0x27:
      v28 = CFSTR("RASTER_STANDARD_LABELS");
      break;
    case 0x28:
      v28 = CFSTR("RASTER_HYBRID_ROADS");
      break;
    case 0x29:
      v28 = CFSTR("RASTER_HYBRID_LABELS");
      break;
    case 0x2A:
      v28 = CFSTR("FLYOVER_C3M_MESH");
      break;
    case 0x2B:
      v28 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
      break;
    case 0x2C:
      v28 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
      break;
    case 0x2D:
      v28 = CFSTR("RASTER_SATELLITE_ASTC");
      break;
    case 0x2E:
      v28 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
      break;
    case 0x2F:
      v28 = CFSTR("VECTOR_TRANSIT_SELECTION");
      break;
    case 0x30:
      v28 = CFSTR("VECTOR_COVERAGE");
      break;
    case 0x34:
      v28 = CFSTR("FLYOVER_METADATA");
      break;
    case 0x35:
      v28 = CFSTR("VECTOR_ROAD_NETWORK");
      break;
    case 0x36:
      v28 = CFSTR("VECTOR_LAND_COVER");
      break;
    case 0x37:
      v28 = CFSTR("VECTOR_DEBUG");
      break;
    case 0x38:
      v28 = CFSTR("VECTOR_STREET_POI");
      break;
    case 0x39:
      v28 = CFSTR("MUNIN_METADATA");
      break;
    case 0x3A:
      v28 = CFSTR("VECTOR_SPR_MERCATOR");
      break;
    case 0x3B:
      v28 = CFSTR("VECTOR_SPR_MODELS");
      break;
    case 0x3C:
      v28 = CFSTR("VECTOR_SPR_MATERIALS");
      break;
    case 0x3D:
      v28 = CFSTR("VECTOR_SPR_METADATA");
      break;
    case 0x3E:
      v28 = CFSTR("VECTOR_TRACKS");
      break;
    case 0x3F:
      v28 = CFSTR("VECTOR_RESERVED_2");
      break;
    case 0x40:
      v28 = CFSTR("VECTOR_STREET_LANDMARKS");
      break;
    case 0x41:
      v28 = CFSTR("COARSE_LOCATION_POLYGONS");
      break;
    case 0x42:
      v28 = CFSTR("VECTOR_SPR_ROADS");
      break;
    case 0x43:
      v28 = CFSTR("VECTOR_SPR_STANDARD");
      break;
    case 0x44:
      v28 = CFSTR("VECTOR_POI_V2");
      break;
    case 0x45:
      v28 = CFSTR("VECTOR_POLYGON_SELECTION");
      break;
    case 0x46:
      v28 = CFSTR("VL_METADATA");
      break;
    case 0x47:
      v28 = CFSTR("VL_DATA");
      break;
    case 0x48:
      v28 = CFSTR("PROACTIVE_APP_CLIP");
      break;
    case 0x49:
      v28 = CFSTR("VECTOR_BUILDINGS_V2");
      break;
    case 0x4A:
      v28 = CFSTR("POI_BUSYNESS");
      break;
    case 0x4B:
      v28 = CFSTR("POI_DP_BUSYNESS");
      break;
    case 0x4C:
      v28 = CFSTR("SMART_INTERFACE_SELECTION");
      break;
    case 0x4D:
      v28 = CFSTR("VECTOR_ASSETS");
      break;
    case 0x4E:
      v28 = CFSTR("SPR_ASSET_METADATA");
      break;
    case 0x4F:
      v28 = CFSTR("VECTOR_SPR_POLAR");
      break;
    case 0x50:
      v28 = CFSTR("SMART_DATA_MODE");
      break;
    case 0x51:
      v28 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
      break;
    case 0x52:
      v28 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
      break;
    case 0x53:
      v28 = CFSTR("VECTOR_TOPOGRAPHIC");
      break;
    case 0x54:
      v28 = CFSTR("VECTOR_POI_V2_UPDATE");
      break;
    case 0x55:
      v28 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
      break;
    case 0x56:
      v28 = CFSTR("VECTOR_TRAFFIC_V2");
      break;
    case 0x57:
      v28 = CFSTR("VECTOR_ROAD_SELECTION");
      break;
    case 0x58:
      v28 = CFSTR("VECTOR_REGION_METADATA");
      break;
    case 0x59:
      v28 = CFSTR("RAY_TRACING");
      break;
    case 0x5A:
      v28 = CFSTR("VECTOR_CONTOURS");
      break;
    case 0x5B:
      v28 = CFSTR("RASTER_SATELLITE_POLAR");
      break;
    case 0x5C:
      v28 = CFSTR("VMAP4_ELEVATION");
      break;
    case 0x5D:
      v28 = CFSTR("VMAP4_ELEVATION_POLAR");
      break;
    case 0x5E:
      v28 = CFSTR("CELLULAR_COVERAGE_PLMN");
      break;
    case 0x5F:
      v28 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
      break;
    case 0x60:
      v28 = CFSTR("UNUSED_96");
      break;
    case 0x61:
      v28 = CFSTR("UNUSED_97");
      break;
    case 0x62:
      v28 = CFSTR("UNUSED_98");
      break;
    case 0x63:
      v28 = CFSTR("UNUSED_99");
      break;
    case 0x64:
      v28 = CFSTR("UNUSED_100");
      break;
    case 0x65:
      v28 = CFSTR("UNUSED_101");
      break;
    case 0x66:
      v28 = CFSTR("UNUSED_102");
      break;
    case 0x67:
      v28 = CFSTR("UNUSED_103");
      break;
    case 0x68:
      v28 = CFSTR("UNUSED_104");
      break;
    case 0x69:
      v28 = CFSTR("UNUSED_105");
      break;
    case 0x6A:
      v28 = CFSTR("UNUSED_106");
      break;
    case 0x6B:
      v28 = CFSTR("UNUSED_107");
      break;
    case 0x6C:
      v28 = CFSTR("UNUSED_108");
      break;
    case 0x6D:
      v28 = CFSTR("UNUSED_109");
      break;
    case 0x6E:
      v28 = CFSTR("UNUSED_110");
      break;
    case 0x6F:
      v28 = CFSTR("UNUSED_111");
      break;
    case 0x70:
      v28 = CFSTR("UNUSED_112");
      break;
    case 0x71:
      v28 = CFSTR("UNUSED_113");
      break;
    case 0x72:
      v28 = CFSTR("UNUSED_114");
      break;
    case 0x73:
      v28 = CFSTR("UNUSED_115");
      break;
    case 0x74:
      v28 = CFSTR("UNUSED_116");
      break;
    case 0x75:
      v28 = CFSTR("UNUSED_117");
      break;
    case 0x76:
      v28 = CFSTR("UNUSED_118");
      break;
    case 0x77:
      v28 = CFSTR("UNUSED_119");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 144));
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  if (a2)
    v29 = CFSTR("tileSetStyle");
  else
    v29 = CFSTR("tile_set_style");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

LABEL_178:
  objc_msgSend((id)a1, "svcIp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    if (a2)
      v31 = CFSTR("svcIp");
    else
      v31 = CFSTR("svc_ip");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);
  }

  objc_msgSend((id)a1, "errorDomain");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    if (a2)
      v33 = CFSTR("errorDomain");
    else
      v33 = CFSTR("error_domain");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);
  }

  if ((*(_BYTE *)(a1 + 156) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("errorCode");
    else
      v35 = CFSTR("error_code");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  objc_msgSend((id)a1, "manifestEnv");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    if (a2)
      v37 = CFSTR("manifestEnv");
    else
      v37 = CFSTR("manifest_env");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);
  }

  v38 = *(_DWORD *)(a1 + 156);
  if ((v38 & 0x10) == 0)
  {
    if ((v38 & 0x1000) == 0)
      goto LABEL_200;
LABEL_212:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 153));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v48 = CFSTR("reusedConnection");
    else
      v48 = CFSTR("reused_connection");
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

    if ((*(_DWORD *)(a1 + 156) & 0x800) == 0)
      goto LABEL_205;
    goto LABEL_201;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v46 = CFSTR("httpResponseCode");
  else
    v46 = CFSTR("http_response_code");
  objc_msgSend(v4, "setObject:forKey:", v45, v46);

  v38 = *(_DWORD *)(a1 + 156);
  if ((v38 & 0x1000) != 0)
    goto LABEL_212;
LABEL_200:
  if ((v38 & 0x800) != 0)
  {
LABEL_201:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 152));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("isBackground");
    else
      v40 = CFSTR("is_background");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
LABEL_205:
  objc_msgSend((id)a1, "latencyStats");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("latencyStats");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("latency_stats");
    }
    v49 = v43;

    objc_msgSend(v4, "setObject:forKey:", v49, v44);
  }

  objc_msgSend((id)a1, "txBytesStats");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v50, "jsonRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("txBytesStats");
    }
    else
    {
      objc_msgSend(v50, "dictionaryRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("tx_bytes_stats");
    }
    v54 = v52;

    objc_msgSend(v4, "setObject:forKey:", v54, v53);
  }

  objc_msgSend((id)a1, "rxBytesStats");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v55, "jsonRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("rxBytesStats");
    }
    else
    {
      objc_msgSend(v55, "dictionaryRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("rx_bytes_stats");
    }
    v59 = v57;

    objc_msgSend(v4, "setObject:forKey:", v59, v58);
  }

  if ((*(_BYTE *)(a1 + 156) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v61 = CFSTR("eventCount");
    else
      v61 = CFSTR("event_count");
    objc_msgSend(v4, "setObject:forKey:", v60, v61);

  }
  v62 = v4;

  return v62;
}

- (id)jsonRepresentation
{
  return -[GEONetEventDimensionalGrouping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONetEventDimensionalGrouping)initWithDictionary:(id)a3
{
  return (GEONetEventDimensionalGrouping *)-[GEONetEventDimensionalGrouping _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  GEONetEventAggregateStats *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  GEONetEventAggregateStats *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  GEONetEventAggregateStats *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  void *v69;

  v5 = a2;
  if (!a1)
    goto LABEL_543;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_543;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("year"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setYear:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("month"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMonth:", objc_msgSend(v7, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("day"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDay:", objc_msgSend(v8, "unsignedIntValue"));

  if (a3)
    v9 = CFSTR("usedCellular");
  else
    v9 = CFSTR("used_cellular");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUsedCellular:", objc_msgSend(v10, "BOOLValue"));

  if (a3)
    v11 = CFSTR("appId");
  else
    v11 = CFSTR("app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(a1, "setAppId:", v13);

  }
  if (a3)
    v14 = CFSTR("requestingAppId");
  else
    v14 = CFSTR("requesting_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(a1, "setRequestingAppId:", v16);

  }
  if (a3)
    v17 = CFSTR("countryCode");
  else
    v17 = CFSTR("country_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(a1, "setCountryCode:", v19);

  }
  if (a3)
    v20 = CFSTR("networkService");
  else
    v20 = CFSTR("network_service");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v21;
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("NETWORK_SERVICE_UNKNOWN")) & 1) != 0)
    {
      v23 = 0;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("REVERSE_GEOCODER")) & 1) != 0)
    {
      v23 = 1;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("FORWARD_GEOCODER")) & 1) != 0)
    {
      v23 = 2;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
    {
      v23 = 3;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
    {
      v23 = 4;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("TILE")) & 1) != 0)
    {
      v23 = 5;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("TRAFFIC_ETA")) & 1) != 0)
    {
      v23 = 6;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("SIMPLE_ETA")) & 1) != 0)
    {
      v23 = 7;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("SUGGESTIONS")) & 1) != 0)
    {
      v23 = 8;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("BATCH_REVGEO")) & 1) != 0)
    {
      v23 = 9;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MAP_MATCH")) & 1) != 0)
    {
      v23 = 10;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_INIT")) & 1) != 0)
    {
      v23 = 11;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_UPDATE")) & 1) != 0)
    {
      v23 = 12;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("PLACE_DATA")) & 1) != 0)
    {
      v23 = 13;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("RESOURCE_LOADER")) & 1) != 0)
    {
      v23 = 14;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("LOG_MESSAGE_USAGE")) & 1) != 0)
    {
      v23 = 16;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("LOCATION_SHIFT")) & 1) != 0)
    {
      v23 = 17;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("AB_ASSIGN")) & 1) != 0)
    {
      v23 = 18;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MANIFEST")) & 1) != 0)
    {
      v23 = 19;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE")) & 1) != 0)
    {
      v23 = 20;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE")) & 1) != 0)
    {
      v23 = 21;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("SYNC")) & 1) != 0)
    {
      v23 = 22;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("WIFI_QUALITY")) & 1) != 0)
    {
      v23 = 23;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("NETWORK_DEFAULTS")) & 1) != 0)
    {
      v23 = 24;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MUNIN_RESOURCE")) & 1) != 0)
    {
      v23 = 25;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("JUNCTION_VIEW")) & 1) != 0)
    {
      v23 = 26;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("WIFI_TILE")) & 1) != 0)
    {
      v23 = 27;
    }
    else if (objc_msgSend(v22, "isEqualToString:", CFSTR("INCIDENT")))
    {
      v23 = 28;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_94;
    v23 = objc_msgSend(v21, "intValue");
  }
  objc_msgSend(a1, "setNetworkService:", v23);
LABEL_94:

  if (a3)
    v24 = CFSTR("placeType");
  else
    v24 = CFSTR("place_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v27 = 0;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
    {
      v27 = 1;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
    {
      v27 = 2;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
    {
      v27 = 3;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
    {
      v27 = 4;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
    {
      v27 = 5;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
    {
      v27 = 6;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
    {
      v27 = 7;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
    {
      v27 = 8;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
    {
      v27 = 9;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
    {
      v27 = 10;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v27 = 11;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
    {
      v27 = 12;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v27 = 13;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v27 = 14;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
    {
      v27 = 15;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v27 = 16;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
    {
      v27 = 17;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
    {
      v27 = 18;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
    {
      v27 = 19;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
    {
      v27 = 20;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
    {
      v27 = 21;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
    {
      v27 = 22;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
    {
      v27 = 23;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
    {
      v27 = 24;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
    {
      v27 = 25;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
    {
      v27 = 26;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
    {
      v27 = 27;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
    {
      v27 = 28;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
    {
      v27 = 29;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
    {
      v27 = 30;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
    {
      v27 = 31;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
    {
      v27 = 32;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
    {
      v27 = 33;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
    {
      v27 = 34;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
    {
      v27 = 35;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
    {
      v27 = 36;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
    {
      v27 = 37;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
    {
      v27 = 38;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v27 = 39;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
    {
      v27 = 40;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
    {
      v27 = 41;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
    {
      v27 = 42;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
    {
      v27 = 43;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
    {
      v27 = 44;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
    {
      v27 = 45;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
    {
      v27 = 46;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
    {
      v27 = 47;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
    {
      v27 = 48;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
    {
      v27 = 49;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v27 = 50;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
    {
      v27 = 51;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
    {
      v27 = 52;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
    {
      v27 = 53;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
    {
      v27 = 54;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
    {
      v27 = 55;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
    {
      v27 = 56;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
    {
      v27 = 57;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
    {
      v27 = 58;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
    {
      v27 = 59;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
    {
      v27 = 60;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
    {
      v27 = 61;
    }
    else if (objc_msgSend(v26, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
    {
      v27 = 62;
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_229;
    v27 = objc_msgSend(v25, "intValue");
  }
  objc_msgSend(a1, "setPlaceType:", v27);
LABEL_229:

  if (a3)
    v28 = CFSTR("tileSetId");
  else
    v28 = CFSTR("tile_set_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTileSetId:", objc_msgSend(v29, "unsignedIntValue"));

  if (a3)
    v30 = CFSTR("dataSetId");
  else
    v30 = CFSTR("data_set_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDataSetId:", objc_msgSend(v31, "unsignedIntValue"));

  if (a3)
    v32 = CFSTR("tileSetStyle");
  else
    v32 = CFSTR("tile_set_style");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v33;
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
    {
      v35 = 0;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
    {
      v35 = 1;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
    {
      v35 = 2;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v35 = 3;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v35 = 4;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
    {
      v35 = 5;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
    {
      v35 = 6;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
    {
      v35 = 7;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
    {
      v35 = 8;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
    {
      v35 = 11;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
    {
      v35 = 12;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
    {
      v35 = 13;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
    {
      v35 = 14;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
    {
      v35 = 15;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
    {
      v35 = 16;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
    {
      v35 = 17;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
    {
      v35 = 18;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
    {
      v35 = 19;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
    {
      v35 = 20;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
    {
      v35 = 21;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
    {
      v35 = 22;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
    {
      v35 = 23;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
    {
      v35 = 24;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
    {
      v35 = 25;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
    {
      v35 = 26;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
    {
      v35 = 27;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
    {
      v35 = 28;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
    {
      v35 = 29;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
    {
      v35 = 30;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
    {
      v35 = 31;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
    {
      v35 = 32;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
    {
      v35 = 33;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
    {
      v35 = 34;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
    {
      v35 = 35;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
    {
      v35 = 36;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
    {
      v35 = 37;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
    {
      v35 = 38;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
    {
      v35 = 39;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
    {
      v35 = 40;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
    {
      v35 = 41;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
    {
      v35 = 42;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
    {
      v35 = 43;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
    {
      v35 = 44;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
    {
      v35 = 45;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
    {
      v35 = 46;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
    {
      v35 = 47;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
    {
      v35 = 48;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
    {
      v35 = 52;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
    {
      v35 = 53;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
    {
      v35 = 54;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
    {
      v35 = 55;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
    {
      v35 = 56;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
    {
      v35 = 57;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
    {
      v35 = 58;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
    {
      v35 = 59;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
    {
      v35 = 60;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
    {
      v35 = 61;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
    {
      v35 = 62;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
    {
      v35 = 63;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
    {
      v35 = 64;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
    {
      v35 = 65;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
    {
      v35 = 66;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
    {
      v35 = 67;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
    {
      v35 = 68;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
    {
      v35 = 69;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
    {
      v35 = 70;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
    {
      v35 = 71;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
    {
      v35 = 72;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
    {
      v35 = 73;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
    {
      v35 = 74;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
    {
      v35 = 75;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
    {
      v35 = 76;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
    {
      v35 = 77;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
    {
      v35 = 78;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
    {
      v35 = 79;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
    {
      v35 = 80;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
    {
      v35 = 81;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
    {
      v35 = 82;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
    {
      v35 = 83;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
    {
      v35 = 84;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
    {
      v35 = 85;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
    {
      v35 = 86;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
    {
      v35 = 87;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
    {
      v35 = 88;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
    {
      v35 = 89;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
    {
      v35 = 90;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
    {
      v35 = 91;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
    {
      v35 = 92;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
    {
      v35 = 93;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
    {
      v35 = 94;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
    {
      v35 = 95;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
    {
      v35 = 96;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
    {
      v35 = 97;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
    {
      v35 = 98;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
    {
      v35 = 99;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
    {
      v35 = 100;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
    {
      v35 = 101;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
    {
      v35 = 102;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
    {
      v35 = 103;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
    {
      v35 = 104;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
    {
      v35 = 105;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
    {
      v35 = 106;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
    {
      v35 = 107;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
    {
      v35 = 108;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
    {
      v35 = 109;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
    {
      v35 = 110;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
    {
      v35 = 111;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
    {
      v35 = 112;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
    {
      v35 = 113;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
    {
      v35 = 114;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
    {
      v35 = 115;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
    {
      v35 = 116;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
    {
      v35 = 117;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
    {
      v35 = 118;
    }
    else if (objc_msgSend(v34, "isEqualToString:", CFSTR("UNUSED_119")))
    {
      v35 = 119;
    }
    else
    {
      v35 = 0;
    }

    goto LABEL_477;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = objc_msgSend(v33, "intValue");
LABEL_477:
    objc_msgSend(a1, "setTileSetStyle:", v35);
  }

  if (a3)
    v36 = CFSTR("svcIp");
  else
    v36 = CFSTR("svc_ip");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(a1, "setSvcIp:", v38);

  }
  if (a3)
    v39 = CFSTR("errorDomain");
  else
    v39 = CFSTR("error_domain");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = (void *)objc_msgSend(v40, "copy");
    objc_msgSend(a1, "setErrorDomain:", v41);

  }
  if (a3)
    v42 = CFSTR("errorCode");
  else
    v42 = CFSTR("error_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setErrorCode:", objc_msgSend(v43, "longLongValue"));

  if (a3)
    v44 = CFSTR("manifestEnv");
  else
    v44 = CFSTR("manifest_env");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(a1, "setManifestEnv:", v46);

  }
  if (a3)
    v47 = CFSTR("httpResponseCode");
  else
    v47 = CFSTR("http_response_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHttpResponseCode:", objc_msgSend(v48, "unsignedIntValue"));

  if (a3)
    v49 = CFSTR("reusedConnection");
  else
    v49 = CFSTR("reused_connection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setReusedConnection:", objc_msgSend(v50, "BOOLValue"));

  if (a3)
    v51 = CFSTR("isBackground");
  else
    v51 = CFSTR("is_background");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsBackground:", objc_msgSend(v52, "BOOLValue"));

  if (a3)
    v53 = CFSTR("latencyStats");
  else
    v53 = CFSTR("latency_stats");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = [GEONetEventAggregateStats alloc];
    if ((a3 & 1) != 0)
      v56 = -[GEONetEventAggregateStats initWithJSON:](v55, "initWithJSON:", v54);
    else
      v56 = -[GEONetEventAggregateStats initWithDictionary:](v55, "initWithDictionary:", v54);
    v57 = (void *)v56;
    objc_msgSend(a1, "setLatencyStats:", v56);

  }
  if (a3)
    v58 = CFSTR("txBytesStats");
  else
    v58 = CFSTR("tx_bytes_stats");
  objc_msgSend(v5, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = [GEONetEventAggregateStats alloc];
    if ((a3 & 1) != 0)
      v61 = -[GEONetEventAggregateStats initWithJSON:](v60, "initWithJSON:", v59);
    else
      v61 = -[GEONetEventAggregateStats initWithDictionary:](v60, "initWithDictionary:", v59);
    v62 = (void *)v61;
    objc_msgSend(a1, "setTxBytesStats:", v61);

  }
  if (a3)
    v63 = CFSTR("rxBytesStats");
  else
    v63 = CFSTR("rx_bytes_stats");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = [GEONetEventAggregateStats alloc];
    if ((a3 & 1) != 0)
      v66 = -[GEONetEventAggregateStats initWithJSON:](v65, "initWithJSON:", v64);
    else
      v66 = -[GEONetEventAggregateStats initWithDictionary:](v65, "initWithDictionary:", v64);
    v67 = (void *)v66;
    objc_msgSend(a1, "setRxBytesStats:", v66);

  }
  if (a3)
    v68 = CFSTR("eventCount");
  else
    v68 = CFSTR("event_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEventCount:", objc_msgSend(v69, "unsignedLongLongValue"));

  a1 = a1;
LABEL_543:

  return a1;
}

- (GEONetEventDimensionalGrouping)initWithJSON:(id)a3
{
  return (GEONetEventDimensionalGrouping *)-[GEONetEventDimensionalGrouping _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_8561;
    else
      v8 = (int *)&readAll__nonRecursiveTag_8562;
    GEONetEventDimensionalGroupingReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEONetEventAggregateStats readAll:](self->_latencyStats, "readAll:", 1);
    -[GEONetEventAggregateStats readAll:](self->_txBytesStats, "readAll:", 1);
    -[GEONetEventAggregateStats readAll:](self->_rxBytesStats, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetEventDimensionalGroupingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetEventDimensionalGroupingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $4318C9330A95675F510920386E4F36BC flags;
  $4318C9330A95675F510920386E4F36BC v6;
  $4318C9330A95675F510920386E4F36BC v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0xFFC000) == 0)
    {
      v8 = self->_reader;
      objc_sync_enter(v8);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeData:", v9);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_53;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONetEventDimensionalGrouping readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:
  if (self->_appId)
    PBDataWriterWriteStringField();
  if (self->_requestingAppId)
    PBDataWriterWriteStringField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 0x80) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v6 & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_46;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
LABEL_19:
    PBDataWriterWriteInt32Field();
LABEL_20:
  if (self->_svcIp)
    PBDataWriterWriteStringField();
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_manifestEnv)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
    if ((*(_WORD *)&v7 & 0x1000) == 0)
      goto LABEL_30;
LABEL_50:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x800) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  PBDataWriterWriteUint32Field();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
    goto LABEL_50;
LABEL_30:
  if ((*(_WORD *)&v7 & 0x800) != 0)
LABEL_31:
    PBDataWriterWriteBOOLField();
LABEL_32:
  if (self->_latencyStats)
    PBDataWriterWriteSubmessage();
  if (self->_txBytesStats)
    PBDataWriterWriteSubmessage();
  if (self->_rxBytesStats)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint64Field();
LABEL_53:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $4318C9330A95675F510920386E4F36BC flags;
  $4318C9330A95675F510920386E4F36BC v6;
  $4318C9330A95675F510920386E4F36BC v7;
  id *v8;

  v8 = (id *)a3;
  -[GEONetEventDimensionalGrouping readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 26) = self->_readerMarkPos;
  *((_DWORD *)v8 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v8;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    *((_DWORD *)v8 + 37) = self->_year;
    *((_DWORD *)v8 + 39) |= 0x400u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v8 + 32) = self->_month;
  *((_DWORD *)v8 + 39) |= 0x20u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_41:
  *((_DWORD *)v8 + 30) = self->_day;
  *((_DWORD *)v8 + 39) |= 8u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_5:
    *((_BYTE *)v8 + 154) = self->_usedCellular;
    *((_DWORD *)v8 + 39) |= 0x2000u;
  }
LABEL_6:
  if (self->_appId)
  {
    objc_msgSend(v8, "setAppId:");
    v4 = v8;
  }
  if (self->_requestingAppId)
  {
    objc_msgSend(v8, "setRequestingAppId:");
    v4 = v8;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v8, "setCountryCode:");
    v4 = v8;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_networkService;
    *((_DWORD *)v4 + 39) |= 0x40u;
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 0x80) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v6 & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_45;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v4 + 34) = self->_placeType;
  *((_DWORD *)v4 + 39) |= 0x80u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 35) = self->_tileSetId;
  *((_DWORD *)v4 + 39) |= 0x100u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_46:
  *((_DWORD *)v4 + 29) = self->_dataSetId;
  *((_DWORD *)v4 + 39) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 36) = self->_tileSetStyle;
    *((_DWORD *)v4 + 39) |= 0x200u;
  }
LABEL_18:
  if (self->_svcIp)
  {
    objc_msgSend(v8, "setSvcIp:");
    v4 = v8;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v8, "setErrorDomain:");
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[4] = (id)self->_errorCode;
    *((_DWORD *)v4 + 39) |= 1u;
  }
  if (self->_manifestEnv)
  {
    objc_msgSend(v8, "setManifestEnv:");
    v4 = v8;
  }
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 31) = self->_httpResponseCode;
    *((_DWORD *)v4 + 39) |= 0x10u;
    v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x1000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v7 & 0x800) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
    goto LABEL_28;
  }
  *((_BYTE *)v4 + 153) = self->_reusedConnection;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  if ((*(_DWORD *)&self->_flags & 0x800) != 0)
  {
LABEL_29:
    *((_BYTE *)v4 + 152) = self->_isBackground;
    *((_DWORD *)v4 + 39) |= 0x800u;
  }
LABEL_30:
  if (self->_latencyStats)
  {
    objc_msgSend(v8, "setLatencyStats:");
    v4 = v8;
  }
  if (self->_txBytesStats)
  {
    objc_msgSend(v8, "setTxBytesStats:");
    v4 = v8;
  }
  if (self->_rxBytesStats)
  {
    objc_msgSend(v8, "setRxBytesStats:");
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4[6] = (id)self->_eventCount;
    *((_DWORD *)v4 + 39) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $4318C9330A95675F510920386E4F36BC flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  $4318C9330A95675F510920386E4F36BC v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  $4318C9330A95675F510920386E4F36BC v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 0x80) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEONetEventDimensionalGroupingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONetEventDimensionalGrouping readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_year;
    *(_DWORD *)(v5 + 156) |= 0x400u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_month;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_27:
  *(_DWORD *)(v5 + 120) = self->_day;
  *(_DWORD *)(v5 + 156) |= 8u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_9:
    *(_BYTE *)(v5 + 154) = self->_usedCellular;
    *(_DWORD *)(v5 + 156) |= 0x2000u;
  }
LABEL_10:
  v10 = -[NSString copyWithZone:](self->_appId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_requestingAppId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_networkService;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    v16 = self->_flags;
    if ((*(_BYTE *)&v16 & 0x80) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&v16 & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&v16 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v5 + 136) = self->_placeType;
  *(_DWORD *)(v5 + 156) |= 0x80u;
  v16 = self->_flags;
  if ((*(_WORD *)&v16 & 0x100) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v16 & 4) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 140) = self->_tileSetId;
  *(_DWORD *)(v5 + 156) |= 0x100u;
  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v16 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_32:
  *(_DWORD *)(v5 + 116) = self->_dataSetId;
  *(_DWORD *)(v5 + 156) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 144) = self->_tileSetStyle;
    *(_DWORD *)(v5 + 156) |= 0x200u;
  }
LABEL_16:
  v17 = -[NSString copyWithZone:](self->_svcIp, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v17;

  v19 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_errorCode;
    *(_DWORD *)(v5 + 156) |= 1u;
  }
  v21 = -[NSString copyWithZone:](self->_manifestEnv, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v21;

  v23 = self->_flags;
  if ((*(_BYTE *)&v23 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_httpResponseCode;
    *(_DWORD *)(v5 + 156) |= 0x10u;
    v23 = self->_flags;
    if ((*(_WORD *)&v23 & 0x1000) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v23 & 0x800) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&v23 & 0x1000) == 0)
  {
    goto LABEL_20;
  }
  *(_BYTE *)(v5 + 153) = self->_reusedConnection;
  *(_DWORD *)(v5 + 156) |= 0x1000u;
  if ((*(_DWORD *)&self->_flags & 0x800) != 0)
  {
LABEL_21:
    *(_BYTE *)(v5 + 152) = self->_isBackground;
    *(_DWORD *)(v5 + 156) |= 0x800u;
  }
LABEL_22:
  v24 = -[GEONetEventAggregateStats copyWithZone:](self->_latencyStats, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  v26 = -[GEONetEventAggregateStats copyWithZone:](self->_txBytesStats, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v26;

  v28 = -[GEONetEventAggregateStats copyWithZone:](self->_rxBytesStats, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v28;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_eventCount;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $4318C9330A95675F510920386E4F36BC flags;
  int v6;
  NSString *appId;
  NSString *requestingAppId;
  NSString *countryCode;
  $4318C9330A95675F510920386E4F36BC v10;
  int v11;
  NSString *svcIp;
  NSString *errorDomain;
  $4318C9330A95675F510920386E4F36BC v14;
  int v15;
  NSString *manifestEnv;
  GEONetEventAggregateStats *latencyStats;
  GEONetEventAggregateStats *txBytesStats;
  GEONetEventAggregateStats *rxBytesStats;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_100;
  -[GEONetEventDimensionalGrouping readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_year != *((_DWORD *)v4 + 37))
      goto LABEL_100;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_month != *((_DWORD *)v4 + 32))
      goto LABEL_100;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_day != *((_DWORD *)v4 + 30))
      goto LABEL_100;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_100;
    if (self->_usedCellular)
    {
      if (!*((_BYTE *)v4 + 154))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 154))
    {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_100;
  }
  appId = self->_appId;
  if ((unint64_t)appId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](appId, "isEqual:"))
    goto LABEL_100;
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:"))
      goto LABEL_100;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_100;
  }
  v10 = self->_flags;
  v11 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_networkService != *((_DWORD *)v4 + 33))
      goto LABEL_100;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_placeType != *((_DWORD *)v4 + 34))
      goto LABEL_100;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_tileSetId != *((_DWORD *)v4 + 35))
      goto LABEL_100;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dataSetId != *((_DWORD *)v4 + 29))
      goto LABEL_100;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_tileSetStyle != *((_DWORD *)v4 + 36))
      goto LABEL_100;
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_100;
  }
  svcIp = self->_svcIp;
  if ((unint64_t)svcIp | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](svcIp, "isEqual:"))
    goto LABEL_100;
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:"))
      goto LABEL_100;
  }
  v14 = self->_flags;
  v15 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 4))
      goto LABEL_100;
  }
  else if ((v15 & 1) != 0)
  {
    goto LABEL_100;
  }
  manifestEnv = self->_manifestEnv;
  if ((unint64_t)manifestEnv | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](manifestEnv, "isEqual:"))
      goto LABEL_100;
    v14 = self->_flags;
    v15 = *((_DWORD *)v4 + 39);
  }
  if ((*(_BYTE *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_httpResponseCode != *((_DWORD *)v4 + 31))
      goto LABEL_100;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0)
      goto LABEL_100;
    if (self->_reusedConnection)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_100;
    }
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
    if ((v15 & 0x800) != 0)
    {
      if (self->_isBackground)
      {
        if (!*((_BYTE *)v4 + 152))
          goto LABEL_100;
        goto LABEL_89;
      }
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_89;
    }
LABEL_100:
    v20 = 0;
    goto LABEL_101;
  }
  if ((v15 & 0x800) != 0)
    goto LABEL_100;
LABEL_89:
  latencyStats = self->_latencyStats;
  if ((unint64_t)latencyStats | *((_QWORD *)v4 + 7)
    && !-[GEONetEventAggregateStats isEqual:](latencyStats, "isEqual:"))
  {
    goto LABEL_100;
  }
  txBytesStats = self->_txBytesStats;
  if ((unint64_t)txBytesStats | *((_QWORD *)v4 + 12))
  {
    if (!-[GEONetEventAggregateStats isEqual:](txBytesStats, "isEqual:"))
      goto LABEL_100;
  }
  rxBytesStats = self->_rxBytesStats;
  if ((unint64_t)rxBytesStats | *((_QWORD *)v4 + 10))
  {
    if (!-[GEONetEventAggregateStats isEqual:](rxBytesStats, "isEqual:"))
      goto LABEL_100;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_DWORD *)v4 + 39) & 2) == 0 || self->_eventCount != *((_QWORD *)v4 + 6))
      goto LABEL_100;
    v20 = 1;
  }
  else
  {
    v20 = (*((_DWORD *)v4 + 39) & 2) == 0;
  }
LABEL_101:

  return v20;
}

- (unint64_t)hash
{
  $4318C9330A95675F510920386E4F36BC flags;
  $4318C9330A95675F510920386E4F36BC v4;
  NSUInteger v5;
  $4318C9330A95675F510920386E4F36BC v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  -[GEONetEventDimensionalGrouping readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    v29 = 2654435761 * self->_year;
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
LABEL_3:
      v28 = 2654435761 * self->_month;
      if ((*(_BYTE *)&flags & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v27 = 0;
      if ((*(_WORD *)&flags & 0x2000) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v29 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_3;
  }
  v28 = 0;
  if ((*(_BYTE *)&flags & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v27 = 2654435761 * self->_day;
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
LABEL_5:
    v26 = 2654435761 * self->_usedCellular;
    goto LABEL_10;
  }
LABEL_9:
  v26 = 0;
LABEL_10:
  v25 = -[NSString hash](self->_appId, "hash");
  v24 = -[NSString hash](self->_requestingAppId, "hash");
  v23 = -[NSString hash](self->_countryCode, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
    v22 = 2654435761 * self->_networkService;
    if ((*(_BYTE *)&v4 & 0x80) != 0)
    {
LABEL_12:
      v21 = 2654435761 * self->_placeType;
      if ((*(_WORD *)&v4 & 0x100) != 0)
        goto LABEL_13;
      goto LABEL_18;
    }
  }
  else
  {
    v22 = 0;
    if ((*(_BYTE *)&v4 & 0x80) != 0)
      goto LABEL_12;
  }
  v21 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_13:
    v20 = 2654435761 * self->_tileSetId;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_14;
LABEL_19:
    v19 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_15;
    goto LABEL_20;
  }
LABEL_18:
  v20 = 0;
  if ((*(_BYTE *)&v4 & 4) == 0)
    goto LABEL_19;
LABEL_14:
  v19 = 2654435761 * self->_dataSetId;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_15:
    v18 = 2654435761 * self->_tileSetStyle;
    goto LABEL_21;
  }
LABEL_20:
  v18 = 0;
LABEL_21:
  v17 = -[NSString hash](self->_svcIp, "hash");
  v16 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v15 = 2654435761 * self->_errorCode;
  else
    v15 = 0;
  v5 = -[NSString hash](self->_manifestEnv, "hash");
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
    v7 = 0;
    if ((*(_WORD *)&v6 & 0x1000) != 0)
      goto LABEL_26;
LABEL_29:
    v8 = 0;
    if ((*(_WORD *)&v6 & 0x800) != 0)
      goto LABEL_27;
    goto LABEL_30;
  }
  v7 = 2654435761 * self->_httpResponseCode;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
    goto LABEL_29;
LABEL_26:
  v8 = 2654435761 * self->_reusedConnection;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_27:
    v9 = 2654435761 * self->_isBackground;
    goto LABEL_31;
  }
LABEL_30:
  v9 = 0;
LABEL_31:
  v10 = -[GEONetEventAggregateStats hash](self->_latencyStats, "hash");
  v11 = -[GEONetEventAggregateStats hash](self->_txBytesStats, "hash");
  v12 = -[GEONetEventAggregateStats hash](self->_rxBytesStats, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v13 = 2654435761u * self->_eventCount;
  else
    v13 = 0;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  GEONetEventAggregateStats *latencyStats;
  uint64_t v9;
  GEONetEventAggregateStats *txBytesStats;
  uint64_t v11;
  GEONetEventAggregateStats *rxBytesStats;
  uint64_t v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "readAll:", 0);
  v4 = v14;
  v5 = *((_DWORD *)v14 + 39);
  if ((v5 & 0x400) != 0)
  {
    self->_year = *((_DWORD *)v14 + 37);
    *(_DWORD *)&self->_flags |= 0x400u;
    v5 = *((_DWORD *)v14 + 39);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_month = *((_DWORD *)v14 + 32);
  *(_DWORD *)&self->_flags |= 0x20u;
  v5 = *((_DWORD *)v14 + 39);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_35:
  self->_day = *((_DWORD *)v14 + 30);
  *(_DWORD *)&self->_flags |= 8u;
  if ((*((_DWORD *)v14 + 39) & 0x2000) != 0)
  {
LABEL_5:
    self->_usedCellular = *((_BYTE *)v14 + 154);
    *(_DWORD *)&self->_flags |= 0x2000u;
  }
LABEL_6:
  if (*((_QWORD *)v14 + 2))
  {
    -[GEONetEventDimensionalGrouping setAppId:](self, "setAppId:");
    v4 = v14;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[GEONetEventDimensionalGrouping setRequestingAppId:](self, "setRequestingAppId:");
    v4 = v14;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEONetEventDimensionalGrouping setCountryCode:](self, "setCountryCode:");
    v4 = v14;
  }
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x40) != 0)
  {
    self->_networkService = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 0x40u;
    v6 = *((_DWORD *)v4 + 39);
    if ((v6 & 0x80) == 0)
    {
LABEL_14:
      if ((v6 & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_39;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  self->_placeType = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_flags |= 0x80u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  self->_tileSetId = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x100u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_40:
  self->_dataSetId = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 39) & 0x200) != 0)
  {
LABEL_17:
    self->_tileSetStyle = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
LABEL_18:
  if (*((_QWORD *)v4 + 11))
  {
    -[GEONetEventDimensionalGrouping setSvcIp:](self, "setSvcIp:");
    v4 = v14;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEONetEventDimensionalGrouping setErrorDomain:](self, "setErrorDomain:");
    v4 = v14;
  }
  if ((*((_BYTE *)v4 + 156) & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)v4 + 4);
    *(_DWORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[GEONetEventDimensionalGrouping setManifestEnv:](self, "setManifestEnv:");
    v4 = v14;
  }
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x10) != 0)
  {
    self->_httpResponseCode = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_flags |= 0x10u;
    v7 = *((_DWORD *)v4 + 39);
    if ((v7 & 0x1000) == 0)
    {
LABEL_28:
      if ((v7 & 0x800) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((v7 & 0x1000) == 0)
  {
    goto LABEL_28;
  }
  self->_reusedConnection = *((_BYTE *)v4 + 153);
  *(_DWORD *)&self->_flags |= 0x1000u;
  if ((*((_DWORD *)v4 + 39) & 0x800) != 0)
  {
LABEL_29:
    self->_isBackground = *((_BYTE *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
LABEL_30:
  latencyStats = self->_latencyStats;
  v9 = *((_QWORD *)v4 + 7);
  if (latencyStats)
  {
    if (!v9)
      goto LABEL_48;
    -[GEONetEventAggregateStats mergeFrom:](latencyStats, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_48;
    -[GEONetEventDimensionalGrouping setLatencyStats:](self, "setLatencyStats:");
  }
  v4 = v14;
LABEL_48:
  txBytesStats = self->_txBytesStats;
  v11 = *((_QWORD *)v4 + 12);
  if (txBytesStats)
  {
    if (!v11)
      goto LABEL_54;
    -[GEONetEventAggregateStats mergeFrom:](txBytesStats, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_54;
    -[GEONetEventDimensionalGrouping setTxBytesStats:](self, "setTxBytesStats:");
  }
  v4 = v14;
LABEL_54:
  rxBytesStats = self->_rxBytesStats;
  v13 = *((_QWORD *)v4 + 10);
  if (rxBytesStats)
  {
    if (!v13)
      goto LABEL_60;
    -[GEONetEventAggregateStats mergeFrom:](rxBytesStats, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_60;
    -[GEONetEventDimensionalGrouping setRxBytesStats:](self, "setRxBytesStats:");
  }
  v4 = v14;
LABEL_60:
  if ((*((_BYTE *)v4 + 156) & 2) != 0)
  {
    self->_eventCount = *((_QWORD *)v4 + 6);
    *(_DWORD *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txBytesStats, 0);
  objc_storeStrong((id *)&self->_svcIp, 0);
  objc_storeStrong((id *)&self->_rxBytesStats, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_manifestEnv, 0);
  objc_storeStrong((id *)&self->_latencyStats, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
