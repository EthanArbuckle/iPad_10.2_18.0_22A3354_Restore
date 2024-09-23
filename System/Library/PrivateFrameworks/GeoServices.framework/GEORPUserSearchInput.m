@implementation GEORPUserSearchInput

- (GEORPUserSearchInput)init
{
  GEORPUserSearchInput *v2;
  GEORPUserSearchInput *v3;
  GEORPUserSearchInput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPUserSearchInput;
  v2 = -[GEORPUserSearchInput init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPUserSearchInput)initWithData:(id)a3
{
  GEORPUserSearchInput *v3;
  GEORPUserSearchInput *v4;
  GEORPUserSearchInput *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPUserSearchInput;
  v3 = -[GEORPUserSearchInput initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSearchString
{
  -[GEORPUserSearchInput _readSearchString]((uint64_t)self);
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEORPUserSearchInput _readSearchString]((uint64_t)self);
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)_readSingleLineAddressString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSingleLineAddressString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSingleLineAddressString
{
  -[GEORPUserSearchInput _readSingleLineAddressString]((uint64_t)self);
  return self->_singleLineAddressString != 0;
}

- (NSString)singleLineAddressString
{
  -[GEORPUserSearchInput _readSingleLineAddressString]((uint64_t)self);
  return self->_singleLineAddressString;
}

- (void)setSingleLineAddressString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_singleLineAddressString, a3);
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_2848);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  -[GEORPUserSearchInput _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPUserSearchInput _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readAutocompleteEntry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteEntry_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAutocompleteEntry
{
  -[GEORPUserSearchInput _readAutocompleteEntry]((uint64_t)self);
  return self->_autocompleteEntry != 0;
}

- (GEOPDAutocompleteEntry)autocompleteEntry
{
  -[GEORPUserSearchInput _readAutocompleteEntry]((uint64_t)self);
  return self->_autocompleteEntry;
}

- (void)setAutocompleteEntry:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_autocompleteEntry, a3);
}

- (void)_readCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinate_tags_2849);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCoordinate
{
  -[GEORPUserSearchInput _readCoordinate]((uint64_t)self);
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPUserSearchInput _readCoordinate]((uint64_t)self);
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (int)origin
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_origin;
  else
    return 0;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasOrigin
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0EFA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DROPPED_PIN")))
  {
    v4 = 3;
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
  v8.super_class = (Class)GEORPUserSearchInput;
  -[GEORPUserSearchInput description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPUserSearchInput dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPUserSearchInput _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("searchString");
      else
        v6 = CFSTR("search_string");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "singleLineAddressString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("singleLineAddressString");
      else
        v8 = CFSTR("single_line_address_string");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend((id)a1, "place");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v9, "jsonRepresentation");
      else
        objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("place"));

    }
    objc_msgSend((id)a1, "autocompleteEntry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v12, "jsonRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("autocompleteEntry");
      }
      else
      {
        objc_msgSend(v12, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("autocomplete_entry");
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

    }
    objc_msgSend((id)a1, "coordinate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v16, "jsonRepresentation");
      else
        objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("coordinate"));

    }
    if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    {
      v19 = *(int *)(a1 + 68);
      if (v19 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E1C0EFA8[v19];
      }
      objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("origin"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPUserSearchInput _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPUserSearchInput)initWithDictionary:(id)a3
{
  return (GEORPUserSearchInput *)-[GEORPUserSearchInput _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOPDPlace *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOPDAutocompleteEntry *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  GEOLatLng *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("searchString");
      else
        v6 = CFSTR("search_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSearchString:", v8);

      }
      if (a3)
        v9 = CFSTR("singleLineAddressString");
      else
        v9 = CFSTR("single_line_address_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setSingleLineAddressString:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPDPlace alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOPDPlace initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOPDPlace initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setPlace:", v14);

      }
      if (a3)
        v16 = CFSTR("autocompleteEntry");
      else
        v16 = CFSTR("autocomplete_entry");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOPDAutocompleteEntry alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOPDAutocompleteEntry initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOPDAutocompleteEntry initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setAutocompleteEntry:", v19);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOLatLng initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOLatLng initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setCoordinate:", v23);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v25;
        if ((objc_msgSend(v26, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
        {
          v27 = 0;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
        {
          v27 = 1;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("CURRENT_LOCATION")) & 1) != 0)
        {
          v27 = 2;
        }
        else if (objc_msgSend(v26, "isEqualToString:", CFSTR("DROPPED_PIN")))
        {
          v27 = 3;
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
        {
LABEL_45:

          goto LABEL_46;
        }
        v27 = objc_msgSend(v25, "intValue");
      }
      objc_msgSend(a1, "setOrigin:", v27);
      goto LABEL_45;
    }
  }
LABEL_46:

  return a1;
}

- (GEORPUserSearchInput)initWithJSON:(id)a3
{
  return (GEORPUserSearchInput *)-[GEORPUserSearchInput _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2865;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2866;
    GEORPUserSearchInputReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDPlace readAll:](self->_place, "readAll:", 1);
    -[GEOPDAutocompleteEntry readAll:](self->_autocompleteEntry, "readAll:", 1);
    -[GEOLatLng readAll:](self->_coordinate, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPUserSearchInputIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPUserSearchInputReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPUserSearchInputIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPUserSearchInput readAll:](self, "readAll:", 0);
    if (self->_searchString)
      PBDataWriterWriteStringField();
    if (self->_singleLineAddressString)
      PBDataWriterWriteStringField();
    if (self->_place)
      PBDataWriterWriteSubmessage();
    if (self->_autocompleteEntry)
      PBDataWriterWriteSubmessage();
    if (self->_coordinate)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPUserSearchInput _readAutocompleteEntry]((uint64_t)self);
  if (-[GEOPDAutocompleteEntry hasGreenTeaWithValue:](self->_autocompleteEntry, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPUserSearchInput _readCoordinate]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_coordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPUserSearchInput _readPlace]((uint64_t)self);
  return -[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPUserSearchInput readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_searchString)
    objc_msgSend(v5, "setSearchString:");
  if (self->_singleLineAddressString)
    objc_msgSend(v5, "setSingleLineAddressString:");
  v4 = v5;
  if (self->_place)
  {
    objc_msgSend(v5, "setPlace:");
    v4 = v5;
  }
  if (self->_autocompleteEntry)
  {
    objc_msgSend(v5, "setAutocompleteEntry:");
    v4 = v5;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v5, "setCoordinate:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_origin;
    *((_BYTE *)v4 + 72) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

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
      GEORPUserSearchInputReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPUserSearchInput readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_singleLineAddressString, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[GEOPDAutocompleteEntry copyWithZone:](self->_autocompleteEntry, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;

  v17 = -[GEOLatLng copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_origin;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchString;
  NSString *singleLineAddressString;
  GEOPDPlace *place;
  GEOPDAutocompleteEntry *autocompleteEntry;
  GEOLatLng *coordinate;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEORPUserSearchInput readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:"))
      goto LABEL_16;
  }
  singleLineAddressString = self->_singleLineAddressString;
  if ((unint64_t)singleLineAddressString | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](singleLineAddressString, "isEqual:"))
      goto LABEL_16;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:"))
      goto LABEL_16;
  }
  autocompleteEntry = self->_autocompleteEntry;
  if ((unint64_t)autocompleteEntry | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](autocompleteEntry, "isEqual:"))
      goto LABEL_16;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 72) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) != 0 && self->_origin == *((_DWORD *)v4 + 17))
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEORPUserSearchInput readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_searchString, "hash");
  v4 = -[NSString hash](self->_singleLineAddressString, "hash");
  v5 = -[GEOPDPlace hash](self->_place, "hash");
  v6 = -[GEOPDAutocompleteEntry hash](self->_autocompleteEntry, "hash");
  v7 = -[GEOLatLng hash](self->_coordinate, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_origin;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPDPlace *place;
  uint64_t v6;
  GEOPDAutocompleteEntry *autocompleteEntry;
  uint64_t v8;
  GEOLatLng *coordinate;
  uint64_t v10;
  _QWORD *v11;

  v11 = a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  if (v11[5])
  {
    -[GEORPUserSearchInput setSearchString:](self, "setSearchString:");
    v4 = v11;
  }
  if (v4[6])
  {
    -[GEORPUserSearchInput setSingleLineAddressString:](self, "setSingleLineAddressString:");
    v4 = v11;
  }
  place = self->_place;
  v6 = v4[4];
  if (place)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPUserSearchInput setPlace:](self, "setPlace:");
  }
  v4 = v11;
LABEL_11:
  autocompleteEntry = self->_autocompleteEntry;
  v8 = v4[2];
  if (autocompleteEntry)
  {
    if (!v8)
      goto LABEL_17;
    -[GEOPDAutocompleteEntry mergeFrom:](autocompleteEntry, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPUserSearchInput setAutocompleteEntry:](self, "setAutocompleteEntry:");
  }
  v4 = v11;
LABEL_17:
  coordinate = self->_coordinate;
  v10 = v4[3];
  if (coordinate)
  {
    if (!v10)
      goto LABEL_23;
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[GEORPUserSearchInput setCoordinate:](self, "setCoordinate:");
  }
  v4 = v11;
LABEL_23:
  if ((v4[9] & 1) != 0)
  {
    self->_origin = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleLineAddressString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
