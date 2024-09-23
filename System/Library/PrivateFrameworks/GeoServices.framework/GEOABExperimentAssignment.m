@implementation GEOABExperimentAssignment

- (GEOABExperimentAssignment)init
{
  GEOABExperimentAssignment *v2;
  GEOABExperimentAssignment *v3;
  GEOABExperimentAssignment *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOABExperimentAssignment;
  v2 = -[GEOABExperimentAssignment init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABExperimentAssignment)initWithData:(id)a3
{
  GEOABExperimentAssignment *v3;
  GEOABExperimentAssignment *v4;
  GEOABExperimentAssignment *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOABExperimentAssignment;
  v3 = -[GEOABExperimentAssignment initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)serviceType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_serviceType;
  else
    return 0;
}

- (void)setServiceType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_serviceType = a3;
}

- (void)setHasServiceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasServiceType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C14398[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsServiceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_TYPE_DISPATCHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_TYPE_ROUTING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_TYPE_TILES")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)placeRequestType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_placeRequestType;
  else
    return 0;
}

- (void)setPlaceRequestType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_placeRequestType = a3;
}

- (void)setHasPlaceRequestType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasPlaceRequestType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)placeRequestTypeAsString:(int)a3
{
  if (a3 < 0x3F)
    return off_1E1C143B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceRequestType:(id)a3
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

- (void)_readQuerySubstring
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABExperimentAssignmentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuerySubstring_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuerySubstring
{
  -[GEOABExperimentAssignment _readQuerySubstring]((uint64_t)self);
  return self->_querySubstring != 0;
}

- (NSString)querySubstring
{
  -[GEOABExperimentAssignment _readQuerySubstring]((uint64_t)self);
  return self->_querySubstring;
}

- (void)setQuerySubstring:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_querySubstring, a3);
}

- (void)_readDebugExperimentBranch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABExperimentAssignmentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugExperimentBranch_tags_507);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDebugExperimentBranch
{
  -[GEOABExperimentAssignment _readDebugExperimentBranch]((uint64_t)self);
  return self->_debugExperimentBranch != 0;
}

- (GEOABDebugPanelExperimentBranch)debugExperimentBranch
{
  -[GEOABExperimentAssignment _readDebugExperimentBranch]((uint64_t)self);
  return self->_debugExperimentBranch;
}

- (void)setDebugExperimentBranch:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_debugExperimentBranch, a3);
}

- (void)_readOfflineAbJson
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABExperimentAssignmentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineAbJson_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOfflineAbJson
{
  -[GEOABExperimentAssignment _readOfflineAbJson]((uint64_t)self);
  return self->_offlineAbJson != 0;
}

- (NSString)offlineAbJson
{
  -[GEOABExperimentAssignment _readOfflineAbJson]((uint64_t)self);
  return self->_offlineAbJson;
}

- (void)setOfflineAbJson:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_offlineAbJson, a3);
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
  v8.super_class = (Class)GEOABExperimentAssignment;
  -[GEOABExperimentAssignment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOABExperimentAssignment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABExperimentAssignment _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 68);
  if ((v5 & 2) != 0)
  {
    v6 = *(int *)(a1 + 64);
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C14398[v6];
    }
    if (a2)
      v8 = CFSTR("serviceType");
    else
      v8 = CFSTR("service_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 68);
  }
  if ((v5 & 1) != 0)
  {
    v9 = *(int *)(a1 + 60);
    if (v9 >= 0x3F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C143B8[v9];
    }
    if (a2)
      v11 = CFSTR("placeRequestType");
    else
      v11 = CFSTR("place_request_type");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "querySubstring");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("querySubstring");
    else
      v13 = CFSTR("query_substring");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  objc_msgSend((id)a1, "debugExperimentBranch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("debugExperimentBranch");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("debug_experiment_branch");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "offlineAbJson");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("offlineAbJson");
    else
      v19 = CFSTR("offline_ab_json");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __55__GEOABExperimentAssignment__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABExperimentAssignment _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOABExperimentAssignment__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOABExperimentAssignment)initWithDictionary:(id)a3
{
  return (GEOABExperimentAssignment *)-[GEOABExperimentAssignment _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOABDebugPanelExperimentBranch *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v5 = a2;
  if (!a1)
    goto LABEL_174;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_174;
  if (a3)
    v6 = CFSTR("serviceType");
  else
    v6 = CFSTR("service_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SERVICE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SERVICE_TYPE_DISPATCHER")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SERVICE_TYPE_ROUTING")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("SERVICE_TYPE_TILES")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_20;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setServiceType:", v9);
LABEL_20:

  if (a3)
    v10 = CFSTR("placeRequestType");
  else
    v10 = CFSTR("place_request_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
    {
      v13 = 5;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
    {
      v13 = 6;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
    {
      v13 = 7;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
    {
      v13 = 8;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
    {
      v13 = 9;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
    {
      v13 = 10;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v13 = 11;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
    {
      v13 = 12;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v13 = 13;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v13 = 14;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
    {
      v13 = 15;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v13 = 16;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
    {
      v13 = 17;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
    {
      v13 = 18;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
    {
      v13 = 19;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
    {
      v13 = 20;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
    {
      v13 = 21;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
    {
      v13 = 22;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
    {
      v13 = 23;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
    {
      v13 = 24;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
    {
      v13 = 25;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
    {
      v13 = 26;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
    {
      v13 = 27;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
    {
      v13 = 28;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
    {
      v13 = 29;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
    {
      v13 = 30;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
    {
      v13 = 31;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
    {
      v13 = 32;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
    {
      v13 = 33;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
    {
      v13 = 34;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
    {
      v13 = 35;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
    {
      v13 = 36;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
    {
      v13 = 37;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
    {
      v13 = 38;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v13 = 39;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
    {
      v13 = 40;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
    {
      v13 = 41;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
    {
      v13 = 42;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
    {
      v13 = 43;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
    {
      v13 = 44;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
    {
      v13 = 45;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
    {
      v13 = 46;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
    {
      v13 = 47;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
    {
      v13 = 48;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
    {
      v13 = 49;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v13 = 50;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
    {
      v13 = 51;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
    {
      v13 = 52;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
    {
      v13 = 53;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
    {
      v13 = 54;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
    {
      v13 = 55;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
    {
      v13 = 56;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
    {
      v13 = 57;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
    {
      v13 = 58;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
    {
      v13 = 59;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
    {
      v13 = 60;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
    {
      v13 = 61;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
    {
      v13 = 62;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_154;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_154:
    objc_msgSend(a1, "setPlaceRequestType:", v13);
  }

  if (a3)
    v14 = CFSTR("querySubstring");
  else
    v14 = CFSTR("query_substring");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(a1, "setQuerySubstring:", v16);

  }
  if (a3)
    v17 = CFSTR("debugExperimentBranch");
  else
    v17 = CFSTR("debug_experiment_branch");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOABDebugPanelExperimentBranch alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOABDebugPanelExperimentBranch initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOABDebugPanelExperimentBranch initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setDebugExperimentBranch:", v20);

  }
  if (a3)
    v22 = CFSTR("offlineAbJson");
  else
    v22 = CFSTR("offline_ab_json");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(a1, "setOfflineAbJson:", v24);

  }
LABEL_174:

  return a1;
}

- (GEOABExperimentAssignment)initWithJSON:(id)a3
{
  return (GEOABExperimentAssignment *)-[GEOABExperimentAssignment _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_524;
    else
      v8 = (int *)&readAll__nonRecursiveTag_525;
    GEOABExperimentAssignmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOABDebugPanelExperimentBranch readAll:](self->_debugExperimentBranch, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABExperimentAssignmentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABExperimentAssignmentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOABExperimentAssignmentIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOABExperimentAssignment readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    v6 = v9;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    if (self->_querySubstring)
    {
      PBDataWriterWriteStringField();
      v6 = v9;
    }
    if (self->_debugExperimentBranch)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_offlineAbJson)
    {
      PBDataWriterWriteStringField();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOABExperimentAssignment readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_serviceType;
    *((_BYTE *)v6 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_placeRequestType;
    *((_BYTE *)v6 + 68) |= 1u;
  }
  if (self->_querySubstring)
  {
    objc_msgSend(v6, "setQuerySubstring:");
    v4 = v6;
  }
  if (self->_debugExperimentBranch)
  {
    objc_msgSend(v6, "setDebugExperimentBranch:");
    v4 = v6;
  }
  if (self->_offlineAbJson)
  {
    objc_msgSend(v6, "setOfflineAbJson:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PBUnknownFields *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOABExperimentAssignmentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOABExperimentAssignment readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_serviceType;
    *(_BYTE *)(v5 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_placeRequestType;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_querySubstring, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[GEOABDebugPanelExperimentBranch copyWithZone:](self->_debugExperimentBranch, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_offlineAbJson, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *querySubstring;
  GEOABDebugPanelExperimentBranch *debugExperimentBranch;
  NSString *offlineAbJson;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOABExperimentAssignment readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_serviceType != *((_DWORD *)v4 + 16))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_placeRequestType != *((_DWORD *)v4 + 15))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_18;
  }
  querySubstring = self->_querySubstring;
  if ((unint64_t)querySubstring | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](querySubstring, "isEqual:"))
  {
    goto LABEL_18;
  }
  debugExperimentBranch = self->_debugExperimentBranch;
  if ((unint64_t)debugExperimentBranch | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOABDebugPanelExperimentBranch isEqual:](debugExperimentBranch, "isEqual:"))
      goto LABEL_18;
  }
  offlineAbJson = self->_offlineAbJson;
  if ((unint64_t)offlineAbJson | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](offlineAbJson, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;

  -[GEOABExperimentAssignment readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_serviceType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_placeRequestType;
LABEL_6:
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_querySubstring, "hash");
  v7 = v5 ^ -[GEOABDebugPanelExperimentBranch hash](self->_debugExperimentBranch, "hash") ^ v6;
  return v7 ^ -[NSString hash](self->_offlineAbJson, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  GEOABDebugPanelExperimentBranch *debugExperimentBranch;
  uint64_t v7;
  int *v8;

  v8 = (int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 68);
  if ((v5 & 2) != 0)
  {
    self->_serviceType = v8[16];
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v8 + 68);
  }
  if ((v5 & 1) != 0)
  {
    self->_placeRequestType = v8[15];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v8 + 5))
  {
    -[GEOABExperimentAssignment setQuerySubstring:](self, "setQuerySubstring:");
    v4 = v8;
  }
  debugExperimentBranch = self->_debugExperimentBranch;
  v7 = *((_QWORD *)v4 + 3);
  if (debugExperimentBranch)
  {
    if (!v7)
      goto LABEL_13;
    -[GEOABDebugPanelExperimentBranch mergeFrom:](debugExperimentBranch, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[GEOABExperimentAssignment setDebugExperimentBranch:](self, "setDebugExperimentBranch:");
  }
  v4 = v8;
LABEL_13:
  if (*((_QWORD *)v4 + 4))
  {
    -[GEOABExperimentAssignment setOfflineAbJson:](self, "setOfflineAbJson:");
    v4 = v8;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOABExperimentAssignmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_528);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOABExperimentAssignment readAll:](self, "readAll:", 0);
    -[GEOABDebugPanelExperimentBranch clearUnknownFields:](self->_debugExperimentBranch, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querySubstring, 0);
  objc_storeStrong((id *)&self->_offlineAbJson, 0);
  objc_storeStrong((id *)&self->_debugExperimentBranch, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
