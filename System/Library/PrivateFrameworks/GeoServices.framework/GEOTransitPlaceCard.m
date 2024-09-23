@implementation GEOTransitPlaceCard

- (GEOTransitPlaceCard)init
{
  GEOTransitPlaceCard *v2;
  GEOTransitPlaceCard *v3;
  GEOTransitPlaceCard *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitPlaceCard;
  v2 = -[GEOTransitPlaceCard init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitPlaceCard)initWithData:(id)a3
{
  GEOTransitPlaceCard *v3;
  GEOTransitPlaceCard *v4;
  GEOTransitPlaceCard *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitPlaceCard;
  v3 = -[GEOTransitPlaceCard initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)transitCategory
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_transitCategory;
  else
    return 0;
}

- (void)setTransitCategory:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_transitCategory = a3;
}

- (void)setHasTransitCategory:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasTransitCategory
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)transitCategoryAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0CCF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransitCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CATEGORY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUMMARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW_FREQUENCY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH_FREQUENCY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIXED_FREQUENCY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTIONS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OUT_OF_SERVICE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTransitSystemName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitPlaceCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitSystemName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitSystemName
{
  -[GEOTransitPlaceCard _readTransitSystemName]((uint64_t)self);
  return self->_transitSystemName != 0;
}

- (NSString)transitSystemName
{
  -[GEOTransitPlaceCard _readTransitSystemName]((uint64_t)self);
  return self->_transitSystemName;
}

- (void)setTransitSystemName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_transitSystemName, a3);
}

- (void)_readTransitDepartureSequenceUsage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitPlaceCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitDepartureSequenceUsage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitDepartureSequenceUsage
{
  -[GEOTransitPlaceCard _readTransitDepartureSequenceUsage]((uint64_t)self);
  return self->_transitDepartureSequenceUsage != 0;
}

- (GEOTransitDepartureSequenceUsage)transitDepartureSequenceUsage
{
  -[GEOTransitPlaceCard _readTransitDepartureSequenceUsage]((uint64_t)self);
  return self->_transitDepartureSequenceUsage;
}

- (void)setTransitDepartureSequenceUsage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_transitDepartureSequenceUsage, a3);
}

- (void)_readIncidentType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitPlaceCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIncidentType
{
  -[GEOTransitPlaceCard _readIncidentType]((uint64_t)self);
  return self->_incidentType != 0;
}

- (NSString)incidentType
{
  -[GEOTransitPlaceCard _readIncidentType]((uint64_t)self);
  return self->_incidentType;
}

- (void)setIncidentType:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_incidentType, a3);
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
  v8.super_class = (Class)GEOTransitPlaceCard;
  -[GEOTransitPlaceCard description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitPlaceCard dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitPlaceCard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      v5 = *(int *)(a1 + 52);
      if (v5 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0CCF0[v5];
      }
      if (a2)
        v7 = CFSTR("transitCategory");
      else
        v7 = CFSTR("transit_category");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "transitSystemName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        v9 = CFSTR("transitSystemName");
      else
        v9 = CFSTR("transit_system_name");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);
    }

    objc_msgSend((id)a1, "transitDepartureSequenceUsage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("transitDepartureSequenceUsage");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("transit_departure_sequence_usage");
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    objc_msgSend((id)a1, "incidentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a2)
        v15 = CFSTR("incidentType");
      else
        v15 = CFSTR("incident_type");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);
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
  return -[GEOTransitPlaceCard _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTransitPlaceCard)initWithDictionary:(id)a3
{
  return (GEOTransitPlaceCard *)-[GEOTransitPlaceCard _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;
  const __CFString *v13;
  void *v14;
  GEOTransitDepartureSequenceUsage *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;

  v5 = a2;
  if (!a1)
    goto LABEL_45;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_45;
  if (a3)
    v6 = CFSTR("transitCategory");
  else
    v6 = CFSTR("transit_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_CATEGORY")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SUMMARY")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOW_FREQUENCY")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HIGH_FREQUENCY")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MIXED_FREQUENCY")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CONNECTIONS")) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("OUT_OF_SERVICE")))
    {
      v9 = 6;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_25:
    objc_msgSend(a1, "setTransitCategory:", v9);
  }

  if (a3)
    v10 = CFSTR("transitSystemName");
  else
    v10 = CFSTR("transit_system_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setTransitSystemName:", v12);

  }
  if (a3)
    v13 = CFSTR("transitDepartureSequenceUsage");
  else
    v13 = CFSTR("transit_departure_sequence_usage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOTransitDepartureSequenceUsage alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOTransitDepartureSequenceUsage initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOTransitDepartureSequenceUsage initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setTransitDepartureSequenceUsage:", v16);

  }
  if (a3)
    v18 = CFSTR("incidentType");
  else
    v18 = CFSTR("incident_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(a1, "setIncidentType:", v20);

  }
LABEL_45:

  return a1;
}

- (GEOTransitPlaceCard)initWithJSON:(id)a3
{
  return (GEOTransitPlaceCard *)-[GEOTransitPlaceCard _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1348;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1349;
    GEOTransitPlaceCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOTransitDepartureSequenceUsage readAll:](self->_transitDepartureSequenceUsage, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitPlaceCardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitPlaceCardReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitPlaceCardIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitPlaceCard readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_transitSystemName)
      PBDataWriterWriteStringField();
    if (self->_transitDepartureSequenceUsage)
      PBDataWriterWriteSubmessage();
    if (self->_incidentType)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOTransitPlaceCard readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_transitCategory;
    *((_BYTE *)v5 + 56) |= 1u;
  }
  if (self->_transitSystemName)
  {
    objc_msgSend(v5, "setTransitSystemName:");
    v4 = v5;
  }
  if (self->_transitDepartureSequenceUsage)
  {
    objc_msgSend(v5, "setTransitDepartureSequenceUsage:");
    v4 = v5;
  }
  if (self->_incidentType)
  {
    objc_msgSend(v5, "setIncidentType:");
    v4 = v5;
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
  id v11;
  void *v12;
  uint64_t v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitPlaceCardReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitPlaceCard readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_transitCategory;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_transitSystemName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOTransitDepartureSequenceUsage copyWithZone:](self->_transitDepartureSequenceUsage, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_incidentType, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *transitSystemName;
  GEOTransitDepartureSequenceUsage *transitDepartureSequenceUsage;
  NSString *incidentType;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOTransitPlaceCard readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_transitCategory != *((_DWORD *)v4 + 13))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  transitSystemName = self->_transitSystemName;
  if ((unint64_t)transitSystemName | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](transitSystemName, "isEqual:"))
  {
    goto LABEL_13;
  }
  transitDepartureSequenceUsage = self->_transitDepartureSequenceUsage;
  if ((unint64_t)transitDepartureSequenceUsage | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOTransitDepartureSequenceUsage isEqual:](transitDepartureSequenceUsage, "isEqual:"))
      goto LABEL_13;
  }
  incidentType = self->_incidentType;
  if ((unint64_t)incidentType | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](incidentType, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  -[GEOTransitPlaceCard readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_transitCategory;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_transitSystemName, "hash");
  v5 = v4 ^ v3 ^ -[GEOTransitDepartureSequenceUsage hash](self->_transitDepartureSequenceUsage, "hash");
  return v5 ^ -[NSString hash](self->_incidentType, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOTransitDepartureSequenceUsage *transitDepartureSequenceUsage;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[14] & 1) != 0)
  {
    self->_transitCategory = v7[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v7 + 4))
  {
    -[GEOTransitPlaceCard setTransitSystemName:](self, "setTransitSystemName:");
    v4 = v7;
  }
  transitDepartureSequenceUsage = self->_transitDepartureSequenceUsage;
  v6 = *((_QWORD *)v4 + 3);
  if (transitDepartureSequenceUsage)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOTransitDepartureSequenceUsage mergeFrom:](transitDepartureSequenceUsage, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEOTransitPlaceCard setTransitDepartureSequenceUsage:](self, "setTransitDepartureSequenceUsage:");
  }
  v4 = v7;
LABEL_11:
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOTransitPlaceCard setIncidentType:](self, "setIncidentType:");
    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSystemName, 0);
  objc_storeStrong((id *)&self->_transitDepartureSequenceUsage, 0);
  objc_storeStrong((id *)&self->_incidentType, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
