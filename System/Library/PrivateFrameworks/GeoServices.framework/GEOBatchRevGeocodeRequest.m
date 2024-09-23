@implementation GEOBatchRevGeocodeRequest

- (GEOBatchRevGeocodeRequest)init
{
  GEOBatchRevGeocodeRequest *v2;
  GEOBatchRevGeocodeRequest *v3;
  GEOBatchRevGeocodeRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOBatchRevGeocodeRequest;
  v2 = -[GEOBatchRevGeocodeRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBatchRevGeocodeRequest)initWithData:(id)a3
{
  GEOBatchRevGeocodeRequest *v3;
  GEOBatchRevGeocodeRequest *v4;
  GEOBatchRevGeocodeRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOBatchRevGeocodeRequest;
  v3 = -[GEOBatchRevGeocodeRequest initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOBatchRevGeocodeRequest;
  -[GEOBatchRevGeocodeRequest dealloc](&v3, sel_dealloc);
}

- (void)_readLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocations_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)locations
{
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *locations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  locations = self->_locations;
  self->_locations = v4;

}

- (void)clearLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_locations, "removeAllObjects");
}

- (void)addLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  -[GEOBatchRevGeocodeRequest _addNoFlagsLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsLocation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)locationsCount
{
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_locations, "count");
}

- (id)locationAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_locations, "objectAtIndex:", a3);
}

+ (Class)locationType
{
  return (Class)objc_opt_class();
}

- (void)_readAdditionalPlaceTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalPlaceTypes_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)additionalPlaceTypesCount
{
  -[GEOBatchRevGeocodeRequest _readAdditionalPlaceTypes]((uint64_t)self);
  return self->_additionalPlaceTypes.count;
}

- (int)additionalPlaceTypes
{
  -[GEOBatchRevGeocodeRequest _readAdditionalPlaceTypes]((uint64_t)self);
  return self->_additionalPlaceTypes.list;
}

- (void)clearAdditionalPlaceTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Clear();
}

- (void)addAdditionalPlaceType:(int)a3
{
  -[GEOBatchRevGeocodeRequest _readAdditionalPlaceTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (int)additionalPlaceTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_additionalPlaceTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOBatchRevGeocodeRequest _readAdditionalPlaceTypes]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
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

- (void)_readDeviceCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceCountryCode
{
  -[GEOBatchRevGeocodeRequest _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOBatchRevGeocodeRequest _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEOBatchRevGeocodeRequest _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOBatchRevGeocodeRequest _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readDeviceSku
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSku_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceSku
{
  -[GEOBatchRevGeocodeRequest _readDeviceSku]((uint64_t)self);
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOBatchRevGeocodeRequest _readDeviceSku]((uint64_t)self);
  return self->_deviceSku;
}

- (void)setDeviceSku:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_deviceSku, a3);
}

- (void)_readServiceTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceTags_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  return self->_serviceTags;
}

- (void)setServiceTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceTags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;

}

- (void)clearServiceTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_serviceTags, "removeAllObjects");
}

- (void)addServiceTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  -[GEOBatchRevGeocodeRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
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
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)serviceTagsCount
{
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceTags, "count");
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceTags, "objectAtIndex:", a3);
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOBatchRevGeocodeRequest;
  -[GEOBatchRevGeocodeRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBatchRevGeocodeRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v6 = *(id *)(a1 + 64);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("location"));
  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v15 = 0;
      do
      {
        v16 = *(unsigned int *)(*v14 + 4 * v15);
        if ((int)v16 > 99)
        {
          switch((int)v16)
          {
            case 'd':
              v17 = CFSTR("DMA");
              break;
            case 'e':
              v17 = CFSTR("CAT_10284_POSTAL");
              break;
            case 'f':
              v17 = CFSTR("CAT_10285_CITY");
              break;
            case 'g':
              v17 = CFSTR("CAT_10286_COUNTY");
              break;
            case 'h':
              v17 = CFSTR("CAT_10287_STATE");
              break;
            case 'i':
              v17 = CFSTR("CAT_10288_COUNTRY");
              break;
            case 'j':
              v17 = CFSTR("CAT_10288_COUNTRY_CODE");
              break;
            case 'k':
              v17 = CFSTR("CAT_10287_STATE_CODE");
              break;
            default:
              if ((_DWORD)v16 == 1016)
              {
                v17 = CFSTR("PERDU_CITY");
              }
              else
              {
LABEL_28:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
        }
        else
        {
          switch((int)v16)
          {
            case '#':
              v17 = CFSTR("TIME_ZONE");
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
              goto LABEL_28;
            case '+':
              v17 = CFSTR("NEIGHBORHOOD");
              break;
            case ',':
              v17 = CFSTR("OCEAN");
              break;
            case '-':
              v17 = CFSTR("AOI");
              break;
            case '.':
              v17 = CFSTR("INLAND_WATER");
              break;
            case '/':
              v17 = CFSTR("POI");
              break;
            case '0':
              v17 = CFSTR("ISLAND");
              break;
            case '1':
              v17 = CFSTR("STREET");
              break;
            case '2':
              v17 = CFSTR("ADMIN");
              break;
            case '3':
              v17 = CFSTR("POSTAL");
              break;
            case '6':
              v17 = CFSTR("INTERSECTION");
              break;
            case '7':
              v17 = CFSTR("BUILDING");
              break;
            case '9':
              v17 = CFSTR("ADDRESS");
              break;
            case ';':
              v17 = CFSTR("ZCTAS");
              break;
            case '=':
              v17 = CFSTR("CONTINENT");
              break;
            case 'A':
              v17 = CFSTR("PHYSICAL_FEATURE");
              break;
            default:
              v17 = CFSTR("PT_UNKNOWN");
              switch((int)v16)
              {
                case 0:
                  goto LABEL_53;
                case 1:
                  v17 = CFSTR("COUNTRY");
                  break;
                case 2:
                  v17 = CFSTR("STATE");
                  break;
                case 3:
                  goto LABEL_28;
                case 4:
                  v17 = CFSTR("COUNTY");
                  break;
                default:
                  if ((_DWORD)v16 != 16)
                    goto LABEL_28;
                  v17 = CFSTR("CITY");
                  break;
              }
              break;
          }
        }
LABEL_53:
        objc_msgSend(v13, "addObject:", v17);

        ++v15;
        v14 = (_QWORD *)(a1 + 16);
      }
      while (v15 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("additionalPlaceType"));

  }
  objc_msgSend((id)a1, "deviceCountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("deviceCountryCode");
    else
      v19 = CFSTR("device_country_code");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  objc_msgSend((id)a1, "displayRegion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a2)
      v21 = CFSTR("displayRegion");
    else
      v21 = CFSTR("display_region");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  objc_msgSend((id)a1, "deviceSku");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (a2)
      v23 = CFSTR("deviceSku");
    else
      v23 = CFSTR("device_sku");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);
  }

  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = *(id *)(a1 + 72);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("serviceTag"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBatchRevGeocodeRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBatchRevGeocodeRequest)initWithDictionary:(id)a3
{
  return (GEOBatchRevGeocodeRequest *)-[GEOBatchRevGeocodeRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOLocation *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  GEOGeoServiceTag *v42;
  uint64_t v43;
  void *v44;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v47 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v57 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOLocation alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOLocation initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOLocation initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(v6, "addLocation:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
          }
          while (v10);
        }

        v5 = v47;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("additionalPlaceType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v46 = v17;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (!v19)
          goto LABEL_91;
        v20 = v19;
        v21 = *(_QWORD *)v53;
        while (1)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v53 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v23;
              if ((objc_msgSend(v24, "isEqualToString:", CFSTR("PT_UNKNOWN")) & 1) != 0)
              {
                v25 = 0;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
              {
                v25 = 1;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
              {
                v25 = 2;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
              {
                v25 = 4;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
              {
                v25 = 16;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
              {
                v25 = 35;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("NEIGHBORHOOD")) & 1) != 0)
              {
                v25 = 43;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
              {
                v25 = 44;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
              {
                v25 = 45;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
              {
                v25 = 46;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("POI")) & 1) != 0)
              {
                v25 = 47;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
              {
                v25 = 48;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
              {
                v25 = 49;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
              {
                v25 = 50;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
              {
                v25 = 51;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
              {
                v25 = 54;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
              {
                v25 = 55;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
              {
                v25 = 57;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ZCTAS")) & 1) != 0)
              {
                v25 = 59;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
              {
                v25 = 61;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")) & 1) != 0)
              {
                v25 = 65;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("PERDU_CITY")) & 1) != 0)
              {
                v25 = 1016;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("DMA")) & 1) != 0)
              {
                v25 = 100;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CAT_10284_POSTAL")) & 1) != 0)
              {
                v25 = 101;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CAT_10285_CITY")) & 1) != 0)
              {
                v25 = 102;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CAT_10286_COUNTY")) & 1) != 0)
              {
                v25 = 103;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CAT_10287_STATE")) & 1) != 0)
              {
                v25 = 104;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CAT_10288_COUNTRY")) & 1) != 0)
              {
                v25 = 105;
              }
              else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("CAT_10288_COUNTRY_CODE")) & 1) != 0)
              {
                v25 = 106;
              }
              else if (objc_msgSend(v24, "isEqualToString:", CFSTR("CAT_10287_STATE_CODE")))
              {
                v25 = 107;
              }
              else
              {
                v25 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v25 = objc_msgSend(v23, "intValue");
            }
            objc_msgSend(v6, "addAdditionalPlaceType:", v25, v46);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (!v20)
          {
LABEL_91:

            v17 = v46;
            v5 = v47;
            break;
          }
        }
      }

      if (a3)
        v26 = CFSTR("deviceCountryCode");
      else
        v26 = CFSTR("device_country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26, v46);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v6, "setDeviceCountryCode:", v28);

      }
      if (a3)
        v29 = CFSTR("displayRegion");
      else
        v29 = CFSTR("display_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v6, "setDisplayRegion:", v31);

      }
      if (a3)
        v32 = CFSTR("deviceSku");
      else
        v32 = CFSTR("device_sku");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = (void *)objc_msgSend(v33, "copy");
        objc_msgSend(v6, "setDeviceSku:", v34);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serviceTag"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v38; ++k)
            {
              if (*(_QWORD *)v49 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOGeoServiceTag alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOGeoServiceTag initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOGeoServiceTag initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = (void *)v43;
                objc_msgSend(v6, "addServiceTag:", v43);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v38);
        }

        v5 = v47;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOBatchRevGeocodeRequest)initWithJSON:(id)a3
{
  return (GEOBatchRevGeocodeRequest *)-[GEOBatchRevGeocodeRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_54;
    else
      v8 = (int *)&readAll__nonRecursiveTag_54;
    GEOBatchRevGeocodeRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_locations;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "readAll:", 1);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v10);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = self->_serviceTags;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "readAll:", 1, (_QWORD)v17);
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  BOOL v29;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v17 = v10 & 7;
      if (v16 || v17 == 4)
        break;
      switch((v10 >> 3))
      {
        case 2u:
          if (v17 == 2 && PBReaderPlaceMark() && GEOLocationIsValid((char *)a3))
            goto LABEL_27;
          goto LABEL_56;
        case 3u:
          if (v17 != 2)
          {
            if ((v10 & 7) != 0)
              goto LABEL_56;
            while (1)
            {
              v19 = *v4;
              v20 = *(_QWORD *)((char *)a3 + v19);
              v21 = v20 + 1;
              if (v20 == -1 || v21 > *(_QWORD *)((char *)a3 + *v5))
                break;
              v22 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v20);
              *(_QWORD *)((char *)a3 + v19) = v21;
              if (v22 < 0)
              {
                v23 = v17++;
                if (v23 <= 8)
                  continue;
              }
              goto LABEL_41;
            }
            *((_BYTE *)a3 + *v6) = 1;
            goto LABEL_41;
          }
          if (!PBReaderPlaceMark())
            goto LABEL_56;
LABEL_44:
          while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5))
          {
            v24 = *((unsigned __int8 *)a3 + *v6);
            if (*((_BYTE *)a3 + *v6))
              break;
            while (1)
            {
              v25 = *v4;
              v26 = *(_QWORD *)((char *)a3 + v25);
              v27 = v26 + 1;
              if (v26 == -1 || v27 > *(_QWORD *)((char *)a3 + *v5))
                break;
              v28 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v26);
              *(_QWORD *)((char *)a3 + v25) = v27;
              if (v28 < 0)
              {
                v15 = v24++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_44;
            }
            *((_BYTE *)a3 + *v6) = 1;
          }
          goto LABEL_27;
        case 4u:
          if (v17 == 2)
            goto LABEL_40;
          goto LABEL_56;
        case 5u:
          if (v17 == 2)
            goto LABEL_40;
          goto LABEL_56;
        case 6u:
          if (v17 == 2)
            goto LABEL_40;
          goto LABEL_56;
        default:
          if ((v10 >> 3) == 100)
          {
            if (v17 != 2 || !PBReaderPlaceMark() || !GEOGeoServiceTagIsValid((char *)a3))
            {
LABEL_56:
              PBReaderRecallMark();
              return 0;
            }
LABEL_27:
            PBReaderRecallMark();
          }
          else
          {
LABEL_40:
            if ((PBReaderSkipValueWithTag() & 1) == 0)
              goto LABEL_56;
          }
LABEL_41:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_54;
          break;
      }
    }
  }
LABEL_54:
  v29 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v29;
}

- (BOOL)readFrom:(id)a3
{
  return GEOBatchRevGeocodeRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7F) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBatchRevGeocodeRequest readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_locations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    if (self->_additionalPlaceTypes.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_additionalPlaceTypes.count);
    }
    if (self->_deviceCountryCode)
      PBDataWriterWriteStringField();
    if (self->_displayRegion)
      PBDataWriterWriteStringField();
    if (self->_deviceSku)
      PBDataWriterWriteStringField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_serviceTags;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  _DWORD *v7;

  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  if (-[NSMutableArray count](self->_locations, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_locations, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (GEOLocationHasSensitiveFields((uint64_t)v6))
      {
        v7 = (_DWORD *)objc_msgSend(v6, "copy");
        GEOLocationClearSensitiveFields(v7);
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_locations, "replaceObjectAtIndex:withObject:", v5, v7);

      }
      else
      {
        objc_msgSend(v6, "clearSensitiveFields:", a3);
      }

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_locations, "count"));
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_locations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)requestTypeCode
{
  return 49;
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
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  void *v14;
  id *v15;

  v15 = (id *)a3;
  -[GEOBatchRevGeocodeRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 20) = self->_readerMarkPos;
  *((_DWORD *)v15 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOBatchRevGeocodeRequest locationsCount](self, "locationsCount"))
  {
    objc_msgSend(v15, "clearLocations");
    v4 = -[GEOBatchRevGeocodeRequest locationsCount](self, "locationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOBatchRevGeocodeRequest locationAtIndex:](self, "locationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addLocation:", v7);

      }
    }
  }
  if (-[GEOBatchRevGeocodeRequest additionalPlaceTypesCount](self, "additionalPlaceTypesCount"))
  {
    objc_msgSend(v15, "clearAdditionalPlaceTypes");
    v8 = -[GEOBatchRevGeocodeRequest additionalPlaceTypesCount](self, "additionalPlaceTypesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v15, "addAdditionalPlaceType:", -[GEOBatchRevGeocodeRequest additionalPlaceTypeAtIndex:](self, "additionalPlaceTypeAtIndex:", j));
    }
  }
  if (self->_deviceCountryCode)
    objc_msgSend(v15, "setDeviceCountryCode:");
  if (self->_displayRegion)
    objc_msgSend(v15, "setDisplayRegion:");
  if (self->_deviceSku)
    objc_msgSend(v15, "setDeviceSku:");
  if (-[GEOBatchRevGeocodeRequest serviceTagsCount](self, "serviceTagsCount"))
  {
    objc_msgSend(v15, "clearServiceTags");
    v11 = -[GEOBatchRevGeocodeRequest serviceTagsCount](self, "serviceTagsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEOBatchRevGeocodeRequest serviceTagAtIndex:](self, "serviceTagAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addServiceTag:", v14);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOBatchRevGeocodeRequestReadAllFrom((uint64_t)v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOBatchRevGeocodeRequest readAll:](self, "readAll:", 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_locations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addLocation:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  v13 = -[NSString copyWithZone:](self->_deviceCountryCode, "copyWithZone:", a3);
  v14 = (void *)v5[5];
  v5[5] = v13;

  v15 = -[NSString copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v16 = (void *)v5[7];
  v5[7] = v15;

  v17 = -[NSString copyWithZone:](self->_deviceSku, "copyWithZone:", a3);
  v18 = (void *)v5[6];
  v5[6] = v17;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = self->_serviceTags;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addServiceTag:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *locations;
  NSString *deviceCountryCode;
  NSString *displayRegion;
  NSString *deviceSku;
  NSMutableArray *serviceTags;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOBatchRevGeocodeRequest readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         locations = self->_locations,
         !((unint64_t)locations | v4[8]))
     || -[NSMutableArray isEqual:](locations, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((deviceCountryCode = self->_deviceCountryCode, !((unint64_t)deviceCountryCode | v4[5]))
     || -[NSString isEqual:](deviceCountryCode, "isEqual:"))
    && ((displayRegion = self->_displayRegion, !((unint64_t)displayRegion | v4[7]))
     || -[NSString isEqual:](displayRegion, "isEqual:"))
    && ((deviceSku = self->_deviceSku, !((unint64_t)deviceSku | v4[6]))
     || -[NSString isEqual:](deviceSku, "isEqual:")))
  {
    serviceTags = self->_serviceTags;
    if ((unint64_t)serviceTags | v4[9])
      v10 = -[NSMutableArray isEqual:](serviceTags, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  -[GEOBatchRevGeocodeRequest readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_locations, "hash");
  v4 = PBRepeatedInt32Hash() ^ v3;
  v5 = -[NSString hash](self->_deviceCountryCode, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_displayRegion, "hash");
  v7 = -[NSString hash](self->_deviceSku, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_serviceTags, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v4[8];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        -[GEOBatchRevGeocodeRequest addLocation:](self, "addLocation:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v4, "additionalPlaceTypesCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[GEOBatchRevGeocodeRequest addAdditionalPlaceType:](self, "addAdditionalPlaceType:", objc_msgSend(v4, "additionalPlaceTypeAtIndex:", j));
  }
  if (v4[5])
    -[GEOBatchRevGeocodeRequest setDeviceCountryCode:](self, "setDeviceCountryCode:");
  if (v4[7])
    -[GEOBatchRevGeocodeRequest setDisplayRegion:](self, "setDisplayRegion:");
  if (v4[6])
    -[GEOBatchRevGeocodeRequest setDeviceSku:](self, "setDeviceSku:");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v4[9];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[GEOBatchRevGeocodeRequest addServiceTag:](self, "addServiceTag:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * k), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
