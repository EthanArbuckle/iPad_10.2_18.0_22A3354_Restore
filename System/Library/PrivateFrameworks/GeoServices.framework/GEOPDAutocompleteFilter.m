@implementation GEOPDAutocompleteFilter

- (GEOPDAutocompleteFilter)init
{
  GEOPDAutocompleteFilter *v2;
  GEOPDAutocompleteFilter *v3;
  GEOPDAutocompleteFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteFilter;
  v2 = -[GEOPDAutocompleteFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteFilter)initWithData:(id)a3
{
  GEOPDAutocompleteFilter *v3;
  GEOPDAutocompleteFilter *v4;
  GEOPDAutocompleteFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteFilter;
  v3 = -[GEOPDAutocompleteFilter initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteFilter;
  -[GEOPDAutocompleteFilter dealloc](&v3, sel_dealloc);
}

- (void)_readRequestedEntryTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 128) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestedEntryTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)requestedEntryTypesCount
{
  -[GEOPDAutocompleteFilter _readRequestedEntryTypes]((uint64_t)self);
  return self->_requestedEntryTypes.count;
}

- (int)requestedEntryTypes
{
  -[GEOPDAutocompleteFilter _readRequestedEntryTypes]((uint64_t)self);
  return self->_requestedEntryTypes.list;
}

- (void)clearRequestedEntryTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Clear();
}

- (void)addRequestedEntryType:(int)a3
{
  -[GEOPDAutocompleteFilter _readRequestedEntryTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (int)requestedEntryTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_requestedEntryTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteFilter _readRequestedEntryTypes]((uint64_t)self);
  p_requestedEntryTypes = &self->_requestedEntryTypes;
  count = self->_requestedEntryTypes.count;
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
  return p_requestedEntryTypes->list[a3];
}

- (void)setRequestedEntryTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Set();
}

- (id)requestedEntryTypesAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C04720[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestedEntryTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND_PROFILE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_AREA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_RESOLVED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTION_INTENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPoiIconCategoryFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiIconCategoryFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPoiIconCategoryFilter
{
  -[GEOPDAutocompleteFilter _readPoiIconCategoryFilter]((uint64_t)self);
  return self->_poiIconCategoryFilter != 0;
}

- (GEOPDPoiIconCategoryFilter)poiIconCategoryFilter
{
  -[GEOPDAutocompleteFilter _readPoiIconCategoryFilter]((uint64_t)self);
  return self->_poiIconCategoryFilter;
}

- (void)setPoiIconCategoryFilter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, a3);
}

- (void)_readPlaceTypeFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 128) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceTypeFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)placeTypeFiltersCount
{
  -[GEOPDAutocompleteFilter _readPlaceTypeFilters]((uint64_t)self);
  return self->_placeTypeFilters.count;
}

- (int)placeTypeFilters
{
  -[GEOPDAutocompleteFilter _readPlaceTypeFilters]((uint64_t)self);
  return self->_placeTypeFilters.list;
}

- (void)clearPlaceTypeFilters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Clear();
}

- (void)addPlaceTypeFilter:(int)a3
{
  -[GEOPDAutocompleteFilter _readPlaceTypeFilters]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (int)placeTypeFilterAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_placeTypeFilters;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteFilter _readPlaceTypeFilters]((uint64_t)self);
  p_placeTypeFilters = &self->_placeTypeFilters;
  count = self->_placeTypeFilters.count;
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
  return p_placeTypeFilters->list[a3];
}

- (void)setPlaceTypeFilters:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Set();
}

- (id)placeTypeFiltersAsString:(int)a3
{
  __CFString *v3;
  id result;

  switch(a3)
  {
    case '#':
      v3 = CFSTR("TIME_ZONE");
      goto LABEL_3;
    case '$':
    case '%':
    case '&':
    case '\'':
    case '(':
    case ')':
    case '*':
    case '4':
    case '5':
    case '8':
    case ':':
    case ';':
    case '<':
    case '>':
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v3;
      break;
    case '+':
      result = CFSTR("SUB_LOCALITY");
      break;
    case ',':
      result = CFSTR("OCEAN");
      break;
    case '-':
      result = CFSTR("AOI");
      break;
    case '.':
      result = CFSTR("INLAND_WATER");
      break;
    case '/':
      result = CFSTR("BUSINESS");
      break;
    case '0':
      result = CFSTR("ISLAND");
      break;
    case '1':
      result = CFSTR("STREET");
      break;
    case '2':
      result = CFSTR("ADMIN");
      break;
    case '3':
      result = CFSTR("POSTAL");
      break;
    case '6':
      result = CFSTR("INTERSECTION");
      break;
    case '7':
      result = CFSTR("BUILDING");
      break;
    case '9':
      result = CFSTR("ADDRESS");
      break;
    case '=':
      result = CFSTR("CONTINENT");
      break;
    case '?':
      result = CFSTR("REGION");
      break;
    case '@':
      result = CFSTR("DIVISION");
      break;
    case 'A':
      result = CFSTR("PHYSICAL_FEATURE");
      break;
    default:
      v3 = CFSTR("UNKNOWN_PLACE_TYPE");
      switch(a3)
      {
        case 0:
          goto LABEL_3;
        case 1:
          result = CFSTR("COUNTRY");
          break;
        case 2:
          result = CFSTR("ADMINISTRATIVE_AREA");
          break;
        case 3:
          goto LABEL_9;
        case 4:
          result = CFSTR("SUB_ADMINISTRATIVE_AREA");
          break;
        default:
          if (a3 != 16)
            goto LABEL_9;
          result = CFSTR("LOCALITY");
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsPlaceTypeFilters:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
  {
    v4 = 64;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
  {
    v4 = 65;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isStrictMapRegion
{
  return self->_isStrictMapRegion;
}

- (void)setIsStrictMapRegion:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_isStrictMapRegion = a3;
}

- (void)setHasIsStrictMapRegion:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasIsStrictMapRegion
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readResultTypeFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 128) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultTypeFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)resultTypeFiltersCount
{
  -[GEOPDAutocompleteFilter _readResultTypeFilters]((uint64_t)self);
  return self->_resultTypeFilters.count;
}

- (int)resultTypeFilters
{
  -[GEOPDAutocompleteFilter _readResultTypeFilters]((uint64_t)self);
  return self->_resultTypeFilters.list;
}

- (void)clearResultTypeFilters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Clear();
}

- (void)addResultTypeFilter:(int)a3
{
  -[GEOPDAutocompleteFilter _readResultTypeFilters]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (int)resultTypeFilterAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_resultTypeFilters;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteFilter _readResultTypeFilters]((uint64_t)self);
  p_resultTypeFilters = &self->_resultTypeFilters;
  count = self->_resultTypeFilters.count;
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
  return p_resultTypeFilters->list[a3];
}

- (void)setResultTypeFilters:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Set();
}

- (id)resultTypeFiltersAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C045C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResultTypeFilters:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_POI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_PHYSICAL_FEATURE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_ADDRESS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_QUERY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAddressResultSubTypeFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 128) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressResultSubTypeFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasAddressResultSubTypeFilter
{
  -[GEOPDAutocompleteFilter _readAddressResultSubTypeFilter]((uint64_t)self);
  return self->_addressResultSubTypeFilter != 0;
}

- (GEOPDAddressResultSubTypeFilter)addressResultSubTypeFilter
{
  -[GEOPDAutocompleteFilter _readAddressResultSubTypeFilter]((uint64_t)self);
  return self->_addressResultSubTypeFilter;
}

- (void)setAddressResultSubTypeFilter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, a3);
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
  v8.super_class = (Class)GEOPDAutocompleteFilter;
  -[GEOPDAutocompleteFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 0xA)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C04720[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 48);
      }
      while (v7 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v10 = CFSTR("requestedEntryType");
    else
      v10 = CFSTR("requested_entry_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  objc_msgSend((id)a1, "poiIconCategoryFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("poiIconCategoryFilter");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("poi_icon_category_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v17 = 0;
      do
      {
        v18 = *(unsigned int *)(*v16 + 4 * v17);
        switch((int)v18)
        {
          case '#':
            v19 = CFSTR("TIME_ZONE");
            break;
          case '$':
          case '%':
          case '&':
          case '\'':
          case '(':
          case ')':
          case '*':
          case '4':
          case '5':
          case '8':
          case ':':
          case ';':
          case '<':
          case '>':
LABEL_27:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
          case '+':
            v19 = CFSTR("SUB_LOCALITY");
            break;
          case ',':
            v19 = CFSTR("OCEAN");
            break;
          case '-':
            v19 = CFSTR("AOI");
            break;
          case '.':
            v19 = CFSTR("INLAND_WATER");
            break;
          case '/':
            v19 = CFSTR("BUSINESS");
            break;
          case '0':
            v19 = CFSTR("ISLAND");
            break;
          case '1':
            v19 = CFSTR("STREET");
            break;
          case '2':
            v19 = CFSTR("ADMIN");
            break;
          case '3':
            v19 = CFSTR("POSTAL");
            break;
          case '6':
            v19 = CFSTR("INTERSECTION");
            break;
          case '7':
            v19 = CFSTR("BUILDING");
            break;
          case '9':
            v19 = CFSTR("ADDRESS");
            break;
          case '=':
            v19 = CFSTR("CONTINENT");
            break;
          case '?':
            v19 = CFSTR("REGION");
            break;
          case '@':
            v19 = CFSTR("DIVISION");
            break;
          case 'A':
            v19 = CFSTR("PHYSICAL_FEATURE");
            break;
          default:
            v19 = CFSTR("UNKNOWN_PLACE_TYPE");
            switch((int)v18)
            {
              case 0:
                goto LABEL_46;
              case 1:
                v19 = CFSTR("COUNTRY");
                break;
              case 2:
                v19 = CFSTR("ADMINISTRATIVE_AREA");
                break;
              case 3:
                goto LABEL_27;
              case 4:
                v19 = CFSTR("SUB_ADMINISTRATIVE_AREA");
                break;
              default:
                if ((_DWORD)v18 != 16)
                  goto LABEL_27;
                v19 = CFSTR("LOCALITY");
                break;
            }
            break;
        }
LABEL_46:
        objc_msgSend(v15, "addObject:", v19);

        ++v17;
        v16 = (_QWORD *)(a1 + 24);
      }
      while (v17 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v20 = CFSTR("placeTypeFilter");
    else
      v20 = CFSTR("place_type_filter");
    objc_msgSend(v4, "setObject:forKey:", v15, v20);

  }
  if ((*(_BYTE *)(a1 + 128) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 124));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("isStrictMapRegion");
    else
      v22 = CFSTR("is_strict_map_region");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v25 = 0;
      do
      {
        v26 = *(int *)(*v24 + 4 * v25);
        if (v26 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v26);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = off_1E1C045C0[v26];
        }
        objc_msgSend(v23, "addObject:", v27);

        ++v25;
        v24 = (_QWORD *)(a1 + 72);
      }
      while (v25 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v28 = CFSTR("resultTypeFilter");
    else
      v28 = CFSTR("result_type_filter");
    objc_msgSend(v4, "setObject:forKey:", v23, v28);

  }
  objc_msgSend((id)a1, "addressResultSubTypeFilter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("addressResultSubTypeFilter");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("address_result_sub_type_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  v33 = *(void **)(a1 + 16);
  if (v33)
  {
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __53__GEOPDAutocompleteFilter__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E1C00600;
      v37 = v36;
      v41 = v37;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v40);
      v38 = v37;

      v35 = v38;
    }
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDAutocompleteFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteFilter)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteFilter *)-[GEOPDAutocompleteFilter _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  GEOPDPoiIconCategoryFilter *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  id v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  GEOPDAddressResultSubTypeFilter *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("requestedEntryType");
      else
        v7 = CFSTR("requested_entry_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v52 = v5;
      v51 = a3;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v48 = v8;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        if (!v10)
          goto LABEL_40;
        v11 = v10;
        v12 = *(_QWORD *)v62;
        while (1)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v62 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
              {
                v16 = 0;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
              {
                v16 = 1;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
              {
                v16 = 2;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
              {
                v16 = 3;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BRAND_PROFILE")) & 1) != 0)
              {
                v16 = 4;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OFFLINE_AREA")) & 1) != 0)
              {
                v16 = 5;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CLIENT_RESOLVED")) & 1) != 0)
              {
                v16 = 6;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DIRECTION_INTENT")) & 1) != 0)
              {
                v16 = 7;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
              {
                v16 = 8;
              }
              else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PUBLISHER")))
              {
                v16 = 9;
              }
              else
              {
                v16 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v16 = objc_msgSend(v14, "intValue");
            }
            objc_msgSend(v6, "addRequestedEntryType:", v16);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
          if (!v11)
          {
LABEL_40:

            v5 = v52;
            v8 = v48;
            break;
          }
        }
      }

      if (a3)
        v17 = CFSTR("poiIconCategoryFilter");
      else
        v17 = CFSTR("poi_icon_category_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOPDPoiIconCategoryFilter alloc];
        if (v19)
          v20 = -[GEOPDPoiIconCategoryFilter _initWithDictionary:isJSON:](v19, v18, a3);
        else
          v20 = 0;
        objc_msgSend(v6, "setPoiIconCategoryFilter:", v20);

      }
      if (a3)
        v21 = CFSTR("placeTypeFilter");
      else
        v21 = CFSTR("place_type_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v49 = v22;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (!v24)
          goto LABEL_109;
        v25 = v24;
        v26 = *(_QWORD *)v58;
        while (1)
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v58 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = v28;
              if ((objc_msgSend(v29, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
              {
                v30 = 0;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
              {
                v30 = 1;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
              {
                v30 = 2;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
              {
                v30 = 4;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
              {
                v30 = 16;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
              {
                v30 = 35;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
              {
                v30 = 43;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
              {
                v30 = 44;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
              {
                v30 = 45;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
              {
                v30 = 46;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
              {
                v30 = 47;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
              {
                v30 = 48;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
              {
                v30 = 49;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
              {
                v30 = 50;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
              {
                v30 = 51;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
              {
                v30 = 54;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
              {
                v30 = 55;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
              {
                v30 = 57;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
              {
                v30 = 61;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
              {
                v30 = 63;
              }
              else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
              {
                v30 = 64;
              }
              else if (objc_msgSend(v29, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
              {
                v30 = 65;
              }
              else
              {
                v30 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v30 = objc_msgSend(v28, "intValue");
            }
            objc_msgSend(v6, "addPlaceTypeFilter:", v30);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (!v25)
          {
LABEL_109:

            v5 = v52;
            a3 = v51;
            v22 = v49;
            break;
          }
        }
      }

      if (a3)
        v31 = CFSTR("isStrictMapRegion");
      else
        v31 = CFSTR("is_strict_map_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setIsStrictMapRegion:", objc_msgSend(v32, "BOOLValue"));

      if (a3)
        v33 = CFSTR("resultTypeFilter");
      else
        v33 = CFSTR("result_type_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v50 = v34;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
        if (!v36)
          goto LABEL_142;
        v37 = v36;
        v38 = *(_QWORD *)v54;
        while (1)
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v54 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = v40;
              if ((objc_msgSend(v41, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_UNKNOWN")) & 1) != 0)
              {
                v42 = 0;
              }
              else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_POI")) & 1) != 0)
              {
                v42 = 1;
              }
              else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_PHYSICAL_FEATURE")) & 1) != 0)
              {
                v42 = 2;
              }
              else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_ADDRESS")) & 1) != 0)
              {
                v42 = 3;
              }
              else if (objc_msgSend(v41, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_FILTER_QUERY")))
              {
                v42 = 4;
              }
              else
              {
                v42 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v42 = objc_msgSend(v40, "intValue");
            }
            objc_msgSend(v6, "addResultTypeFilter:", v42);
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
          if (!v37)
          {
LABEL_142:

            v5 = v52;
            a3 = v51;
            v34 = v50;
            break;
          }
        }
      }

      if (a3)
        v43 = CFSTR("addressResultSubTypeFilter");
      else
        v43 = CFSTR("address_result_sub_type_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = [GEOPDAddressResultSubTypeFilter alloc];
        if (v45)
          v46 = (void *)-[GEOPDAddressResultSubTypeFilter _initWithDictionary:isJSON:](v45, v44, a3);
        else
          v46 = 0;
        objc_msgSend(v6, "setAddressResultSubTypeFilter:", v46);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOPDAutocompleteFilter)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteFilter *)-[GEOPDAutocompleteFilter _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_329;
    else
      v8 = (int *)&readAll__nonRecursiveTag_330;
    GEOPDAutocompleteFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self->_poiIconCategoryFilter, 1);
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self->_addressResultSubTypeFilter, 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDAutocompleteFilterIsDirty((uint64_t)self))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteFilter readAll:](self, "readAll:", 0);
    v5 = v11;
    if (self->_requestedEntryTypes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v11;
        ++v6;
      }
      while (v6 < self->_requestedEntryTypes.count);
    }
    if (self->_poiIconCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v11;
    }
    if (self->_placeTypeFilters.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v11;
        ++v7;
      }
      while (v7 < self->_placeTypeFilters.count);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v11;
    }
    if (self->_resultTypeFilters.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v11;
        ++v8;
      }
      while (v8 < self->_resultTypeFilters.count);
    }
    if (self->_addressResultSubTypeFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v11;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  id *v13;

  v13 = (id *)a3;
  -[GEOPDAutocompleteFilter readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 28) = self->_readerMarkPos;
  *((_DWORD *)v13 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPDAutocompleteFilter requestedEntryTypesCount](self, "requestedEntryTypesCount"))
  {
    objc_msgSend(v13, "clearRequestedEntryTypes");
    v4 = -[GEOPDAutocompleteFilter requestedEntryTypesCount](self, "requestedEntryTypesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v13, "addRequestedEntryType:", -[GEOPDAutocompleteFilter requestedEntryTypeAtIndex:](self, "requestedEntryTypeAtIndex:", i));
    }
  }
  if (self->_poiIconCategoryFilter)
    objc_msgSend(v13, "setPoiIconCategoryFilter:");
  if (-[GEOPDAutocompleteFilter placeTypeFiltersCount](self, "placeTypeFiltersCount"))
  {
    objc_msgSend(v13, "clearPlaceTypeFilters");
    v7 = -[GEOPDAutocompleteFilter placeTypeFiltersCount](self, "placeTypeFiltersCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v13, "addPlaceTypeFilter:", -[GEOPDAutocompleteFilter placeTypeFilterAtIndex:](self, "placeTypeFilterAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v13 + 124) = self->_isStrictMapRegion;
    *((_BYTE *)v13 + 128) |= 1u;
  }
  if (-[GEOPDAutocompleteFilter resultTypeFiltersCount](self, "resultTypeFiltersCount"))
  {
    objc_msgSend(v13, "clearResultTypeFilters");
    v10 = -[GEOPDAutocompleteFilter resultTypeFiltersCount](self, "resultTypeFiltersCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v13, "addResultTypeFilter:", -[GEOPDAutocompleteFilter resultTypeFilterAtIndex:](self, "resultTypeFilterAtIndex:", k));
    }
  }
  if (self->_addressResultSubTypeFilter)
    objc_msgSend(v13, "setAddressResultSubTypeFilter:");

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
  PBUnknownFields *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAutocompleteFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteFilter readAll:](self, "readAll:", 0);
  PBRepeatedInt32Copy();
  v9 = -[GEOPDPoiIconCategoryFilter copyWithZone:](self->_poiIconCategoryFilter, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v9;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 124) = self->_isStrictMapRegion;
    *(_BYTE *)(v5 + 128) |= 1u;
  }
  PBRepeatedInt32Copy();
  v11 = -[GEOPDAddressResultSubTypeFilter copyWithZone:](self->_addressResultSubTypeFilter, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v11;

  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPoiIconCategoryFilter *poiIconCategoryFilter;
  GEOPDAddressResultSubTypeFilter *addressResultSubTypeFilter;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDAutocompleteFilter readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_17;
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  if ((unint64_t)poiIconCategoryFilter | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOPDPoiIconCategoryFilter isEqual:](poiIconCategoryFilter, "isEqual:"))
      goto LABEL_17;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_17;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 1) != 0)
    {
      if (self->_isStrictMapRegion)
      {
        if (!*((_BYTE *)v4 + 124))
          goto LABEL_17;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_14;
    }
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if ((*((_BYTE *)v4 + 128) & 1) != 0)
    goto LABEL_17;
LABEL_14:
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_17;
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  if ((unint64_t)addressResultSubTypeFilter | *((_QWORD *)v4 + 12))
    v7 = -[GEOPDAddressResultSubTypeFilter isEqual:](addressResultSubTypeFilter, "isEqual:");
  else
    v7 = 1;
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOPDAutocompleteFilter readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  v4 = -[GEOPDPoiIconCategoryFilter hash](self->_poiIconCategoryFilter, "hash");
  v5 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_isStrictMapRegion;
  else
    v6 = 0;
  v7 = v4 ^ v3;
  v8 = v5 ^ v6 ^ PBRepeatedInt32Hash();
  return v7 ^ v8 ^ -[GEOPDAddressResultSubTypeFilter hash](self->_addressResultSubTypeFilter, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  GEOPDPoiIconCategoryFilter *poiIconCategoryFilter;
  BOOL *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  GEOPDAddressResultSubTypeFilter *addressResultSubTypeFilter;
  BOOL *v17;
  void *v18;
  BOOL *v19;

  v19 = (BOOL *)a3;
  objc_msgSend(v19, "readAll:", 0);
  v4 = objc_msgSend(v19, "requestedEntryTypesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOPDAutocompleteFilter addRequestedEntryType:](self, "addRequestedEntryType:", objc_msgSend(v19, "requestedEntryTypeAtIndex:", i));
  }
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  v8 = v19;
  v9 = (void *)*((_QWORD *)v19 + 13);
  if (poiIconCategoryFilter)
  {
    if (!v9)
      goto LABEL_10;
    -[GEOPDPoiIconCategoryFilter mergeFrom:]((uint64_t)poiIconCategoryFilter, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_10;
    -[GEOPDAutocompleteFilter setPoiIconCategoryFilter:](self, "setPoiIconCategoryFilter:", *((_QWORD *)v19 + 13));
  }
  v8 = v19;
LABEL_10:
  v10 = objc_msgSend(v8, "placeTypeFiltersCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[GEOPDAutocompleteFilter addPlaceTypeFilter:](self, "addPlaceTypeFilter:", objc_msgSend(v19, "placeTypeFilterAtIndex:", j));
  }
  if (v19[128])
  {
    self->_isStrictMapRegion = v19[124];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v13 = objc_msgSend(v19, "resultTypeFiltersCount");
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[GEOPDAutocompleteFilter addResultTypeFilter:](self, "addResultTypeFilter:", objc_msgSend(v19, "resultTypeFilterAtIndex:", k));
  }
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  v17 = v19;
  v18 = (void *)*((_QWORD *)v19 + 12);
  if (addressResultSubTypeFilter)
  {
    if (v18)
    {
      -[GEOPDAddressResultSubTypeFilter mergeFrom:]((uint64_t)addressResultSubTypeFilter, v18);
LABEL_23:
      v17 = v19;
    }
  }
  else if (v18)
  {
    -[GEOPDAutocompleteFilter setAddressResultSubTypeFilter:](self, "setAddressResultSubTypeFilter:", *((_QWORD *)v19 + 12));
    goto LABEL_23;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_333);
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
  *(_BYTE *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteFilter readAll:](self, "readAll:", 0);
    -[GEOPDPoiIconCategoryFilter clearUnknownFields:]((uint64_t)self->_poiIconCategoryFilter, 1);
    -[GEOPDAddressResultSubTypeFilter clearUnknownFields:]((uint64_t)self->_addressResultSubTypeFilter, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, 0);
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
