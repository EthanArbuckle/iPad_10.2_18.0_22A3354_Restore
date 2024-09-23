@implementation GEOPDAutocompleteParameters

- (GEOPDAutocompleteParameters)init
{
  GEOPDAutocompleteParameters *v2;
  GEOPDAutocompleteParameters *v3;
  GEOPDAutocompleteParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParameters;
  v2 = -[GEOPDAutocompleteParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParameters)initWithData:(id)a3
{
  GEOPDAutocompleteParameters *v3;
  GEOPDAutocompleteParameters *v4;
  GEOPDAutocompleteParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParameters;
  v3 = -[GEOPDAutocompleteParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteParameters;
  -[GEOPDAutocompleteParameters dealloc](&v3, sel_dealloc);
}

- (int)requestType
{
  os_unfair_lock_s *p_readerLock;
  $5C80C8B0C09BC17277FBA3E6A168903A flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_requestType;
  else
    return 0;
}

- (void)setRequestType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40001u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  self->_flags = ($5C80C8B0C09BC17277FBA3E6A168903A)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000);
}

- (BOOL)hasRequestType
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E1C04638[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_FULL_ENTRIES_ONLY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_LOCALITIES_AND_LANDMARKS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES_WITH_BROWSE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_SIRI_SEARCH")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_ADDRESS_ONLY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_VENUE_SEARCH")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_BRAND_PROFILE_SEARCH")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_OFFLINE_REGION_SEARCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_POI_ADDRESS_ONLY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_COLLECTIONS_ONLY")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readFullEntries
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFullEntries_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasFullEntries
{
  -[GEOPDAutocompleteParameters _readFullEntries]((uint64_t)self);
  return self->_fullEntries != 0;
}

- (GEOPDAutocompleteParametersFullEntriesOnly)fullEntries
{
  -[GEOPDAutocompleteParameters _readFullEntries]((uint64_t)self);
  return self->_fullEntries;
}

- (void)setFullEntries:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x41000u;
  objc_storeStrong((id *)&self->_fullEntries, a3);
}

- (void)_readAllEntries
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllEntries_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAllEntries
{
  -[GEOPDAutocompleteParameters _readAllEntries]((uint64_t)self);
  return self->_allEntries != 0;
}

- (GEOPDAutocompleteParametersAllEntries)allEntries
{
  -[GEOPDAutocompleteParameters _readAllEntries]((uint64_t)self);
  return self->_allEntries;
}

- (void)setAllEntries:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40080u;
  objc_storeStrong((id *)&self->_allEntries, a3);
}

- (void)_readLocalitiesAndLandmarks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalitiesAndLandmarks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasLocalitiesAndLandmarks
{
  -[GEOPDAutocompleteParameters _readLocalitiesAndLandmarks]((uint64_t)self);
  return self->_localitiesAndLandmarks != 0;
}

- (GEOPDAutocompleteParametersLocalitiesAndLandmarks)localitiesAndLandmarks
{
  -[GEOPDAutocompleteParameters _readLocalitiesAndLandmarks]((uint64_t)self);
  return self->_localitiesAndLandmarks;
}

- (void)setLocalitiesAndLandmarks:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x42000u;
  objc_storeStrong((id *)&self->_localitiesAndLandmarks, a3);
}

- (void)_readAllEntriesWithBrowse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllEntriesWithBrowse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAllEntriesWithBrowse
{
  -[GEOPDAutocompleteParameters _readAllEntriesWithBrowse]((uint64_t)self);
  return self->_allEntriesWithBrowse != 0;
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)allEntriesWithBrowse
{
  -[GEOPDAutocompleteParameters _readAllEntriesWithBrowse]((uint64_t)self);
  return self->_allEntriesWithBrowse;
}

- (void)setAllEntriesWithBrowse:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40040u;
  objc_storeStrong((id *)&self->_allEntriesWithBrowse, a3);
}

- (void)_readSiriSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 174) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSiriSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasSiriSearch
{
  -[GEOPDAutocompleteParameters _readSiriSearch]((uint64_t)self);
  return self->_siriSearch != 0;
}

- (GEOPDAutocompleteParametersSiriSearch)siriSearch
{
  -[GEOPDAutocompleteParameters _readSiriSearch]((uint64_t)self);
  return self->_siriSearch;
}

- (void)setSiriSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x50000u;
  objc_storeStrong((id *)&self->_siriSearch, a3);
}

- (void)_readAddressOnly
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressOnly_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAddressOnly
{
  -[GEOPDAutocompleteParameters _readAddressOnly]((uint64_t)self);
  return self->_addressOnly != 0;
}

- (GEOPDAutocompleteParametersAddressOnly)addressOnly
{
  -[GEOPDAutocompleteParameters _readAddressOnly]((uint64_t)self);
  return self->_addressOnly;
}

- (void)setAddressOnly:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40020u;
  objc_storeStrong((id *)&self->_addressOnly, a3);
}

- (void)_readVenueSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 174) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasVenueSearch
{
  -[GEOPDAutocompleteParameters _readVenueSearch]((uint64_t)self);
  return self->_venueSearch != 0;
}

- (GEOPDAutocompleteParametersVenueSearch)venueSearch
{
  -[GEOPDAutocompleteParameters _readVenueSearch]((uint64_t)self);
  return self->_venueSearch;
}

- (void)setVenueSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x60000u;
  objc_storeStrong((id *)&self->_venueSearch, a3);
}

- (void)_readBrandProfileSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandProfileSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasBrandProfileSearch
{
  -[GEOPDAutocompleteParameters _readBrandProfileSearch]((uint64_t)self);
  return self->_brandProfileSearch != 0;
}

- (GEOPDAutocompleteParametersBrandProfileSearch)brandProfileSearch
{
  -[GEOPDAutocompleteParameters _readBrandProfileSearch]((uint64_t)self);
  return self->_brandProfileSearch;
}

- (void)setBrandProfileSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40400u;
  objc_storeStrong((id *)&self->_brandProfileSearch, a3);
}

- (void)_readOfflineRegionSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineRegionSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasOfflineRegionSearch
{
  -[GEOPDAutocompleteParameters _readOfflineRegionSearch]((uint64_t)self);
  return self->_offlineRegionSearch != 0;
}

- (GEOPDAutocompleteParametersOfflineRegionSearch)offlineRegionSearch
{
  -[GEOPDAutocompleteParameters _readOfflineRegionSearch]((uint64_t)self);
  return self->_offlineRegionSearch;
}

- (void)setOfflineRegionSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x44000u;
  objc_storeStrong((id *)&self->_offlineRegionSearch, a3);
}

- (void)_readPoiAddressOnly
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiAddressOnly_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasPoiAddressOnly
{
  -[GEOPDAutocompleteParameters _readPoiAddressOnly]((uint64_t)self);
  return self->_poiAddressOnly != 0;
}

- (GEOPDAutocompleteParametersPoiAddressOnly)poiAddressOnly
{
  -[GEOPDAutocompleteParameters _readPoiAddressOnly]((uint64_t)self);
  return self->_poiAddressOnly;
}

- (void)setPoiAddressOnly:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000u;
  objc_storeStrong((id *)&self->_poiAddressOnly, a3);
}

- (void)_readAutocompleteFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAutocompleteFilter
{
  -[GEOPDAutocompleteParameters _readAutocompleteFilter]((uint64_t)self);
  return self->_autocompleteFilter != 0;
}

- (GEOPDAutocompleteFilter)autocompleteFilter
{
  -[GEOPDAutocompleteParameters _readAutocompleteFilter]((uint64_t)self);
  return self->_autocompleteFilter;
}

- (void)setAutocompleteFilter:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40100u;
  objc_storeStrong((id *)&self->_autocompleteFilter, a3);
}

- (BOOL)shouldPopulateMapsIdentifier
{
  return self->_shouldPopulateMapsIdentifier;
}

- (void)setShouldPopulateMapsIdentifier:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40002u;
  self->_shouldPopulateMapsIdentifier = a3;
}

- (void)setHasShouldPopulateMapsIdentifier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262146;
  else
    v3 = 0x40000;
  self->_flags = ($5C80C8B0C09BC17277FBA3E6A168903A)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasShouldPopulateMapsIdentifier
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)supportAutocompleteSessionData
{
  return self->_supportAutocompleteSessionData;
}

- (void)setSupportAutocompleteSessionData:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40004u;
  self->_supportAutocompleteSessionData = a3;
}

- (void)setHasSupportAutocompleteSessionData:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262148;
  else
    v3 = 0x40000;
  self->_flags = ($5C80C8B0C09BC17277FBA3E6A168903A)(*(_DWORD *)&self->_flags & 0xFFFBFFFB | v3);
}

- (BOOL)hasSupportAutocompleteSessionData
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readAutocompleteSessionData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteSessionData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAutocompleteSessionData
{
  -[GEOPDAutocompleteParameters _readAutocompleteSessionData]((uint64_t)self);
  return self->_autocompleteSessionData != 0;
}

- (GEOPDAutocompleteSessionData)autocompleteSessionData
{
  -[GEOPDAutocompleteParameters _readAutocompleteSessionData]((uint64_t)self);
  return self->_autocompleteSessionData;
}

- (void)setAutocompleteSessionData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40200u;
  objc_storeStrong((id *)&self->_autocompleteSessionData, a3);
}

- (void)_readCollectionOnly
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionOnly_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasCollectionOnly
{
  -[GEOPDAutocompleteParameters _readCollectionOnly]((uint64_t)self);
  return self->_collectionOnly != 0;
}

- (GEOPDAutocompleteParametersCollectionOnly)collectionOnly
{
  -[GEOPDAutocompleteParameters _readCollectionOnly]((uint64_t)self);
  return self->_collectionOnly;
}

- (void)setCollectionOnly:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40800u;
  objc_storeStrong((id *)&self->_collectionOnly, a3);
}

- (void)_readSupportedClientResolvedTypeWithSetupPrompts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedClientResolvedTypeWithSetupPrompts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)supportedClientResolvedTypeWithSetupPromptsCount
{
  -[GEOPDAutocompleteParameters _readSupportedClientResolvedTypeWithSetupPrompts]((uint64_t)self);
  return self->_supportedClientResolvedTypeWithSetupPrompts.count;
}

- (int)supportedClientResolvedTypeWithSetupPrompts
{
  -[GEOPDAutocompleteParameters _readSupportedClientResolvedTypeWithSetupPrompts]((uint64_t)self);
  return self->_supportedClientResolvedTypeWithSetupPrompts.list;
}

- (void)clearSupportedClientResolvedTypeWithSetupPrompts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  PBRepeatedInt32Clear();
}

- (void)addSupportedClientResolvedTypeWithSetupPrompt:(int)a3
{
  -[GEOPDAutocompleteParameters _readSupportedClientResolvedTypeWithSetupPrompts]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (int)supportedClientResolvedTypeWithSetupPromptAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedClientResolvedTypeWithSetupPrompts;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteParameters _readSupportedClientResolvedTypeWithSetupPrompts]((uint64_t)self);
  p_supportedClientResolvedTypeWithSetupPrompts = &self->_supportedClientResolvedTypeWithSetupPrompts;
  count = self->_supportedClientResolvedTypeWithSetupPrompts.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedClientResolvedTypeWithSetupPrompts->list[a3];
}

- (void)setSupportedClientResolvedTypeWithSetupPrompts:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  PBRepeatedInt32Set();
}

- (id)supportedClientResolvedTypeWithSetupPromptsAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C046D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedClientResolvedTypeWithSetupPrompts:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDAutocompleteParameters;
  -[GEOPDAutocompleteParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  int v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  _QWORD *v66;
  unint64_t v67;
  uint64_t v68;
  __CFString *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  _QWORD v78[4];
  id v79;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 172) & 1) != 0)
  {
    v5 = *(int *)(a1 + 164);
    if (v5 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 164));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C04638[v5];
    }
    if (a2)
      v7 = CFSTR("requestType");
    else
      v7 = CFSTR("request_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "fullEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("fullEntries");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("full_entries");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "allEntries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("allEntries");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("all_entries");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "localitiesAndLandmarks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("localitiesAndLandmarks");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("localities_and_landmarks");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "allEntriesWithBrowse");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("allEntriesWithBrowse");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("all_entries_with_browse");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "siriSearch");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("siriSearch");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("siri_search");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  objc_msgSend((id)a1, "addressOnly");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("addressOnly");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("address_only");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  objc_msgSend((id)a1, "venueSearch");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("venueSearch");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("venue_search");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  objc_msgSend((id)a1, "brandProfileSearch");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("brandProfileSearch");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("brand_profile_search");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  objc_msgSend((id)a1, "offlineRegionSearch");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "jsonRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("offlineRegionSearch");
    }
    else
    {
      objc_msgSend(v40, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("offline_region_search");
    }
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

  }
  objc_msgSend((id)a1, "poiAddressOnly");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "jsonRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("poiAddressOnly");
    }
    else
    {
      objc_msgSend(v44, "dictionaryRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("poi_address_only");
    }
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

  }
  objc_msgSend((id)a1, "autocompleteFilter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v48, "jsonRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("autocompleteFilter");
    }
    else
    {
      objc_msgSend(v48, "dictionaryRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("autocomplete_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

  }
  v52 = *(_DWORD *)(a1 + 172);
  if ((v52 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 168));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v54 = CFSTR("shouldPopulateMapsIdentifier");
    else
      v54 = CFSTR("should_populate_maps_identifier");
    objc_msgSend(v4, "setObject:forKey:", v53, v54);

    v52 = *(_DWORD *)(a1 + 172);
  }
  if ((v52 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 169));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v56 = CFSTR("supportAutocompleteSessionData");
    else
      v56 = CFSTR("support_autocomplete_session_data");
    objc_msgSend(v4, "setObject:forKey:", v55, v56);

  }
  objc_msgSend((id)a1, "autocompleteSessionData");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v57, "jsonRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = CFSTR("autocompleteSessionData");
    }
    else
    {
      objc_msgSend(v57, "dictionaryRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = CFSTR("autocomplete_session_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v59, v60);

  }
  objc_msgSend((id)a1, "collectionOnly");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v61, "jsonRepresentation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = CFSTR("collectionOnly");
    }
    else
    {
      objc_msgSend(v61, "dictionaryRepresentation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = CFSTR("collection_only");
    }
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v67 = 0;
      do
      {
        v68 = *(int *)(*v66 + 4 * v67);
        if (v68 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v68);
          v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = off_1E1C046D0[v68];
        }
        objc_msgSend(v65, "addObject:", v69);

        ++v67;
        v66 = (_QWORD *)(a1 + 24);
      }
      while (v67 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v70 = CFSTR("supportedClientResolvedTypeWithSetupPrompt");
    else
      v70 = CFSTR("supported_client_resolved_type_with_setup_prompt");
    objc_msgSend(v4, "setObject:forKey:", v65, v70);

  }
  v71 = *(void **)(a1 + 16);
  if (v71)
  {
    objc_msgSend(v71, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v72, "count"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __57__GEOPDAutocompleteParameters__dictionaryRepresentation___block_invoke;
      v78[3] = &unk_1E1C00600;
      v75 = v74;
      v79 = v75;
      objc_msgSend(v73, "enumerateKeysAndObjectsUsingBlock:", v78);
      v76 = v75;

      v73 = v76;
    }
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDAutocompleteParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParameters)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParameters *)-[GEOPDAutocompleteParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  GEOPDAutocompleteParametersFullEntriesOnly *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOPDAutocompleteParametersAllEntries *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOPDAutocompleteParametersLocalitiesAndLandmarks *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEOPDAutocompleteParametersAllEntriesWithBrowse *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  GEOPDAutocompleteParametersSiriSearch *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEOPDAutocompleteParametersAddressOnly *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  GEOPDAutocompleteParametersVenueSearch *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  GEOPDAutocompleteParametersBrandProfileSearch *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  GEOPDAutocompleteParametersOfflineRegionSearch *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  GEOPDAutocompleteParametersPoiAddressOnly *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  GEOPDAutocompleteFilter *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  GEOPDAutocompleteSessionData *v72;
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  GEOPDAutocompleteParametersCollectionOnly *v77;
  uint64_t v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  void *v87;
  id v88;
  uint64_t v89;
  void *v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_181;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("requestType");
    else
      v7 = CFSTR("request_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_FULL_ENTRIES_ONLY")) & 1) != 0)
      {
        v10 = 0;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_LOCALITIES_AND_LANDMARKS")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES_WITH_BROWSE")) & 1) != 0)
      {
        v10 = 3;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_SIRI_SEARCH")) & 1) != 0)
      {
        v10 = 4;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_ADDRESS_ONLY")) & 1) != 0)
      {
        v10 = 5;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_VENUE_SEARCH")) & 1) != 0)
      {
        v10 = 6;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_BRAND_PROFILE_SEARCH")) & 1) != 0)
      {
        v10 = 7;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_OFFLINE_REGION_SEARCH")) & 1) != 0)
      {
        v10 = 8;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_POI_ADDRESS_ONLY")) & 1) != 0)
      {
        v10 = 9;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("AUTOCOMPLETE_PARAMETERS_COLLECTIONS_ONLY")))
      {
        v10 = 10;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_34:

        if (a3)
          v11 = CFSTR("fullEntries");
        else
          v11 = CFSTR("full_entries");
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = [GEOPDAutocompleteParametersFullEntriesOnly alloc];
          if ((a3 & 1) != 0)
            v14 = -[GEOPDAutocompleteParametersFullEntriesOnly initWithJSON:](v13, "initWithJSON:", v12);
          else
            v14 = -[GEOPDAutocompleteParametersFullEntriesOnly initWithDictionary:](v13, "initWithDictionary:", v12);
          v15 = (void *)v14;
          objc_msgSend(v6, "setFullEntries:", v14);

        }
        if (a3)
          v16 = CFSTR("allEntries");
        else
          v16 = CFSTR("all_entries");
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = [GEOPDAutocompleteParametersAllEntries alloc];
          if ((a3 & 1) != 0)
            v19 = -[GEOPDAutocompleteParametersAllEntries initWithJSON:](v18, "initWithJSON:", v17);
          else
            v19 = -[GEOPDAutocompleteParametersAllEntries initWithDictionary:](v18, "initWithDictionary:", v17);
          v20 = (void *)v19;
          objc_msgSend(v6, "setAllEntries:", v19);

        }
        if (a3)
          v21 = CFSTR("localitiesAndLandmarks");
        else
          v21 = CFSTR("localities_and_landmarks");
        objc_msgSend(v5, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = [GEOPDAutocompleteParametersLocalitiesAndLandmarks alloc];
          if ((a3 & 1) != 0)
            v24 = -[GEOPDAutocompleteParametersLocalitiesAndLandmarks initWithJSON:](v23, "initWithJSON:", v22);
          else
            v24 = -[GEOPDAutocompleteParametersLocalitiesAndLandmarks initWithDictionary:](v23, "initWithDictionary:", v22);
          v25 = (void *)v24;
          objc_msgSend(v6, "setLocalitiesAndLandmarks:", v24);

        }
        if (a3)
          v26 = CFSTR("allEntriesWithBrowse");
        else
          v26 = CFSTR("all_entries_with_browse");
        objc_msgSend(v5, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = [GEOPDAutocompleteParametersAllEntriesWithBrowse alloc];
          if ((a3 & 1) != 0)
            v29 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse initWithJSON:](v28, "initWithJSON:", v27);
          else
            v29 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse initWithDictionary:](v28, "initWithDictionary:", v27);
          v30 = (void *)v29;
          objc_msgSend(v6, "setAllEntriesWithBrowse:", v29);

        }
        if (a3)
          v31 = CFSTR("siriSearch");
        else
          v31 = CFSTR("siri_search");
        objc_msgSend(v5, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = [GEOPDAutocompleteParametersSiriSearch alloc];
          if ((a3 & 1) != 0)
            v34 = -[GEOPDAutocompleteParametersSiriSearch initWithJSON:](v33, "initWithJSON:", v32);
          else
            v34 = -[GEOPDAutocompleteParametersSiriSearch initWithDictionary:](v33, "initWithDictionary:", v32);
          v35 = (void *)v34;
          objc_msgSend(v6, "setSiriSearch:", v34);

        }
        if (a3)
          v36 = CFSTR("addressOnly");
        else
          v36 = CFSTR("address_only");
        objc_msgSend(v5, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = [GEOPDAutocompleteParametersAddressOnly alloc];
          if ((a3 & 1) != 0)
            v39 = -[GEOPDAutocompleteParametersAddressOnly initWithJSON:](v38, "initWithJSON:", v37);
          else
            v39 = -[GEOPDAutocompleteParametersAddressOnly initWithDictionary:](v38, "initWithDictionary:", v37);
          v40 = (void *)v39;
          objc_msgSend(v6, "setAddressOnly:", v39);

        }
        if (a3)
          v41 = CFSTR("venueSearch");
        else
          v41 = CFSTR("venue_search");
        objc_msgSend(v5, "objectForKeyedSubscript:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v43 = [GEOPDAutocompleteParametersVenueSearch alloc];
          if ((a3 & 1) != 0)
            v44 = -[GEOPDAutocompleteParametersVenueSearch initWithJSON:](v43, "initWithJSON:", v42);
          else
            v44 = -[GEOPDAutocompleteParametersVenueSearch initWithDictionary:](v43, "initWithDictionary:", v42);
          v45 = (void *)v44;
          objc_msgSend(v6, "setVenueSearch:", v44);

        }
        if (a3)
          v46 = CFSTR("brandProfileSearch");
        else
          v46 = CFSTR("brand_profile_search");
        objc_msgSend(v5, "objectForKeyedSubscript:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v48 = [GEOPDAutocompleteParametersBrandProfileSearch alloc];
          if ((a3 & 1) != 0)
            v49 = -[GEOPDAutocompleteParametersBrandProfileSearch initWithJSON:](v48, "initWithJSON:", v47);
          else
            v49 = -[GEOPDAutocompleteParametersBrandProfileSearch initWithDictionary:](v48, "initWithDictionary:", v47);
          v50 = (void *)v49;
          objc_msgSend(v6, "setBrandProfileSearch:", v49);

        }
        if (a3)
          v51 = CFSTR("offlineRegionSearch");
        else
          v51 = CFSTR("offline_region_search");
        objc_msgSend(v5, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v53 = [GEOPDAutocompleteParametersOfflineRegionSearch alloc];
          if ((a3 & 1) != 0)
            v54 = -[GEOPDAutocompleteParametersOfflineRegionSearch initWithJSON:](v53, "initWithJSON:", v52);
          else
            v54 = -[GEOPDAutocompleteParametersOfflineRegionSearch initWithDictionary:](v53, "initWithDictionary:", v52);
          v55 = (void *)v54;
          objc_msgSend(v6, "setOfflineRegionSearch:", v54);

        }
        if (a3)
          v56 = CFSTR("poiAddressOnly");
        else
          v56 = CFSTR("poi_address_only");
        objc_msgSend(v5, "objectForKeyedSubscript:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v58 = [GEOPDAutocompleteParametersPoiAddressOnly alloc];
          if ((a3 & 1) != 0)
            v59 = -[GEOPDAutocompleteParametersPoiAddressOnly initWithJSON:](v58, "initWithJSON:", v57);
          else
            v59 = -[GEOPDAutocompleteParametersPoiAddressOnly initWithDictionary:](v58, "initWithDictionary:", v57);
          v60 = (void *)v59;
          objc_msgSend(v6, "setPoiAddressOnly:", v59);

        }
        if (a3)
          v61 = CFSTR("autocompleteFilter");
        else
          v61 = CFSTR("autocomplete_filter");
        objc_msgSend(v5, "objectForKeyedSubscript:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v63 = [GEOPDAutocompleteFilter alloc];
          if ((a3 & 1) != 0)
            v64 = -[GEOPDAutocompleteFilter initWithJSON:](v63, "initWithJSON:", v62);
          else
            v64 = -[GEOPDAutocompleteFilter initWithDictionary:](v63, "initWithDictionary:", v62);
          v65 = (void *)v64;
          objc_msgSend(v6, "setAutocompleteFilter:", v64);

        }
        if (a3)
          v66 = CFSTR("shouldPopulateMapsIdentifier");
        else
          v66 = CFSTR("should_populate_maps_identifier");
        objc_msgSend(v5, "objectForKeyedSubscript:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setShouldPopulateMapsIdentifier:", objc_msgSend(v67, "BOOLValue"));

        if (a3)
          v68 = CFSTR("supportAutocompleteSessionData");
        else
          v68 = CFSTR("support_autocomplete_session_data");
        objc_msgSend(v5, "objectForKeyedSubscript:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setSupportAutocompleteSessionData:", objc_msgSend(v69, "BOOLValue"));

        if (a3)
          v70 = CFSTR("autocompleteSessionData");
        else
          v70 = CFSTR("autocomplete_session_data");
        objc_msgSend(v5, "objectForKeyedSubscript:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v72 = [GEOPDAutocompleteSessionData alloc];
          if ((a3 & 1) != 0)
            v73 = -[GEOPDAutocompleteSessionData initWithJSON:](v72, "initWithJSON:", v71);
          else
            v73 = -[GEOPDAutocompleteSessionData initWithDictionary:](v72, "initWithDictionary:", v71);
          v74 = (void *)v73;
          objc_msgSend(v6, "setAutocompleteSessionData:", v73);

        }
        if (a3)
          v75 = CFSTR("collectionOnly");
        else
          v75 = CFSTR("collection_only");
        objc_msgSend(v5, "objectForKeyedSubscript:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v77 = [GEOPDAutocompleteParametersCollectionOnly alloc];
          if ((a3 & 1) != 0)
            v78 = -[GEOPDAutocompleteParametersCollectionOnly initWithJSON:](v77, "initWithJSON:", v76);
          else
            v78 = -[GEOPDAutocompleteParametersCollectionOnly initWithDictionary:](v77, "initWithDictionary:", v76);
          v79 = (void *)v78;
          objc_msgSend(v6, "setCollectionOnly:", v78);

        }
        if (a3)
          v80 = CFSTR("supportedClientResolvedTypeWithSetupPrompt");
        else
          v80 = CFSTR("supported_client_resolved_type_with_setup_prompt");
        objc_msgSend(v5, "objectForKeyedSubscript:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v91 = v81;
          v92 = v5;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v82 = v81;
          v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
          if (!v83)
            goto LABEL_179;
          v84 = v83;
          v85 = *(_QWORD *)v94;
          while (1)
          {
            for (i = 0; i != v84; ++i)
            {
              if (*(_QWORD *)v94 != v85)
                objc_enumerationMutation(v82);
              v87 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v88 = v87;
                if ((objc_msgSend(v88, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v89 = 0;
                }
                else if ((objc_msgSend(v88, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
                {
                  v89 = 1;
                }
                else if ((objc_msgSend(v88, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
                {
                  v89 = 2;
                }
                else if ((objc_msgSend(v88, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
                {
                  v89 = 3;
                }
                else if ((objc_msgSend(v88, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
                {
                  v89 = 4;
                }
                else if ((objc_msgSend(v88, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
                {
                  v89 = 5;
                }
                else if (objc_msgSend(v88, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
                {
                  v89 = 6;
                }
                else
                {
                  v89 = 0;
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                v89 = objc_msgSend(v87, "intValue");
              }
              objc_msgSend(v6, "addSupportedClientResolvedTypeWithSetupPrompt:", v89, v91, v92, (_QWORD)v93);
            }
            v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
            if (!v84)
            {
LABEL_179:

              v81 = v91;
              v5 = v92;
              break;
            }
          }
        }

        goto LABEL_181;
      }
      v10 = objc_msgSend(v8, "intValue");
    }
    objc_msgSend(v6, "setRequestType:", v10);
    goto LABEL_34;
  }
LABEL_181:

  return v6;
}

- (GEOPDAutocompleteParameters)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParameters *)-[GEOPDAutocompleteParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_584;
    else
      v8 = (int *)&readAll__nonRecursiveTag_585;
    GEOPDAutocompleteParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDAutocompleteParametersCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  $5C80C8B0C09BC17277FBA3E6A168903A flags;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteParametersIsDirty((uint64_t)self) & 1) == 0)
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteParameters readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v10;
    if (self->_fullEntries)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_allEntries)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_localitiesAndLandmarks)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_allEntriesWithBrowse)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_siriSearch)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_addressOnly)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_venueSearch)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_brandProfileSearch)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_offlineRegionSearch)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_poiAddressOnly)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_autocompleteFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
    }
    if (self->_autocompleteSessionData)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_collectionOnly)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_supportedClientResolvedTypeWithSetupPrompts.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < self->_supportedClientResolvedTypeWithSetupPrompts.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDAutocompleteParametersClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDAutocompleteParameters _readAddressOnly]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersAddressOnly hasGreenTeaWithValue:](self->_addressOnly, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteParameters _readAllEntries]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersAllEntries hasGreenTeaWithValue:](self->_allEntries, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteParameters _readAllEntriesWithBrowse]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersAllEntriesWithBrowse hasGreenTeaWithValue:](self->_allEntriesWithBrowse, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readBrandProfileSearch]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersBrandProfileSearch hasGreenTeaWithValue:](self->_brandProfileSearch, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readCollectionOnly]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersCollectionOnly hasGreenTeaWithValue:](self->_collectionOnly, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readFullEntries]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersFullEntriesOnly hasGreenTeaWithValue:](self->_fullEntries, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readLocalitiesAndLandmarks]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersLocalitiesAndLandmarks hasGreenTeaWithValue:](self->_localitiesAndLandmarks, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readOfflineRegionSearch]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersOfflineRegionSearch hasGreenTeaWithValue:](self->_offlineRegionSearch, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readPoiAddressOnly]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersPoiAddressOnly hasGreenTeaWithValue:](self->_poiAddressOnly, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readSiriSearch]((uint64_t)self);
  if (-[GEOPDAutocompleteParametersSiriSearch hasGreenTeaWithValue:](self->_siriSearch, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteParameters _readVenueSearch]((uint64_t)self);
  return -[GEOPDAutocompleteParametersVenueSearch hasGreenTeaWithValue:](self->_venueSearch, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $5C80C8B0C09BC17277FBA3E6A168903A flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id *v9;

  v9 = (id *)a3;
  -[GEOPDAutocompleteParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 38) = self->_readerMarkPos;
  *((_DWORD *)v9 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v9 + 41) = self->_requestType;
    *((_DWORD *)v9 + 43) |= 1u;
  }
  if (self->_fullEntries)
  {
    objc_msgSend(v9, "setFullEntries:");
    v4 = v9;
  }
  if (self->_allEntries)
  {
    objc_msgSend(v9, "setAllEntries:");
    v4 = v9;
  }
  if (self->_localitiesAndLandmarks)
  {
    objc_msgSend(v9, "setLocalitiesAndLandmarks:");
    v4 = v9;
  }
  if (self->_allEntriesWithBrowse)
  {
    objc_msgSend(v9, "setAllEntriesWithBrowse:");
    v4 = v9;
  }
  if (self->_siriSearch)
  {
    objc_msgSend(v9, "setSiriSearch:");
    v4 = v9;
  }
  if (self->_addressOnly)
  {
    objc_msgSend(v9, "setAddressOnly:");
    v4 = v9;
  }
  if (self->_venueSearch)
  {
    objc_msgSend(v9, "setVenueSearch:");
    v4 = v9;
  }
  if (self->_brandProfileSearch)
  {
    objc_msgSend(v9, "setBrandProfileSearch:");
    v4 = v9;
  }
  if (self->_offlineRegionSearch)
  {
    objc_msgSend(v9, "setOfflineRegionSearch:");
    v4 = v9;
  }
  if (self->_poiAddressOnly)
  {
    objc_msgSend(v9, "setPoiAddressOnly:");
    v4 = v9;
  }
  if (self->_autocompleteFilter)
  {
    objc_msgSend(v9, "setAutocompleteFilter:");
    v4 = v9;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_BYTE *)v4 + 168) = self->_shouldPopulateMapsIdentifier;
    *((_DWORD *)v4 + 43) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *((_BYTE *)v4 + 169) = self->_supportAutocompleteSessionData;
    *((_DWORD *)v4 + 43) |= 4u;
  }
  if (self->_autocompleteSessionData)
    objc_msgSend(v9, "setAutocompleteSessionData:");
  if (self->_collectionOnly)
    objc_msgSend(v9, "setCollectionOnly:");
  if (-[GEOPDAutocompleteParameters supportedClientResolvedTypeWithSetupPromptsCount](self, "supportedClientResolvedTypeWithSetupPromptsCount"))
  {
    objc_msgSend(v9, "clearSupportedClientResolvedTypeWithSetupPrompts");
    v6 = -[GEOPDAutocompleteParameters supportedClientResolvedTypeWithSetupPromptsCount](self, "supportedClientResolvedTypeWithSetupPromptsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addSupportedClientResolvedTypeWithSetupPrompt:", -[GEOPDAutocompleteParameters supportedClientResolvedTypeWithSetupPromptAtIndex:](self, "supportedClientResolvedTypeWithSetupPromptAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  $5C80C8B0C09BC17277FBA3E6A168903A flags;
  id v32;
  void *v33;
  id v34;
  void *v35;
  PBUnknownFields *v36;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAutocompleteParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteParameters readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_requestType;
    *(_DWORD *)(v5 + 172) |= 1u;
  }
  v9 = -[GEOPDAutocompleteParametersFullEntriesOnly copyWithZone:](self->_fullEntries, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v9;

  v11 = -[GEOPDAutocompleteParametersAllEntries copyWithZone:](self->_allEntries, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[GEOPDAutocompleteParametersLocalitiesAndLandmarks copyWithZone:](self->_localitiesAndLandmarks, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v13;

  v15 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse copyWithZone:](self->_allEntriesWithBrowse, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = -[GEOPDAutocompleteParametersSiriSearch copyWithZone:](self->_siriSearch, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v17;

  v19 = -[GEOPDAutocompleteParametersAddressOnly copyWithZone:](self->_addressOnly, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  v21 = -[GEOPDAutocompleteParametersVenueSearch copyWithZone:](self->_venueSearch, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v21;

  v23 = -[GEOPDAutocompleteParametersBrandProfileSearch copyWithZone:](self->_brandProfileSearch, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v23;

  v25 = -[GEOPDAutocompleteParametersOfflineRegionSearch copyWithZone:](self->_offlineRegionSearch, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v25;

  v27 = -[GEOPDAutocompleteParametersPoiAddressOnly copyWithZone:](self->_poiAddressOnly, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v27;

  v29 = -[GEOPDAutocompleteFilter copyWithZone:](self->_autocompleteFilter, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v29;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 168) = self->_shouldPopulateMapsIdentifier;
    *(_DWORD *)(v5 + 172) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 169) = self->_supportAutocompleteSessionData;
    *(_DWORD *)(v5 + 172) |= 4u;
  }
  v32 = -[GEOPDAutocompleteSessionData copyWithZone:](self->_autocompleteSessionData, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v32;

  v34 = -[GEOPDAutocompleteParametersCollectionOnly copyWithZone:](self->_collectionOnly, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v34;

  PBRepeatedInt32Copy();
  v36 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v36;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  GEOPDAutocompleteParametersFullEntriesOnly *fullEntries;
  GEOPDAutocompleteParametersAllEntries *allEntries;
  GEOPDAutocompleteParametersLocalitiesAndLandmarks *localitiesAndLandmarks;
  GEOPDAutocompleteParametersAllEntriesWithBrowse *allEntriesWithBrowse;
  GEOPDAutocompleteParametersSiriSearch *siriSearch;
  GEOPDAutocompleteParametersAddressOnly *addressOnly;
  GEOPDAutocompleteParametersVenueSearch *venueSearch;
  GEOPDAutocompleteParametersBrandProfileSearch *brandProfileSearch;
  GEOPDAutocompleteParametersOfflineRegionSearch *offlineRegionSearch;
  GEOPDAutocompleteParametersPoiAddressOnly *poiAddressOnly;
  GEOPDAutocompleteFilter *autocompleteFilter;
  $5C80C8B0C09BC17277FBA3E6A168903A flags;
  int v18;
  GEOPDAutocompleteSessionData *autocompleteSessionData;
  GEOPDAutocompleteParametersCollectionOnly *collectionOnly;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  -[GEOPDAutocompleteParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_DWORD *)v4 + 43);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 41))
      goto LABEL_50;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_50;
  }
  fullEntries = self->_fullEntries;
  if ((unint64_t)fullEntries | *((_QWORD *)v4 + 13)
    && !-[GEOPDAutocompleteParametersFullEntriesOnly isEqual:](fullEntries, "isEqual:"))
  {
    goto LABEL_50;
  }
  allEntries = self->_allEntries;
  if ((unint64_t)allEntries | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDAutocompleteParametersAllEntries isEqual:](allEntries, "isEqual:"))
      goto LABEL_50;
  }
  localitiesAndLandmarks = self->_localitiesAndLandmarks;
  if ((unint64_t)localitiesAndLandmarks | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOPDAutocompleteParametersLocalitiesAndLandmarks isEqual:](localitiesAndLandmarks, "isEqual:"))
      goto LABEL_50;
  }
  allEntriesWithBrowse = self->_allEntriesWithBrowse;
  if ((unint64_t)allEntriesWithBrowse | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDAutocompleteParametersAllEntriesWithBrowse isEqual:](allEntriesWithBrowse, "isEqual:"))
      goto LABEL_50;
  }
  siriSearch = self->_siriSearch;
  if ((unint64_t)siriSearch | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOPDAutocompleteParametersSiriSearch isEqual:](siriSearch, "isEqual:"))
      goto LABEL_50;
  }
  addressOnly = self->_addressOnly;
  if ((unint64_t)addressOnly | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDAutocompleteParametersAddressOnly isEqual:](addressOnly, "isEqual:"))
      goto LABEL_50;
  }
  venueSearch = self->_venueSearch;
  if ((unint64_t)venueSearch | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOPDAutocompleteParametersVenueSearch isEqual:](venueSearch, "isEqual:"))
      goto LABEL_50;
  }
  brandProfileSearch = self->_brandProfileSearch;
  if ((unint64_t)brandProfileSearch | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDAutocompleteParametersBrandProfileSearch isEqual:](brandProfileSearch, "isEqual:"))
      goto LABEL_50;
  }
  offlineRegionSearch = self->_offlineRegionSearch;
  if ((unint64_t)offlineRegionSearch | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOPDAutocompleteParametersOfflineRegionSearch isEqual:](offlineRegionSearch, "isEqual:"))
      goto LABEL_50;
  }
  poiAddressOnly = self->_poiAddressOnly;
  if ((unint64_t)poiAddressOnly | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOPDAutocompleteParametersPoiAddressOnly isEqual:](poiAddressOnly, "isEqual:"))
      goto LABEL_50;
  }
  autocompleteFilter = self->_autocompleteFilter;
  if ((unint64_t)autocompleteFilter | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDAutocompleteFilter isEqual:](autocompleteFilter, "isEqual:"))
      goto LABEL_50;
  }
  flags = self->_flags;
  v18 = *((_DWORD *)v4 + 43);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v18 & 2) == 0)
      goto LABEL_50;
    if (self->_shouldPopulateMapsIdentifier)
    {
      if (!*((_BYTE *)v4 + 168))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 168))
    {
      goto LABEL_50;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v18 & 4) != 0)
    {
      if (self->_supportAutocompleteSessionData)
      {
        if (!*((_BYTE *)v4 + 169))
          goto LABEL_50;
        goto LABEL_45;
      }
      if (!*((_BYTE *)v4 + 169))
        goto LABEL_45;
    }
LABEL_50:
    IsEqual = 0;
    goto LABEL_51;
  }
  if ((v18 & 4) != 0)
    goto LABEL_50;
LABEL_45:
  autocompleteSessionData = self->_autocompleteSessionData;
  if ((unint64_t)autocompleteSessionData | *((_QWORD *)v4 + 10)
    && !-[GEOPDAutocompleteSessionData isEqual:](autocompleteSessionData, "isEqual:"))
  {
    goto LABEL_50;
  }
  collectionOnly = self->_collectionOnly;
  if ((unint64_t)collectionOnly | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDAutocompleteParametersCollectionOnly isEqual:](collectionOnly, "isEqual:"))
      goto LABEL_50;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_51:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  $5C80C8B0C09BC17277FBA3E6A168903A flags;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  -[GEOPDAutocompleteParameters readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v20 = 2654435761 * self->_requestType;
  else
    v20 = 0;
  v19 = -[GEOPDAutocompleteParametersFullEntriesOnly hash](self->_fullEntries, "hash");
  v18 = -[GEOPDAutocompleteParametersAllEntries hash](self->_allEntries, "hash");
  v17 = -[GEOPDAutocompleteParametersLocalitiesAndLandmarks hash](self->_localitiesAndLandmarks, "hash");
  v3 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse hash](self->_allEntriesWithBrowse, "hash");
  v4 = -[GEOPDAutocompleteParametersSiriSearch hash](self->_siriSearch, "hash");
  v5 = -[GEOPDAutocompleteParametersAddressOnly hash](self->_addressOnly, "hash");
  v6 = -[GEOPDAutocompleteParametersVenueSearch hash](self->_venueSearch, "hash");
  v7 = -[GEOPDAutocompleteParametersBrandProfileSearch hash](self->_brandProfileSearch, "hash");
  v8 = -[GEOPDAutocompleteParametersOfflineRegionSearch hash](self->_offlineRegionSearch, "hash");
  v9 = -[GEOPDAutocompleteParametersPoiAddressOnly hash](self->_poiAddressOnly, "hash");
  v10 = -[GEOPDAutocompleteFilter hash](self->_autocompleteFilter, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v12 = 2654435761 * self->_shouldPopulateMapsIdentifier;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v12 = 0;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v13 = 2654435761 * self->_supportAutocompleteSessionData;
LABEL_9:
  v14 = v10 ^ v12 ^ v13 ^ -[GEOPDAutocompleteSessionData hash](self->_autocompleteSessionData, "hash");
  v15 = v19 ^ v20 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ -[GEOPDAutocompleteParametersCollectionOnly hash](self->_collectionOnly, "hash");
  return v15 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOPDAutocompleteParametersFullEntriesOnly *fullEntries;
  uint64_t v6;
  GEOPDAutocompleteParametersAllEntries *allEntries;
  uint64_t v8;
  GEOPDAutocompleteParametersLocalitiesAndLandmarks *localitiesAndLandmarks;
  uint64_t v10;
  GEOPDAutocompleteParametersAllEntriesWithBrowse *allEntriesWithBrowse;
  uint64_t v12;
  GEOPDAutocompleteParametersSiriSearch *siriSearch;
  uint64_t v14;
  GEOPDAutocompleteParametersAddressOnly *addressOnly;
  uint64_t v16;
  GEOPDAutocompleteParametersVenueSearch *venueSearch;
  uint64_t v18;
  GEOPDAutocompleteParametersBrandProfileSearch *brandProfileSearch;
  uint64_t v20;
  GEOPDAutocompleteParametersOfflineRegionSearch *offlineRegionSearch;
  uint64_t v22;
  GEOPDAutocompleteParametersPoiAddressOnly *poiAddressOnly;
  uint64_t v24;
  GEOPDAutocompleteFilter *autocompleteFilter;
  uint64_t v26;
  int v27;
  GEOPDAutocompleteSessionData *autocompleteSessionData;
  uint64_t v29;
  GEOPDAutocompleteParametersCollectionOnly *collectionOnly;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  int *v35;

  v35 = (int *)a3;
  objc_msgSend(v35, "readAll:", 0);
  v4 = v35;
  if ((v35[43] & 1) != 0)
  {
    self->_requestType = v35[41];
    *(_DWORD *)&self->_flags |= 1u;
  }
  fullEntries = self->_fullEntries;
  v6 = *((_QWORD *)v35 + 13);
  if (fullEntries)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDAutocompleteParametersFullEntriesOnly mergeFrom:](fullEntries, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDAutocompleteParameters setFullEntries:](self, "setFullEntries:");
  }
  v4 = v35;
LABEL_9:
  allEntries = self->_allEntries;
  v8 = *((_QWORD *)v4 + 8);
  if (allEntries)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDAutocompleteParametersAllEntries mergeFrom:](allEntries, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDAutocompleteParameters setAllEntries:](self, "setAllEntries:");
  }
  v4 = v35;
LABEL_15:
  localitiesAndLandmarks = self->_localitiesAndLandmarks;
  v10 = *((_QWORD *)v4 + 14);
  if (localitiesAndLandmarks)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDAutocompleteParametersLocalitiesAndLandmarks mergeFrom:](localitiesAndLandmarks, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDAutocompleteParameters setLocalitiesAndLandmarks:](self, "setLocalitiesAndLandmarks:");
  }
  v4 = v35;
LABEL_21:
  allEntriesWithBrowse = self->_allEntriesWithBrowse;
  v12 = *((_QWORD *)v4 + 7);
  if (allEntriesWithBrowse)
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse mergeFrom:](allEntriesWithBrowse, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPDAutocompleteParameters setAllEntriesWithBrowse:](self, "setAllEntriesWithBrowse:");
  }
  v4 = v35;
LABEL_27:
  siriSearch = self->_siriSearch;
  v14 = *((_QWORD *)v4 + 17);
  if (siriSearch)
  {
    if (!v14)
      goto LABEL_33;
    -[GEOPDAutocompleteParametersSiriSearch mergeFrom:](siriSearch, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[GEOPDAutocompleteParameters setSiriSearch:](self, "setSiriSearch:");
  }
  v4 = v35;
LABEL_33:
  addressOnly = self->_addressOnly;
  v16 = *((_QWORD *)v4 + 6);
  if (addressOnly)
  {
    if (!v16)
      goto LABEL_39;
    -[GEOPDAutocompleteParametersAddressOnly mergeFrom:](addressOnly, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[GEOPDAutocompleteParameters setAddressOnly:](self, "setAddressOnly:");
  }
  v4 = v35;
LABEL_39:
  venueSearch = self->_venueSearch;
  v18 = *((_QWORD *)v4 + 18);
  if (venueSearch)
  {
    if (!v18)
      goto LABEL_45;
    -[GEOPDAutocompleteParametersVenueSearch mergeFrom:](venueSearch, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_45;
    -[GEOPDAutocompleteParameters setVenueSearch:](self, "setVenueSearch:");
  }
  v4 = v35;
LABEL_45:
  brandProfileSearch = self->_brandProfileSearch;
  v20 = *((_QWORD *)v4 + 11);
  if (brandProfileSearch)
  {
    if (!v20)
      goto LABEL_51;
    -[GEOPDAutocompleteParametersBrandProfileSearch mergeFrom:](brandProfileSearch, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_51;
    -[GEOPDAutocompleteParameters setBrandProfileSearch:](self, "setBrandProfileSearch:");
  }
  v4 = v35;
LABEL_51:
  offlineRegionSearch = self->_offlineRegionSearch;
  v22 = *((_QWORD *)v4 + 15);
  if (offlineRegionSearch)
  {
    if (!v22)
      goto LABEL_57;
    -[GEOPDAutocompleteParametersOfflineRegionSearch mergeFrom:](offlineRegionSearch, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_57;
    -[GEOPDAutocompleteParameters setOfflineRegionSearch:](self, "setOfflineRegionSearch:");
  }
  v4 = v35;
LABEL_57:
  poiAddressOnly = self->_poiAddressOnly;
  v24 = *((_QWORD *)v4 + 16);
  if (poiAddressOnly)
  {
    if (!v24)
      goto LABEL_63;
    -[GEOPDAutocompleteParametersPoiAddressOnly mergeFrom:](poiAddressOnly, "mergeFrom:");
  }
  else
  {
    if (!v24)
      goto LABEL_63;
    -[GEOPDAutocompleteParameters setPoiAddressOnly:](self, "setPoiAddressOnly:");
  }
  v4 = v35;
LABEL_63:
  autocompleteFilter = self->_autocompleteFilter;
  v26 = *((_QWORD *)v4 + 9);
  if (autocompleteFilter)
  {
    if (!v26)
      goto LABEL_69;
    -[GEOPDAutocompleteFilter mergeFrom:](autocompleteFilter, "mergeFrom:");
  }
  else
  {
    if (!v26)
      goto LABEL_69;
    -[GEOPDAutocompleteParameters setAutocompleteFilter:](self, "setAutocompleteFilter:");
  }
  v4 = v35;
LABEL_69:
  v27 = v4[43];
  if ((v27 & 2) != 0)
  {
    self->_shouldPopulateMapsIdentifier = *((_BYTE *)v4 + 168);
    *(_DWORD *)&self->_flags |= 2u;
    v27 = v4[43];
  }
  if ((v27 & 4) != 0)
  {
    self->_supportAutocompleteSessionData = *((_BYTE *)v4 + 169);
    *(_DWORD *)&self->_flags |= 4u;
  }
  autocompleteSessionData = self->_autocompleteSessionData;
  v29 = *((_QWORD *)v4 + 10);
  if (autocompleteSessionData)
  {
    if (!v29)
      goto LABEL_79;
    -[GEOPDAutocompleteSessionData mergeFrom:](autocompleteSessionData, "mergeFrom:");
  }
  else
  {
    if (!v29)
      goto LABEL_79;
    -[GEOPDAutocompleteParameters setAutocompleteSessionData:](self, "setAutocompleteSessionData:");
  }
  v4 = v35;
LABEL_79:
  collectionOnly = self->_collectionOnly;
  v31 = *((_QWORD *)v4 + 12);
  if (collectionOnly)
  {
    if (!v31)
      goto LABEL_85;
    -[GEOPDAutocompleteParametersCollectionOnly mergeFrom:](collectionOnly, "mergeFrom:");
  }
  else
  {
    if (!v31)
      goto LABEL_85;
    -[GEOPDAutocompleteParameters setCollectionOnly:](self, "setCollectionOnly:");
  }
  v4 = v35;
LABEL_85:
  v32 = objc_msgSend(v4, "supportedClientResolvedTypeWithSetupPromptsCount");
  if (v32)
  {
    v33 = v32;
    for (i = 0; i != v33; ++i)
      -[GEOPDAutocompleteParameters addSupportedClientResolvedTypeWithSetupPrompt:](self, "addSupportedClientResolvedTypeWithSetupPrompt:", objc_msgSend(v35, "supportedClientResolvedTypeWithSetupPromptAtIndex:", i));
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_588);
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
  *(_DWORD *)&self->_flags |= 0x40008u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteParameters readAll:](self, "readAll:", 0);
    -[GEOPDAutocompleteParametersFullEntriesOnly clearUnknownFields:](self->_fullEntries, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersAllEntries clearUnknownFields:](self->_allEntries, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersLocalitiesAndLandmarks clearUnknownFields:](self->_localitiesAndLandmarks, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse clearUnknownFields:](self->_allEntriesWithBrowse, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersSiriSearch clearUnknownFields:](self->_siriSearch, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersAddressOnly clearUnknownFields:](self->_addressOnly, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersVenueSearch clearUnknownFields:](self->_venueSearch, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersBrandProfileSearch clearUnknownFields:](self->_brandProfileSearch, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersOfflineRegionSearch clearUnknownFields:](self->_offlineRegionSearch, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersPoiAddressOnly clearUnknownFields:](self->_poiAddressOnly, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteFilter clearUnknownFields:](self->_autocompleteFilter, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteSessionData clearUnknownFields:](self->_autocompleteSessionData, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteParametersCollectionOnly clearUnknownFields:](self->_collectionOnly, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueSearch, 0);
  objc_storeStrong((id *)&self->_siriSearch, 0);
  objc_storeStrong((id *)&self->_poiAddressOnly, 0);
  objc_storeStrong((id *)&self->_offlineRegionSearch, 0);
  objc_storeStrong((id *)&self->_localitiesAndLandmarks, 0);
  objc_storeStrong((id *)&self->_fullEntries, 0);
  objc_storeStrong((id *)&self->_collectionOnly, 0);
  objc_storeStrong((id *)&self->_brandProfileSearch, 0);
  objc_storeStrong((id *)&self->_autocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_autocompleteFilter, 0);
  objc_storeStrong((id *)&self->_allEntries, 0);
  objc_storeStrong((id *)&self->_allEntriesWithBrowse, 0);
  objc_storeStrong((id *)&self->_addressOnly, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
