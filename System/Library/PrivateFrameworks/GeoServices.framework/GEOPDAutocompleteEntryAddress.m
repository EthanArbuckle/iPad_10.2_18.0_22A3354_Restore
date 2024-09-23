@implementation GEOPDAutocompleteEntryAddress

- (GEOPDAutocompleteEntryAddress)init
{
  GEOPDAutocompleteEntryAddress *v2;
  GEOPDAutocompleteEntryAddress *v3;
  GEOPDAutocompleteEntryAddress *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryAddress;
  v2 = -[GEOPDAutocompleteEntryAddress init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryAddress)initWithData:(id)a3
{
  GEOPDAutocompleteEntryAddress *v3;
  GEOPDAutocompleteEntryAddress *v4;
  GEOPDAutocompleteEntryAddress *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryAddress;
  v3 = -[GEOPDAutocompleteEntryAddress initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCenter
{
  -[GEOPDAutocompleteEntryAddress _readCenter]((uint64_t)self);
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPDAutocompleteEntryAddress _readCenter]((uint64_t)self);
  return self->_center;
}

- (void)setCenter:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (unint64_t)opaqueGeoId
{
  return self->_opaqueGeoId;
}

- (void)setOpaqueGeoId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_opaqueGeoId = a3;
}

- (void)setHasOpaqueGeoId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 260;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasOpaqueGeoId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDistance
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)placeType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_placeType;
  else
    return 0;
}

- (void)setPlaceType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 264;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPlaceType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)placeTypeAsString:(int)a3
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

- (int)StringAsPlaceType:(id)a3
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

- (double)disambiguationRadiusMeters
{
  return self->_disambiguationRadiusMeters;
}

- (void)setDisambiguationRadiusMeters:(double)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_disambiguationRadiusMeters = a3;
}

- (void)setHasDisambiguationRadiusMeters:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasDisambiguationRadiusMeters
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMapsId
{
  -[GEOPDAutocompleteEntryAddress _readMapsId]((uint64_t)self);
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOPDAutocompleteEntryAddress _readMapsId]((uint64_t)self);
  return self->_mapsId;
}

- (void)setMapsId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (BOOL)shouldCallPlacesForClientization
{
  return self->_shouldCallPlacesForClientization;
}

- (void)setShouldCallPlacesForClientization:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  self->_shouldCallPlacesForClientization = a3;
}

- (void)setHasShouldCallPlacesForClientization:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 272;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasShouldCallPlacesForClientization
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOPDAutocompleteEntryAddress;
  -[GEOPDAutocompleteEntryAddress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteEntryAddress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  const __CFString *v29;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "center");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("center"));

  }
  v8 = *(_WORD *)(a1 + 84);
  if ((v8 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("opaqueGeoId");
    else
      v16 = CFSTR("opaque_geo_id");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v8 = *(_WORD *)(a1 + 84);
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 8) == 0)
        goto LABEL_10;
LABEL_23:
      v18 = *(_DWORD *)(a1 + 76);
      switch(v18)
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
LABEL_41:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 76));
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
          switch(v18)
          {
            case 0:
              goto LABEL_60;
            case 1:
              v19 = CFSTR("COUNTRY");
              break;
            case 2:
              v19 = CFSTR("ADMINISTRATIVE_AREA");
              break;
            case 3:
              goto LABEL_41;
            case 4:
              v19 = CFSTR("SUB_ADMINISTRATIVE_AREA");
              break;
            default:
              if (v18 != 16)
                goto LABEL_41;
              v19 = CFSTR("LOCALITY");
              break;
          }
          break;
      }
LABEL_60:
      if (a2)
        v29 = CFSTR("placeType");
      else
        v29 = CFSTR("place_type");
      objc_msgSend(v4, "setObject:forKey:", v19, v29);

      if ((*(_WORD *)(a1 + 84) & 1) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("distance"));

  v8 = *(_WORD *)(a1 + 84);
  if ((v8 & 8) != 0)
    goto LABEL_23;
LABEL_10:
  if ((v8 & 1) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("disambiguationRadiusMeters");
    else
      v10 = CFSTR("disambiguation_radius_meters");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
LABEL_15:
  objc_msgSend((id)a1, "mapsId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if ((*(_WORD *)(a1 + 84) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("shouldCallPlacesForClientization");
    else
      v21 = CFSTR("should_call_places_for_clientization");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __59__GEOPDAutocompleteEntryAddress__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v26 = v25;
      v31 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v30);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteEntryAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDAutocompleteEntryAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryAddress)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryAddress *)-[GEOPDAutocompleteEntryAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOPDMapsIdentifier *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  v5 = a2;
  if (!a1)
    goto LABEL_87;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_87;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOLatLng initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOLatLng initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setCenter:", v8);

  }
  if (a3)
    v10 = CFSTR("opaqueGeoId");
  else
    v10 = CFSTR("opaque_geo_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOpaqueGeoId:", objc_msgSend(v11, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(a1, "setDistance:");
  }

  if (a3)
    v13 = CFSTR("placeType");
  else
    v13 = CFSTR("place_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
    {
      v16 = 4;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
    {
      v16 = 16;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
    {
      v16 = 35;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
    {
      v16 = 43;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
    {
      v16 = 44;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
    {
      v16 = 45;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
    {
      v16 = 46;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
    {
      v16 = 47;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
    {
      v16 = 48;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
    {
      v16 = 49;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
    {
      v16 = 50;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
    {
      v16 = 51;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
    {
      v16 = 54;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
    {
      v16 = 55;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v16 = 57;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
    {
      v16 = 61;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
    {
      v16 = 63;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
    {
      v16 = 64;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
    {
      v16 = 65;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_67;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_67:
    objc_msgSend(a1, "setPlaceType:", v16);
  }

  if (a3)
    v17 = CFSTR("disambiguationRadiusMeters");
  else
    v17 = CFSTR("disambiguation_radius_meters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(a1, "setDisambiguationRadiusMeters:");
  }

  if (a3)
    v19 = CFSTR("mapsId");
  else
    v19 = CFSTR("maps_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEOPDMapsIdentifier initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEOPDMapsIdentifier initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(a1, "setMapsId:", v22);

  }
  if (a3)
    v24 = CFSTR("shouldCallPlacesForClientization");
  else
    v24 = CFSTR("should_call_places_for_clientization");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShouldCallPlacesForClientization:", objc_msgSend(v25, "BOOLValue"));

LABEL_87:
  return a1;
}

- (GEOPDAutocompleteEntryAddress)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryAddress *)-[GEOPDAutocompleteEntryAddress _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_345;
    else
      v8 = (int *)&readAll__nonRecursiveTag_346;
    GEOPDAutocompleteEntryAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_center, "readAll:", 1);
    -[GEOPDMapsIdentifier readAll:](self->_mapsId, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1C0) == 0)
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
      goto LABEL_20;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteEntryAddress readAll:](self, "readAll:", 0);
  if (self->_center)
    PBDataWriterWriteSubmessage();
  flags = (__int16)self->_flags;
  v6 = v9;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = v9;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
LABEL_17:
      PBDataWriterWriteInt32Field();
      v6 = v9;
      if ((*(_WORD *)&self->_flags & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v6 = v9;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 1) != 0)
  {
LABEL_9:
    PBDataWriterWriteDoubleField();
    v6 = v9;
  }
LABEL_10:
  if (self->_mapsId)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_20:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDAutocompleteEntryAddress _readCenter]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteEntryAddress _readMapsId]((uint64_t)self);
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOPDAutocompleteEntryAddress readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_center)
    objc_msgSend(v6, "setCenter:");
  flags = (__int16)self->_flags;
  v5 = v6;
  if ((flags & 4) != 0)
  {
    v6[7] = (id)self->_opaqueGeoId;
    *((_WORD *)v6 + 42) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_5;
  }
  v6[5] = *(id *)&self->_distance;
  *((_WORD *)v6 + 42) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v6 + 19) = self->_placeType;
  *((_WORD *)v6 + 42) |= 8u;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_7:
    v6[4] = *(id *)&self->_disambiguationRadiusMeters;
    *((_WORD *)v6 + 42) |= 1u;
  }
LABEL_8:
  if (self->_mapsId)
  {
    objc_msgSend(v6, "setMapsId:");
    v5 = v6;
  }
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((_BYTE *)v5 + 80) = self->_shouldCallPlacesForClientization;
    *((_WORD *)v5 + 42) |= 0x10u;
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
  __int16 flags;
  id v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAutocompleteEntryAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_13;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteEntryAddress readAll:](self, "readAll:", 0);
  v9 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_opaqueGeoId;
    *(_WORD *)(v5 + 84) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
LABEL_16:
      *(_DWORD *)(v5 + 76) = self->_placeType;
      *(_WORD *)(v5 + 84) |= 8u;
      if ((*(_WORD *)&self->_flags & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v5 + 40) = self->_distance;
  *(_WORD *)(v5 + 84) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_16;
LABEL_8:
  if ((flags & 1) != 0)
  {
LABEL_9:
    *(double *)(v5 + 32) = self->_disambiguationRadiusMeters;
    *(_WORD *)(v5 + 84) |= 1u;
  }
LABEL_10:
  v12 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_shouldCallPlacesForClientization;
    *(_WORD *)(v5 + 84) |= 0x10u;
  }
  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_13:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *center;
  __int16 flags;
  __int16 v7;
  GEOPDMapsIdentifier *mapsId;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOPDAutocompleteEntryAddress readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_29;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 42);
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_opaqueGeoId != *((_QWORD *)v4 + 7))
      goto LABEL_29;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_distance != *((double *)v4 + 5))
      goto LABEL_29;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_placeType != *((_DWORD *)v4 + 19))
      goto LABEL_29;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_disambiguationRadiusMeters != *((double *)v4 + 4))
      goto LABEL_29;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_29;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
      goto LABEL_29;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 42);
  }
  v9 = (v7 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) != 0)
    {
      if (self->_shouldCallPlacesForClientization)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_29;
      }
      else if (*((_BYTE *)v4 + 80))
      {
        goto LABEL_29;
      }
      v9 = 1;
      goto LABEL_30;
    }
LABEL_29:
    v9 = 0;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  __int16 flags;
  unint64_t v5;
  double distance;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  double disambiguationRadiusMeters;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  -[GEOPDAutocompleteEntryAddress readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_center, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v5 = 2654435761u * self->_opaqueGeoId;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((flags & 2) == 0)
    goto LABEL_8;
LABEL_3:
  distance = self->_distance;
  v7 = -distance;
  if (distance >= 0.0)
    v7 = self->_distance;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((flags & 8) != 0)
  {
    v11 = 2654435761 * self->_placeType;
    if ((flags & 1) != 0)
      goto LABEL_13;
LABEL_18:
    v16 = 0;
    goto LABEL_21;
  }
  v11 = 0;
  if ((flags & 1) == 0)
    goto LABEL_18;
LABEL_13:
  disambiguationRadiusMeters = self->_disambiguationRadiusMeters;
  v13 = -disambiguationRadiusMeters;
  if (disambiguationRadiusMeters >= 0.0)
    v13 = self->_disambiguationRadiusMeters;
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
LABEL_21:
  v17 = -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
    v18 = 2654435761 * self->_shouldCallPlacesForClientization;
  else
    v18 = 0;
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *center;
  uint64_t v6;
  __int16 v7;
  GEOPDMapsIdentifier *mapsId;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  center = self->_center;
  v6 = v10[3];
  if (center)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPDAutocompleteEntryAddress setCenter:](self, "setCenter:");
  }
  v4 = v10;
LABEL_7:
  v7 = *((_WORD *)v4 + 42);
  if ((v7 & 4) != 0)
  {
    self->_opaqueGeoId = v4[7];
    *(_WORD *)&self->_flags |= 4u;
    v7 = *((_WORD *)v4 + 42);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 8) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_distance = (double)v4[5];
  *(_WORD *)&self->_flags |= 2u;
  v7 = *((_WORD *)v4 + 42);
  if ((v7 & 8) == 0)
  {
LABEL_10:
    if ((v7 & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  self->_placeType = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v4 + 42) & 1) != 0)
  {
LABEL_11:
    self->_disambiguationRadiusMeters = (double)v4[4];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_12:
  mapsId = self->_mapsId;
  v9 = v4[6];
  if (mapsId)
  {
    if (!v9)
      goto LABEL_22;
    -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_22;
    -[GEOPDAutocompleteEntryAddress setMapsId:](self, "setMapsId:");
  }
  v4 = v10;
LABEL_22:
  if ((*((_WORD *)v4 + 42) & 0x10) != 0)
  {
    self->_shouldCallPlacesForClientization = *((_BYTE *)v4 + 80);
    *(_WORD *)&self->_flags |= 0x10u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteEntryAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_349);
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
  *(_WORD *)&self->_flags |= 0x120u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteEntryAddress readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_center, "clearUnknownFields:", 1);
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_mapsId, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
