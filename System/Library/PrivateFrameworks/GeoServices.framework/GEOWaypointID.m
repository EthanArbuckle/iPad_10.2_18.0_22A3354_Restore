@implementation GEOWaypointID

- (GEOWaypointID)init
{
  GEOWaypointID *v2;
  GEOWaypointID *v3;
  GEOWaypointID *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointID;
  v2 = -[GEOWaypointID init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypointID)initWithData:(id)a3
{
  GEOWaypointID *v3;
  GEOWaypointID *v4;
  GEOWaypointID *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointID;
  v3 = -[GEOWaypointID initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (unint64_t)resultProviderId
{
  return self->_resultProviderId;
}

- (void)setResultProviderId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_resultProviderId = a3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasResultProviderId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readLocationHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationHint_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLocationHint
{
  -[GEOWaypointID _readLocationHint]((uint64_t)self);
  return self->_locationHint != 0;
}

- (GEOLatLng)locationHint
{
  -[GEOWaypointID _readLocationHint]((uint64_t)self);
  return self->_locationHint;
}

- (void)setLocationHint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_locationHint, a3);
}

- (void)_readAddressHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressHint_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAddressHint
{
  -[GEOWaypointID _readAddressHint]((uint64_t)self);
  return self->_addressHint != 0;
}

- (GEOStructuredAddress)addressHint
{
  -[GEOWaypointID _readAddressHint]((uint64_t)self);
  return self->_addressHint;
}

- (void)setAddressHint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_addressHint, a3);
}

- (void)_readPlaceNameHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceNameHint_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlaceNameHint
{
  -[GEOWaypointID _readPlaceNameHint]((uint64_t)self);
  return self->_placeNameHint != 0;
}

- (NSString)placeNameHint
{
  -[GEOWaypointID _readPlaceNameHint]((uint64_t)self);
  return self->_placeNameHint;
}

- (void)setPlaceNameHint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_placeNameHint, a3);
}

- (void)_readFormattedAddressLineHints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedAddressLineHints_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)formattedAddressLineHints
{
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  return self->_formattedAddressLineHints;
}

- (void)setFormattedAddressLineHints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *formattedAddressLineHints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  formattedAddressLineHints = self->_formattedAddressLineHints;
  self->_formattedAddressLineHints = v4;

}

- (void)clearFormattedAddressLineHints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_formattedAddressLineHints, "removeAllObjects");
}

- (void)addFormattedAddressLineHint:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  -[GEOWaypointID _addNoFlagsFormattedAddressLineHint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)formattedAddressLineHintsCount
{
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  return -[NSMutableArray count](self->_formattedAddressLineHints, "count");
}

- (id)formattedAddressLineHintAtIndex:(unint64_t)a3
{
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_formattedAddressLineHints, "objectAtIndex:", a3);
}

+ (Class)formattedAddressLineHintType
{
  return (Class)objc_opt_class();
}

- (int)placeTypeHint
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_placeTypeHint;
  else
    return 0;
}

- (void)setPlaceTypeHint:(int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_placeTypeHint = a3;
}

- (void)setHasPlaceTypeHint:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 520;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPlaceTypeHint
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)placeTypeHintAsString:(int)a3
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

- (int)StringAsPlaceTypeHint:(id)a3
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

- (int)addressGeocodeAccuracyHint
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_addressGeocodeAccuracyHint;
  else
    return 0;
}

- (void)setAddressGeocodeAccuracyHint:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_addressGeocodeAccuracyHint = a3;
}

- (void)setHasAddressGeocodeAccuracyHint:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasAddressGeocodeAccuracyHint
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)addressGeocodeAccuracyHintAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0F378[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAddressGeocodeAccuracyHint:(id)a3
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL_ZIP")) & 1) != 0)
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointID;
  -[GEOWaypointID description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWaypointID dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointID _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 92);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("muid"));

    v5 = *(_WORD *)(a1 + 92);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("resultProviderId");
    else
      v8 = CFSTR("result_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "locationHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("locationHint");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("location_hint");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "addressHint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("addressHint");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("address_hint");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "placeNameHint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("placeNameHint");
    else
      v18 = CFSTR("place_name_hint");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)a1, "formattedAddressLineHints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("formattedAddressLineHint");
    else
      v20 = CFSTR("formatted_address_line_hint");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = *(_WORD *)(a1 + 92);
  if ((v21 & 8) != 0)
  {
    v22 = *(_DWORD *)(a1 + 88);
    switch(v22)
    {
      case '#':
        v23 = CFSTR("TIME_ZONE");
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
LABEL_36:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 88));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '+':
        v23 = CFSTR("SUB_LOCALITY");
        break;
      case ',':
        v23 = CFSTR("OCEAN");
        break;
      case '-':
        v23 = CFSTR("AOI");
        break;
      case '.':
        v23 = CFSTR("INLAND_WATER");
        break;
      case '/':
        v23 = CFSTR("BUSINESS");
        break;
      case '0':
        v23 = CFSTR("ISLAND");
        break;
      case '1':
        v23 = CFSTR("STREET");
        break;
      case '2':
        v23 = CFSTR("ADMIN");
        break;
      case '3':
        v23 = CFSTR("POSTAL");
        break;
      case '6':
        v23 = CFSTR("INTERSECTION");
        break;
      case '7':
        v23 = CFSTR("BUILDING");
        break;
      case '9':
        v23 = CFSTR("ADDRESS");
        break;
      case '=':
        v23 = CFSTR("CONTINENT");
        break;
      case '?':
        v23 = CFSTR("REGION");
        break;
      case '@':
        v23 = CFSTR("DIVISION");
        break;
      case 'A':
        v23 = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v23 = CFSTR("UNKNOWN_PLACE_TYPE");
        switch(v22)
        {
          case 0:
            goto LABEL_55;
          case 1:
            v23 = CFSTR("COUNTRY");
            break;
          case 2:
            v23 = CFSTR("ADMINISTRATIVE_AREA");
            break;
          case 3:
            goto LABEL_36;
          case 4:
            v23 = CFSTR("SUB_ADMINISTRATIVE_AREA");
            break;
          default:
            if (v22 != 16)
              goto LABEL_36;
            v23 = CFSTR("LOCALITY");
            break;
        }
        break;
    }
LABEL_55:
    if (a2)
      v24 = CFSTR("placeTypeHint");
    else
      v24 = CFSTR("place_type_hint");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v21 = *(_WORD *)(a1 + 92);
  }
  if ((v21 & 4) != 0)
  {
    v25 = *(int *)(a1 + 84);
    if (v25 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E1C0F378[v25];
    }
    if (a2)
      v27 = CFSTR("addressGeocodeAccuracyHint");
    else
      v27 = CFSTR("address_geocode_accuracy_hint");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  v28 = *(void **)(a1 + 16);
  if (v28)
  {
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __43__GEOWaypointID__dictionaryRepresentation___block_invoke;
      v35[3] = &unk_1E1C00600;
      v32 = v31;
      v36 = v32;
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v35);
      v33 = v32;

      v30 = v33;
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointID _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOWaypointID__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointID)initWithDictionary:(id)a3
{
  return (GEOWaypointID *)-[GEOWaypointID _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  GEOLatLng *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOStructuredAddress *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));

      if (a3)
        v7 = CFSTR("resultProviderId");
      else
        v7 = CFSTR("result_provider_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setResultProviderId:", objc_msgSend(v8, "unsignedLongLongValue"));

      if (a3)
        v9 = CFSTR("locationHint");
      else
        v9 = CFSTR("location_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOLatLng initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOLatLng initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setLocationHint:", v12);

      }
      if (a3)
        v14 = CFSTR("addressHint");
      else
        v14 = CFSTR("address_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOStructuredAddress alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOStructuredAddress initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOStructuredAddress initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setAddressHint:", v17);

      }
      if (a3)
        v19 = CFSTR("placeNameHint");
      else
        v19 = CFSTR("place_name_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setPlaceNameHint:", v21);

      }
      if (a3)
        v22 = CFSTR("formattedAddressLineHint");
      else
        v22 = CFSTR("formatted_address_line_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v41 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = (void *)objc_msgSend(v29, "copy", (_QWORD)v40);
                objc_msgSend(a1, "addFormattedAddressLineHint:", v30);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          }
          while (v26);
        }

      }
      if (a3)
        v31 = CFSTR("placeTypeHint");
      else
        v31 = CFSTR("place_type_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31, (_QWORD)v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v32;
        if ((objc_msgSend(v33, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
        {
          v34 = 0;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
        {
          v34 = 1;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
        {
          v34 = 2;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
        {
          v34 = 4;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
        {
          v34 = 16;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
        {
          v34 = 35;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
        {
          v34 = 43;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
        {
          v34 = 44;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
        {
          v34 = 45;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
        {
          v34 = 46;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
        {
          v34 = 47;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
        {
          v34 = 48;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
        {
          v34 = 49;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
        {
          v34 = 50;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
        {
          v34 = 51;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
        {
          v34 = 54;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
        {
          v34 = 55;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
        {
          v34 = 57;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
        {
          v34 = 61;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
        {
          v34 = 63;
        }
        else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
        {
          v34 = 64;
        }
        else if (objc_msgSend(v33, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
        {
          v34 = 65;
        }
        else
        {
          v34 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_98;
        v34 = objc_msgSend(v32, "intValue");
      }
      objc_msgSend(a1, "setPlaceTypeHint:", v34);
LABEL_98:

      if (a3)
        v35 = CFSTR("addressGeocodeAccuracyHint");
      else
        v35 = CFSTR("address_geocode_accuracy_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = v36;
        if ((objc_msgSend(v37, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
        {
          v38 = 0;
        }
        else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
        {
          v38 = 1;
        }
        else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
        {
          v38 = 2;
        }
        else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("POSTAL_ZIP")) & 1) != 0)
        {
          v38 = 3;
        }
        else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
        {
          v38 = 4;
        }
        else if (objc_msgSend(v37, "isEqualToString:", CFSTR("SUBPREMISE")))
        {
          v38 = 5;
        }
        else
        {
          v38 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_119:

          goto LABEL_120;
        }
        v38 = objc_msgSend(v36, "intValue");
      }
      objc_msgSend(a1, "setAddressGeocodeAccuracyHint:", v38);
      goto LABEL_119;
    }
  }
LABEL_120:

  return a1;
}

- (GEOWaypointID)initWithJSON:(id)a3
{
  return (GEOWaypointID *)-[GEOWaypointID _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2992;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2993;
    GEOWaypointIDReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLatLng readAll:](self->_locationHint, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointIDIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointIDReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3E0) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWaypointID readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_locationHint)
      PBDataWriterWriteSubmessage();
    if (self->_addressHint)
      PBDataWriterWriteSubmessage();
    if (self->_placeNameHint)
      PBDataWriterWriteStringField();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_formattedAddressLineHints;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v11 = (__int16)self->_flags;
    if ((v11 & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      v11 = (__int16)self->_flags;
    }
    if ((v11 & 4) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOWaypointID _readLocationHint]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_locationHint, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  __int16 v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOWaypointID readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v10[6] = (id)self->_muid;
    *((_WORD *)v10 + 46) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v10[8] = (id)self->_resultProviderId;
    *((_WORD *)v10 + 46) |= 2u;
  }
  if (self->_locationHint)
    objc_msgSend(v10, "setLocationHint:");
  if (self->_addressHint)
    objc_msgSend(v10, "setAddressHint:");
  if (self->_placeNameHint)
    objc_msgSend(v10, "setPlaceNameHint:");
  if (-[GEOWaypointID formattedAddressLineHintsCount](self, "formattedAddressLineHintsCount"))
  {
    objc_msgSend(v10, "clearFormattedAddressLineHints");
    v5 = -[GEOWaypointID formattedAddressLineHintsCount](self, "formattedAddressLineHintsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOWaypointID formattedAddressLineHintAtIndex:](self, "formattedAddressLineHintAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addFormattedAddressLineHint:", v8);

      }
    }
  }
  v9 = (__int16)self->_flags;
  if ((v9 & 8) != 0)
  {
    *((_DWORD *)v10 + 22) = self->_placeTypeHint;
    *((_WORD *)v10 + 46) |= 8u;
    v9 = (__int16)self->_flags;
  }
  if ((v9 & 4) != 0)
  {
    *((_DWORD *)v10 + 21) = self->_addressGeocodeAccuracyHint;
    *((_WORD *)v10 + 46) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int16 v21;
  PBUnknownFields *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWaypointIDReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWaypointID readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_muid;
    *(_WORD *)(v5 + 92) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_resultProviderId;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v10 = -[GEOLatLng copyWithZone:](self->_locationHint, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[GEOStructuredAddress copyWithZone:](self->_addressHint, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_placeNameHint, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = self->_formattedAddressLineHints;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addFormattedAddressLineHint:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  v21 = (__int16)self->_flags;
  if ((v21 & 8) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_placeTypeHint;
    *(_WORD *)(v5 + 92) |= 8u;
    v21 = (__int16)self->_flags;
  }
  if ((v21 & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_addressGeocodeAccuracyHint;
    *(_WORD *)(v5 + 92) |= 4u;
  }
  v22 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOLatLng *locationHint;
  GEOStructuredAddress *addressHint;
  NSString *placeNameHint;
  NSMutableArray *formattedAddressLineHints;
  __int16 v11;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOWaypointID readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 46);
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 6))
      goto LABEL_29;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_29:
    v13 = 0;
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_resultProviderId != *((_QWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_29;
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((_QWORD *)v4 + 5) && !-[GEOLatLng isEqual:](locationHint, "isEqual:"))
    goto LABEL_29;
  addressHint = self->_addressHint;
  if ((unint64_t)addressHint | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOStructuredAddress isEqual:](addressHint, "isEqual:"))
      goto LABEL_29;
  }
  placeNameHint = self->_placeNameHint;
  if ((unint64_t)placeNameHint | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](placeNameHint, "isEqual:"))
      goto LABEL_29;
  }
  formattedAddressLineHints = self->_formattedAddressLineHints;
  if ((unint64_t)formattedAddressLineHints | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLineHints, "isEqual:"))
      goto LABEL_29;
  }
  v11 = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 46);
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_placeTypeHint != *((_DWORD *)v4 + 22))
      goto LABEL_29;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_29;
  }
  v13 = (v12 & 4) == 0;
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_addressGeocodeAccuracyHint != *((_DWORD *)v4 + 21))
      goto LABEL_29;
    v13 = 1;
  }
LABEL_30:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  -[GEOWaypointID readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v4 = 2654435761u * self->_muid;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_resultProviderId;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[GEOLatLng hash](self->_locationHint, "hash");
  v7 = -[GEOStructuredAddress hash](self->_addressHint, "hash");
  v8 = -[NSString hash](self->_placeNameHint, "hash");
  v9 = -[NSMutableArray hash](self->_formattedAddressLineHints, "hash");
  v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    v11 = 2654435761 * self->_placeTypeHint;
    if ((v10 & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v12 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((v10 & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v12 = 2654435761 * self->_addressGeocodeAccuracyHint;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  GEOLatLng *locationHint;
  uint64_t v7;
  GEOStructuredAddress *addressHint;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 1) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_flags |= 1u;
    v5 = *((_WORD *)v4 + 46);
  }
  if ((v5 & 2) != 0)
  {
    self->_resultProviderId = *((_QWORD *)v4 + 8);
    *(_WORD *)&self->_flags |= 2u;
  }
  locationHint = self->_locationHint;
  v7 = *((_QWORD *)v4 + 5);
  if (locationHint)
  {
    if (v7)
      -[GEOLatLng mergeFrom:](locationHint, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOWaypointID setLocationHint:](self, "setLocationHint:");
  }
  addressHint = self->_addressHint;
  v9 = *((_QWORD *)v4 + 3);
  if (addressHint)
  {
    if (v9)
      -[GEOStructuredAddress mergeFrom:](addressHint, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOWaypointID setAddressHint:](self, "setAddressHint:");
  }
  if (*((_QWORD *)v4 + 7))
    -[GEOWaypointID setPlaceNameHint:](self, "setPlaceNameHint:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[GEOWaypointID addFormattedAddressLineHint:](self, "addFormattedAddressLineHint:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  v15 = *((_WORD *)v4 + 46);
  if ((v15 & 8) != 0)
  {
    self->_placeTypeHint = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 8u;
    v15 = *((_WORD *)v4 + 46);
  }
  if ((v15 & 4) != 0)
  {
    self->_addressGeocodeAccuracyHint = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointIDReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2996);
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
  *(_WORD *)&self->_flags |= 0x210u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOWaypointID readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_locationHint, "clearUnknownFields:", 1);
    -[GEOStructuredAddress clearUnknownFields:](self->_addressHint, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeNameHint, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_formattedAddressLineHints, 0);
  objc_storeStrong((id *)&self->_addressHint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
