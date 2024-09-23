@implementation GEOPlaceSearchRequest

- (GEOPlaceSearchRequest)initWithTraits:(id)a3
{
  id v4;
  GEOPlaceSearchRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  GEOPlaceSearchRequest *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GEOPlaceSearchRequest;
  v5 = -[GEOPlaceSearchRequest init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "deviceLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "deviceLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "latLng");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlaceSearchRequest setDeviceLocation:](v5, "setDeviceLocation:", v8);

      +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "currentCountrySupportsDirections"))
      {
        v10 = objc_msgSend(v4, "transportTypesCount");

        if (v10)
        {
          -[GEOPlaceSearchRequest setIncludeTravelTime:](v5, "setIncludeTravelTime:", 1);
          -[GEOPlaceSearchRequest setIncludeTravelDistance:](v5, "setIncludeTravelDistance:", 1);
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v4, "hasMapRegion"))
    {
      objc_msgSend(v4, "mapRegion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlaceSearchRequest setMapRegion:](v5, "setMapRegion:", v11);

    }
    if (objc_msgSend(v4, "deviceDisplayLanguagesCount"))
    {
      objc_msgSend(v4, "deviceDisplayLanguages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlaceSearchRequest setInputLanguage:](v5, "setInputLanguage:", v13);

    }
    if (objc_msgSend(v4, "hasDeviceSpokenLocale"))
    {
      -[GEOPlaceSearchRequest setIncludeSpokenNames:](v5, "setIncludeSpokenNames:", 1);
      objc_msgSend(v4, "deviceSpokenLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlaceSearchRequest setPhoneticLocaleIdentifier:](v5, "setPhoneticLocaleIdentifier:", v14);

    }
    if (objc_msgSend(v4, "hasSessionId"))
    {
      v15 = objc_msgSend(v4, "sessionId");
      -[GEOPlaceSearchRequest setSessionGUID:](v5, "setSessionGUID:", v15, v16);
    }
    if (objc_msgSend(v4, "hasSequenceNumber"))
      -[GEOPlaceSearchRequest setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v4, "sequenceNumber"));
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "localSearchProviderID");

    if ((_DWORD)v18)
      -[GEOPlaceSearchRequest setLocalSearchProviderID:](v5, "setLocalSearchProviderID:", v18);
    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "countryCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceSearchRequest setDeviceCountryCode:](v5, "setDeviceCountryCode:", v20);

    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "abbreviation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceSearchRequest setDeviceTimeZone:](v5, "setDeviceTimeZone:", v22);

    if (objc_msgSend(v4, "hasIsAPICall"))
      -[GEOPlaceSearchRequest setIsFromAPI:](v5, "setIsFromAPI:", objc_msgSend(v4, "isAPICall"));
    if (objc_msgSend(v4, "hasSource"))
    {
      v23 = objc_msgSend(v4, "source");
      if (v23 - 1 >= 0x17)
        v24 = 0;
      else
        v24 = v23;
      -[GEOPlaceSearchRequest setSearchSource:](v5, "setSearchSource:", v24);
    }
    +[GEOGeoServiceTag defaultTag](GEOGeoServiceTag, "defaultTag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceSearchRequest addServiceTag:](v5, "addServiceTag:", v25);

    if (objc_msgSend(v4, "hasTimeSinceMapEnteredForeground"))
      -[GEOPlaceSearchRequest setTimeSinceMapEnteredForeground:](v5, "setTimeSinceMapEnteredForeground:", (double)objc_msgSend(v4, "timeSinceMapEnteredForeground"));
    if (objc_msgSend(v4, "hasTimeSinceMapViewportChanged"))
      -[GEOPlaceSearchRequest setTimeSinceMapViewportChanged:](v5, "setTimeSinceMapViewportChanged:", (double)objc_msgSend(v4, "timeSinceMapViewportChanged"));
    if (objc_msgSend(v4, "hasMode"))
    {
      v26 = objc_msgSend(v4, "mode");
      if (v26 <= 4)
        -[GEOPlaceSearchRequest setMapMode:](v5, "setMapMode:", v26);
    }
    v27 = v5;
  }

  return v5;
}

- (GEOPlaceSearchRequest)init
{
  GEOPlaceSearchRequest *v2;
  GEOPlaceSearchRequest *v3;
  GEOPlaceSearchRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceSearchRequest;
  v2 = -[GEOPlaceSearchRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceSearchRequest)initWithData:(id)a3
{
  GEOPlaceSearchRequest *v3;
  GEOPlaceSearchRequest *v4;
  GEOPlaceSearchRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceSearchRequest;
  v3 = -[GEOPlaceSearchRequest initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPlaceSearchRequest;
  -[GEOPlaceSearchRequest dealloc](&v3, sel_dealloc);
}

- (void)_readBusinessIDs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x40000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBusinessIDs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (unint64_t)businessIDsCount
{
  -[GEOPlaceSearchRequest _readBusinessIDs]((uint64_t)self);
  return self->_businessIDs.count;
}

- (unint64_t)businessIDs
{
  -[GEOPlaceSearchRequest _readBusinessIDs]((uint64_t)self);
  return self->_businessIDs.list;
}

- (void)clearBusinessIDs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  PBRepeatedUInt64Clear();
}

- (void)addBusinessID:(unint64_t)a3
{
  os_unfair_lock_s *p_readerLock;
  $AD124837EA5E8D01781224E63FEA3088 *p_flags;

  -[GEOPlaceSearchRequest _readBusinessIDs]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x40000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 0x80u;
}

- (unint64_t)businessIDAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_businessIDs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPlaceSearchRequest _readBusinessIDs]((uint64_t)self);
  p_businessIDs = &self->_businessIDs;
  count = self->_businessIDs.count;
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
  return p_businessIDs->list[a3];
}

- (void)setBusinessIDs:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  PBRepeatedUInt64Set();
}

- (void)_readAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAddress_tags_1879);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasAddress
{
  -[GEOPlaceSearchRequest _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEOAddress)address
{
  -[GEOPlaceSearchRequest _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLocation_tags_8);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasLocation
{
  -[GEOPlaceSearchRequest _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOPlaceSearchRequest _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_BYTE *)(a1 + 452) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearch
{
  -[GEOPlaceSearchRequest _readSearch]((uint64_t)self);
  return self->_search != 0;
}

- (NSString)search
{
  -[GEOPlaceSearchRequest _readSearch]((uint64_t)self);
  return self->_search;
}

- (void)setSearch:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x82u;
  objc_storeStrong((id *)&self->_search, a3);
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapRegion_tags_1880);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasMapRegion
{
  -[GEOPlaceSearchRequest _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOPlaceSearchRequest _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readAdditionalPlaceTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x20000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAdditionalPlaceTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (unint64_t)additionalPlaceTypesCount
{
  -[GEOPlaceSearchRequest _readAdditionalPlaceTypes]((uint64_t)self);
  return self->_additionalPlaceTypes.count;
}

- (int)additionalPlaceTypes
{
  -[GEOPlaceSearchRequest _readAdditionalPlaceTypes]((uint64_t)self);
  return self->_additionalPlaceTypes.list;
}

- (void)clearAdditionalPlaceTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  PBRepeatedInt32Clear();
}

- (void)addAdditionalPlaceType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $AD124837EA5E8D01781224E63FEA3088 *p_flags;

  -[GEOPlaceSearchRequest _readAdditionalPlaceTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 0x80u;
}

- (int)additionalPlaceTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_additionalPlaceTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPlaceSearchRequest _readAdditionalPlaceTypes]((uint64_t)self);
  p_additionalPlaceTypes = &self->_additionalPlaceTypes;
  count = self->_additionalPlaceTypes.count;
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
  return p_additionalPlaceTypes->list[a3];
}

- (void)setAdditionalPlaceTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  PBRepeatedInt32Set();
}

- (id)additionalPlaceTypesAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        result = CFSTR("DMA");
        break;
      case 'e':
        result = CFSTR("CAT_10284_POSTAL");
        break;
      case 'f':
        result = CFSTR("CAT_10285_CITY");
        break;
      case 'g':
        result = CFSTR("CAT_10286_COUNTY");
        break;
      case 'h':
        result = CFSTR("CAT_10287_STATE");
        break;
      case 'i':
        result = CFSTR("CAT_10288_COUNTRY");
        break;
      case 'j':
        result = CFSTR("CAT_10288_COUNTRY_CODE");
        break;
      case 'k':
        result = CFSTR("CAT_10287_STATE_CODE");
        break;
      default:
        if (a3 == 1016)
        {
          result = CFSTR("PERDU_CITY");
        }
        else
        {
LABEL_38:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
          result = v3;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '#':
        v3 = CFSTR("TIME_ZONE");
        goto LABEL_4;
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
      case '<':
      case '>':
      case '?':
      case '@':
        goto LABEL_38;
      case '+':
        result = CFSTR("NEIGHBORHOOD");
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
        result = CFSTR("POI");
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
      case ';':
        result = CFSTR("ZCTAS");
        break;
      case '=':
        result = CFSTR("CONTINENT");
        break;
      case 'A':
        result = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v3 = CFSTR("PT_UNKNOWN");
        switch(a3)
        {
          case 0:
            goto LABEL_4;
          case 1:
            result = CFSTR("COUNTRY");
            break;
          case 2:
            result = CFSTR("STATE");
            break;
          case 3:
            goto LABEL_38;
          case 4:
            result = CFSTR("COUNTY");
            break;
          default:
            if (a3 != 16)
              goto LABEL_38;
            result = CFSTR("CITY");
            break;
        }
        break;
    }
  }
  return result;
}

- (int)StringAsAdditionalPlaceTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEIGHBORHOOD")) & 1) != 0)
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI")) & 1) != 0)
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZCTAS")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERDU_CITY")) & 1) != 0)
  {
    v4 = 1016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DMA")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10284_POSTAL")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10285_CITY")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10286_COUNTY")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10287_STATE")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10288_COUNTRY")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10288_COUNTRY_CODE")) & 1) != 0)
  {
    v4 = 106;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10287_STATE_CODE")))
  {
    v4 = 107;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)includePhonetics
{
  return self->_includePhonetics;
}

- (void)setIncludePhonetics:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includePhonetics = a3;
}

- (void)setHasIncludePhonetics:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x1000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludePhonetics
{
  return (*(_QWORD *)&self->_flags >> 24) & 1;
}

- (int)maxResults
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800) != 0)
    return self->_maxResults;
  else
    return 10;
}

- (void)setMaxResults:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2048;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasMaxResults
{
  return (*(_QWORD *)&self->_flags >> 11) & 1;
}

- (GEOSessionID)sessionGUID
{
  GEOSessionID *p_sessionGUID;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionGUID = &self->_sessionGUID;
  high = self->_sessionGUID._high;
  low = p_sessionGUID->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setSessionGUID:(GEOSessionID)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_sessionGUID = a3;
}

- (void)setHasSessionGUID:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_BYTE *)&self->_flags + 8) = v3;
}

- (BOOL)hasSessionGUID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)businessSortOrder
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_businessSortOrder;
  else
    return 0;
}

- (void)setBusinessSortOrder:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_businessSortOrder = a3;
}

- (void)setHasBusinessSortOrder:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 64;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasBusinessSortOrder
{
  return (*(_QWORD *)&self->_flags >> 6) & 1;
}

- (id)businessSortOrderAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0F158[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBusinessSortOrder:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELEVANCE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RATING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISTANCE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)includeBusinessRating
{
  return self->_includeBusinessRating;
}

- (void)setIncludeBusinessRating:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeBusinessRating = a3;
}

- (void)setHasIncludeBusinessRating:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeBusinessRating
{
  return (*(_QWORD *)&self->_flags >> 18) & 1;
}

- (BOOL)includeBusinessCategories
{
  return self->_includeBusinessCategories;
}

- (void)setIncludeBusinessCategories:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeBusinessCategories = a3;
}

- (void)setHasIncludeBusinessCategories:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeBusinessCategories
{
  return (*(_QWORD *)&self->_flags >> 17) & 1;
}

- (int)maxBusinessReviews
{
  return self->_maxBusinessReviews;
}

- (void)setMaxBusinessReviews:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x400uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxBusinessReviews = a3;
}

- (void)setHasMaxBusinessReviews:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 1024;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasMaxBusinessReviews
{
  return (*(_QWORD *)&self->_flags >> 10) & 1;
}

- (void)_readFilterByBusinessCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readFilterByBusinessCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)filterByBusinessCategorys
{
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  return self->_filterByBusinessCategorys;
}

- (void)setFilterByBusinessCategorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *filterByBusinessCategorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  filterByBusinessCategorys = self->_filterByBusinessCategorys;
  self->_filterByBusinessCategorys = v4;

}

- (void)clearFilterByBusinessCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_filterByBusinessCategorys, "removeAllObjects");
}

- (void)addFilterByBusinessCategory:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsFilterByBusinessCategory:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  self->super.super.super.isa = (Class)((unint64_t)self->super.super.super.isa | 0x10000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsFilterByBusinessCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)filterByBusinessCategorysCount
{
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  return -[NSMutableArray count](self->_filterByBusinessCategorys, "count");
}

- (id)filterByBusinessCategoryAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_filterByBusinessCategorys, "objectAtIndex:", a3);
}

+ (Class)filterByBusinessCategoryType
{
  return (Class)objc_opt_class();
}

- (BOOL)isStrictMapRegion
{
  return self->_isStrictMapRegion;
}

- (void)setIsStrictMapRegion:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isStrictMapRegion = a3;
}

- (void)setHasIsStrictMapRegion:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsStrictMapRegion
{
  return (*(_QWORD *)&self->_flags >> 36) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x20uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 32;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTimestamp
{
  return (*(_QWORD *)&self->_flags >> 5) & 1;
}

- (void)_readZilchPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_BYTE *)(a1 + 452) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readZilchPoints_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasZilchPoints
{
  -[GEOPlaceSearchRequest _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints != 0;
}

- (NSData)zilchPoints
{
  -[GEOPlaceSearchRequest _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0xC0u;
  objc_storeStrong((id *)&self->_zilchPoints, a3);
}

- (BOOL)includeEntryPoints
{
  return self->_includeEntryPoints;
}

- (void)setIncludeEntryPoints:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeEntryPoints = a3;
}

- (void)setHasIncludeEntryPoints:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeEntryPoints
{
  return (*(_QWORD *)&self->_flags >> 19) & 1;
}

- (void)_readBusinessOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x400000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBusinessOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasBusinessOptions
{
  -[GEOPlaceSearchRequest _readBusinessOptions]((uint64_t)self);
  return self->_businessOptions != 0;
}

- (GEOBusinessOptions)businessOptions
{
  -[GEOPlaceSearchRequest _readBusinessOptions]((uint64_t)self);
  return self->_businessOptions;
}

- (void)setBusinessOptions:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_businessOptions, a3);
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 256;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_QWORD *)&self->_flags >> 8) & 1;
}

- (BOOL)includeSuggestionsOnly
{
  return self->_includeSuggestionsOnly;
}

- (void)setIncludeSuggestionsOnly:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeSuggestionsOnly = a3;
}

- (void)setHasIncludeSuggestionsOnly:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeSuggestionsOnly
{
  return (*(_QWORD *)&self->_flags >> 29) & 1;
}

- (BOOL)structuredSearch
{
  return self->_structuredSearch;
}

- (void)setStructuredSearch:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_structuredSearch = a3;
}

- (void)setHasStructuredSearch:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasStructuredSearch
{
  return (*(_QWORD *)&self->_flags >> 38) & 1;
}

- (void)_readSuggestionsPrefix
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_BYTE *)(a1 + 452) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSuggestionsPrefix_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSuggestionsPrefix
{
  -[GEOPlaceSearchRequest _readSuggestionsPrefix]((uint64_t)self);
  return self->_suggestionsPrefix != 0;
}

- (NSString)suggestionsPrefix
{
  -[GEOPlaceSearchRequest _readSuggestionsPrefix]((uint64_t)self);
  return self->_suggestionsPrefix;
}

- (void)setSuggestionsPrefix:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x90u;
  objc_storeStrong((id *)&self->_suggestionsPrefix, a3);
}

- (void)_readDeviceCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceCountryCode_tags_1881);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceCountryCode
{
  -[GEOPlaceSearchRequest _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOPlaceSearchRequest _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)_readDeviceLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceLocation_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceLocation
{
  -[GEOPlaceSearchRequest _readDeviceLocation]((uint64_t)self);
  return self->_deviceLocation != 0;
}

- (GEOLatLng)deviceLocation
{
  -[GEOPlaceSearchRequest _readDeviceLocation]((uint64_t)self);
  return self->_deviceLocation;
}

- (void)setDeviceLocation:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceLocation, a3);
}

- (void)_readInputLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readInputLanguage_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasInputLanguage
{
  -[GEOPlaceSearchRequest _readInputLanguage]((uint64_t)self);
  return self->_inputLanguage != 0;
}

- (NSString)inputLanguage
{
  -[GEOPlaceSearchRequest _readInputLanguage]((uint64_t)self);
  return self->_inputLanguage;
}

- (void)setInputLanguage:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_inputLanguage, a3);
}

- (void)_readPhoneticLocaleIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags_1882);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  -[GEOPlaceSearchRequest _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEOPlaceSearchRequest _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier;
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasSequenceNumber
{
  return (*(_QWORD *)&self->_flags >> 14) & 1;
}

- (BOOL)suppressResultsRequiringAttribution
{
  return self->_suppressResultsRequiringAttribution;
}

- (void)setSuppressResultsRequiringAttribution:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_suppressResultsRequiringAttribution = a3;
}

- (void)setHasSuppressResultsRequiringAttribution:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasSuppressResultsRequiringAttribution
{
  return (*(_QWORD *)&self->_flags >> 39) & 1;
}

- (BOOL)isFromAPI
{
  return self->_isFromAPI;
}

- (void)setIsFromAPI:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isFromAPI = a3;
}

- (void)setHasIsFromAPI:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x400000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsFromAPI
{
  return (*(_QWORD *)&self->_flags >> 34) & 1;
}

- (double)timeSinceMapEnteredForeground
{
  return self->_timeSinceMapEnteredForeground;
}

- (void)setTimeSinceMapEnteredForeground:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 8uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_timeSinceMapEnteredForeground = a3;
}

- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 8;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTimeSinceMapEnteredForeground
{
  return (*(_QWORD *)&self->_flags >> 3) & 1;
}

- (double)timeSinceMapViewportChanged
{
  return self->_timeSinceMapViewportChanged;
}

- (void)setTimeSinceMapViewportChanged:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x10uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_timeSinceMapViewportChanged = a3;
}

- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 16;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTimeSinceMapViewportChanged
{
  return (*(_QWORD *)&self->_flags >> 4) & 1;
}

- (BOOL)includeSpokenNames
{
  return self->_includeSpokenNames;
}

- (void)setIncludeSpokenNames:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeSpokenNames = a3;
}

- (void)setHasIncludeSpokenNames:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeSpokenNames
{
  return (*(_QWORD *)&self->_flags >> 27) & 1;
}

- (void)_readDeviceTimeZone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceTimeZone_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceTimeZone
{
  -[GEOPlaceSearchRequest _readDeviceTimeZone]((uint64_t)self);
  return self->_deviceTimeZone != 0;
}

- (NSString)deviceTimeZone
{
  -[GEOPlaceSearchRequest _readDeviceTimeZone]((uint64_t)self);
  return self->_deviceTimeZone;
}

- (void)setDeviceTimeZone:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceTimeZone, a3);
}

- (void)_readClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readClientCapabilities_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasClientCapabilities
{
  -[GEOPlaceSearchRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEOPlaceSearchRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (BOOL)includeTravelTime
{
  return self->_includeTravelTime;
}

- (void)setIncludeTravelTime:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeTravelTime = a3;
}

- (void)setHasIncludeTravelTime:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeTravelTime
{
  return (*(_QWORD *)&self->_flags >> 31) & 1;
}

- (int)transportTypeForTravelTimes
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000) != 0)
    return self->_transportTypeForTravelTimes;
  else
    return 0;
}

- (void)setTransportTypeForTravelTimes:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_transportTypeForTravelTimes = a3;
}

- (void)setHasTransportTypeForTravelTimes:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTransportTypeForTravelTimes
{
  return (*(_QWORD *)&self->_flags >> 15) & 1;
}

- (id)transportTypeForTravelTimesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0F170[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportTypeForTravelTimes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSuggestionsOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_BYTE *)(a1 + 452) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSuggestionsOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSuggestionsOptions
{
  -[GEOPlaceSearchRequest _readSuggestionsOptions]((uint64_t)self);
  return self->_suggestionsOptions != 0;
}

- (GEOSuggestionsOptions)suggestionsOptions
{
  -[GEOPlaceSearchRequest _readSuggestionsOptions]((uint64_t)self);
  return self->_suggestionsOptions;
}

- (void)setSuggestionsOptions:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x88u;
  objc_storeStrong((id *)&self->_suggestionsOptions, a3);
}

- (int)placeTypeLimit
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000) != 0)
    return self->_placeTypeLimit;
  else
    return 0;
}

- (void)setPlaceTypeLimit:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_placeTypeLimit = a3;
}

- (void)setHasPlaceTypeLimit:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4096;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasPlaceTypeLimit
{
  return (*(_QWORD *)&self->_flags >> 12) & 1;
}

- (id)placeTypeLimitAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        result = CFSTR("DMA");
        break;
      case 'e':
        result = CFSTR("CAT_10284_POSTAL");
        break;
      case 'f':
        result = CFSTR("CAT_10285_CITY");
        break;
      case 'g':
        result = CFSTR("CAT_10286_COUNTY");
        break;
      case 'h':
        result = CFSTR("CAT_10287_STATE");
        break;
      case 'i':
        result = CFSTR("CAT_10288_COUNTRY");
        break;
      case 'j':
        result = CFSTR("CAT_10288_COUNTRY_CODE");
        break;
      case 'k':
        result = CFSTR("CAT_10287_STATE_CODE");
        break;
      default:
        if (a3 == 1016)
        {
          result = CFSTR("PERDU_CITY");
        }
        else
        {
LABEL_38:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
          result = v3;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '#':
        v3 = CFSTR("TIME_ZONE");
        goto LABEL_4;
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
      case '<':
      case '>':
      case '?':
      case '@':
        goto LABEL_38;
      case '+':
        result = CFSTR("NEIGHBORHOOD");
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
        result = CFSTR("POI");
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
      case ';':
        result = CFSTR("ZCTAS");
        break;
      case '=':
        result = CFSTR("CONTINENT");
        break;
      case 'A':
        result = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v3 = CFSTR("PT_UNKNOWN");
        switch(a3)
        {
          case 0:
            goto LABEL_4;
          case 1:
            result = CFSTR("COUNTRY");
            break;
          case 2:
            result = CFSTR("STATE");
            break;
          case 3:
            goto LABEL_38;
          case 4:
            result = CFSTR("COUNTY");
            break;
          default:
            if (a3 != 16)
              goto LABEL_38;
            result = CFSTR("CITY");
            break;
        }
        break;
    }
  }
  return result;
}

- (int)StringAsPlaceTypeLimit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEIGHBORHOOD")) & 1) != 0)
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI")) & 1) != 0)
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZCTAS")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERDU_CITY")) & 1) != 0)
  {
    v4 = 1016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DMA")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10284_POSTAL")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10285_CITY")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10286_COUNTY")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10287_STATE")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10288_COUNTRY")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10288_COUNTRY_CODE")) & 1) != 0)
  {
    v4 = 106;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10287_STATE_CODE")))
  {
    v4 = 107;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isStrictGeocoding
{
  return self->_isStrictGeocoding;
}

- (void)setIsStrictGeocoding:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isStrictGeocoding = a3;
}

- (void)setHasIsStrictGeocoding:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x800000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsStrictGeocoding
{
  return (*(_QWORD *)&self->_flags >> 35) & 1;
}

- (BOOL)includeTravelDistance
{
  return self->_includeTravelDistance;
}

- (void)setIncludeTravelDistance:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeTravelDistance = a3;
}

- (void)setHasIncludeTravelDistance:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeTravelDistance
{
  return (*(_QWORD *)&self->_flags >> 30) & 1;
}

- (BOOL)includeRoadAccessPoints
{
  return self->_includeRoadAccessPoints;
}

- (void)setIncludeRoadAccessPoints:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeRoadAccessPoints = a3;
}

- (void)setHasIncludeRoadAccessPoints:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeRoadAccessPoints
{
  return (*(_QWORD *)&self->_flags >> 26) & 1;
}

- (void)_readLimitToCountryCodeIso2s
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLimitToCountryCodeIso2s_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)limitToCountryCodeIso2s
{
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  return self->_limitToCountryCodeIso2s;
}

- (void)setLimitToCountryCodeIso2s:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *limitToCountryCodeIso2s;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;
  self->_limitToCountryCodeIso2s = v4;

}

- (void)clearLimitToCountryCodeIso2s
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_limitToCountryCodeIso2s, "removeAllObjects");
}

- (void)addLimitToCountryCodeIso2:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsLimitToCountryCodeIso2:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  self->super.super.super.isa = (Class)((unint64_t)self->super.super.super.isa | 0x100000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsLimitToCountryCodeIso2:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 224);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v5;

      v4 = *(void **)(a1 + 224);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)limitToCountryCodeIso2sCount
{
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  return -[NSMutableArray count](self->_limitToCountryCodeIso2s, "count");
}

- (id)limitToCountryCodeIso2AtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_limitToCountryCodeIso2s, "objectAtIndex:", a3);
}

+ (Class)limitToCountryCodeIso2Type
{
  return (Class)objc_opt_class();
}

- (BOOL)isCanonicalLocationSearch
{
  return self->_isCanonicalLocationSearch;
}

- (void)setIsCanonicalLocationSearch:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isCanonicalLocationSearch = a3;
}

- (void)setHasIsCanonicalLocationSearch:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsCanonicalLocationSearch
{
  return (*(_QWORD *)&self->_flags >> 33) & 1;
}

- (int64_t)geoId
{
  return self->_geoId;
}

- (void)setGeoId:(int64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_geoId = a3;
}

- (void)setHasGeoId:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasGeoId
{
  return (*(_QWORD *)&self->_flags >> 1) & 1;
}

- (BOOL)includeQuads
{
  return self->_includeQuads;
}

- (void)setIncludeQuads:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeQuads = a3;
}

- (void)setHasIncludeQuads:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeQuads
{
  return (*(_QWORD *)&self->_flags >> 25) & 1;
}

- (BOOL)excludeAddressInResults
{
  return self->_excludeAddressInResults;
}

- (void)setExcludeAddressInResults:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_excludeAddressInResults = a3;
}

- (void)setHasExcludeAddressInResults:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasExcludeAddressInResults
{
  return (*(_QWORD *)&self->_flags >> 16) & 1;
}

- (void)_readSearchSubstrings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_BYTE *)(a1 + 452) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchSubstrings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)searchSubstrings
{
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  return self->_searchSubstrings;
}

- (void)setSearchSubstrings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *searchSubstrings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  searchSubstrings = self->_searchSubstrings;
  self->_searchSubstrings = v4;

}

- (void)clearSearchSubstrings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_searchSubstrings, "removeAllObjects");
}

- (void)addSearchSubstring:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsSearchSubstring:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  LOBYTE(self->_reader) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsSearchSubstring:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 288);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 288);
      *(_QWORD *)(a1 + 288) = v5;

      v4 = *(void **)(a1 + 288);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)searchSubstringsCount
{
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  return -[NSMutableArray count](self->_searchSubstrings, "count");
}

- (id)searchSubstringAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_searchSubstrings, "objectAtIndex:", a3);
}

+ (Class)searchSubstringType
{
  return (Class)objc_opt_class();
}

- (BOOL)includeGeoId
{
  return self->_includeGeoId;
}

- (void)setIncludeGeoId:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeGeoId = a3;
}

- (void)setHasIncludeGeoId:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeGeoId
{
  return (*(_QWORD *)&self->_flags >> 21) & 1;
}

- (void)_readSearchContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearchContext
{
  -[GEOPlaceSearchRequest _readSearchContext]((uint64_t)self);
  return self->_searchContext != 0;
}

- (NSString)searchContext
{
  -[GEOPlaceSearchRequest _readSearchContext]((uint64_t)self);
  return self->_searchContext;
}

- (void)setSearchContext:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchContext, a3);
}

- (void)_readSearchContextSubstring
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchContextSubstring_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearchContextSubstring
{
  -[GEOPlaceSearchRequest _readSearchContextSubstring]((uint64_t)self);
  return self->_searchContextSubstring != 0;
}

- (GEOSearchSubstring)searchContextSubstring
{
  -[GEOPlaceSearchRequest _readSearchContextSubstring]((uint64_t)self);
  return self->_searchContextSubstring;
}

- (void)setSearchContextSubstring:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchContextSubstring, a3);
}

- (BOOL)includeStatusCodeInfo
{
  return self->_includeStatusCodeInfo;
}

- (void)setIncludeStatusCodeInfo:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeStatusCodeInfo = a3;
}

- (void)setHasIncludeStatusCodeInfo:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeStatusCodeInfo
{
  return (*(_QWORD *)&self->_flags >> 28) & 1;
}

- (void)_readPreserveFields
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPreserveFields_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasPreserveFields
{
  -[GEOPlaceSearchRequest _readPreserveFields]((uint64_t)self);
  return self->_preserveFields != 0;
}

- (GEOAddress)preserveFields
{
  -[GEOPlaceSearchRequest _readPreserveFields]((uint64_t)self);
  return self->_preserveFields;
}

- (void)setPreserveFields:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_preserveFields, a3);
}

- (BOOL)includeUnmatchedStrings
{
  return self->_includeUnmatchedStrings;
}

- (void)setIncludeUnmatchedStrings:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeUnmatchedStrings = a3;
}

- (void)setHasIncludeUnmatchedStrings:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeUnmatchedStrings
{
  return HIDWORD(*(_QWORD *)&self->_flags) & 1;
}

- (void)_readIndexFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIndexFilter_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasIndexFilter
{
  -[GEOPlaceSearchRequest _readIndexFilter]((uint64_t)self);
  return self->_indexFilter != 0;
}

- (GEOIndexQueryNode)indexFilter
{
  -[GEOPlaceSearchRequest _readIndexFilter]((uint64_t)self);
  return self->_indexFilter;
}

- (void)setIndexFilter:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_indexFilter, a3);
}

- (BOOL)includeFeatureSets
{
  return self->_includeFeatureSets;
}

- (void)setIncludeFeatureSets:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeFeatureSets = a3;
}

- (void)setHasIncludeFeatureSets:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeFeatureSets
{
  return (*(_QWORD *)&self->_flags >> 20) & 1;
}

- (void)_readServiceTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_BYTE *)(a1 + 452) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readServiceTags_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  return self->_serviceTags;
}

- (void)setServiceTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceTags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;

}

- (void)clearServiceTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_serviceTags, "removeAllObjects");
}

- (void)addServiceTag:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  LOBYTE(self->_reader) |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 304);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 304);
      *(_QWORD *)(a1 + 304) = v5;

      v4 = *(void **)(a1 + 304);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)serviceTagsCount
{
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceTags, "count");
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceTags, "objectAtIndex:", a3);
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (unint64_t)intersectingGeoId
{
  return self->_intersectingGeoId;
}

- (void)setIntersectingGeoId:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_intersectingGeoId = a3;
}

- (void)setHasIntersectingGeoId:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIntersectingGeoId
{
  return (*(_QWORD *)&self->_flags >> 2) & 1;
}

- (void)_readKnownLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readKnownLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasKnownLocation
{
  -[GEOPlaceSearchRequest _readKnownLocation]((uint64_t)self);
  return self->_knownLocation != 0;
}

- (GEOLatLng)knownLocation
{
  -[GEOPlaceSearchRequest _readKnownLocation]((uint64_t)self);
  return self->_knownLocation;
}

- (void)setKnownLocation:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_knownLocation, a3);
}

- (int)knownAccuracy
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x80) != 0)
    return self->_knownAccuracy;
  else
    return 0;
}

- (void)setKnownAccuracy:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x80uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_knownAccuracy = a3;
}

- (void)setHasKnownAccuracy:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 128;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasKnownAccuracy
{
  return (*(_QWORD *)&self->_flags >> 7) & 1;
}

- (id)knownAccuracyAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0F1A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKnownAccuracy:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBPREMISE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)includeMatchedToken
{
  return self->_includeMatchedToken;
}

- (void)setIncludeMatchedToken:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeMatchedToken = a3;
}

- (void)setHasIncludeMatchedToken:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x400000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeMatchedToken
{
  return (*(_QWORD *)&self->_flags >> 22) & 1;
}

- (int)searchSource
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x2000) != 0)
    return self->_searchSource;
  else
    return 0;
}

- (void)setSearchSource:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_searchSource = a3;
}

- (void)setHasSearchSource:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasSearchSource
{
  return (*(_QWORD *)&self->_flags >> 13) & 1;
}

- (id)searchSourceAsString:(int)a3
{
  if (a3 < 0x18)
    return off_1E1C0F1D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFINEMENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPELLING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_CONTACTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_USER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_COMPLETION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_HINT_COMPLETION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_HISTORY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_HINT_HISTORY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_SEARCH")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_AUTOCOMPLETE_SEARCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_FROM")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_TO")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_FROM")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TO")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOKMARK_REFRESH")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRELOADER")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NO_TYPING")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_FAVORITES")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_COLLECTIONS")) & 1) != 0)
  {
    v4 = 22;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_HINT_COMPLETION")))
  {
    v4 = 23;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readOptionalSuppressionReasons
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x80000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readOptionalSuppressionReasons_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (unint64_t)optionalSuppressionReasonsCount
{
  -[GEOPlaceSearchRequest _readOptionalSuppressionReasons]((uint64_t)self);
  return self->_optionalSuppressionReasons.count;
}

- (int)optionalSuppressionReasons
{
  -[GEOPlaceSearchRequest _readOptionalSuppressionReasons]((uint64_t)self);
  return self->_optionalSuppressionReasons.list;
}

- (void)clearOptionalSuppressionReasons
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  PBRepeatedInt32Clear();
}

- (void)addOptionalSuppressionReason:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $AD124837EA5E8D01781224E63FEA3088 *p_flags;

  -[GEOPlaceSearchRequest _readOptionalSuppressionReasons]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 0x80u;
}

- (int)optionalSuppressionReasonAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_optionalSuppressionReasons;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPlaceSearchRequest _readOptionalSuppressionReasons]((uint64_t)self);
  p_optionalSuppressionReasons = &self->_optionalSuppressionReasons;
  count = self->_optionalSuppressionReasons.count;
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
  return p_optionalSuppressionReasons->list[a3];
}

- (void)setOptionalSuppressionReasons:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x80u;
  PBRepeatedInt32Set();
}

- (id)optionalSuppressionReasonsAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("OBSCURE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOptionalSuppressionReasons:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("OBSCURE"));
  return 1;
}

- (void)_readSearchLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchLocation_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearchLocation
{
  -[GEOPlaceSearchRequest _readSearchLocation]((uint64_t)self);
  return self->_searchLocation != 0;
}

- (GEOLatLng)searchLocation
{
  -[GEOPlaceSearchRequest _readSearchLocation]((uint64_t)self);
  return self->_searchLocation;
}

- (void)setSearchLocation:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchLocation, a3);
}

- (BOOL)includeNameForForwardGeocodingResults
{
  return self->_includeNameForForwardGeocodingResults;
}

- (void)setIncludeNameForForwardGeocodingResults:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeNameForForwardGeocodingResults = a3;
}

- (void)setHasIncludeNameForForwardGeocodingResults:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x800000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeNameForForwardGeocodingResults
{
  return (*(_QWORD *)&self->_flags >> 23) & 1;
}

- (void)_readAdditionalEnabledMarkets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  -[GEOPlaceSearchRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOPlaceSearchRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (int)mapMode
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200) != 0)
    return self->_mapMode;
  else
    return 0;
}

- (void)setMapMode:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_mapMode = a3;
}

- (void)setHasMapMode:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 512;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasMapMode
{
  return (*(_QWORD *)&self->_flags >> 9) & 1;
}

- (id)mapModeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0F298[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isPopularNearbyRequest
{
  return self->_isPopularNearbyRequest;
}

- (void)setIsPopularNearbyRequest:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isPopularNearbyRequest = a3;
}

- (void)setHasIsPopularNearbyRequest:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsPopularNearbyRequest
{
  return (*(_QWORD *)&self->_flags >> 37) & 1;
}

- (void)_readDeviceLocationCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_QWORD *)(a1 + 444) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceLocationCountryCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceLocationCountryCode
{
  -[GEOPlaceSearchRequest _readDeviceLocationCountryCode]((uint64_t)self);
  return self->_deviceLocationCountryCode != 0;
}

- (NSString)deviceLocationCountryCode
{
  -[GEOPlaceSearchRequest _readDeviceLocationCountryCode]((uint64_t)self);
  return self->_deviceLocationCountryCode;
}

- (void)setDeviceLocationCountryCode:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceLocationCountryCode, a3);
}

- (void)_readViewportCenterCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(_BYTE *)(a1 + 452) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readViewportCenterCountryCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasViewportCenterCountryCode
{
  -[GEOPlaceSearchRequest _readViewportCenterCountryCode]((uint64_t)self);
  return self->_viewportCenterCountryCode != 0;
}

- (NSString)viewportCenterCountryCode
{
  -[GEOPlaceSearchRequest _readViewportCenterCountryCode]((uint64_t)self);
  return self->_viewportCenterCountryCode;
}

- (void)setViewportCenterCountryCode:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0xA0u;
  objc_storeStrong((id *)&self->_viewportCenterCountryCode, a3);
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
  v8.super_class = (Class)GEOPlaceSearchRequest;
  -[GEOPlaceSearchRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceSearchRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceSearchRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  __CFString *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t j;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  __CFString *v116;
  void *v117;
  uint64_t v118;
  __CFString *v119;
  void *v120;
  _QWORD *v121;
  unint64_t v122;
  uint64_t v123;
  __CFString *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  __CFString *v134;
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  id v147;
  id v148;
  void *v150;
  void *v151;
  _QWORD v152[4];
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt64NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("businessID"));

  }
  objc_msgSend((id)a1, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("address"));
  }

  objc_msgSend((id)a1, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("location"));
  }

  objc_msgSend((id)a1, "search");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("search"));

  objc_msgSend((id)a1, "mapRegion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("mapRegion"));
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v18 = 0;
      do
      {
        v19 = *(unsigned int *)(*v17 + 4 * v18);
        if ((int)v19 > 99)
        {
          switch((int)v19)
          {
            case 'd':
              v20 = CFSTR("DMA");
              break;
            case 'e':
              v20 = CFSTR("CAT_10284_POSTAL");
              break;
            case 'f':
              v20 = CFSTR("CAT_10285_CITY");
              break;
            case 'g':
              v20 = CFSTR("CAT_10286_COUNTY");
              break;
            case 'h':
              v20 = CFSTR("CAT_10287_STATE");
              break;
            case 'i':
              v20 = CFSTR("CAT_10288_COUNTRY");
              break;
            case 'j':
              v20 = CFSTR("CAT_10288_COUNTRY_CODE");
              break;
            case 'k':
              v20 = CFSTR("CAT_10287_STATE_CODE");
              break;
            default:
              if ((_DWORD)v19 == 1016)
              {
                v20 = CFSTR("PERDU_CITY");
              }
              else
              {
LABEL_35:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
        }
        else
        {
          switch((int)v19)
          {
            case '#':
              v20 = CFSTR("TIME_ZONE");
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
            case '<':
            case '>':
            case '?':
            case '@':
              goto LABEL_35;
            case '+':
              v20 = CFSTR("NEIGHBORHOOD");
              break;
            case ',':
              v20 = CFSTR("OCEAN");
              break;
            case '-':
              v20 = CFSTR("AOI");
              break;
            case '.':
              v20 = CFSTR("INLAND_WATER");
              break;
            case '/':
              v20 = CFSTR("POI");
              break;
            case '0':
              v20 = CFSTR("ISLAND");
              break;
            case '1':
              v20 = CFSTR("STREET");
              break;
            case '2':
              v20 = CFSTR("ADMIN");
              break;
            case '3':
              v20 = CFSTR("POSTAL");
              break;
            case '6':
              v20 = CFSTR("INTERSECTION");
              break;
            case '7':
              v20 = CFSTR("BUILDING");
              break;
            case '9':
              v20 = CFSTR("ADDRESS");
              break;
            case ';':
              v20 = CFSTR("ZCTAS");
              break;
            case '=':
              v20 = CFSTR("CONTINENT");
              break;
            case 'A':
              v20 = CFSTR("PHYSICAL_FEATURE");
              break;
            default:
              v20 = CFSTR("PT_UNKNOWN");
              switch((int)v19)
              {
                case 0:
                  goto LABEL_60;
                case 1:
                  v20 = CFSTR("COUNTRY");
                  break;
                case 2:
                  v20 = CFSTR("STATE");
                  break;
                case 3:
                  goto LABEL_35;
                case 4:
                  v20 = CFSTR("COUNTY");
                  break;
                default:
                  if ((_DWORD)v19 != 16)
                    goto LABEL_35;
                  v20 = CFSTR("CITY");
                  break;
              }
              break;
          }
        }
LABEL_60:
        objc_msgSend(v16, "addObject:", v20);

        ++v18;
        v17 = (_QWORD *)(a1 + 24);
      }
      while (v18 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("additionalPlaceType"));

  }
  v21 = *(_QWORD *)(a1 + 444);
  if ((v21 & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 428));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("includePhonetics"));

    v21 = *(_QWORD *)(a1 + 444);
    if ((v21 & 0x800) == 0)
    {
LABEL_64:
      if ((v21 & 1) == 0)
        goto LABEL_65;
      goto LABEL_81;
    }
  }
  else if ((v21 & 0x800) == 0)
  {
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 400));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("maxResults"));

  v21 = *(_QWORD *)(a1 + 444);
  if ((v21 & 1) == 0)
  {
LABEL_65:
    if ((v21 & 0x40) == 0)
      goto LABEL_66;
    goto LABEL_82;
  }
LABEL_81:
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 96));
  v32 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("sessionGUID"));
  v21 = *(_QWORD *)(a1 + 444);
  if ((v21 & 0x40) == 0)
  {
LABEL_66:
    if ((v21 & 0x40000) == 0)
      goto LABEL_67;
    goto LABEL_139;
  }
LABEL_82:
  v33 = *(int *)(a1 + 380);
  if (v33 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 380));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_1E1C0F158[v33];
  }
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("businessSortOrder"));

  v21 = *(_QWORD *)(a1 + 444);
  if ((v21 & 0x40000) == 0)
  {
LABEL_67:
    if ((v21 & 0x20000) == 0)
      goto LABEL_68;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 422));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("includeBusinessRating"));

  v21 = *(_QWORD *)(a1 + 444);
  if ((v21 & 0x20000) == 0)
  {
LABEL_68:
    if ((v21 & 0x400) == 0)
      goto LABEL_70;
    goto LABEL_69;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 421));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("includeBusinessCategories"));

  if ((*(_QWORD *)(a1 + 444) & 0x400) != 0)
  {
LABEL_69:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 396));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("maxBusinessReviews"));

  }
LABEL_70:
  if (*(_QWORD *)(a1 + 176))
  {
    objc_msgSend((id)a1, "filterByBusinessCategorys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("filterByBusinessCategory"));

  }
  v24 = *(_QWORD *)(a1 + 444);
  if ((v24 & 0x1000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 440));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("isStrictMapRegion"));

    v24 = *(_QWORD *)(a1 + 444);
  }
  if ((v24 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 344));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("timestamp"));

  }
  objc_msgSend((id)a1, "zilchPoints");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "base64EncodedStringWithOptions:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("zilchPoints"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("zilchPoints"));
    }
  }

  if ((*(_QWORD *)(a1 + 444) & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 423));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("includeEntryPoints"));

  }
  objc_msgSend((id)a1, "businessOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v36, "jsonRepresentation");
    else
      objc_msgSend(v36, "dictionaryRepresentation");
    v38 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("businessOptions"));
  }

  v39 = *(_QWORD *)(a1 + 444);
  if ((v39 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 388));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("localSearchProviderID"));

    v39 = *(_QWORD *)(a1 + 444);
    if ((v39 & 0x20000000) == 0)
    {
LABEL_94:
      if ((v39 & 0x4000000000) == 0)
        goto LABEL_96;
      goto LABEL_95;
    }
  }
  else if ((v39 & 0x20000000) == 0)
  {
    goto LABEL_94;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 433));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("includeSuggestionsOnly"));

  if ((*(_QWORD *)(a1 + 444) & 0x4000000000) != 0)
  {
LABEL_95:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 442));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("structuredSearch"));

  }
LABEL_96:
  objc_msgSend((id)a1, "suggestionsPrefix");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("suggestionsPrefix"));

  objc_msgSend((id)a1, "deviceCountryCode");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("deviceCountryCode"));

  objc_msgSend((id)a1, "deviceLocation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v43, "jsonRepresentation");
    else
      objc_msgSend(v43, "dictionaryRepresentation");
    v47 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("deviceLocation"));
  }

  objc_msgSend((id)a1, "inputLanguage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("inputLanguage"));

  objc_msgSend((id)a1, "phoneticLocaleIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("phoneticLocaleIdentifier"));

  v50 = *(_QWORD *)(a1 + 444);
  if ((v50 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 412));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("sequenceNumber"));

    v50 = *(_QWORD *)(a1 + 444);
    if ((v50 & 0x8000000000) == 0)
    {
LABEL_114:
      if ((v50 & 0x400000000) == 0)
        goto LABEL_115;
      goto LABEL_126;
    }
  }
  else if ((v50 & 0x8000000000) == 0)
  {
    goto LABEL_114;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 443));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("suppressResultsRequiringAttribution"));

  v50 = *(_QWORD *)(a1 + 444);
  if ((v50 & 0x400000000) == 0)
  {
LABEL_115:
    if ((v50 & 8) == 0)
      goto LABEL_116;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 438));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("isFromAPI"));

  v50 = *(_QWORD *)(a1 + 444);
  if ((v50 & 8) == 0)
  {
LABEL_116:
    if ((v50 & 0x10) == 0)
      goto LABEL_117;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 328));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("timeSinceMapEnteredForeground"));

  v50 = *(_QWORD *)(a1 + 444);
  if ((v50 & 0x10) == 0)
  {
LABEL_117:
    if ((v50 & 0x8000000) == 0)
      goto LABEL_119;
    goto LABEL_118;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 336));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("timeSinceMapViewportChanged"));

  if ((*(_QWORD *)(a1 + 444) & 0x8000000) != 0)
  {
LABEL_118:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 431));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("includeSpokenNames"));

  }
LABEL_119:
  objc_msgSend((id)a1, "deviceTimeZone");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("deviceTimeZone"));

  objc_msgSend((id)a1, "clientCapabilities");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v53, "jsonRepresentation");
    else
      objc_msgSend(v53, "dictionaryRepresentation");
    v60 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("clientCapabilities"));
  }

  v61 = *(_QWORD *)(a1 + 444);
  if ((v61 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 435));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("includeTravelTime"));

    v61 = *(_QWORD *)(a1 + 444);
  }
  if ((v61 & 0x8000) != 0)
  {
    v63 = *(int *)(a1 + 416);
    if (v63 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 416));
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_1E1C0F170[v63];
    }
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("transportTypeForTravelTimes"));

  }
  objc_msgSend((id)a1, "suggestionsOptions");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v67)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v67, "jsonRepresentation");
    else
      objc_msgSend(v67, "dictionaryRepresentation");
    v69 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("suggestionsOptions"));
  }

  v70 = *(_QWORD *)(a1 + 444);
  if ((v70 & 0x1000) != 0)
  {
    v87 = *(_DWORD *)(a1 + 404);
    if (v87 > 99)
    {
      switch(v87)
      {
        case 'd':
          v88 = CFSTR("DMA");
          break;
        case 'e':
          v88 = CFSTR("CAT_10284_POSTAL");
          break;
        case 'f':
          v88 = CFSTR("CAT_10285_CITY");
          break;
        case 'g':
          v88 = CFSTR("CAT_10286_COUNTY");
          break;
        case 'h':
          v88 = CFSTR("CAT_10287_STATE");
          break;
        case 'i':
          v88 = CFSTR("CAT_10288_COUNTRY");
          break;
        case 'j':
          v88 = CFSTR("CAT_10288_COUNTRY_CODE");
          break;
        case 'k':
          v88 = CFSTR("CAT_10287_STATE_CODE");
          break;
        default:
          if (v87 == 1016)
          {
            v88 = CFSTR("PERDU_CITY");
          }
          else
          {
LABEL_292:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 404));
            v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          break;
      }
    }
    else
    {
      switch(v87)
      {
        case '#':
          v88 = CFSTR("TIME_ZONE");
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
        case '<':
        case '>':
        case '?':
        case '@':
          goto LABEL_292;
        case '+':
          v88 = CFSTR("NEIGHBORHOOD");
          break;
        case ',':
          v88 = CFSTR("OCEAN");
          break;
        case '-':
          v88 = CFSTR("AOI");
          break;
        case '.':
          v88 = CFSTR("INLAND_WATER");
          break;
        case '/':
          v88 = CFSTR("POI");
          break;
        case '0':
          v88 = CFSTR("ISLAND");
          break;
        case '1':
          v88 = CFSTR("STREET");
          break;
        case '2':
          v88 = CFSTR("ADMIN");
          break;
        case '3':
          v88 = CFSTR("POSTAL");
          break;
        case '6':
          v88 = CFSTR("INTERSECTION");
          break;
        case '7':
          v88 = CFSTR("BUILDING");
          break;
        case '9':
          v88 = CFSTR("ADDRESS");
          break;
        case ';':
          v88 = CFSTR("ZCTAS");
          break;
        case '=':
          v88 = CFSTR("CONTINENT");
          break;
        case 'A':
          v88 = CFSTR("PHYSICAL_FEATURE");
          break;
        default:
          v88 = CFSTR("PT_UNKNOWN");
          switch(v87)
          {
            case 0:
              goto LABEL_317;
            case 1:
              v88 = CFSTR("COUNTRY");
              break;
            case 2:
              v88 = CFSTR("STATE");
              break;
            case 3:
              goto LABEL_292;
            case 4:
              v88 = CFSTR("COUNTY");
              break;
            default:
              if (v87 != 16)
                goto LABEL_292;
              v88 = CFSTR("CITY");
              break;
          }
          break;
      }
    }
LABEL_317:
    objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("placeTypeLimit"));

    v70 = *(_QWORD *)(a1 + 444);
    if ((v70 & 0x800000000) == 0)
    {
LABEL_151:
      if ((v70 & 0x40000000) == 0)
        goto LABEL_152;
      goto LABEL_319;
    }
  }
  else if ((v70 & 0x800000000) == 0)
  {
    goto LABEL_151;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 439));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v150, CFSTR("isStrictGeocoding"));

  v70 = *(_QWORD *)(a1 + 444);
  if ((v70 & 0x40000000) == 0)
  {
LABEL_152:
    if ((v70 & 0x4000000) == 0)
      goto LABEL_154;
    goto LABEL_153;
  }
LABEL_319:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 434));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v151, CFSTR("includeTravelDistance"));

  if ((*(_QWORD *)(a1 + 444) & 0x4000000) != 0)
  {
LABEL_153:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 430));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("includeRoadAccessPoints"));

  }
LABEL_154:
  if (*(_QWORD *)(a1 + 224))
  {
    objc_msgSend((id)a1, "limitToCountryCodeIso2s");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("limitToCountryCodeIso2"));

  }
  v73 = *(_QWORD *)(a1 + 444);
  if ((v73 & 0x200000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 437));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v89, CFSTR("isCanonicalLocationSearch"));

    v73 = *(_QWORD *)(a1 + 444);
    if ((v73 & 2) == 0)
    {
LABEL_158:
      if ((v73 & 0x2000000) == 0)
        goto LABEL_159;
      goto LABEL_185;
    }
  }
  else if ((v73 & 2) == 0)
  {
    goto LABEL_158;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 184));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("geoId"));

  v73 = *(_QWORD *)(a1 + 444);
  if ((v73 & 0x2000000) == 0)
  {
LABEL_159:
    if ((v73 & 0x10000) == 0)
      goto LABEL_161;
    goto LABEL_160;
  }
LABEL_185:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 429));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v91, CFSTR("includeQuads"));

  if ((*(_QWORD *)(a1 + 444) & 0x10000) != 0)
  {
LABEL_160:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 420));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("excludeAddressInResults"));

  }
LABEL_161:
  if (objc_msgSend(*(id *)(a1 + 288), "count"))
  {
    v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 288), "count"));
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v76 = *(id *)(a1 + 288);
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v158, v163, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v159;
      do
      {
        for (i = 0; i != v78; ++i)
        {
          if (*(_QWORD *)v159 != v79)
            objc_enumerationMutation(v76);
          v81 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v81, "jsonRepresentation");
          else
            objc_msgSend(v81, "dictionaryRepresentation");
          v82 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v75, "addObject:", v82);
        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v158, v163, 16);
      }
      while (v78);
    }

    objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("searchSubstring"));
  }
  if ((*(_QWORD *)(a1 + 444) & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 425));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("includeGeoId"));

  }
  objc_msgSend((id)a1, "searchContext");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
    objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("searchContext"));

  objc_msgSend((id)a1, "searchContextSubstring");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85;
  if (v85)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v85, "jsonRepresentation");
    else
      objc_msgSend(v85, "dictionaryRepresentation");
    v92 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v92, CFSTR("searchContextSubstring"));
  }

  if ((*(_QWORD *)(a1 + 444) & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 432));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v93, CFSTR("includeStatusCodeInfo"));

  }
  objc_msgSend((id)a1, "preserveFields");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94;
  if (v94)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v94, "jsonRepresentation");
    else
      objc_msgSend(v94, "dictionaryRepresentation");
    v96 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v96, CFSTR("preserveFields"));
  }

  if ((*(_QWORD *)(a1 + 444) & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 436));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v97, CFSTR("includeUnmatchedStrings"));

  }
  objc_msgSend((id)a1, "indexFilter");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98;
  if (v98)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v98, "jsonRepresentation");
    else
      objc_msgSend(v98, "dictionaryRepresentation");
    v100 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v100, CFSTR("indexFilter"));
  }

  if ((*(_QWORD *)(a1 + 444) & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 424));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v101, CFSTR("includeFeatureSets"));

  }
  if (objc_msgSend(*(id *)(a1 + 304), "count"))
  {
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 304), "count"));
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v103 = *(id *)(a1 + 304);
    v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v154, v162, 16);
    if (v104)
    {
      v105 = v104;
      v106 = *(_QWORD *)v155;
      do
      {
        for (j = 0; j != v105; ++j)
        {
          if (*(_QWORD *)v155 != v106)
            objc_enumerationMutation(v103);
          v108 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v108, "jsonRepresentation");
          else
            objc_msgSend(v108, "dictionaryRepresentation");
          v109 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v102, "addObject:", v109);
        }
        v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v154, v162, 16);
      }
      while (v105);
    }

    objc_msgSend(v4, "setObject:forKey:", v102, CFSTR("serviceTag"));
  }
  if ((*(_QWORD *)(a1 + 444) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 208));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("intersectingGeoId"));

  }
  objc_msgSend((id)a1, "knownLocation");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v111, "jsonRepresentation");
    else
      objc_msgSend(v111, "dictionaryRepresentation");
    v113 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v113, CFSTR("knownLocation"));
  }

  v114 = *(_QWORD *)(a1 + 444);
  if ((v114 & 0x80) != 0)
  {
    v115 = *(int *)(a1 + 384);
    if (v115 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 384));
      v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v116 = off_1E1C0F1A8[v115];
    }
    objc_msgSend(v4, "setObject:forKey:", v116, CFSTR("knownAccuracy"));

    v114 = *(_QWORD *)(a1 + 444);
    if ((v114 & 0x400000) == 0)
    {
LABEL_226:
      if ((v114 & 0x2000) == 0)
        goto LABEL_237;
LABEL_233:
      v118 = *(int *)(a1 + 408);
      if (v118 >= 0x18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 408));
        v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v119 = off_1E1C0F1D8[v118];
      }
      objc_msgSend(v4, "setObject:forKey:", v119, CFSTR("searchSource"));

      goto LABEL_237;
    }
  }
  else if ((v114 & 0x400000) == 0)
  {
    goto LABEL_226;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 426));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v117, CFSTR("includeMatchedToken"));

  if ((*(_QWORD *)(a1 + 444) & 0x2000) != 0)
    goto LABEL_233;
LABEL_237:
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v122 = 0;
      do
      {
        v123 = *(unsigned int *)(*v121 + 4 * v122);
        v124 = CFSTR("OBSCURE");
        if ((_DWORD)v123 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v123);
          v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v120, "addObject:", v124);

        ++v122;
        v121 = (_QWORD *)(a1 + 72);
      }
      while (v122 < *(_QWORD *)(a1 + 80));
    }
    objc_msgSend(v4, "setObject:forKey:", v120, CFSTR("optionalSuppressionReason"));

  }
  objc_msgSend((id)a1, "searchLocation");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v125;
  if (v125)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v125, "jsonRepresentation");
    else
      objc_msgSend(v125, "dictionaryRepresentation");
    v127 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v127, CFSTR("searchLocation"));
  }

  if ((*(_QWORD *)(a1 + 444) & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 427));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v128, CFSTR("includeNameForForwardGeocodingResults"));

  }
  objc_msgSend((id)a1, "additionalEnabledMarkets");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v129;
  if (v129)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v129, "jsonRepresentation");
    else
      objc_msgSend(v129, "dictionaryRepresentation");
    v131 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v131, CFSTR("additionalEnabledMarkets"));
  }

  v132 = *(_QWORD *)(a1 + 444);
  if ((v132 & 0x200) != 0)
  {
    v133 = *(int *)(a1 + 392);
    if (v133 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 392));
      v134 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v134 = off_1E1C0F298[v133];
    }
    if (a2)
      v135 = CFSTR("mapMode");
    else
      v135 = CFSTR("map_mode");
    objc_msgSend(v4, "setObject:forKey:", v134, v135);

    v132 = *(_QWORD *)(a1 + 444);
  }
  if ((v132 & 0x2000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 441));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v137 = CFSTR("isPopularNearbyRequest");
    else
      v137 = CFSTR("is_popular_nearby_request");
    objc_msgSend(v4, "setObject:forKey:", v136, v137);

  }
  objc_msgSend((id)a1, "deviceLocationCountryCode");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    if (a2)
      v139 = CFSTR("deviceLocationCountryCode");
    else
      v139 = CFSTR("device_location_country_code");
    objc_msgSend(v4, "setObject:forKey:", v138, v139);
  }

  objc_msgSend((id)a1, "viewportCenterCountryCode");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (v140)
  {
    if (a2)
      v141 = CFSTR("viewportCenterCountryCode");
    else
      v141 = CFSTR("viewport_center_country_code");
    objc_msgSend(v4, "setObject:forKey:", v140, v141);
  }

  v142 = *(void **)(a1 + 16);
  if (v142)
  {
    objc_msgSend(v142, "dictionaryRepresentation");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v143;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v143, "count"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __51__GEOPlaceSearchRequest__dictionaryRepresentation___block_invoke;
      v152[3] = &unk_1E1C00600;
      v146 = v145;
      v153 = v146;
      objc_msgSend(v144, "enumerateKeysAndObjectsUsingBlock:", v152);
      v147 = v146;

      v144 = v147;
    }
    objc_msgSend(v4, "setObject:forKey:", v144, CFSTR("Unknown Fields"));

  }
  v148 = v4;

  return v148;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceSearchRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPlaceSearchRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPlaceSearchRequest)initWithDictionary:(id)a3
{
  return (GEOPlaceSearchRequest *)-[GEOPlaceSearchRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  GEOAddress *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GEOLocation *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  GEOMapRegion *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  GEOBusinessOptions *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  GEOLatLng *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  GEOClientCapabilities *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  GEOSuggestionsOptions *v94;
  GEOSuggestionsOptions *v95;
  id v96;
  uint64_t v97;
  void *v98;
  id v99;
  int v100;
  void *v101;
  id v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  void *v110;
  char v111;
  void *v112;
  id v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t m;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t n;
  uint64_t v136;
  GEOSearchSubstring *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  GEOSearchSubstring *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  GEOAddress *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  GEOIndexQueryNode *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t ii;
  uint64_t v163;
  GEOGeoServiceTag *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  GEOLatLng *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  id v173;
  uint64_t v174;
  void *v175;
  void *v176;
  id v177;
  uint64_t v178;
  void *v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t jj;
  void *v185;
  id v186;
  uint64_t v187;
  void *v188;
  GEOLatLng *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  GEOAdditionalEnabledMarkets *v194;
  uint64_t v195;
  void *v196;
  const __CFString *v197;
  void *v198;
  id v199;
  uint64_t v200;
  const __CFString *v201;
  void *v202;
  const __CFString *v203;
  void *v204;
  void *v205;
  const __CFString *v206;
  void *v207;
  void *v208;
  void *v210;
  id v211;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  uint64_t v233;
  uint64_t v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  uint64_t v250;

  v250 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
    goto LABEL_548;
  v5 = (id)objc_msgSend(a1, "init");

  if (!v5)
  {
    a1 = 0;
    goto LABEL_548;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("businessID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v241 = 0u;
    v242 = 0u;
    v239 = 0u;
    v240 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v239, v249, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v240;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v240 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "addBusinessID:", objc_msgSend(v12, "unsignedLongLongValue"));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v239, v249, 16);
      }
      while (v9);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("address"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOAddress alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOAddress initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOAddress initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(v5, "setAddress:", v15);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOLocation initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOLocation initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(v5, "setLocation:", v19);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("search"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v5, "setSearch:", v22);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapRegion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOMapRegion initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOMapRegion initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(v5, "setMapRegion:", v25);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("additionalPlaceType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v210 = v27;
    v211 = v4;
    v237 = 0u;
    v238 = 0u;
    v235 = 0u;
    v236 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v235, v248, 16);
    if (!v29)
      goto LABEL_106;
    v30 = v29;
    v31 = *(_QWORD *)v236;
    while (1)
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v236 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = v33;
          if ((objc_msgSend(v34, "isEqualToString:", CFSTR("PT_UNKNOWN")) & 1) != 0)
          {
            v35 = 0;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
          {
            v35 = 1;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
          {
            v35 = 2;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
          {
            v35 = 4;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
          {
            v35 = 16;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
          {
            v35 = 35;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("NEIGHBORHOOD")) & 1) != 0)
          {
            v35 = 43;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
          {
            v35 = 44;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
          {
            v35 = 45;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
          {
            v35 = 46;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POI")) & 1) != 0)
          {
            v35 = 47;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
          {
            v35 = 48;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
          {
            v35 = 49;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
          {
            v35 = 50;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
          {
            v35 = 51;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
          {
            v35 = 54;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
          {
            v35 = 55;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
          {
            v35 = 57;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("ZCTAS")) & 1) != 0)
          {
            v35 = 59;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
          {
            v35 = 61;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")) & 1) != 0)
          {
            v35 = 65;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("PERDU_CITY")) & 1) != 0)
          {
            v35 = 1016;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("DMA")) & 1) != 0)
          {
            v35 = 100;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CAT_10284_POSTAL")) & 1) != 0)
          {
            v35 = 101;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CAT_10285_CITY")) & 1) != 0)
          {
            v35 = 102;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CAT_10286_COUNTY")) & 1) != 0)
          {
            v35 = 103;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CAT_10287_STATE")) & 1) != 0)
          {
            v35 = 104;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CAT_10288_COUNTRY")) & 1) != 0)
          {
            v35 = 105;
          }
          else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("CAT_10288_COUNTRY_CODE")) & 1) != 0)
          {
            v35 = 106;
          }
          else if (objc_msgSend(v34, "isEqualToString:", CFSTR("CAT_10287_STATE_CODE")))
          {
            v35 = 107;
          }
          else
          {
            v35 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v35 = objc_msgSend(v33, "intValue");
        }
        objc_msgSend(v5, "addAdditionalPlaceType:", v35);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v235, v248, 16);
      if (!v30)
      {
LABEL_106:

        v27 = v210;
        v4 = v211;
        break;
      }
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includePhonetics"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludePhonetics:", objc_msgSend(v36, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxResults"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setMaxResults:", objc_msgSend(v37, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionGUID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v233 = 0;
    v234 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v38, &v233);
    objc_msgSend(v5, "setSessionGUID:", v233, v234);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("businessSortOrder"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = v39;
    if ((objc_msgSend(v40, "isEqualToString:", CFSTR("RELEVANCE")) & 1) != 0)
    {
      v41 = 0;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("RATING")) & 1) != 0)
    {
      v41 = 1;
    }
    else if (objc_msgSend(v40, "isEqualToString:", CFSTR("DISTANCE")))
    {
      v41 = 2;
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_125;
    v41 = objc_msgSend(v39, "intValue");
  }
  objc_msgSend(v5, "setBusinessSortOrder:", v41);
LABEL_125:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeBusinessRating"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeBusinessRating:", objc_msgSend(v42, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeBusinessCategories"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeBusinessCategories:", objc_msgSend(v43, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxBusinessReviews"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setMaxBusinessReviews:", objc_msgSend(v44, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filterByBusinessCategory"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v231 = 0u;
    v232 = 0u;
    v229 = 0u;
    v230 = 0u;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v229, v247, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v230;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v230 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = (void *)objc_msgSend(v51, "copy");
            objc_msgSend(v5, "addFilterByBusinessCategory:", v52);

          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v229, v247, 16);
      }
      while (v48);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isStrictMapRegion"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsStrictMapRegion:", objc_msgSend(v53, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v54, "doubleValue");
    objc_msgSend(v5, "setTimestamp:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zilchPoints"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v55, 0);
    objc_msgSend(v5, "setZilchPoints:", v56);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeEntryPoints"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeEntryPoints:", objc_msgSend(v57, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("businessOptions"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = [GEOBusinessOptions alloc];
    if ((a3 & 1) != 0)
      v60 = -[GEOBusinessOptions initWithJSON:](v59, "initWithJSON:", v58);
    else
      v60 = -[GEOBusinessOptions initWithDictionary:](v59, "initWithDictionary:", v58);
    v61 = (void *)v60;
    objc_msgSend(v5, "setBusinessOptions:", v60);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localSearchProviderID"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLocalSearchProviderID:", objc_msgSend(v62, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeSuggestionsOnly"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeSuggestionsOnly:", objc_msgSend(v63, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("structuredSearch"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setStructuredSearch:", objc_msgSend(v64, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionsPrefix"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = (void *)objc_msgSend(v65, "copy");
    objc_msgSend(v5, "setSuggestionsPrefix:", v66);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceCountryCode"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = (void *)objc_msgSend(v67, "copy");
    objc_msgSend(v5, "setDeviceCountryCode:", v68);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceLocation"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v71 = -[GEOLatLng initWithJSON:](v70, "initWithJSON:", v69);
    else
      v71 = -[GEOLatLng initWithDictionary:](v70, "initWithDictionary:", v69);
    v72 = (void *)v71;
    objc_msgSend(v5, "setDeviceLocation:", v71);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputLanguage"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = (void *)objc_msgSend(v73, "copy");
    objc_msgSend(v5, "setInputLanguage:", v74);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneticLocaleIdentifier"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = (void *)objc_msgSend(v75, "copy");
    objc_msgSend(v5, "setPhoneticLocaleIdentifier:", v76);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSequenceNumber:", objc_msgSend(v77, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suppressResultsRequiringAttribution"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSuppressResultsRequiringAttribution:", objc_msgSend(v78, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFromAPI"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsFromAPI:", objc_msgSend(v79, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceMapEnteredForeground"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v80, "doubleValue");
    objc_msgSend(v5, "setTimeSinceMapEnteredForeground:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceMapViewportChanged"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v81, "doubleValue");
    objc_msgSend(v5, "setTimeSinceMapViewportChanged:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeSpokenNames"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeSpokenNames:", objc_msgSend(v82, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceTimeZone"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v84 = (void *)objc_msgSend(v83, "copy");
    objc_msgSend(v5, "setDeviceTimeZone:", v84);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientCapabilities"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = [GEOClientCapabilities alloc];
    if ((a3 & 1) != 0)
      v87 = -[GEOClientCapabilities initWithJSON:](v86, "initWithJSON:", v85);
    else
      v87 = -[GEOClientCapabilities initWithDictionary:](v86, "initWithDictionary:", v85);
    v88 = (void *)v87;
    objc_msgSend(v5, "setClientCapabilities:", v87);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeTravelTime"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeTravelTime:", objc_msgSend(v89, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transportTypeForTravelTimes"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = v90;
    if ((objc_msgSend(v91, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v92 = 0;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v92 = 1;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v92 = 2;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v92 = 3;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v92 = 4;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v92 = 5;
    }
    else if (objc_msgSend(v91, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v92 = 6;
    }
    else
    {
      v92 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_215;
    v92 = objc_msgSend(v90, "intValue");
  }
  objc_msgSend(v5, "setTransportTypeForTravelTimes:", v92);
LABEL_215:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionsOptions"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_261;
  v94 = [GEOSuggestionsOptions alloc];
  if (!v94)
  {
    v97 = 0;
    goto LABEL_260;
  }
  v95 = v94;
  v96 = v93;
  v97 = -[GEOSuggestionsOptions init](v95, "init");
  if (v97)
  {
    objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("listType"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v99 = v98;
      if ((objc_msgSend(v99, "isEqualToString:", CFSTR("INTERLEAVED")) & 1) != 0)
      {
        v100 = 0;
      }
      else if ((objc_msgSend(v99, "isEqualToString:", CFSTR("SECTIONED")) & 1) != 0)
      {
        v100 = 1;
      }
      else if (objc_msgSend(v99, "isEqualToString:", CFSTR("LEGACY_LIST")))
      {
        v100 = 2;
      }
      else
      {
        v100 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_230;
      v100 = objc_msgSend(v98, "intValue");
    }
    *(_BYTE *)(v97 + 64) |= 0x80u;
    *(_BYTE *)(v97 + 64) |= 2u;
    *(_DWORD *)(v97 + 56) = v100;
LABEL_230:

    objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("entriesType"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v102 = v101;
      if ((objc_msgSend(v102, "isEqualToString:", CFSTR("INSTANT_SEARCH")) & 1) != 0)
      {
        v103 = 0;
      }
      else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("AUTOCOMPLETE")) & 1) != 0)
      {
        v103 = 1;
      }
      else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("LEGACY_ENTRIES")) & 1) != 0)
      {
        v103 = 2;
      }
      else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("PARSEC")) & 1) != 0)
      {
        v103 = 3;
      }
      else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("ADDRESSES_ONLY")) & 1) != 0)
      {
        v103 = 4;
      }
      else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("LOCALITIES_AND_LANDMARKS")) & 1) != 0)
      {
        v103 = 5;
      }
      else if (objc_msgSend(v102, "isEqualToString:", CFSTR("PARSEC_LOCALITIES_AND_LANDMARKS")))
      {
        v103 = 6;
      }
      else
      {
        v103 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_250:

        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("suggestionMetadata"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v104, 0);
          -[GEOSuggestionsOptions setSuggestionMetadata:](v97, v105);

        }
        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("suggestionEntryMetadata"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v106, 0);
          -[GEOSuggestionsOptions setSuggestionEntryMetadata:](v97, v107);

        }
        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("normalizePOIs"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v109 = objc_msgSend(v108, "BOOLValue");
          *(_BYTE *)(v97 + 64) |= 0x80u;
          *(_BYTE *)(v97 + 64) |= 8u;
          *(_BYTE *)(v97 + 61) = v109;
        }

        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("includeRankingFeatures"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v111 = objc_msgSend(v110, "BOOLValue");
          *(_BYTE *)(v97 + 64) |= 0x80u;
          *(_BYTE *)(v97 + 64) |= 4u;
          *(_BYTE *)(v97 + 60) = v111;
        }

        goto LABEL_259;
      }
      v103 = objc_msgSend(v101, "intValue");
    }
    *(_BYTE *)(v97 + 64) |= 0x80u;
    *(_BYTE *)(v97 + 64) |= 1u;
    *(_DWORD *)(v97 + 52) = v103;
    goto LABEL_250;
  }
LABEL_259:

LABEL_260:
  objc_msgSend(v5, "setSuggestionsOptions:", v97);

LABEL_261:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeTypeLimit"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = v112;
    if ((objc_msgSend(v113, "isEqualToString:", CFSTR("PT_UNKNOWN")) & 1) != 0)
    {
      v114 = 0;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
    {
      v114 = 1;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
    {
      v114 = 2;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
    {
      v114 = 4;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
    {
      v114 = 16;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
    {
      v114 = 35;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("NEIGHBORHOOD")) & 1) != 0)
    {
      v114 = 43;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
    {
      v114 = 44;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
    {
      v114 = 45;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
    {
      v114 = 46;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("POI")) & 1) != 0)
    {
      v114 = 47;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
    {
      v114 = 48;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
    {
      v114 = 49;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
    {
      v114 = 50;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
    {
      v114 = 51;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
    {
      v114 = 54;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
    {
      v114 = 55;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v114 = 57;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("ZCTAS")) & 1) != 0)
    {
      v114 = 59;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
    {
      v114 = 61;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")) & 1) != 0)
    {
      v114 = 65;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("PERDU_CITY")) & 1) != 0)
    {
      v114 = 1016;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("DMA")) & 1) != 0)
    {
      v114 = 100;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CAT_10284_POSTAL")) & 1) != 0)
    {
      v114 = 101;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CAT_10285_CITY")) & 1) != 0)
    {
      v114 = 102;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CAT_10286_COUNTY")) & 1) != 0)
    {
      v114 = 103;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CAT_10287_STATE")) & 1) != 0)
    {
      v114 = 104;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CAT_10288_COUNTRY")) & 1) != 0)
    {
      v114 = 105;
    }
    else if ((objc_msgSend(v113, "isEqualToString:", CFSTR("CAT_10288_COUNTRY_CODE")) & 1) != 0)
    {
      v114 = 106;
    }
    else if (objc_msgSend(v113, "isEqualToString:", CFSTR("CAT_10287_STATE_CODE")))
    {
      v114 = 107;
    }
    else
    {
      v114 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_328;
    v114 = objc_msgSend(v112, "intValue");
  }
  objc_msgSend(v5, "setPlaceTypeLimit:", v114);
LABEL_328:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isStrictGeocoding"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsStrictGeocoding:", objc_msgSend(v115, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeTravelDistance"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeTravelDistance:", objc_msgSend(v116, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeRoadAccessPoints"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeRoadAccessPoints:", objc_msgSend(v117, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("limitToCountryCodeIso2"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v227 = 0u;
    v228 = 0u;
    v225 = 0u;
    v226 = 0u;
    v119 = v118;
    v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v225, v246, 16);
    if (v120)
    {
      v121 = v120;
      v122 = *(_QWORD *)v226;
      do
      {
        for (m = 0; m != v121; ++m)
        {
          if (*(_QWORD *)v226 != v122)
            objc_enumerationMutation(v119);
          v124 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v125 = (void *)objc_msgSend(v124, "copy");
            objc_msgSend(v5, "addLimitToCountryCodeIso2:", v125);

          }
        }
        v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v225, v246, 16);
      }
      while (v121);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCanonicalLocationSearch"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsCanonicalLocationSearch:", objc_msgSend(v126, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("geoId"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setGeoId:", objc_msgSend(v127, "longLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeQuads"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeQuads:", objc_msgSend(v128, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("excludeAddressInResults"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setExcludeAddressInResults:", objc_msgSend(v129, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchSubstring"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    v131 = v130;
    v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v221, v245, 16);
    if (v132)
    {
      v133 = v132;
      v134 = *(_QWORD *)v222;
      do
      {
        for (n = 0; n != v133; ++n)
        {
          if (*(_QWORD *)v222 != v134)
            objc_enumerationMutation(v131);
          v136 = *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v137 = [GEOSearchSubstring alloc];
            if ((a3 & 1) != 0)
              v138 = -[GEOSearchSubstring initWithJSON:](v137, "initWithJSON:", v136);
            else
              v138 = -[GEOSearchSubstring initWithDictionary:](v137, "initWithDictionary:", v136);
            v139 = (void *)v138;
            objc_msgSend(v5, "addSearchSubstring:", v138);

          }
        }
        v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v221, v245, 16);
      }
      while (v133);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeGeoId"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeGeoId:", objc_msgSend(v140, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchContext"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v142 = (void *)objc_msgSend(v141, "copy");
    objc_msgSend(v5, "setSearchContext:", v142);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchContextSubstring"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v144 = [GEOSearchSubstring alloc];
    if ((a3 & 1) != 0)
      v145 = -[GEOSearchSubstring initWithJSON:](v144, "initWithJSON:", v143);
    else
      v145 = -[GEOSearchSubstring initWithDictionary:](v144, "initWithDictionary:", v143);
    v146 = (void *)v145;
    objc_msgSend(v5, "setSearchContextSubstring:", v145);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeStatusCodeInfo"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeStatusCodeInfo:", objc_msgSend(v147, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preserveFields"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v149 = [GEOAddress alloc];
    if ((a3 & 1) != 0)
      v150 = -[GEOAddress initWithJSON:](v149, "initWithJSON:", v148);
    else
      v150 = -[GEOAddress initWithDictionary:](v149, "initWithDictionary:", v148);
    v151 = (void *)v150;
    objc_msgSend(v5, "setPreserveFields:", v150);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeUnmatchedStrings"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeUnmatchedStrings:", objc_msgSend(v152, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("indexFilter"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v154 = [GEOIndexQueryNode alloc];
    if (v154)
      v155 = (void *)-[GEOIndexQueryNode _initWithDictionary:isJSON:](v154, v153);
    else
      v155 = 0;
    objc_msgSend(v5, "setIndexFilter:", v155);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeFeatureSets"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeFeatureSets:", objc_msgSend(v156, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceTag"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v219 = 0u;
    v220 = 0u;
    v217 = 0u;
    v218 = 0u;
    v158 = v157;
    v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v217, v244, 16);
    if (v159)
    {
      v160 = v159;
      v161 = *(_QWORD *)v218;
      do
      {
        for (ii = 0; ii != v160; ++ii)
        {
          if (*(_QWORD *)v218 != v161)
            objc_enumerationMutation(v158);
          v163 = *(_QWORD *)(*((_QWORD *)&v217 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v164 = [GEOGeoServiceTag alloc];
            if ((a3 & 1) != 0)
              v165 = -[GEOGeoServiceTag initWithJSON:](v164, "initWithJSON:", v163);
            else
              v165 = -[GEOGeoServiceTag initWithDictionary:](v164, "initWithDictionary:", v163);
            v166 = (void *)v165;
            objc_msgSend(v5, "addServiceTag:", v165);

          }
        }
        v160 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v217, v244, 16);
      }
      while (v160);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intersectingGeoId"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIntersectingGeoId:", objc_msgSend(v167, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("knownLocation"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v169 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v170 = -[GEOLatLng initWithJSON:](v169, "initWithJSON:", v168);
    else
      v170 = -[GEOLatLng initWithDictionary:](v169, "initWithDictionary:", v168);
    v171 = (void *)v170;
    objc_msgSend(v5, "setKnownLocation:", v170);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("knownAccuracy"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v173 = v172;
    if ((objc_msgSend(v173, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
    {
      v174 = 0;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
    {
      v174 = 1;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
    {
      v174 = 2;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
    {
      v174 = 3;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
    {
      v174 = 4;
    }
    else if (objc_msgSend(v173, "isEqualToString:", CFSTR("SUBPREMISE")))
    {
      v174 = 5;
    }
    else
    {
      v174 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_430;
    v174 = objc_msgSend(v172, "intValue");
  }
  objc_msgSend(v5, "setKnownAccuracy:", v174);
LABEL_430:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeMatchedToken"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeMatchedToken:", objc_msgSend(v175, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchSource"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v177 = v176;
    if ((objc_msgSend(v177, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v178 = 0;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("URL")) & 1) != 0)
    {
      v178 = 1;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("USER")) & 1) != 0)
    {
      v178 = 2;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("REFINEMENT")) & 1) != 0)
    {
      v178 = 3;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("SPELLING")) & 1) != 0)
    {
      v178 = 4;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("HINT_CONTACTS")) & 1) != 0)
    {
      v178 = 5;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("STARK_USER")) & 1) != 0)
    {
      v178 = 6;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("HINT_COMPLETION")) & 1) != 0)
    {
      v178 = 7;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("STARK_HINT_COMPLETION")) & 1) != 0)
    {
      v178 = 8;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("HINT_HISTORY")) & 1) != 0)
    {
      v178 = 9;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("STARK_HINT_HISTORY")) & 1) != 0)
    {
      v178 = 10;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("AUTOCOMPLETE_SEARCH")) & 1) != 0)
    {
      v178 = 11;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("STARK_AUTOCOMPLETE_SEARCH")) & 1) != 0)
    {
      v178 = 12;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_FROM")) & 1) != 0)
    {
      v178 = 13;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_TO")) & 1) != 0)
    {
      v178 = 14;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("NAV_FROM")) & 1) != 0)
    {
      v178 = 15;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("NAV_TO")) & 1) != 0)
    {
      v178 = 16;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("BOOKMARK_REFRESH")) & 1) != 0)
    {
      v178 = 17;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
    {
      v178 = 18;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("PRELOADER")) & 1) != 0)
    {
      v178 = 19;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("USER_NO_TYPING")) & 1) != 0)
    {
      v178 = 20;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("ADD_TO_FAVORITES")) & 1) != 0)
    {
      v178 = 21;
    }
    else if ((objc_msgSend(v177, "isEqualToString:", CFSTR("ADD_TO_COLLECTIONS")) & 1) != 0)
    {
      v178 = 22;
    }
    else if (objc_msgSend(v177, "isEqualToString:", CFSTR("RAP_HINT_COMPLETION")))
    {
      v178 = 23;
    }
    else
    {
      v178 = 0;
    }

    goto LABEL_486;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v178 = objc_msgSend(v176, "intValue");
LABEL_486:
    objc_msgSend(v5, "setSearchSource:", v178);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optionalSuppressionReason"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_501;
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  v180 = v179;
  v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v213, v243, 16);
  if (!v181)
    goto LABEL_500;
  v182 = v181;
  v183 = *(_QWORD *)v214;
  do
  {
    for (jj = 0; jj != v182; ++jj)
    {
      if (*(_QWORD *)v214 != v183)
        objc_enumerationMutation(v180);
      v185 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * jj);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v186 = v185;
        objc_msgSend(v186, "isEqualToString:", CFSTR("OBSCURE"));

        v187 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v187 = objc_msgSend(v185, "intValue");
      }
      objc_msgSend(v5, "addOptionalSuppressionReason:", v187);
    }
    v182 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v213, v243, 16);
  }
  while (v182);
LABEL_500:

LABEL_501:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchLocation"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v189 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v190 = -[GEOLatLng initWithJSON:](v189, "initWithJSON:", v188);
    else
      v190 = -[GEOLatLng initWithDictionary:](v189, "initWithDictionary:", v188);
    v191 = (void *)v190;
    objc_msgSend(v5, "setSearchLocation:", v190);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeNameForForwardGeocodingResults"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIncludeNameForForwardGeocodingResults:", objc_msgSend(v192, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("additionalEnabledMarkets"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v194 = [GEOAdditionalEnabledMarkets alloc];
    if ((a3 & 1) != 0)
      v195 = -[GEOAdditionalEnabledMarkets initWithJSON:](v194, "initWithJSON:", v193);
    else
      v195 = -[GEOAdditionalEnabledMarkets initWithDictionary:](v194, "initWithDictionary:", v193);
    v196 = (void *)v195;
    objc_msgSend(v5, "setAdditionalEnabledMarkets:", v195);

  }
  if (a3)
    v197 = CFSTR("mapMode");
  else
    v197 = CFSTR("map_mode");
  objc_msgSend(v4, "objectForKeyedSubscript:", v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v199 = v198;
    if ((objc_msgSend(v199, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v200 = 0;
    }
    else if ((objc_msgSend(v199, "isEqualToString:", CFSTR("STANDARD")) & 1) != 0)
    {
      v200 = 1;
    }
    else if ((objc_msgSend(v199, "isEqualToString:", CFSTR("SATELLITE")) & 1) != 0)
    {
      v200 = 2;
    }
    else if ((objc_msgSend(v199, "isEqualToString:", CFSTR("HYBRID")) & 1) != 0)
    {
      v200 = 3;
    }
    else if (objc_msgSend(v199, "isEqualToString:", CFSTR("TRANSIT")))
    {
      v200 = 4;
    }
    else
    {
      v200 = 0;
    }

LABEL_531:
    objc_msgSend(v5, "setMapMode:", v200);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v200 = objc_msgSend(v198, "intValue");
      goto LABEL_531;
    }
  }

  if (a3)
    v201 = CFSTR("isPopularNearbyRequest");
  else
    v201 = CFSTR("is_popular_nearby_request");
  objc_msgSend(v4, "objectForKeyedSubscript:", v201);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsPopularNearbyRequest:", objc_msgSend(v202, "BOOLValue"));

  if (a3)
    v203 = CFSTR("deviceLocationCountryCode");
  else
    v203 = CFSTR("device_location_country_code");
  objc_msgSend(v4, "objectForKeyedSubscript:", v203);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v205 = (void *)objc_msgSend(v204, "copy");
    objc_msgSend(v5, "setDeviceLocationCountryCode:", v205);

  }
  if (a3)
    v206 = CFSTR("viewportCenterCountryCode");
  else
    v206 = CFSTR("viewport_center_country_code");
  objc_msgSend(v4, "objectForKeyedSubscript:", v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v208 = (void *)objc_msgSend(v207, "copy");
    objc_msgSend(v5, "setViewportCenterCountryCode:", v208);

  }
  a1 = v5;

LABEL_548:
  return a1;
}

- (GEOPlaceSearchRequest)initWithJSON:(id)a3
{
  return (GEOPlaceSearchRequest *)-[GEOPlaceSearchRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2026;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2027;
    GEOPlaceSearchRequestReadSpecified((uint64_t)self, (char *)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPlaceSearchRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceSearchRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceSearchRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  unint64_t v7;
  $AD124837EA5E8D01781224E63FEA3088 *p_flags;
  uint64_t flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  PBDataReader *v35;
  void *v36;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceSearchRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v35 = self->_reader;
    objc_sync_enter(v35);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v36);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v35);
    goto LABEL_169;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceSearchRequest readAll:](self, "readAll:", 0);
  if (self->_businessIDs.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_businessIDs.count);
  }
  if (self->_address)
    PBDataWriterWriteSubmessage();
  if (self->_location)
    PBDataWriterWriteSubmessage();
  if (self->_search)
    PBDataWriterWriteStringField();
  if (self->_mapRegion)
    PBDataWriterWriteSubmessage();
  if (self->_additionalPlaceTypes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_additionalPlaceTypes.count);
  }
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x800) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0)
        goto LABEL_20;
      goto LABEL_27;
    }
  }
  else if ((flags & 0x800) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_20:
    if ((flags & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_27:
  v53 = 0;
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_21:
    if ((flags & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40000) == 0)
  {
LABEL_22:
    if ((flags & 0x20000) == 0)
      goto LABEL_23;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_23:
    if ((flags & 0x400) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_flags & 0x400) != 0)
LABEL_31:
    PBDataWriterWriteInt32Field();
LABEL_32:
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = self->_filterByBusinessCategorys;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v50;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v11);
  }

  v14 = (uint64_t)self->_flags;
  if ((v14 & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v14 = (uint64_t)self->_flags;
  }
  if ((v14 & 0x20) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_zilchPoints)
    PBDataWriterWriteDataField();
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_businessOptions)
    PBDataWriterWriteSubmessage();
  v15 = (uint64_t)self->_flags;
  if ((v15 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x4000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_suggestionsPrefix)
    PBDataWriterWriteStringField();
  if (self->_deviceCountryCode)
    PBDataWriterWriteStringField();
  if (self->_deviceLocation)
    PBDataWriterWriteSubmessage();
  if (self->_inputLanguage)
    PBDataWriterWriteStringField();
  if (self->_phoneticLocaleIdentifier)
    PBDataWriterWriteStringField();
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x8000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_deviceTimeZone)
    PBDataWriterWriteStringField();
  if (self->_clientCapabilities)
    PBDataWriterWriteSubmessage();
  v17 = (uint64_t)self->_flags;
  if ((v17 & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x8000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_suggestionsOptions)
    PBDataWriterWriteSubmessage();
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x4000000) != 0)
    PBDataWriterWriteBOOLField();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = self->_limitToCountryCodeIso2s;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v46;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v19);
        PBDataWriterWriteStringField();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    }
    while (v20);
  }

  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v23 = (uint64_t)self->_flags;
  }
  if ((v23 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v23 = (uint64_t)self->_flags;
  }
  if ((v23 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v23 = (uint64_t)self->_flags;
  }
  if ((v23 & 0x10000) != 0)
    PBDataWriterWriteBOOLField();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = self->_searchSubstrings;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v42;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage();
        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v25);
  }

  if ((*(_QWORD *)&self->_flags & 0x200000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_searchContext)
    PBDataWriterWriteStringField();
  if (self->_searchContextSubstring)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_flags & 0x10000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_preserveFields)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_flags & 0x100000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_indexFilter)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_flags & 0x100000) != 0)
    PBDataWriterWriteBOOLField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v28 = self->_serviceTags;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v38;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage();
        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
    }
    while (v29);
  }

  if ((*(_QWORD *)&self->_flags & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_knownLocation)
    PBDataWriterWriteSubmessage();
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v32 = (uint64_t)self->_flags;
  }
  if ((v32 & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v32 = (uint64_t)self->_flags;
  }
  if ((v32 & 0x2000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_optionalSuppressionReasons.count)
  {
    v33 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v33;
    }
    while (v33 < self->_optionalSuppressionReasons.count);
  }
  if (self->_searchLocation)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_flags & 0x800000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_additionalEnabledMarkets)
    PBDataWriterWriteSubmessage();
  v34 = (uint64_t)self->_flags;
  if ((v34 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x2000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_deviceLocationCountryCode)
    PBDataWriterWriteStringField();
  if (self->_viewportCenterCountryCode)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v37);
LABEL_169:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPlaceSearchRequestClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPlaceSearchRequest _readDeviceLocation]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_deviceLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPlaceSearchRequest _readKnownLocation]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_knownLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPlaceSearchRequest _readLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPlaceSearchRequest _readMapRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPlaceSearchRequest _readSearchLocation]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_searchLocation, "hasGreenTeaWithValue:", v3);
}

- (unsigned)requestTypeCode
{
  return 43;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  $AD124837EA5E8D01781224E63FEA3088 *p_flags;
  uint64_t flags;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  uint64_t v16;
  char *v17;
  $AD124837EA5E8D01781224E63FEA3088 *v18;
  uint64_t v19;
  $AD124837EA5E8D01781224E63FEA3088 *v20;
  uint64_t v21;
  uint64_t v22;
  $AD124837EA5E8D01781224E63FEA3088 *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t m;
  void *v28;
  $AD124837EA5E8D01781224E63FEA3088 *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t n;
  void *v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t ii;
  void *v39;
  char *v40;
  $AD124837EA5E8D01781224E63FEA3088 *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t jj;
  char *v46;
  uint64_t v47;
  char *v48;

  v48 = (char *)a3;
  -[GEOPlaceSearchRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v48 + 1, self->_reader);
  *((_DWORD *)v48 + 92) = self->_readerMarkPos;
  *((_DWORD *)v48 + 93) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPlaceSearchRequest businessIDsCount](self, "businessIDsCount"))
  {
    objc_msgSend(v48, "clearBusinessIDs");
    v4 = -[GEOPlaceSearchRequest businessIDsCount](self, "businessIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v48, "addBusinessID:", -[GEOPlaceSearchRequest businessIDAtIndex:](self, "businessIDAtIndex:", i));
    }
  }
  if (self->_address)
    objc_msgSend(v48, "setAddress:");
  if (self->_location)
    objc_msgSend(v48, "setLocation:");
  if (self->_search)
    objc_msgSend(v48, "setSearch:");
  if (self->_mapRegion)
    objc_msgSend(v48, "setMapRegion:");
  if (-[GEOPlaceSearchRequest additionalPlaceTypesCount](self, "additionalPlaceTypesCount"))
  {
    objc_msgSend(v48, "clearAdditionalPlaceTypes");
    v7 = -[GEOPlaceSearchRequest additionalPlaceTypesCount](self, "additionalPlaceTypesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v48, "addAdditionalPlaceType:", -[GEOPlaceSearchRequest additionalPlaceTypeAtIndex:](self, "additionalPlaceTypeAtIndex:", j));
    }
  }
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    v48[428] = self->_includePhonetics;
    *(_QWORD *)(v48 + 444) |= 0x1000000uLL;
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x800) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0)
        goto LABEL_20;
      goto LABEL_137;
    }
  }
  else if ((flags & 0x800) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v48 + 100) = self->_maxResults;
  *(_QWORD *)(v48 + 444) |= 0x800uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_20:
    if ((flags & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_138;
  }
LABEL_137:
  *((_OWORD *)v48 + 6) = self->_sessionGUID;
  *(_QWORD *)(v48 + 444) |= 1uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_21:
    if ((flags & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v48 + 95) = self->_businessSortOrder;
  *(_QWORD *)(v48 + 444) |= 0x40uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40000) == 0)
  {
LABEL_22:
    if ((flags & 0x20000) == 0)
      goto LABEL_23;
LABEL_140:
    v48[421] = self->_includeBusinessCategories;
    *(_QWORD *)(v48 + 444) |= 0x20000uLL;
    if ((*(_QWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_139:
  v48[422] = self->_includeBusinessRating;
  *(_QWORD *)(v48 + 444) |= 0x40000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) != 0)
    goto LABEL_140;
LABEL_23:
  if ((flags & 0x400) != 0)
  {
LABEL_24:
    *((_DWORD *)v48 + 99) = self->_maxBusinessReviews;
    *(_QWORD *)(v48 + 444) |= 0x400uLL;
  }
LABEL_25:
  if (-[GEOPlaceSearchRequest filterByBusinessCategorysCount](self, "filterByBusinessCategorysCount"))
  {
    objc_msgSend(v48, "clearFilterByBusinessCategorys");
    v12 = -[GEOPlaceSearchRequest filterByBusinessCategorysCount](self, "filterByBusinessCategorysCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOPlaceSearchRequest filterByBusinessCategoryAtIndex:](self, "filterByBusinessCategoryAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addFilterByBusinessCategory:", v15);

      }
    }
  }
  v16 = (uint64_t)self->_flags;
  v17 = v48;
  if ((v16 & 0x1000000000) != 0)
  {
    v48[440] = self->_isStrictMapRegion;
    *(_QWORD *)(v48 + 444) |= 0x1000000000uLL;
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x20) != 0)
  {
    *((_QWORD *)v48 + 43) = *(_QWORD *)&self->_timestamp;
    *(_QWORD *)(v48 + 444) |= 0x20uLL;
  }
  if (self->_zilchPoints)
  {
    objc_msgSend(v48, "setZilchPoints:");
    v17 = v48;
  }
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
  {
    v17[423] = self->_includeEntryPoints;
    *(_QWORD *)(v17 + 444) |= 0x80000uLL;
  }
  if (self->_businessOptions)
  {
    objc_msgSend(v48, "setBusinessOptions:");
    v17 = v48;
  }
  v18 = &self->_flags;
  v19 = (uint64_t)self->_flags;
  if ((v19 & 0x100) != 0)
  {
    *((_DWORD *)v17 + 97) = self->_localSearchProviderID;
    *(_QWORD *)(v17 + 444) |= 0x100uLL;
    v19 = *(_QWORD *)v18;
    if ((*(_QWORD *)v18 & 0x20000000) == 0)
    {
LABEL_41:
      if ((v19 & 0x4000000000) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((v19 & 0x20000000) == 0)
  {
    goto LABEL_41;
  }
  v17[433] = self->_includeSuggestionsOnly;
  *(_QWORD *)(v17 + 444) |= 0x20000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x4000000000) != 0)
  {
LABEL_42:
    v17[442] = self->_structuredSearch;
    *(_QWORD *)(v17 + 444) |= 0x4000000000uLL;
  }
LABEL_43:
  if (self->_suggestionsPrefix)
  {
    objc_msgSend(v48, "setSuggestionsPrefix:");
    v17 = v48;
  }
  if (self->_deviceCountryCode)
  {
    objc_msgSend(v48, "setDeviceCountryCode:");
    v17 = v48;
  }
  if (self->_deviceLocation)
  {
    objc_msgSend(v48, "setDeviceLocation:");
    v17 = v48;
  }
  if (self->_inputLanguage)
  {
    objc_msgSend(v48, "setInputLanguage:");
    v17 = v48;
  }
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v48, "setPhoneticLocaleIdentifier:");
    v17 = v48;
  }
  v20 = &self->_flags;
  v21 = (uint64_t)self->_flags;
  if ((v21 & 0x4000) != 0)
  {
    *((_DWORD *)v17 + 103) = self->_sequenceNumber;
    *(_QWORD *)(v17 + 444) |= 0x4000uLL;
    v21 = *(_QWORD *)v20;
    if ((*(_QWORD *)v20 & 0x8000000000) == 0)
    {
LABEL_55:
      if ((v21 & 0x400000000) == 0)
        goto LABEL_56;
      goto LABEL_147;
    }
  }
  else if ((v21 & 0x8000000000) == 0)
  {
    goto LABEL_55;
  }
  v17[443] = self->_suppressResultsRequiringAttribution;
  *(_QWORD *)(v17 + 444) |= 0x8000000000uLL;
  v21 = (uint64_t)self->_flags;
  if ((v21 & 0x400000000) == 0)
  {
LABEL_56:
    if ((v21 & 8) == 0)
      goto LABEL_57;
    goto LABEL_148;
  }
LABEL_147:
  v17[438] = self->_isFromAPI;
  *(_QWORD *)(v17 + 444) |= 0x400000000uLL;
  v21 = (uint64_t)self->_flags;
  if ((v21 & 8) == 0)
  {
LABEL_57:
    if ((v21 & 0x10) == 0)
      goto LABEL_58;
    goto LABEL_149;
  }
LABEL_148:
  *((_QWORD *)v17 + 41) = *(_QWORD *)&self->_timeSinceMapEnteredForeground;
  *(_QWORD *)(v17 + 444) |= 8uLL;
  v21 = (uint64_t)self->_flags;
  if ((v21 & 0x10) == 0)
  {
LABEL_58:
    if ((v21 & 0x8000000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_149:
  *((_QWORD *)v17 + 42) = *(_QWORD *)&self->_timeSinceMapViewportChanged;
  *(_QWORD *)(v17 + 444) |= 0x10uLL;
  if ((*(_QWORD *)&self->_flags & 0x8000000) != 0)
  {
LABEL_59:
    v17[431] = self->_includeSpokenNames;
    *(_QWORD *)(v17 + 444) |= 0x8000000uLL;
  }
LABEL_60:
  if (self->_deviceTimeZone)
  {
    objc_msgSend(v48, "setDeviceTimeZone:");
    v17 = v48;
  }
  if (self->_clientCapabilities)
  {
    objc_msgSend(v48, "setClientCapabilities:");
    v17 = v48;
  }
  v22 = (uint64_t)self->_flags;
  if ((v22 & 0x80000000) != 0)
  {
    v17[435] = self->_includeTravelTime;
    *(_QWORD *)(v17 + 444) |= 0x80000000uLL;
    v22 = (uint64_t)self->_flags;
  }
  if ((v22 & 0x8000) != 0)
  {
    *((_DWORD *)v17 + 104) = self->_transportTypeForTravelTimes;
    *(_QWORD *)(v17 + 444) |= 0x8000uLL;
  }
  if (self->_suggestionsOptions)
  {
    objc_msgSend(v48, "setSuggestionsOptions:");
    v17 = v48;
  }
  v23 = &self->_flags;
  v24 = (uint64_t)self->_flags;
  if ((v24 & 0x1000) != 0)
  {
    *((_DWORD *)v17 + 101) = self->_placeTypeLimit;
    *(_QWORD *)(v17 + 444) |= 0x1000uLL;
    v24 = *(_QWORD *)v23;
    if ((*(_QWORD *)v23 & 0x800000000) == 0)
    {
LABEL_72:
      if ((v24 & 0x40000000) == 0)
        goto LABEL_73;
LABEL_153:
      v17[434] = self->_includeTravelDistance;
      *(_QWORD *)(v17 + 444) |= 0x40000000uLL;
      if ((*(_QWORD *)&self->_flags & 0x4000000) == 0)
        goto LABEL_75;
      goto LABEL_74;
    }
  }
  else if ((v24 & 0x800000000) == 0)
  {
    goto LABEL_72;
  }
  v17[439] = self->_isStrictGeocoding;
  *(_QWORD *)(v17 + 444) |= 0x800000000uLL;
  v24 = (uint64_t)self->_flags;
  if ((v24 & 0x40000000) != 0)
    goto LABEL_153;
LABEL_73:
  if ((v24 & 0x4000000) != 0)
  {
LABEL_74:
    v17[430] = self->_includeRoadAccessPoints;
    *(_QWORD *)(v17 + 444) |= 0x4000000uLL;
  }
LABEL_75:
  if (-[GEOPlaceSearchRequest limitToCountryCodeIso2sCount](self, "limitToCountryCodeIso2sCount"))
  {
    objc_msgSend(v48, "clearLimitToCountryCodeIso2s");
    v25 = -[GEOPlaceSearchRequest limitToCountryCodeIso2sCount](self, "limitToCountryCodeIso2sCount");
    if (v25)
    {
      v26 = v25;
      for (m = 0; m != v26; ++m)
      {
        -[GEOPlaceSearchRequest limitToCountryCodeIso2AtIndex:](self, "limitToCountryCodeIso2AtIndex:", m);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addLimitToCountryCodeIso2:", v28);

      }
    }
  }
  v29 = &self->_flags;
  v30 = (uint64_t)self->_flags;
  if ((v30 & 0x200000000) != 0)
  {
    v48[437] = self->_isCanonicalLocationSearch;
    *(_QWORD *)(v48 + 444) |= 0x200000000uLL;
    v30 = *(_QWORD *)v29;
    if ((*(_QWORD *)v29 & 2) == 0)
    {
LABEL_81:
      if ((v30 & 0x2000000) == 0)
        goto LABEL_82;
LABEL_157:
      v48[429] = self->_includeQuads;
      *(_QWORD *)(v48 + 444) |= 0x2000000uLL;
      if ((*(_QWORD *)&self->_flags & 0x10000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((v30 & 2) == 0)
  {
    goto LABEL_81;
  }
  *((_QWORD *)v48 + 23) = self->_geoId;
  *(_QWORD *)(v48 + 444) |= 2uLL;
  v30 = (uint64_t)self->_flags;
  if ((v30 & 0x2000000) != 0)
    goto LABEL_157;
LABEL_82:
  if ((v30 & 0x10000) != 0)
  {
LABEL_83:
    v48[420] = self->_excludeAddressInResults;
    *(_QWORD *)(v48 + 444) |= 0x10000uLL;
  }
LABEL_84:
  if (-[GEOPlaceSearchRequest searchSubstringsCount](self, "searchSubstringsCount"))
  {
    objc_msgSend(v48, "clearSearchSubstrings");
    v31 = -[GEOPlaceSearchRequest searchSubstringsCount](self, "searchSubstringsCount");
    if (v31)
    {
      v32 = v31;
      for (n = 0; n != v32; ++n)
      {
        -[GEOPlaceSearchRequest searchSubstringAtIndex:](self, "searchSubstringAtIndex:", n);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addSearchSubstring:", v34);

      }
    }
  }
  v35 = v48;
  if ((*(_QWORD *)&self->_flags & 0x200000) != 0)
  {
    v48[425] = self->_includeGeoId;
    *(_QWORD *)(v48 + 444) |= 0x200000uLL;
  }
  if (self->_searchContext)
  {
    objc_msgSend(v48, "setSearchContext:");
    v35 = v48;
  }
  if (self->_searchContextSubstring)
  {
    objc_msgSend(v48, "setSearchContextSubstring:");
    v35 = v48;
  }
  if ((*(_QWORD *)&self->_flags & 0x10000000) != 0)
  {
    v35[432] = self->_includeStatusCodeInfo;
    *(_QWORD *)(v35 + 444) |= 0x10000000uLL;
  }
  if (self->_preserveFields)
  {
    objc_msgSend(v48, "setPreserveFields:");
    v35 = v48;
  }
  if ((*(_QWORD *)&self->_flags & 0x100000000) != 0)
  {
    v35[436] = self->_includeUnmatchedStrings;
    *(_QWORD *)(v35 + 444) |= 0x100000000uLL;
  }
  if (self->_indexFilter)
  {
    objc_msgSend(v48, "setIndexFilter:");
    v35 = v48;
  }
  if ((*(_QWORD *)&self->_flags & 0x100000) != 0)
  {
    v35[424] = self->_includeFeatureSets;
    *(_QWORD *)(v35 + 444) |= 0x100000uLL;
  }
  if (-[GEOPlaceSearchRequest serviceTagsCount](self, "serviceTagsCount"))
  {
    objc_msgSend(v48, "clearServiceTags");
    v36 = -[GEOPlaceSearchRequest serviceTagsCount](self, "serviceTagsCount");
    if (v36)
    {
      v37 = v36;
      for (ii = 0; ii != v37; ++ii)
      {
        -[GEOPlaceSearchRequest serviceTagAtIndex:](self, "serviceTagAtIndex:", ii);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addServiceTag:", v39);

      }
    }
  }
  v40 = v48;
  if ((*(_QWORD *)&self->_flags & 4) != 0)
  {
    *((_QWORD *)v48 + 26) = self->_intersectingGeoId;
    *(_QWORD *)(v48 + 444) |= 4uLL;
  }
  if (self->_knownLocation)
  {
    objc_msgSend(v48, "setKnownLocation:");
    v40 = v48;
  }
  v41 = &self->_flags;
  v42 = (uint64_t)self->_flags;
  if ((v42 & 0x80) == 0)
  {
    if ((v42 & 0x400000) == 0)
      goto LABEL_114;
LABEL_160:
    v40[426] = self->_includeMatchedToken;
    *(_QWORD *)(v40 + 444) |= 0x400000uLL;
    if ((*(_QWORD *)&self->_flags & 0x2000) == 0)
      goto LABEL_116;
    goto LABEL_115;
  }
  *((_DWORD *)v40 + 96) = self->_knownAccuracy;
  *(_QWORD *)(v40 + 444) |= 0x80uLL;
  v42 = *(_QWORD *)v41;
  if ((*(_QWORD *)v41 & 0x400000) != 0)
    goto LABEL_160;
LABEL_114:
  if ((v42 & 0x2000) != 0)
  {
LABEL_115:
    *((_DWORD *)v40 + 102) = self->_searchSource;
    *(_QWORD *)(v40 + 444) |= 0x2000uLL;
  }
LABEL_116:
  if (-[GEOPlaceSearchRequest optionalSuppressionReasonsCount](self, "optionalSuppressionReasonsCount"))
  {
    objc_msgSend(v48, "clearOptionalSuppressionReasons");
    v43 = -[GEOPlaceSearchRequest optionalSuppressionReasonsCount](self, "optionalSuppressionReasonsCount");
    if (v43)
    {
      v44 = v43;
      for (jj = 0; jj != v44; ++jj)
        objc_msgSend(v48, "addOptionalSuppressionReason:", -[GEOPlaceSearchRequest optionalSuppressionReasonAtIndex:](self, "optionalSuppressionReasonAtIndex:", jj));
    }
  }
  if (self->_searchLocation)
    objc_msgSend(v48, "setSearchLocation:");
  v46 = v48;
  if ((*(_QWORD *)&self->_flags & 0x800000) != 0)
  {
    v48[427] = self->_includeNameForForwardGeocodingResults;
    *(_QWORD *)(v48 + 444) |= 0x800000uLL;
  }
  if (self->_additionalEnabledMarkets)
  {
    objc_msgSend(v48, "setAdditionalEnabledMarkets:");
    v46 = v48;
  }
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x200) != 0)
  {
    *((_DWORD *)v46 + 98) = self->_mapMode;
    *(_QWORD *)(v46 + 444) |= 0x200uLL;
    v47 = (uint64_t)self->_flags;
  }
  if ((v47 & 0x2000000000) != 0)
  {
    v46[441] = self->_isPopularNearbyRequest;
    *(_QWORD *)(v46 + 444) |= 0x2000000000uLL;
  }
  if (self->_deviceLocationCountryCode)
  {
    objc_msgSend(v48, "setDeviceLocationCountryCode:");
    v46 = v48;
  }
  if (self->_viewportCenterCountryCode)
  {
    objc_msgSend(v48, "setViewportCenterCountryCode:");
    v46 = v48;
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
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  $AD124837EA5E8D01781224E63FEA3088 *p_flags;
  uint64_t flags;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  $AD124837EA5E8D01781224E63FEA3088 *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  $AD124837EA5E8D01781224E63FEA3088 *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  $AD124837EA5E8D01781224E63FEA3088 *v50;
  uint64_t v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  $AD124837EA5E8D01781224E63FEA3088 *v57;
  uint64_t v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  $AD124837EA5E8D01781224E63FEA3088 *v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((char *)&self->_flags + 8) & 0x8000000000000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPlaceSearchRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_93;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceSearchRequest readAll:](self, "readAll:", 0);
  PBRepeatedUInt64Copy();
  v9 = -[GEOAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v9;

  v11 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v11;

  v13 = -[NSString copyWithZone:](self->_search, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v13;

  v15 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v15;

  PBRepeatedInt32Copy();
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    *(_BYTE *)(v5 + 428) = self->_includePhonetics;
    *(_QWORD *)(v5 + 444) |= 0x1000000uLL;
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x800) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0)
        goto LABEL_8;
      goto LABEL_96;
    }
  }
  else if ((flags & 0x800) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 400) = self->_maxResults;
  *(_QWORD *)(v5 + 444) |= 0x800uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_97;
  }
LABEL_96:
  *(GEOSessionID *)(v5 + 96) = self->_sessionGUID;
  *(_QWORD *)(v5 + 444) |= 1uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v5 + 380) = self->_businessSortOrder;
  *(_QWORD *)(v5 + 444) |= 0x40uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40000) == 0)
  {
LABEL_10:
    if ((flags & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_99;
  }
LABEL_98:
  *(_BYTE *)(v5 + 422) = self->_includeBusinessRating;
  *(_QWORD *)(v5 + 444) |= 0x40000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_11:
    if ((flags & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_99:
  *(_BYTE *)(v5 + 421) = self->_includeBusinessCategories;
  *(_QWORD *)(v5 + 444) |= 0x20000uLL;
  if ((*(_QWORD *)&self->_flags & 0x400) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 396) = self->_maxBusinessReviews;
    *(_QWORD *)(v5 + 444) |= 0x400uLL;
  }
LABEL_13:
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v19 = self->_filterByBusinessCategorys;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v104, v111, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v105;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v105 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFilterByBusinessCategory:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v104, v111, 16);
    }
    while (v20);
  }

  v24 = (uint64_t)self->_flags;
  if ((v24 & 0x1000000000) != 0)
  {
    *(_BYTE *)(v5 + 440) = self->_isStrictMapRegion;
    *(_QWORD *)(v5 + 444) |= 0x1000000000uLL;
    v24 = (uint64_t)self->_flags;
  }
  if ((v24 & 0x20) != 0)
  {
    *(double *)(v5 + 344) = self->_timestamp;
    *(_QWORD *)(v5 + 444) |= 0x20uLL;
  }
  v25 = -[NSData copyWithZone:](self->_zilchPoints, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v25;

  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
  {
    *(_BYTE *)(v5 + 423) = self->_includeEntryPoints;
    *(_QWORD *)(v5 + 444) |= 0x80000uLL;
  }
  v27 = -[GEOBusinessOptions copyWithZone:](self->_businessOptions, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v27;

  v29 = &self->_flags;
  v30 = (uint64_t)self->_flags;
  if ((v30 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 388) = self->_localSearchProviderID;
    *(_QWORD *)(v5 + 444) |= 0x100uLL;
    v30 = *(_QWORD *)v29;
    if ((*(_QWORD *)v29 & 0x20000000) == 0)
    {
LABEL_28:
      if ((v30 & 0x4000000000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((v30 & 0x20000000) == 0)
  {
    goto LABEL_28;
  }
  *(_BYTE *)(v5 + 433) = self->_includeSuggestionsOnly;
  *(_QWORD *)(v5 + 444) |= 0x20000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x4000000000) != 0)
  {
LABEL_29:
    *(_BYTE *)(v5 + 442) = self->_structuredSearch;
    *(_QWORD *)(v5 + 444) |= 0x4000000000uLL;
  }
LABEL_30:
  v31 = -[NSString copyWithZone:](self->_suggestionsPrefix, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v31;

  v33 = -[NSString copyWithZone:](self->_deviceCountryCode, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v33;

  v35 = -[GEOLatLng copyWithZone:](self->_deviceLocation, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v35;

  v37 = -[NSString copyWithZone:](self->_inputLanguage, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v37;

  v39 = -[NSString copyWithZone:](self->_phoneticLocaleIdentifier, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v39;

  v41 = &self->_flags;
  v42 = (uint64_t)self->_flags;
  if ((v42 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 412) = self->_sequenceNumber;
    *(_QWORD *)(v5 + 444) |= 0x4000uLL;
    v42 = *(_QWORD *)v41;
    if ((*(_QWORD *)v41 & 0x8000000000) == 0)
    {
LABEL_32:
      if ((v42 & 0x400000000) == 0)
        goto LABEL_33;
      goto LABEL_106;
    }
  }
  else if ((v42 & 0x8000000000) == 0)
  {
    goto LABEL_32;
  }
  *(_BYTE *)(v5 + 443) = self->_suppressResultsRequiringAttribution;
  *(_QWORD *)(v5 + 444) |= 0x8000000000uLL;
  v42 = (uint64_t)self->_flags;
  if ((v42 & 0x400000000) == 0)
  {
LABEL_33:
    if ((v42 & 8) == 0)
      goto LABEL_34;
    goto LABEL_107;
  }
LABEL_106:
  *(_BYTE *)(v5 + 438) = self->_isFromAPI;
  *(_QWORD *)(v5 + 444) |= 0x400000000uLL;
  v42 = (uint64_t)self->_flags;
  if ((v42 & 8) == 0)
  {
LABEL_34:
    if ((v42 & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_108;
  }
LABEL_107:
  *(double *)(v5 + 328) = self->_timeSinceMapEnteredForeground;
  *(_QWORD *)(v5 + 444) |= 8uLL;
  v42 = (uint64_t)self->_flags;
  if ((v42 & 0x10) == 0)
  {
LABEL_35:
    if ((v42 & 0x8000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_108:
  *(double *)(v5 + 336) = self->_timeSinceMapViewportChanged;
  *(_QWORD *)(v5 + 444) |= 0x10uLL;
  if ((*(_QWORD *)&self->_flags & 0x8000000) != 0)
  {
LABEL_36:
    *(_BYTE *)(v5 + 431) = self->_includeSpokenNames;
    *(_QWORD *)(v5 + 444) |= 0x8000000uLL;
  }
LABEL_37:
  v43 = -[NSString copyWithZone:](self->_deviceTimeZone, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v43;

  v45 = -[GEOClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v45;

  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 435) = self->_includeTravelTime;
    *(_QWORD *)(v5 + 444) |= 0x80000000uLL;
    v47 = (uint64_t)self->_flags;
  }
  if ((v47 & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 416) = self->_transportTypeForTravelTimes;
    *(_QWORD *)(v5 + 444) |= 0x8000uLL;
  }
  v48 = -[GEOSuggestionsOptions copyWithZone:](self->_suggestionsOptions, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v48;

  v50 = &self->_flags;
  v51 = (uint64_t)self->_flags;
  if ((v51 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 404) = self->_placeTypeLimit;
    *(_QWORD *)(v5 + 444) |= 0x1000uLL;
    v51 = *(_QWORD *)v50;
    if ((*(_QWORD *)v50 & 0x800000000) == 0)
    {
LABEL_43:
      if ((v51 & 0x40000000) == 0)
        goto LABEL_44;
      goto LABEL_112;
    }
  }
  else if ((v51 & 0x800000000) == 0)
  {
    goto LABEL_43;
  }
  *(_BYTE *)(v5 + 439) = self->_isStrictGeocoding;
  *(_QWORD *)(v5 + 444) |= 0x800000000uLL;
  v51 = (uint64_t)self->_flags;
  if ((v51 & 0x40000000) == 0)
  {
LABEL_44:
    if ((v51 & 0x4000000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_112:
  *(_BYTE *)(v5 + 434) = self->_includeTravelDistance;
  *(_QWORD *)(v5 + 444) |= 0x40000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x4000000) != 0)
  {
LABEL_45:
    *(_BYTE *)(v5 + 430) = self->_includeRoadAccessPoints;
    *(_QWORD *)(v5 + 444) |= 0x4000000uLL;
  }
LABEL_46:
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v52 = self->_limitToCountryCodeIso2s;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v101;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v101 != v54)
          objc_enumerationMutation(v52);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * v55), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLimitToCountryCodeIso2:", v56);

        ++v55;
      }
      while (v53 != v55);
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    }
    while (v53);
  }

  v57 = &self->_flags;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x200000000) != 0)
  {
    *(_BYTE *)(v5 + 437) = self->_isCanonicalLocationSearch;
    *(_QWORD *)(v5 + 444) |= 0x200000000uLL;
    v58 = *(_QWORD *)v57;
    if ((*(_QWORD *)v57 & 2) == 0)
    {
LABEL_55:
      if ((v58 & 0x2000000) == 0)
        goto LABEL_56;
      goto LABEL_116;
    }
  }
  else if ((v58 & 2) == 0)
  {
    goto LABEL_55;
  }
  *(_QWORD *)(v5 + 184) = self->_geoId;
  *(_QWORD *)(v5 + 444) |= 2uLL;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x2000000) == 0)
  {
LABEL_56:
    if ((v58 & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_116:
  *(_BYTE *)(v5 + 429) = self->_includeQuads;
  *(_QWORD *)(v5 + 444) |= 0x2000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x10000) != 0)
  {
LABEL_57:
    *(_BYTE *)(v5 + 420) = self->_excludeAddressInResults;
    *(_QWORD *)(v5 + 444) |= 0x10000uLL;
  }
LABEL_58:
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v59 = self->_searchSubstrings;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v97;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v97 != v61)
          objc_enumerationMutation(v59);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * v62), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSearchSubstring:", v63);

        ++v62;
      }
      while (v60 != v62);
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
    }
    while (v60);
  }

  if ((*(_QWORD *)&self->_flags & 0x200000) != 0)
  {
    *(_BYTE *)(v5 + 425) = self->_includeGeoId;
    *(_QWORD *)(v5 + 444) |= 0x200000uLL;
  }
  v64 = -[NSString copyWithZone:](self->_searchContext, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v64;

  v66 = -[GEOSearchSubstring copyWithZone:](self->_searchContextSubstring, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v66;

  if ((*(_QWORD *)&self->_flags & 0x10000000) != 0)
  {
    *(_BYTE *)(v5 + 432) = self->_includeStatusCodeInfo;
    *(_QWORD *)(v5 + 444) |= 0x10000000uLL;
  }
  v68 = -[GEOAddress copyWithZone:](self->_preserveFields, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v68;

  if ((*(_QWORD *)&self->_flags & 0x100000000) != 0)
  {
    *(_BYTE *)(v5 + 436) = self->_includeUnmatchedStrings;
    *(_QWORD *)(v5 + 444) |= 0x100000000uLL;
  }
  v70 = -[GEOIndexQueryNode copyWithZone:](self->_indexFilter, "copyWithZone:", a3);
  v71 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v70;

  if ((*(_QWORD *)&self->_flags & 0x100000) != 0)
  {
    *(_BYTE *)(v5 + 424) = self->_includeFeatureSets;
    *(_QWORD *)(v5 + 444) |= 0x100000uLL;
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v72 = self->_serviceTags;
  v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
  if (v73)
  {
    v74 = *(_QWORD *)v93;
    do
    {
      v75 = 0;
      do
      {
        if (*(_QWORD *)v93 != v74)
          objc_enumerationMutation(v72);
        v76 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v75), "copyWithZone:", a3, (_QWORD)v92);
        objc_msgSend((id)v5, "addServiceTag:", v76);

        ++v75;
      }
      while (v73 != v75);
      v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
    }
    while (v73);
  }

  if ((*(_QWORD *)&self->_flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 208) = self->_intersectingGeoId;
    *(_QWORD *)(v5 + 444) |= 4uLL;
  }
  v77 = -[GEOLatLng copyWithZone:](self->_knownLocation, "copyWithZone:", a3, (_QWORD)v92);
  v78 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v77;

  v79 = &self->_flags;
  v80 = (uint64_t)self->_flags;
  if ((v80 & 0x80) == 0)
  {
    if ((v80 & 0x400000) == 0)
      goto LABEL_84;
LABEL_119:
    *(_BYTE *)(v5 + 426) = self->_includeMatchedToken;
    *(_QWORD *)(v5 + 444) |= 0x400000uLL;
    if ((*(_QWORD *)&self->_flags & 0x2000) == 0)
      goto LABEL_86;
    goto LABEL_85;
  }
  *(_DWORD *)(v5 + 384) = self->_knownAccuracy;
  *(_QWORD *)(v5 + 444) |= 0x80uLL;
  v80 = *(_QWORD *)v79;
  if ((*(_QWORD *)v79 & 0x400000) != 0)
    goto LABEL_119;
LABEL_84:
  if ((v80 & 0x2000) != 0)
  {
LABEL_85:
    *(_DWORD *)(v5 + 408) = self->_searchSource;
    *(_QWORD *)(v5 + 444) |= 0x2000uLL;
  }
LABEL_86:
  PBRepeatedInt32Copy();
  v81 = -[GEOLatLng copyWithZone:](self->_searchLocation, "copyWithZone:", a3);
  v82 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v81;

  if ((*(_QWORD *)&self->_flags & 0x800000) != 0)
  {
    *(_BYTE *)(v5 + 427) = self->_includeNameForForwardGeocodingResults;
    *(_QWORD *)(v5 + 444) |= 0x800000uLL;
  }
  v83 = -[GEOAdditionalEnabledMarkets copyWithZone:](self->_additionalEnabledMarkets, "copyWithZone:", a3);
  v84 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v83;

  v85 = (uint64_t)self->_flags;
  if ((v85 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 392) = self->_mapMode;
    *(_QWORD *)(v5 + 444) |= 0x200uLL;
    v85 = (uint64_t)self->_flags;
  }
  if ((v85 & 0x2000000000) != 0)
  {
    *(_BYTE *)(v5 + 441) = self->_isPopularNearbyRequest;
    *(_QWORD *)(v5 + 444) |= 0x2000000000uLL;
  }
  v86 = -[NSString copyWithZone:](self->_deviceLocationCountryCode, "copyWithZone:", a3);
  v87 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v86;

  v88 = -[NSString copyWithZone:](self->_viewportCenterCountryCode, "copyWithZone:", a3);
  v89 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v88;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  v90 = (id)v5;
LABEL_93:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  GEOAddress *address;
  GEOLocation *location;
  NSString *search;
  GEOMapRegion *mapRegion;
  uint64_t flags;
  uint64_t v10;
  NSMutableArray *filterByBusinessCategorys;
  NSData *zilchPoints;
  GEOBusinessOptions *businessOptions;
  NSString *suggestionsPrefix;
  NSString *deviceCountryCode;
  GEOLatLng *deviceLocation;
  NSString *inputLanguage;
  NSString *phoneticLocaleIdentifier;
  uint64_t v20;
  uint64_t v21;
  NSString *deviceTimeZone;
  GEOClientCapabilities *clientCapabilities;
  uint64_t v24;
  uint64_t v25;
  GEOSuggestionsOptions *suggestionsOptions;
  NSMutableArray *limitToCountryCodeIso2s;
  NSMutableArray *searchSubstrings;
  NSString *searchContext;
  GEOSearchSubstring *searchContextSubstring;
  uint64_t v31;
  uint64_t v32;
  GEOAddress *preserveFields;
  GEOIndexQueryNode *indexFilter;
  NSMutableArray *serviceTags;
  GEOLatLng *knownLocation;
  GEOLatLng *searchLocation;
  uint64_t v38;
  uint64_t v39;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  NSString *deviceLocationCountryCode;
  NSString *viewportCenterCountryCode;
  char v43;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_346;
  -[GEOPlaceSearchRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_346;
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOAddress isEqual:](address, "isEqual:"))
      goto LABEL_346;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 29))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:"))
      goto LABEL_346;
  }
  search = self->_search;
  if ((unint64_t)search | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](search, "isEqual:"))
      goto LABEL_346;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_346;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_346;
  flags = (uint64_t)self->_flags;
  v10 = *(_QWORD *)(v4 + 444);
  if ((flags & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0)
      goto LABEL_346;
    if (self->_includePhonetics)
    {
      if (!v4[428])
        goto LABEL_346;
    }
    else if (v4[428])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_maxResults != *((_DWORD *)v4 + 100))
      goto LABEL_346;
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 1) != 0 && (v10 & 1) != 0)
  {
    if (self->_sessionGUID._high != *((_QWORD *)v4 + 12) || self->_sessionGUID._low != *((_QWORD *)v4 + 13))
      goto LABEL_346;
  }
  else if (((flags | v10) & 1) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_businessSortOrder != *((_DWORD *)v4 + 95))
      goto LABEL_346;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0)
      goto LABEL_346;
    if (self->_includeBusinessRating)
    {
      if (!v4[422])
        goto LABEL_346;
    }
    else if (v4[422])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0)
      goto LABEL_346;
    if (self->_includeBusinessCategories)
    {
      if (!v4[421])
        goto LABEL_346;
    }
    else if (v4[421])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_maxBusinessReviews != *((_DWORD *)v4 + 99))
      goto LABEL_346;
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_346;
  }
  filterByBusinessCategorys = self->_filterByBusinessCategorys;
  if ((unint64_t)filterByBusinessCategorys | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](filterByBusinessCategorys, "isEqual:"))
      goto LABEL_346;
    flags = (uint64_t)self->_flags;
    v10 = *(_QWORD *)(v4 + 444);
  }
  if ((flags & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0)
      goto LABEL_346;
    if (self->_isStrictMapRegion)
    {
      if (!v4[440])
        goto LABEL_346;
    }
    else if (v4[440])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_timestamp != *((double *)v4 + 43))
      goto LABEL_346;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_346;
  }
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((_QWORD *)v4 + 45))
  {
    if (!-[NSData isEqual:](zilchPoints, "isEqual:"))
      goto LABEL_346;
    flags = (uint64_t)self->_flags;
    v10 = *(_QWORD *)(v4 + 444);
  }
  if ((flags & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0)
      goto LABEL_346;
    if (self->_includeEntryPoints)
    {
      if (!v4[423])
        goto LABEL_346;
    }
    else if (v4[423])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_346;
  }
  businessOptions = self->_businessOptions;
  if ((unint64_t)businessOptions | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOBusinessOptions isEqual:](businessOptions, "isEqual:"))
      goto LABEL_346;
    flags = (uint64_t)self->_flags;
    v10 = *(_QWORD *)(v4 + 444);
  }
  if ((flags & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 97))
      goto LABEL_346;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0)
      goto LABEL_346;
    if (self->_includeSuggestionsOnly)
    {
      if (!v4[433])
        goto LABEL_346;
    }
    else if (v4[433])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x4000000000) != 0)
  {
    if ((v10 & 0x4000000000) == 0)
      goto LABEL_346;
    if (self->_structuredSearch)
    {
      if (!v4[442])
        goto LABEL_346;
    }
    else if (v4[442])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x4000000000) != 0)
  {
    goto LABEL_346;
  }
  suggestionsPrefix = self->_suggestionsPrefix;
  if ((unint64_t)suggestionsPrefix | *((_QWORD *)v4 + 40)
    && !-[NSString isEqual:](suggestionsPrefix, "isEqual:"))
  {
    goto LABEL_346;
  }
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](deviceCountryCode, "isEqual:"))
      goto LABEL_346;
  }
  deviceLocation = self->_deviceLocation;
  if ((unint64_t)deviceLocation | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOLatLng isEqual:](deviceLocation, "isEqual:"))
      goto LABEL_346;
  }
  inputLanguage = self->_inputLanguage;
  if ((unint64_t)inputLanguage | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](inputLanguage, "isEqual:"))
      goto LABEL_346;
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:"))
      goto LABEL_346;
  }
  v20 = (uint64_t)self->_flags;
  v21 = *(_QWORD *)(v4 + 444);
  if ((v20 & 0x4000) != 0)
  {
    if ((v21 & 0x4000) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 103))
      goto LABEL_346;
  }
  else if ((v21 & 0x4000) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x8000000000) != 0)
  {
    if ((v21 & 0x8000000000) == 0)
      goto LABEL_346;
    if (self->_suppressResultsRequiringAttribution)
    {
      if (!v4[443])
        goto LABEL_346;
    }
    else if (v4[443])
    {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x8000000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x400000000) != 0)
  {
    if ((v21 & 0x400000000) == 0)
      goto LABEL_346;
    if (self->_isFromAPI)
    {
      if (!v4[438])
        goto LABEL_346;
    }
    else if (v4[438])
    {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x400000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 8) != 0)
  {
    if ((v21 & 8) == 0 || self->_timeSinceMapEnteredForeground != *((double *)v4 + 41))
      goto LABEL_346;
  }
  else if ((v21 & 8) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0 || self->_timeSinceMapViewportChanged != *((double *)v4 + 42))
      goto LABEL_346;
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x8000000) != 0)
  {
    if ((v21 & 0x8000000) == 0)
      goto LABEL_346;
    if (self->_includeSpokenNames)
    {
      if (!v4[431])
        goto LABEL_346;
    }
    else if (v4[431])
    {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x8000000) != 0)
  {
    goto LABEL_346;
  }
  deviceTimeZone = self->_deviceTimeZone;
  if ((unint64_t)deviceTimeZone | *((_QWORD *)v4 + 20)
    && !-[NSString isEqual:](deviceTimeZone, "isEqual:"))
  {
    goto LABEL_346;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
      goto LABEL_346;
  }
  v24 = (uint64_t)self->_flags;
  v25 = *(_QWORD *)(v4 + 444);
  if ((v24 & 0x80000000) != 0)
  {
    if ((v25 & 0x80000000) == 0)
      goto LABEL_346;
    if (self->_includeTravelTime)
    {
      if (!v4[435])
        goto LABEL_346;
    }
    else if (v4[435])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x80000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x8000) != 0)
  {
    if ((v25 & 0x8000) == 0 || self->_transportTypeForTravelTimes != *((_DWORD *)v4 + 104))
      goto LABEL_346;
  }
  else if ((v25 & 0x8000) != 0)
  {
    goto LABEL_346;
  }
  suggestionsOptions = self->_suggestionsOptions;
  if ((unint64_t)suggestionsOptions | *((_QWORD *)v4 + 39))
  {
    if (!-[GEOSuggestionsOptions isEqual:](suggestionsOptions, "isEqual:"))
      goto LABEL_346;
    v24 = (uint64_t)self->_flags;
    v25 = *(_QWORD *)(v4 + 444);
  }
  if ((v24 & 0x1000) != 0)
  {
    if ((v25 & 0x1000) == 0 || self->_placeTypeLimit != *((_DWORD *)v4 + 101))
      goto LABEL_346;
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x800000000) != 0)
  {
    if ((v25 & 0x800000000) == 0)
      goto LABEL_346;
    if (self->_isStrictGeocoding)
    {
      if (!v4[439])
        goto LABEL_346;
    }
    else if (v4[439])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x800000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x40000000) != 0)
  {
    if ((v25 & 0x40000000) == 0)
      goto LABEL_346;
    if (self->_includeTravelDistance)
    {
      if (!v4[434])
        goto LABEL_346;
    }
    else if (v4[434])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x40000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x4000000) != 0)
  {
    if ((v25 & 0x4000000) == 0)
      goto LABEL_346;
    if (self->_includeRoadAccessPoints)
    {
      if (!v4[430])
        goto LABEL_346;
    }
    else if (v4[430])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x4000000) != 0)
  {
    goto LABEL_346;
  }
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;
  if ((unint64_t)limitToCountryCodeIso2s | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](limitToCountryCodeIso2s, "isEqual:"))
      goto LABEL_346;
    v24 = (uint64_t)self->_flags;
    v25 = *(_QWORD *)(v4 + 444);
  }
  if ((v24 & 0x200000000) != 0)
  {
    if ((v25 & 0x200000000) == 0)
      goto LABEL_346;
    if (self->_isCanonicalLocationSearch)
    {
      if (!v4[437])
        goto LABEL_346;
    }
    else if (v4[437])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x200000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_geoId != *((_QWORD *)v4 + 23))
      goto LABEL_346;
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x2000000) != 0)
  {
    if ((v25 & 0x2000000) == 0)
      goto LABEL_346;
    if (self->_includeQuads)
    {
      if (!v4[429])
        goto LABEL_346;
    }
    else if (v4[429])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x2000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x10000) != 0)
  {
    if ((v25 & 0x10000) == 0)
      goto LABEL_346;
    if (self->_excludeAddressInResults)
    {
      if (!v4[420])
        goto LABEL_346;
    }
    else if (v4[420])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x10000) != 0)
  {
    goto LABEL_346;
  }
  searchSubstrings = self->_searchSubstrings;
  if ((unint64_t)searchSubstrings | *((_QWORD *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](searchSubstrings, "isEqual:"))
      goto LABEL_346;
    v24 = (uint64_t)self->_flags;
    v25 = *(_QWORD *)(v4 + 444);
  }
  if ((v24 & 0x200000) != 0)
  {
    if ((v25 & 0x200000) == 0)
      goto LABEL_346;
    if (self->_includeGeoId)
    {
      if (!v4[425])
        goto LABEL_346;
    }
    else if (v4[425])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x200000) != 0)
  {
    goto LABEL_346;
  }
  searchContext = self->_searchContext;
  if ((unint64_t)searchContext | *((_QWORD *)v4 + 34)
    && !-[NSString isEqual:](searchContext, "isEqual:"))
  {
    goto LABEL_346;
  }
  searchContextSubstring = self->_searchContextSubstring;
  if ((unint64_t)searchContextSubstring | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOSearchSubstring isEqual:](searchContextSubstring, "isEqual:"))
      goto LABEL_346;
  }
  v31 = (uint64_t)self->_flags;
  v32 = *(_QWORD *)(v4 + 444);
  if ((v31 & 0x10000000) != 0)
  {
    if ((v32 & 0x10000000) == 0)
      goto LABEL_346;
    if (self->_includeStatusCodeInfo)
    {
      if (!v4[432])
        goto LABEL_346;
    }
    else if (v4[432])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x10000000) != 0)
  {
    goto LABEL_346;
  }
  preserveFields = self->_preserveFields;
  if ((unint64_t)preserveFields | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOAddress isEqual:](preserveFields, "isEqual:"))
      goto LABEL_346;
    v31 = (uint64_t)self->_flags;
    v32 = *(_QWORD *)(v4 + 444);
  }
  if ((v31 & 0x100000000) != 0)
  {
    if ((v32 & 0x100000000) == 0)
      goto LABEL_346;
    if (self->_includeUnmatchedStrings)
    {
      if (!v4[436])
        goto LABEL_346;
    }
    else if (v4[436])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x100000000) != 0)
  {
    goto LABEL_346;
  }
  indexFilter = self->_indexFilter;
  if ((unint64_t)indexFilter | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOIndexQueryNode isEqual:](indexFilter, "isEqual:"))
      goto LABEL_346;
    v31 = (uint64_t)self->_flags;
    v32 = *(_QWORD *)(v4 + 444);
  }
  if ((v31 & 0x100000) != 0)
  {
    if ((v32 & 0x100000) == 0)
      goto LABEL_346;
    if (self->_includeFeatureSets)
    {
      if (!v4[424])
        goto LABEL_346;
    }
    else if (v4[424])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x100000) != 0)
  {
    goto LABEL_346;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((_QWORD *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](serviceTags, "isEqual:"))
      goto LABEL_346;
    v31 = (uint64_t)self->_flags;
    v32 = *(_QWORD *)(v4 + 444);
  }
  if ((v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_intersectingGeoId != *((_QWORD *)v4 + 26))
      goto LABEL_346;
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_346;
  }
  knownLocation = self->_knownLocation;
  if ((unint64_t)knownLocation | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOLatLng isEqual:](knownLocation, "isEqual:"))
      goto LABEL_346;
    v31 = (uint64_t)self->_flags;
    v32 = *(_QWORD *)(v4 + 444);
  }
  if ((v31 & 0x80) != 0)
  {
    if ((v32 & 0x80) == 0 || self->_knownAccuracy != *((_DWORD *)v4 + 96))
      goto LABEL_346;
  }
  else if ((v32 & 0x80) != 0)
  {
    goto LABEL_346;
  }
  if ((v31 & 0x400000) != 0)
  {
    if ((v32 & 0x400000) == 0)
      goto LABEL_346;
    if (self->_includeMatchedToken)
    {
      if (!v4[426])
        goto LABEL_346;
    }
    else if (v4[426])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x400000) != 0)
  {
    goto LABEL_346;
  }
  if ((v31 & 0x2000) != 0)
  {
    if ((v32 & 0x2000) == 0 || self->_searchSource != *((_DWORD *)v4 + 102))
      goto LABEL_346;
  }
  else if ((v32 & 0x2000) != 0)
  {
    goto LABEL_346;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_346;
  searchLocation = self->_searchLocation;
  if ((unint64_t)searchLocation | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOLatLng isEqual:](searchLocation, "isEqual:"))
      goto LABEL_346;
  }
  v38 = (uint64_t)self->_flags;
  v39 = *(_QWORD *)(v4 + 444);
  if ((v38 & 0x800000) != 0)
  {
    if ((v39 & 0x800000) == 0)
      goto LABEL_346;
    if (self->_includeNameForForwardGeocodingResults)
    {
      if (!v4[427])
        goto LABEL_346;
    }
    else if (v4[427])
    {
      goto LABEL_346;
    }
  }
  else if ((v39 & 0x800000) != 0)
  {
    goto LABEL_346;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:"))
      goto LABEL_346;
    v38 = (uint64_t)self->_flags;
    v39 = *(_QWORD *)(v4 + 444);
  }
  if ((v38 & 0x200) != 0)
  {
    if ((v39 & 0x200) == 0 || self->_mapMode != *((_DWORD *)v4 + 98))
      goto LABEL_346;
  }
  else if ((v39 & 0x200) != 0)
  {
    goto LABEL_346;
  }
  if ((v38 & 0x2000000000) == 0)
  {
    if ((v39 & 0x2000000000) == 0)
      goto LABEL_342;
LABEL_346:
    v43 = 0;
    goto LABEL_347;
  }
  if ((v39 & 0x2000000000) == 0)
    goto LABEL_346;
  if (self->_isPopularNearbyRequest)
  {
    if (!v4[441])
      goto LABEL_346;
  }
  else if (v4[441])
  {
    goto LABEL_346;
  }
LABEL_342:
  deviceLocationCountryCode = self->_deviceLocationCountryCode;
  if ((unint64_t)deviceLocationCountryCode | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](deviceLocationCountryCode, "isEqual:"))
  {
    goto LABEL_346;
  }
  viewportCenterCountryCode = self->_viewportCenterCountryCode;
  if ((unint64_t)viewportCenterCountryCode | *((_QWORD *)v4 + 44))
    v43 = -[NSString isEqual:](viewportCenterCountryCode, "isEqual:");
  else
    v43 = 1;
LABEL_347:

  return v43;
}

- (unint64_t)hash
{
  uint64_t flags;
  uint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double timeSinceMapEnteredForeground;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double timeSinceMapViewportChanged;
  double v19;
  long double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSUInteger v36;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  NSUInteger v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  NSUInteger v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSUInteger v69;
  NSUInteger v70;
  unint64_t v71;
  NSUInteger v72;
  NSUInteger v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  NSUInteger v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;

  -[GEOPlaceSearchRequest readAll:](self, "readAll:", 1);
  v95 = PBRepeatedUInt64Hash();
  v94 = -[GEOAddress hash](self->_address, "hash");
  v93 = -[GEOLocation hash](self->_location, "hash");
  v92 = -[NSString hash](self->_search, "hash");
  v91 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v90 = PBRepeatedInt32Hash();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    v89 = 2654435761 * self->_includePhonetics;
    if ((flags & 0x800) != 0)
    {
LABEL_3:
      v88 = 2654435761 * self->_maxResults;
      if ((flags & 1) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v89 = 0;
    if ((flags & 0x800) != 0)
      goto LABEL_3;
  }
  v88 = 0;
  if ((flags & 1) != 0)
  {
LABEL_4:
    v87 = PBHashBytes();
    flags = (uint64_t)self->_flags;
    if ((flags & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v87 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_5:
    v86 = 2654435761 * self->_businessSortOrder;
    if ((flags & 0x40000) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v86 = 0;
  if ((flags & 0x40000) != 0)
  {
LABEL_6:
    v85 = 2654435761 * self->_includeBusinessRating;
    if ((flags & 0x20000) != 0)
      goto LABEL_7;
LABEL_14:
    v84 = 0;
    if ((flags & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v85 = 0;
  if ((flags & 0x20000) == 0)
    goto LABEL_14;
LABEL_7:
  v84 = 2654435761 * self->_includeBusinessCategories;
  if ((flags & 0x400) != 0)
  {
LABEL_8:
    v83 = 2654435761 * self->_maxBusinessReviews;
    goto LABEL_16;
  }
LABEL_15:
  v83 = 0;
LABEL_16:
  v82 = -[NSMutableArray hash](self->_filterByBusinessCategorys, "hash");
  v4 = (uint64_t)self->_flags;
  if ((v4 & 0x1000000000) != 0)
  {
    v81 = 2654435761 * self->_isStrictMapRegion;
    if ((v4 & 0x20) != 0)
      goto LABEL_18;
LABEL_23:
    v9 = 0;
    goto LABEL_26;
  }
  v81 = 0;
  if ((v4 & 0x20) == 0)
    goto LABEL_23;
LABEL_18:
  timestamp = self->_timestamp;
  v6 = -timestamp;
  if (timestamp >= 0.0)
    v6 = self->_timestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_26:
  v80 = v9;
  v79 = -[NSData hash](self->_zilchPoints, "hash");
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
    v78 = 2654435761 * self->_includeEntryPoints;
  else
    v78 = 0;
  v77 = -[GEOBusinessOptions hash](self->_businessOptions, "hash");
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x100) == 0)
  {
    v76 = 0;
    if ((v10 & 0x20000000) != 0)
      goto LABEL_31;
LABEL_34:
    v75 = 0;
    if ((v10 & 0x4000000000) != 0)
      goto LABEL_32;
    goto LABEL_35;
  }
  v76 = 2654435761 * self->_localSearchProviderID;
  if ((v10 & 0x20000000) == 0)
    goto LABEL_34;
LABEL_31:
  v75 = 2654435761 * self->_includeSuggestionsOnly;
  if ((v10 & 0x4000000000) != 0)
  {
LABEL_32:
    v74 = 2654435761 * self->_structuredSearch;
    goto LABEL_36;
  }
LABEL_35:
  v74 = 0;
LABEL_36:
  v73 = -[NSString hash](self->_suggestionsPrefix, "hash");
  v72 = -[NSString hash](self->_deviceCountryCode, "hash");
  v71 = -[GEOLatLng hash](self->_deviceLocation, "hash");
  v70 = -[NSString hash](self->_inputLanguage, "hash");
  v69 = -[NSString hash](self->_phoneticLocaleIdentifier, "hash");
  v11 = (uint64_t)self->_flags;
  if ((v11 & 0x4000) != 0)
  {
    v68 = 2654435761 * self->_sequenceNumber;
    if ((v11 & 0x8000000000) != 0)
    {
LABEL_38:
      v67 = 2654435761 * self->_suppressResultsRequiringAttribution;
      if ((v11 & 0x400000000) != 0)
        goto LABEL_39;
LABEL_46:
      v66 = 0;
      if ((v11 & 8) != 0)
        goto LABEL_40;
LABEL_47:
      v16 = 0;
      goto LABEL_50;
    }
  }
  else
  {
    v68 = 0;
    if ((v11 & 0x8000000000) != 0)
      goto LABEL_38;
  }
  v67 = 0;
  if ((v11 & 0x400000000) == 0)
    goto LABEL_46;
LABEL_39:
  v66 = 2654435761 * self->_isFromAPI;
  if ((v11 & 8) == 0)
    goto LABEL_47;
LABEL_40:
  timeSinceMapEnteredForeground = self->_timeSinceMapEnteredForeground;
  v13 = -timeSinceMapEnteredForeground;
  if (timeSinceMapEnteredForeground >= 0.0)
    v13 = self->_timeSinceMapEnteredForeground;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0)
      v16 += (unint64_t)v15;
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_50:
  if ((v11 & 0x10) != 0)
  {
    timeSinceMapViewportChanged = self->_timeSinceMapViewportChanged;
    v19 = -timeSinceMapViewportChanged;
    if (timeSinceMapViewportChanged >= 0.0)
      v19 = self->_timeSinceMapViewportChanged;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  v65 = v17;
  if ((v11 & 0x8000000) != 0)
    v64 = 2654435761 * self->_includeSpokenNames;
  else
    v64 = 0;
  v63 = -[NSString hash](self->_deviceTimeZone, "hash");
  v62 = -[GEOClientCapabilities hash](self->_clientCapabilities, "hash");
  v22 = (uint64_t)self->_flags;
  if ((v22 & 0x80000000) != 0)
  {
    v61 = 2654435761 * self->_includeTravelTime;
    if ((v22 & 0x8000) != 0)
      goto LABEL_63;
  }
  else
  {
    v61 = 0;
    if ((v22 & 0x8000) != 0)
    {
LABEL_63:
      v60 = 2654435761 * self->_transportTypeForTravelTimes;
      goto LABEL_66;
    }
  }
  v60 = 0;
LABEL_66:
  v59 = -[GEOSuggestionsOptions hash](self->_suggestionsOptions, "hash");
  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x1000) != 0)
  {
    v58 = 2654435761 * self->_placeTypeLimit;
    if ((v23 & 0x800000000) != 0)
    {
LABEL_68:
      v57 = 2654435761 * self->_isStrictGeocoding;
      if ((v23 & 0x40000000) != 0)
        goto LABEL_69;
LABEL_73:
      v56 = 0;
      if ((v23 & 0x4000000) != 0)
        goto LABEL_70;
      goto LABEL_74;
    }
  }
  else
  {
    v58 = 0;
    if ((v23 & 0x800000000) != 0)
      goto LABEL_68;
  }
  v57 = 0;
  if ((v23 & 0x40000000) == 0)
    goto LABEL_73;
LABEL_69:
  v56 = 2654435761 * self->_includeTravelDistance;
  if ((v23 & 0x4000000) != 0)
  {
LABEL_70:
    v55 = 2654435761 * self->_includeRoadAccessPoints;
    goto LABEL_75;
  }
LABEL_74:
  v55 = 0;
LABEL_75:
  v54 = -[NSMutableArray hash](self->_limitToCountryCodeIso2s, "hash");
  v24 = (uint64_t)self->_flags;
  if ((v24 & 0x200000000) != 0)
  {
    v53 = 2654435761 * self->_isCanonicalLocationSearch;
    if ((v24 & 2) != 0)
    {
LABEL_77:
      v52 = 2654435761 * self->_geoId;
      if ((v24 & 0x2000000) != 0)
        goto LABEL_78;
LABEL_82:
      v51 = 0;
      if ((v24 & 0x10000) != 0)
        goto LABEL_79;
      goto LABEL_83;
    }
  }
  else
  {
    v53 = 0;
    if ((v24 & 2) != 0)
      goto LABEL_77;
  }
  v52 = 0;
  if ((v24 & 0x2000000) == 0)
    goto LABEL_82;
LABEL_78:
  v51 = 2654435761 * self->_includeQuads;
  if ((v24 & 0x10000) != 0)
  {
LABEL_79:
    v50 = 2654435761 * self->_excludeAddressInResults;
    goto LABEL_84;
  }
LABEL_83:
  v50 = 0;
LABEL_84:
  v49 = -[NSMutableArray hash](self->_searchSubstrings, "hash");
  if ((*(_QWORD *)&self->_flags & 0x200000) != 0)
    v48 = 2654435761 * self->_includeGeoId;
  else
    v48 = 0;
  v47 = -[NSString hash](self->_searchContext, "hash");
  v46 = -[GEOSearchSubstring hash](self->_searchContextSubstring, "hash");
  if ((*(_QWORD *)&self->_flags & 0x10000000) != 0)
    v45 = 2654435761 * self->_includeStatusCodeInfo;
  else
    v45 = 0;
  v44 = -[GEOAddress hash](self->_preserveFields, "hash");
  if ((*(_QWORD *)&self->_flags & 0x100000000) != 0)
    v43 = 2654435761 * self->_includeUnmatchedStrings;
  else
    v43 = 0;
  v42 = -[GEOIndexQueryNode hash](self->_indexFilter, "hash");
  if ((*(_QWORD *)&self->_flags & 0x100000) != 0)
    v41 = 2654435761 * self->_includeFeatureSets;
  else
    v41 = 0;
  v40 = -[NSMutableArray hash](self->_serviceTags, "hash");
  if ((*(_QWORD *)&self->_flags & 4) != 0)
    v39 = 2654435761u * self->_intersectingGeoId;
  else
    v39 = 0;
  v38 = -[GEOLatLng hash](self->_knownLocation, "hash");
  v25 = (uint64_t)self->_flags;
  if ((v25 & 0x80) == 0)
  {
    v26 = 0;
    if ((v25 & 0x400000) != 0)
      goto LABEL_101;
LABEL_104:
    v27 = 0;
    if ((v25 & 0x2000) != 0)
      goto LABEL_102;
    goto LABEL_105;
  }
  v26 = 2654435761 * self->_knownAccuracy;
  if ((v25 & 0x400000) == 0)
    goto LABEL_104;
LABEL_101:
  v27 = 2654435761 * self->_includeMatchedToken;
  if ((v25 & 0x2000) != 0)
  {
LABEL_102:
    v28 = 2654435761 * self->_searchSource;
    goto LABEL_106;
  }
LABEL_105:
  v28 = 0;
LABEL_106:
  v29 = PBRepeatedInt32Hash();
  v30 = -[GEOLatLng hash](self->_searchLocation, "hash");
  if ((*(_QWORD *)&self->_flags & 0x800000) != 0)
    v31 = 2654435761 * self->_includeNameForForwardGeocodingResults;
  else
    v31 = 0;
  v32 = -[GEOAdditionalEnabledMarkets hash](self->_additionalEnabledMarkets, "hash");
  v33 = (uint64_t)self->_flags;
  if ((v33 & 0x200) != 0)
  {
    v34 = 2654435761 * self->_mapMode;
    if ((v33 & 0x2000000000) != 0)
      goto LABEL_111;
LABEL_113:
    v35 = 0;
    goto LABEL_114;
  }
  v34 = 0;
  if ((v33 & 0x2000000000) == 0)
    goto LABEL_113;
LABEL_111:
  v35 = 2654435761 * self->_isPopularNearbyRequest;
LABEL_114:
  v36 = v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v34 ^ v35 ^ -[NSString hash](self->_deviceLocationCountryCode, "hash");
  return v94 ^ v95 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v16 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v36 ^ -[NSString hash](self->_viewportCenterCountryCode, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  GEOAddress *address;
  uint64_t v9;
  GEOLocation *location;
  uint64_t v11;
  GEOMapRegion *mapRegion;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  GEOBusinessOptions *businessOptions;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  GEOLatLng *deviceLocation;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  GEOClientCapabilities *clientCapabilities;
  uint64_t v34;
  uint64_t v35;
  GEOSuggestionsOptions *suggestionsOptions;
  void *v37;
  id v38;
  char v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  uint64_t *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  GEOSearchSubstring *searchContextSubstring;
  uint64_t v58;
  GEOAddress *preserveFields;
  uint64_t v60;
  GEOIndexQueryNode *indexFilter;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t ii;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t jj;
  GEOLatLng *knownLocation;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t kk;
  GEOLatLng *searchLocation;
  uint64_t v84;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "businessIDsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOPlaceSearchRequest addBusinessID:](self, "addBusinessID:", objc_msgSend(v4, "businessIDAtIndex:", i));
  }
  address = self->_address;
  v9 = *((_QWORD *)v4 + 15);
  if (address)
  {
    if (v9)
      -[GEOAddress mergeFrom:](address, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOPlaceSearchRequest setAddress:](self, "setAddress:");
  }
  location = self->_location;
  v11 = *((_QWORD *)v4 + 29);
  if (location)
  {
    if (v11)
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOPlaceSearchRequest setLocation:](self, "setLocation:");
  }
  if (*((_QWORD *)v4 + 37))
    -[GEOPlaceSearchRequest setSearch:](self, "setSearch:");
  mapRegion = self->_mapRegion;
  v13 = *((_QWORD *)v4 + 30);
  if (mapRegion)
  {
    if (v13)
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOPlaceSearchRequest setMapRegion:](self, "setMapRegion:");
  }
  v14 = objc_msgSend(v4, "additionalPlaceTypesCount");
  if (v14)
  {
    v15 = v14;
    for (j = 0; j != v15; ++j)
      -[GEOPlaceSearchRequest addAdditionalPlaceType:](self, "addAdditionalPlaceType:", objc_msgSend(v4, "additionalPlaceTypeAtIndex:", j));
  }
  v17 = (uint64_t *)(v4 + 444);
  v18 = *(_QWORD *)(v4 + 444);
  if ((v18 & 0x1000000) != 0)
  {
    self->_includePhonetics = v4[428];
    *(_QWORD *)&self->_flags |= 0x1000000uLL;
    v18 = *v17;
    if ((*v17 & 0x800) == 0)
    {
LABEL_26:
      if ((v18 & 1) == 0)
        goto LABEL_27;
      goto LABEL_52;
    }
  }
  else if ((v18 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  self->_maxResults = *((_DWORD *)v4 + 100);
  *(_QWORD *)&self->_flags |= 0x800uLL;
  v18 = *(_QWORD *)(v4 + 444);
  if ((v18 & 1) == 0)
  {
LABEL_27:
    if ((v18 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_53;
  }
LABEL_52:
  self->_sessionGUID = (GEOSessionID)*((_OWORD *)v4 + 6);
  *(_QWORD *)&self->_flags |= 1uLL;
  v18 = *(_QWORD *)(v4 + 444);
  if ((v18 & 0x40) == 0)
  {
LABEL_28:
    if ((v18 & 0x40000) == 0)
      goto LABEL_29;
    goto LABEL_54;
  }
LABEL_53:
  self->_businessSortOrder = *((_DWORD *)v4 + 95);
  *(_QWORD *)&self->_flags |= 0x40uLL;
  v18 = *(_QWORD *)(v4 + 444);
  if ((v18 & 0x40000) == 0)
  {
LABEL_29:
    if ((v18 & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_55;
  }
LABEL_54:
  self->_includeBusinessRating = v4[422];
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  v18 = *(_QWORD *)(v4 + 444);
  if ((v18 & 0x20000) == 0)
  {
LABEL_30:
    if ((v18 & 0x400) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_55:
  self->_includeBusinessCategories = v4[421];
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  if ((*(_QWORD *)(v4 + 444) & 0x400) != 0)
  {
LABEL_31:
    self->_maxBusinessReviews = *((_DWORD *)v4 + 99);
    *(_QWORD *)&self->_flags |= 0x400uLL;
  }
LABEL_32:
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v19 = *((id *)v4 + 22);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v101;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v101 != v22)
          objc_enumerationMutation(v19);
        -[GEOPlaceSearchRequest addFilterByBusinessCategory:](self, "addFilterByBusinessCategory:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
    }
    while (v21);
  }

  v24 = *(_QWORD *)(v4 + 444);
  if ((v24 & 0x1000000000) != 0)
  {
    self->_isStrictMapRegion = v4[440];
    *(_QWORD *)&self->_flags |= 0x1000000000uLL;
    v24 = *(_QWORD *)(v4 + 444);
  }
  if ((v24 & 0x20) != 0)
  {
    self->_timestamp = *((double *)v4 + 43);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
  if (*((_QWORD *)v4 + 45))
    -[GEOPlaceSearchRequest setZilchPoints:](self, "setZilchPoints:");
  if ((*(_QWORD *)(v4 + 444) & 0x80000) != 0)
  {
    self->_includeEntryPoints = v4[423];
    *(_QWORD *)&self->_flags |= 0x80000uLL;
  }
  businessOptions = self->_businessOptions;
  v26 = *((_QWORD *)v4 + 16);
  if (businessOptions)
  {
    if (v26)
      -[GEOBusinessOptions mergeFrom:](businessOptions, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOPlaceSearchRequest setBusinessOptions:](self, "setBusinessOptions:");
  }
  v27 = (uint64_t *)(v4 + 444);
  v28 = *(_QWORD *)(v4 + 444);
  if ((v28 & 0x100) != 0)
  {
    self->_localSearchProviderID = *((_DWORD *)v4 + 97);
    *(_QWORD *)&self->_flags |= 0x100uLL;
    v28 = *v27;
    if ((*v27 & 0x20000000) == 0)
    {
LABEL_61:
      if ((v28 & 0x4000000000) == 0)
        goto LABEL_63;
      goto LABEL_62;
    }
  }
  else if ((v28 & 0x20000000) == 0)
  {
    goto LABEL_61;
  }
  self->_includeSuggestionsOnly = v4[433];
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  if ((*(_QWORD *)(v4 + 444) & 0x4000000000) != 0)
  {
LABEL_62:
    self->_structuredSearch = v4[442];
    *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  }
LABEL_63:
  if (*((_QWORD *)v4 + 40))
    -[GEOPlaceSearchRequest setSuggestionsPrefix:](self, "setSuggestionsPrefix:");
  if (*((_QWORD *)v4 + 18))
    -[GEOPlaceSearchRequest setDeviceCountryCode:](self, "setDeviceCountryCode:");
  deviceLocation = self->_deviceLocation;
  v30 = *((_QWORD *)v4 + 19);
  if (deviceLocation)
  {
    if (v30)
      -[GEOLatLng mergeFrom:](deviceLocation, "mergeFrom:");
  }
  else if (v30)
  {
    -[GEOPlaceSearchRequest setDeviceLocation:](self, "setDeviceLocation:");
  }
  if (*((_QWORD *)v4 + 25))
    -[GEOPlaceSearchRequest setInputLanguage:](self, "setInputLanguage:");
  if (*((_QWORD *)v4 + 31))
    -[GEOPlaceSearchRequest setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
  v31 = (uint64_t *)(v4 + 444);
  v32 = *(_QWORD *)(v4 + 444);
  if ((v32 & 0x4000) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v4 + 103);
    *(_QWORD *)&self->_flags |= 0x4000uLL;
    v32 = *v31;
    if ((*v31 & 0x8000000000) == 0)
    {
LABEL_81:
      if ((v32 & 0x400000000) == 0)
        goto LABEL_82;
      goto LABEL_93;
    }
  }
  else if ((v32 & 0x8000000000) == 0)
  {
    goto LABEL_81;
  }
  self->_suppressResultsRequiringAttribution = v4[443];
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  v32 = *(_QWORD *)(v4 + 444);
  if ((v32 & 0x400000000) == 0)
  {
LABEL_82:
    if ((v32 & 8) == 0)
      goto LABEL_83;
    goto LABEL_94;
  }
LABEL_93:
  self->_isFromAPI = v4[438];
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  v32 = *(_QWORD *)(v4 + 444);
  if ((v32 & 8) == 0)
  {
LABEL_83:
    if ((v32 & 0x10) == 0)
      goto LABEL_84;
    goto LABEL_95;
  }
LABEL_94:
  self->_timeSinceMapEnteredForeground = *((double *)v4 + 41);
  *(_QWORD *)&self->_flags |= 8uLL;
  v32 = *(_QWORD *)(v4 + 444);
  if ((v32 & 0x10) == 0)
  {
LABEL_84:
    if ((v32 & 0x8000000) == 0)
      goto LABEL_86;
    goto LABEL_85;
  }
LABEL_95:
  self->_timeSinceMapViewportChanged = *((double *)v4 + 42);
  *(_QWORD *)&self->_flags |= 0x10uLL;
  if ((*(_QWORD *)(v4 + 444) & 0x8000000) != 0)
  {
LABEL_85:
    self->_includeSpokenNames = v4[431];
    *(_QWORD *)&self->_flags |= 0x8000000uLL;
  }
LABEL_86:
  if (*((_QWORD *)v4 + 20))
    -[GEOPlaceSearchRequest setDeviceTimeZone:](self, "setDeviceTimeZone:");
  clientCapabilities = self->_clientCapabilities;
  v34 = *((_QWORD *)v4 + 17);
  if (clientCapabilities)
  {
    if (v34)
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
  }
  else if (v34)
  {
    -[GEOPlaceSearchRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  v35 = *(_QWORD *)(v4 + 444);
  if ((v35 & 0x80000000) != 0)
  {
    self->_includeTravelTime = v4[435];
    *(_QWORD *)&self->_flags |= 0x80000000uLL;
    v35 = *(_QWORD *)(v4 + 444);
  }
  if ((v35 & 0x8000) != 0)
  {
    self->_transportTypeForTravelTimes = *((_DWORD *)v4 + 104);
    *(_QWORD *)&self->_flags |= 0x8000uLL;
  }
  suggestionsOptions = self->_suggestionsOptions;
  v37 = (void *)*((_QWORD *)v4 + 39);
  if (suggestionsOptions)
  {
    if (v37)
    {
      v38 = v37;
      -[GEOSuggestionsOptions readAll:]((uint64_t)v38, 0);
      v39 = *((_BYTE *)v38 + 64);
      if ((v39 & 2) != 0)
      {
        suggestionsOptions->_listType = *((_DWORD *)v38 + 14);
        *(_BYTE *)&suggestionsOptions->_flags |= 2u;
        v39 = *((_BYTE *)v38 + 64);
      }
      if ((v39 & 1) != 0)
      {
        suggestionsOptions->_entriesType = *((_DWORD *)v38 + 13);
        *(_BYTE *)&suggestionsOptions->_flags |= 1u;
      }
      v40 = (void *)*((_QWORD *)v38 + 4);
      if (v40)
        -[GEOSuggestionsOptions setSuggestionMetadata:]((uint64_t)suggestionsOptions, v40);
      v41 = (void *)*((_QWORD *)v38 + 3);
      if (v41)
        -[GEOSuggestionsOptions setSuggestionEntryMetadata:]((uint64_t)suggestionsOptions, v41);
      v42 = *((_BYTE *)v38 + 64);
      if ((v42 & 8) != 0)
      {
        suggestionsOptions->_normalizePOIs = *((_BYTE *)v38 + 61);
        *(_BYTE *)&suggestionsOptions->_flags |= 8u;
        v42 = *((_BYTE *)v38 + 64);
      }
      if ((v42 & 4) != 0)
      {
        suggestionsOptions->_includeRankingFeatures = *((_BYTE *)v38 + 60);
        *(_BYTE *)&suggestionsOptions->_flags |= 4u;
      }

    }
  }
  else if (v37)
  {
    -[GEOPlaceSearchRequest setSuggestionsOptions:](self, "setSuggestionsOptions:");
  }
  v43 = (uint64_t *)(v4 + 444);
  v44 = *(_QWORD *)(v4 + 444);
  if ((v44 & 0x1000) != 0)
  {
    self->_placeTypeLimit = *((_DWORD *)v4 + 101);
    *(_QWORD *)&self->_flags |= 0x1000uLL;
    v44 = *v43;
    if ((*v43 & 0x800000000) == 0)
    {
LABEL_122:
      if ((v44 & 0x40000000) == 0)
        goto LABEL_123;
      goto LABEL_153;
    }
  }
  else if ((v44 & 0x800000000) == 0)
  {
    goto LABEL_122;
  }
  self->_isStrictGeocoding = v4[439];
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  v44 = *(_QWORD *)(v4 + 444);
  if ((v44 & 0x40000000) == 0)
  {
LABEL_123:
    if ((v44 & 0x4000000) == 0)
      goto LABEL_125;
    goto LABEL_124;
  }
LABEL_153:
  self->_includeTravelDistance = v4[434];
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  if ((*(_QWORD *)(v4 + 444) & 0x4000000) != 0)
  {
LABEL_124:
    self->_includeRoadAccessPoints = v4[430];
    *(_QWORD *)&self->_flags |= 0x4000000uLL;
  }
LABEL_125:
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v45 = *((id *)v4 + 28);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v97;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v97 != v48)
          objc_enumerationMutation(v45);
        -[GEOPlaceSearchRequest addLimitToCountryCodeIso2:](self, "addLimitToCountryCodeIso2:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * m));
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
    }
    while (v47);
  }

  v50 = (uint64_t *)(v4 + 444);
  v51 = *(_QWORD *)(v4 + 444);
  if ((v51 & 0x200000000) != 0)
  {
    self->_isCanonicalLocationSearch = v4[437];
    *(_QWORD *)&self->_flags |= 0x200000000uLL;
    v51 = *v50;
    if ((*v50 & 2) == 0)
    {
LABEL_134:
      if ((v51 & 0x2000000) == 0)
        goto LABEL_135;
      goto LABEL_157;
    }
  }
  else if ((v51 & 2) == 0)
  {
    goto LABEL_134;
  }
  self->_geoId = *((_QWORD *)v4 + 23);
  *(_QWORD *)&self->_flags |= 2uLL;
  v51 = *(_QWORD *)(v4 + 444);
  if ((v51 & 0x2000000) == 0)
  {
LABEL_135:
    if ((v51 & 0x10000) == 0)
      goto LABEL_137;
    goto LABEL_136;
  }
LABEL_157:
  self->_includeQuads = v4[429];
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  if ((*(_QWORD *)(v4 + 444) & 0x10000) != 0)
  {
LABEL_136:
    self->_excludeAddressInResults = v4[420];
    *(_QWORD *)&self->_flags |= 0x10000uLL;
  }
LABEL_137:
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v52 = *((id *)v4 + 36);
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v93;
    do
    {
      for (n = 0; n != v54; ++n)
      {
        if (*(_QWORD *)v93 != v55)
          objc_enumerationMutation(v52);
        -[GEOPlaceSearchRequest addSearchSubstring:](self, "addSearchSubstring:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * n));
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
    }
    while (v54);
  }

  if ((*(_QWORD *)(v4 + 444) & 0x200000) != 0)
  {
    self->_includeGeoId = v4[425];
    *(_QWORD *)&self->_flags |= 0x200000uLL;
  }
  if (*((_QWORD *)v4 + 34))
    -[GEOPlaceSearchRequest setSearchContext:](self, "setSearchContext:");
  searchContextSubstring = self->_searchContextSubstring;
  v58 = *((_QWORD *)v4 + 33);
  if (searchContextSubstring)
  {
    if (v58)
      -[GEOSearchSubstring mergeFrom:](searchContextSubstring, "mergeFrom:");
  }
  else if (v58)
  {
    -[GEOPlaceSearchRequest setSearchContextSubstring:](self, "setSearchContextSubstring:");
  }
  if ((*(_QWORD *)(v4 + 444) & 0x10000000) != 0)
  {
    self->_includeStatusCodeInfo = v4[432];
    *(_QWORD *)&self->_flags |= 0x10000000uLL;
  }
  preserveFields = self->_preserveFields;
  v60 = *((_QWORD *)v4 + 32);
  if (preserveFields)
  {
    if (v60)
      -[GEOAddress mergeFrom:](preserveFields, "mergeFrom:");
  }
  else if (v60)
  {
    -[GEOPlaceSearchRequest setPreserveFields:](self, "setPreserveFields:");
  }
  if ((*(_QWORD *)(v4 + 444) & 0x100000000) != 0)
  {
    self->_includeUnmatchedStrings = v4[436];
    *(_QWORD *)&self->_flags |= 0x100000000uLL;
  }
  indexFilter = self->_indexFilter;
  v62 = (void *)*((_QWORD *)v4 + 24);
  if (indexFilter)
  {
    if (v62)
    {
      v63 = v62;
      -[GEOIndexQueryNode readAll:]((uint64_t)v63, 0);
      indexFilter->_type = *((_DWORD *)v63 + 15);
      v64 = (void *)*((_QWORD *)v63 + 3);
      if (v64)
        -[GEOIndexQueryNode setField:]((uint64_t)indexFilter, v64);
      v65 = (void *)*((_QWORD *)v63 + 5);
      if (v65)
        -[GEOIndexQueryNode setValue:]((uint64_t)indexFilter, v65);
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v66 = *((id *)v63 + 4);
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v105;
        do
        {
          for (ii = 0; ii != v68; ++ii)
          {
            if (*(_QWORD *)v105 != v69)
              objc_enumerationMutation(v66);
            -[GEOIndexQueryNode addOperands:]((uint64_t)indexFilter, *(void **)(*((_QWORD *)&v104 + 1) + 8 * ii));
          }
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
        }
        while (v68);
      }

    }
  }
  else if (v62)
  {
    -[GEOPlaceSearchRequest setIndexFilter:](self, "setIndexFilter:");
  }
  if ((*(_QWORD *)(v4 + 444) & 0x100000) != 0)
  {
    self->_includeFeatureSets = v4[424];
    *(_QWORD *)&self->_flags |= 0x100000uLL;
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v71 = *((id *)v4 + 38);
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v88, v108, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v89;
    do
    {
      for (jj = 0; jj != v73; ++jj)
      {
        if (*(_QWORD *)v89 != v74)
          objc_enumerationMutation(v71);
        -[GEOPlaceSearchRequest addServiceTag:](self, "addServiceTag:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * jj), (_QWORD)v88);
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v88, v108, 16);
    }
    while (v73);
  }

  if ((*(_QWORD *)(v4 + 444) & 4) != 0)
  {
    self->_intersectingGeoId = *((_QWORD *)v4 + 26);
    *(_QWORD *)&self->_flags |= 4uLL;
  }
  knownLocation = self->_knownLocation;
  v77 = *((_QWORD *)v4 + 27);
  if (knownLocation)
  {
    if (v77)
      -[GEOLatLng mergeFrom:](knownLocation, "mergeFrom:");
  }
  else if (v77)
  {
    -[GEOPlaceSearchRequest setKnownLocation:](self, "setKnownLocation:");
  }
  v78 = (uint64_t *)(v4 + 444);
  v79 = *(_QWORD *)(v4 + 444);
  if ((v79 & 0x80) != 0)
  {
    self->_knownAccuracy = *((_DWORD *)v4 + 96);
    *(_QWORD *)&self->_flags |= 0x80uLL;
    v79 = *v78;
    if ((*v78 & 0x400000) == 0)
    {
LABEL_204:
      if ((v79 & 0x2000) == 0)
        goto LABEL_206;
      goto LABEL_205;
    }
  }
  else if ((v79 & 0x400000) == 0)
  {
    goto LABEL_204;
  }
  self->_includeMatchedToken = v4[426];
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  if ((*(_QWORD *)(v4 + 444) & 0x2000) != 0)
  {
LABEL_205:
    self->_searchSource = *((_DWORD *)v4 + 102);
    *(_QWORD *)&self->_flags |= 0x2000uLL;
  }
LABEL_206:
  v80 = objc_msgSend(v4, "optionalSuppressionReasonsCount", (_QWORD)v88);
  if (v80)
  {
    v81 = v80;
    for (kk = 0; kk != v81; ++kk)
      -[GEOPlaceSearchRequest addOptionalSuppressionReason:](self, "addOptionalSuppressionReason:", objc_msgSend(v4, "optionalSuppressionReasonAtIndex:", kk));
  }
  searchLocation = self->_searchLocation;
  v84 = *((_QWORD *)v4 + 35);
  if (searchLocation)
  {
    if (v84)
      -[GEOLatLng mergeFrom:](searchLocation, "mergeFrom:");
  }
  else if (v84)
  {
    -[GEOPlaceSearchRequest setSearchLocation:](self, "setSearchLocation:");
  }
  if ((*(_QWORD *)(v4 + 444) & 0x800000) != 0)
  {
    self->_includeNameForForwardGeocodingResults = v4[427];
    *(_QWORD *)&self->_flags |= 0x800000uLL;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  v86 = *((_QWORD *)v4 + 14);
  if (additionalEnabledMarkets)
  {
    if (v86)
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
  }
  else if (v86)
  {
    -[GEOPlaceSearchRequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  v87 = *(_QWORD *)(v4 + 444);
  if ((v87 & 0x200) != 0)
  {
    self->_mapMode = *((_DWORD *)v4 + 98);
    *(_QWORD *)&self->_flags |= 0x200uLL;
    v87 = *(_QWORD *)(v4 + 444);
  }
  if ((v87 & 0x2000000000) != 0)
  {
    self->_isPopularNearbyRequest = v4[441];
    *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  }
  if (*((_QWORD *)v4 + 21))
    -[GEOPlaceSearchRequest setDeviceLocationCountryCode:](self, "setDeviceLocationCountryCode:");
  if (*((_QWORD *)v4 + 44))
    -[GEOPlaceSearchRequest setViewportCenterCountryCode:](self, "setViewportCenterCountryCode:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_QWORD *)&self->_flags & 0x10000000000) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceSearchRequestReadSpecified((uint64_t)self, (char *)self->_reader, (int *)&unknownFields_tags_2031);
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
  char v6;
  PBUnknownFields *unknownFields;
  GEOSuggestionsOptions *suggestionsOptions;
  PBUnknownFields *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v6 = *((_BYTE *)&self->_flags + 8) | 0x80;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPlaceSearchRequest readAll:](self, "readAll:", 0);
    -[GEOAddress clearUnknownFields:](self->_address, "clearUnknownFields:", 1);
    -[GEOLocation clearUnknownFields:](self->_location, "clearUnknownFields:", 1);
    -[GEOMapRegion clearUnknownFields:](self->_mapRegion, "clearUnknownFields:", 1);
    -[GEOBusinessOptions clearUnknownFields:](self->_businessOptions, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_deviceLocation, "clearUnknownFields:", 1);
    -[GEOClientCapabilities clearUnknownFields:](self->_clientCapabilities, "clearUnknownFields:", 1);
    suggestionsOptions = self->_suggestionsOptions;
    if (suggestionsOptions)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)&suggestionsOptions->_flags |= 0x10u;
      *(_BYTE *)&suggestionsOptions->_flags |= 0x80u;
      os_unfair_lock_unlock(&suggestionsOptions->_readerLock);
      v9 = suggestionsOptions->_unknownFields;
      suggestionsOptions->_unknownFields = 0;

      -[GEOSuggestionsOptions readAll:]((uint64_t)suggestionsOptions, 0);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_searchSubstrings;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14++), "clearUnknownFields:", 1);
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    -[GEOSearchSubstring clearUnknownFields:](self->_searchContextSubstring, "clearUnknownFields:", 1);
    -[GEOAddress clearUnknownFields:](self->_preserveFields, "clearUnknownFields:", 1);
    -[GEOIndexQueryNode clearUnknownFields:]((uint64_t)self->_indexFilter);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = self->_serviceTags;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "clearUnknownFields:", 1, (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

    -[GEOLatLng clearUnknownFields:](self->_knownLocation, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_searchLocation, "clearUnknownFields:", 1);
    -[GEOAdditionalEnabledMarkets clearUnknownFields:](self->_additionalEnabledMarkets, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_viewportCenterCountryCode, 0);
  objc_storeStrong((id *)&self->_suggestionsPrefix, 0);
  objc_storeStrong((id *)&self->_suggestionsOptions, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_searchSubstrings, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_searchContextSubstring, 0);
  objc_storeStrong((id *)&self->_preserveFields, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_limitToCountryCodeIso2s, 0);
  objc_storeStrong((id *)&self->_knownLocation, 0);
  objc_storeStrong((id *)&self->_inputLanguage, 0);
  objc_storeStrong((id *)&self->_indexFilter, 0);
  objc_storeStrong((id *)&self->_filterByBusinessCategorys, 0);
  objc_storeStrong((id *)&self->_deviceLocationCountryCode, 0);
  objc_storeStrong((id *)&self->_deviceTimeZone, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_businessOptions, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
