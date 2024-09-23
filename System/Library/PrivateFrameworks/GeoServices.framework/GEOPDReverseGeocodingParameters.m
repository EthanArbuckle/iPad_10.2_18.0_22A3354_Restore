@implementation GEOPDReverseGeocodingParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_extendedLocations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDReverseGeocodingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_locations;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDReverseGeocodingParameters addLocation:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_placeTypeLimit;
    *(_BYTE *)(v5 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_preserveOriginalLocation;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_extendedLocations;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPDReverseGeocodingParameters addExtendedLocation:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_24:

  return (id)v5;
}

- (GEOPDReverseGeocodingParameters)init
{
  GEOPDReverseGeocodingParameters *v2;
  GEOPDReverseGeocodingParameters *v3;
  GEOPDReverseGeocodingParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDReverseGeocodingParameters;
  v2 = -[GEOPDReverseGeocodingParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)addExtendedLocation:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDReverseGeocodingParameters _readExtendedLocations](a1);
    -[GEOPDReverseGeocodingParameters _addNoFlagsExtendedLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_readExtendedLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDReverseGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExtendedLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsExtendedLocation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)extendedLocations
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDReverseGeocodingParameters _readExtendedLocations]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
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
  if (self->_reader && (_GEOPDReverseGeocodingParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 0);
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

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_extendedLocations;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }

}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5053;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5054;
      GEOPDReverseGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDReverseGeocodingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)dictionaryRepresentation
{
  return -[GEOPDReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v13;
  int v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDReverseGeocodingParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("location"));
  }
  v13 = *(_BYTE *)(a1 + 60);
  if ((v13 & 1) != 0)
  {
    v14 = *(_DWORD *)(a1 + 52);
    switch(v14)
    {
      case '#':
        v15 = CFSTR("TIME_ZONE");
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
LABEL_21:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '+':
        v15 = CFSTR("SUB_LOCALITY");
        break;
      case ',':
        v15 = CFSTR("OCEAN");
        break;
      case '-':
        v15 = CFSTR("AOI");
        break;
      case '.':
        v15 = CFSTR("INLAND_WATER");
        break;
      case '/':
        v15 = CFSTR("BUSINESS");
        break;
      case '0':
        v15 = CFSTR("ISLAND");
        break;
      case '1':
        v15 = CFSTR("STREET");
        break;
      case '2':
        v15 = CFSTR("ADMIN");
        break;
      case '3':
        v15 = CFSTR("POSTAL");
        break;
      case '6':
        v15 = CFSTR("INTERSECTION");
        break;
      case '7':
        v15 = CFSTR("BUILDING");
        break;
      case '9':
        v15 = CFSTR("ADDRESS");
        break;
      case '=':
        v15 = CFSTR("CONTINENT");
        break;
      case '?':
        v15 = CFSTR("REGION");
        break;
      case '@':
        v15 = CFSTR("DIVISION");
        break;
      case 'A':
        v15 = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v15 = CFSTR("UNKNOWN_PLACE_TYPE");
        switch(v14)
        {
          case 0:
            goto LABEL_40;
          case 1:
            v15 = CFSTR("COUNTRY");
            break;
          case 2:
            v15 = CFSTR("ADMINISTRATIVE_AREA");
            break;
          case 3:
            goto LABEL_21;
          case 4:
            v15 = CFSTR("SUB_ADMINISTRATIVE_AREA");
            break;
          default:
            if (v14 != 16)
              goto LABEL_21;
            v15 = CFSTR("LOCALITY");
            break;
        }
        break;
    }
LABEL_40:
    if (a2)
      v16 = CFSTR("placeTypeLimit");
    else
      v16 = CFSTR("place_type_limit");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v13 = *(_BYTE *)(a1 + 60);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("preserveOriginalLocation");
    else
      v18 = CFSTR("preserve_original_location");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = *(id *)(a1 + 24);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("extendedLocation");
    else
      v27 = CFSTR("extended_location");
    objc_msgSend(v4, "setObject:forKey:", v19, v27);

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
      v35[2] = __61__GEOPDReverseGeocodingParameters__dictionaryRepresentation___block_invoke;
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

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDReverseGeocodingParameters _readExtendedLocations](a1);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 24);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v4);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2) & 1) != 0)
        goto LABEL_19;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }

  -[GEOPDReverseGeocodingParameters _readLocations](a1);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_12:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v4);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "hasGreenTeaWithValue:", a2, (_QWORD)v15) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
LABEL_19:
    v13 = 1;
    goto LABEL_20;
  }
LABEL_18:
  v13 = 0;
LABEL_20:

  return v13;
}

- (GEOPDReverseGeocodingParameters)initWithData:(id)a3
{
  GEOPDReverseGeocodingParameters *v3;
  GEOPDReverseGeocodingParameters *v4;
  GEOPDReverseGeocodingParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDReverseGeocodingParameters;
  v3 = -[GEOPDReverseGeocodingParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocations
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDReverseGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocations_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)addLocation:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDReverseGeocodingParameters _readLocations](a1);
    -[GEOPDReverseGeocodingParameters _addNoFlagsLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDReverseGeocodingParameters;
  -[GEOPDReverseGeocodingParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDReverseGeocodingParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPDReverseGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDReverseGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *locations;
  char v6;
  NSMutableArray *extendedLocations;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)v4, 1);
  locations = self->_locations;
  if ((unint64_t)locations | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_placeTypeLimit != *((_DWORD *)v4 + 13))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
      goto LABEL_19;
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  if ((*((_BYTE *)v4 + 60) & 2) == 0)
    goto LABEL_13;
  if (!self->_preserveOriginalLocation)
  {
    if (!*((_BYTE *)v4 + 56))
      goto LABEL_19;
    goto LABEL_13;
  }
  if (!*((_BYTE *)v4 + 56))
    goto LABEL_13;
LABEL_19:
  extendedLocations = self->_extendedLocations;
  if ((unint64_t)extendedLocations | *((_QWORD *)v4 + 3))
    v6 = -[NSMutableArray isEqual:](extendedLocations, "isEqual:");
  else
    v6 = 1;
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_locations, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_placeTypeLimit;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_extendedLocations, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_preserveOriginalLocation;
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_extendedLocations, "hash");
}

@end
