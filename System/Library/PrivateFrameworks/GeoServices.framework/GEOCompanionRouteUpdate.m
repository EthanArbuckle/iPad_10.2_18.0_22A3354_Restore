@implementation GEOCompanionRouteUpdate

- (GEOCompanionRouteUpdate)init
{
  GEOCompanionRouteUpdate *v2;
  GEOCompanionRouteUpdate *v3;
  GEOCompanionRouteUpdate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionRouteUpdate;
  v2 = -[GEOCompanionRouteUpdate init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionRouteUpdate)initWithData:(id)a3
{
  GEOCompanionRouteUpdate *v3;
  GEOCompanionRouteUpdate *v4;
  GEOCompanionRouteUpdate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionRouteUpdate;
  v3 = -[GEOCompanionRouteUpdate initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteID
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
        GEOCompanionRouteUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteID_tags_805);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRouteID
{
  -[GEOCompanionRouteUpdate _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOCompanionRouteUpdate _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("TRANSIT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT"));

  return v4;
}

- (double)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_lastUpdated = a3;
}

- (void)setHasLastUpdated:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasLastUpdated
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readTransitRouteUpdate
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
        GEOCompanionRouteUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitRouteUpdate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitRouteUpdate
{
  -[GEOCompanionRouteUpdate _readTransitRouteUpdate]((uint64_t)self);
  return self->_transitRouteUpdate != 0;
}

- (GEOTransitRouteUpdate)transitRouteUpdate
{
  -[GEOCompanionRouteUpdate _readTransitRouteUpdate]((uint64_t)self);
  return self->_transitRouteUpdate;
}

- (void)setTransitRouteUpdate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_transitRouteUpdate, a3);
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
  v8.super_class = (Class)GEOCompanionRouteUpdate;
  -[GEOCompanionRouteUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionRouteUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "routeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routeID"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("routeID"));
      }
    }

    v8 = *(_BYTE *)(a1 + 56);
    if ((v8 & 2) != 0)
    {
      v9 = *(_DWORD *)(a1 + 52);
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = CFSTR("TRANSIT");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = CFSTR("UNKNOWN");
      }
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("type"));

      v8 = *(_BYTE *)(a1 + 56);
    }
    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("lastUpdated"));

    }
    objc_msgSend((id)a1, "transitRouteUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v12, "jsonRepresentation");
      else
        objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("transitRouteUpdate"));

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
  return -[GEOCompanionRouteUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionRouteUpdate)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteUpdate *)-[GEOCompanionRouteUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTransitRouteUpdate *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  if (!a1)
    goto LABEL_21;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_21;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    objc_msgSend(a1, "setRouteID:", v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      v10 = 0;
    else
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("TRANSIT"));

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_12:
    objc_msgSend(a1, "setType:", v10);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastUpdated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(a1, "setLastUpdated:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitRouteUpdate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOTransitRouteUpdate alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOTransitRouteUpdate initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOTransitRouteUpdate initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setTransitRouteUpdate:", v14);

  }
LABEL_21:

  return a1;
}

- (GEOCompanionRouteUpdate)initWithJSON:(id)a3
{
  return (GEOCompanionRouteUpdate *)-[GEOCompanionRouteUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_813;
    else
      v8 = (int *)&readAll__nonRecursiveTag_814;
    GEOCompanionRouteUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOTransitRouteUpdate readAll:](self->_transitRouteUpdate, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionRouteUpdateIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCompanionRouteUpdate readAll:](self, "readAll:", 0);
    if (self->_routeID)
      PBDataWriterWriteDataField();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_transitRouteUpdate)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOCompanionRouteUpdate readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeID)
    objc_msgSend(v6, "setRouteID:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_type;
    *((_BYTE *)v6 + 56) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v6[2] = *(id *)&self->_lastUpdated;
    *((_BYTE *)v6 + 56) |= 1u;
  }
  if (self->_transitRouteUpdate)
  {
    objc_msgSend(v6, "setTransitRouteUpdate:");
    v5 = v6;
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
  char flags;
  id v12;

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
      GEOCompanionRouteUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionRouteUpdate readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_type;
    *(_BYTE *)(v5 + 56) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_lastUpdated;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v12 = -[GEOTransitRouteUpdate copyWithZone:](self->_transitRouteUpdate, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *routeID;
  GEOTransitRouteUpdate *transitRouteUpdate;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOCompanionRouteUpdate readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 13))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_lastUpdated != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_16;
  }
  transitRouteUpdate = self->_transitRouteUpdate;
  if ((unint64_t)transitRouteUpdate | *((_QWORD *)v4 + 4))
    v7 = -[GEOTransitRouteUpdate isEqual:](transitRouteUpdate, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double lastUpdated;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  -[GEOCompanionRouteUpdate readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_routeID, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9 ^ -[GEOTransitRouteUpdate hash](self->_transitRouteUpdate, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  lastUpdated = self->_lastUpdated;
  v6 = -lastUpdated;
  if (lastUpdated >= 0.0)
    v6 = self->_lastUpdated;
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
  return v4 ^ v3 ^ v9 ^ -[GEOTransitRouteUpdate hash](self->_transitRouteUpdate, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOTransitRouteUpdate *transitRouteUpdate;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if (v8[3])
  {
    -[GEOCompanionRouteUpdate setRouteID:](self, "setRouteID:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_lastUpdated = (double)v4[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
  transitRouteUpdate = self->_transitRouteUpdate;
  v7 = v4[4];
  if (transitRouteUpdate)
  {
    if (v7)
    {
      -[GEOTransitRouteUpdate mergeFrom:](transitRouteUpdate, "mergeFrom:");
LABEL_12:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOCompanionRouteUpdate setTransitRouteUpdate:](self, "setTransitRouteUpdate:");
    goto LABEL_12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitRouteUpdate, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCompanionRouteUpdate)initWithTransitRouteUpdate:(id)a3
{
  id v4;
  GEOCompanionRouteUpdate *v5;
  GEOCompanionRouteUpdate *v6;
  void *v7;
  void *v8;
  GEOCompanionRouteUpdate *v9;

  v4 = a3;
  if (v4)
  {
    v5 = -[GEOCompanionRouteUpdate init](self, "init");
    v6 = v5;
    if (v5)
    {
      -[GEOCompanionRouteUpdate setType:](v5, "setType:", 1);
      -[GEOCompanionRouteUpdate setTransitRouteUpdate:](v6, "setTransitRouteUpdate:", v4);
      objc_msgSend(v4, "routeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientRouteHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOCompanionRouteUpdate setRouteID:](v6, "setRouteID:", v8);

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
