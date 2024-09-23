@implementation GEOMapItemRoutineAttributes

- (NSUUID)loiIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[GEOMapItemRoutineAttributes loiIdentifierString](self, "loiIdentifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[GEOMapItemRoutineAttributes loiIdentifierString](self, "loiIdentifierString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    v6 = 0;
  }
  return (NSUUID *)v6;
}

- (void)setLoiIdentifier:(id)a3
{
  id v4;

  objc_msgSend(a3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemRoutineAttributes setLoiIdentifierString:](self, "setLoiIdentifierString:", v4);

}

- (GEOMapItemRoutineAttributes)init
{
  GEOMapItemRoutineAttributes *v2;
  GEOMapItemRoutineAttributes *v3;
  GEOMapItemRoutineAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemRoutineAttributes;
  v2 = -[GEOMapItemRoutineAttributes init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapItemRoutineAttributes)initWithData:(id)a3
{
  GEOMapItemRoutineAttributes *v3;
  GEOMapItemRoutineAttributes *v4;
  GEOMapItemRoutineAttributes *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemRoutineAttributes;
  v3 = -[GEOMapItemRoutineAttributes initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)loiType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_loiType;
  else
    return 0;
}

- (void)setLoiType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_loiType = a3;
}

- (void)setHasLoiType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLoiType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)loiTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0F9F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLoiType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("School")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gym")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEventName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemRoutineAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEventName
{
  -[GEOMapItemRoutineAttributes _readEventName]((uint64_t)self);
  return self->_eventName != 0;
}

- (NSString)eventName
{
  -[GEOMapItemRoutineAttributes _readEventName]((uint64_t)self);
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (double)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_eventDate = a3;
}

- (void)setHasEventDate:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasEventDate
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isEventAllDay
{
  return self->_isEventAllDay;
}

- (void)setIsEventAllDay:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_isEventAllDay = a3;
}

- (void)setHasIsEventAllDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsEventAllDay
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readLoiIdentifierString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemRoutineAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLoiIdentifierString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLoiIdentifierString
{
  -[GEOMapItemRoutineAttributes _readLoiIdentifierString]((uint64_t)self);
  return self->_loiIdentifierString != 0;
}

- (NSString)loiIdentifierString
{
  -[GEOMapItemRoutineAttributes _readLoiIdentifierString]((uint64_t)self);
  return self->_loiIdentifierString;
}

- (void)setLoiIdentifierString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_loiIdentifierString, a3);
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
  v8.super_class = (Class)GEOMapItemRoutineAttributes;
  -[GEOMapItemRoutineAttributes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemRoutineAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemRoutineAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 68) & 2) != 0)
  {
    v5 = *(int *)(a1 + 60);
    if (v5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0F9F0[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("loiType"));

  }
  objc_msgSend((id)a1, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("eventName"));

  v8 = *(_BYTE *)(a1 + 68);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("eventDate"));

    v8 = *(_BYTE *)(a1 + 68);
  }
  if ((v8 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("isEventAllDay"));

  }
  objc_msgSend((id)a1, "loiIdentifierString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("loiIdentifierString"));

  v12 = *(void **)(a1 + 16);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__GEOMapItemRoutineAttributes__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapItemRoutineAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOMapItemRoutineAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapItemRoutineAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemRoutineAttributes *)-[GEOMapItemRoutineAttributes _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (!a1)
    goto LABEL_28;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_28;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("loiType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Home")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Work")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("School")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Gym")))
    {
      v6 = 4;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_18:
    objc_msgSend(a1, "setLoiType:", v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setEventName:", v8);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(a1, "setEventDate:");
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isEventAllDay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsEventAllDay:", objc_msgSend(v10, "BOOLValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("loiIdentifierString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setLoiIdentifierString:", v12);

  }
LABEL_28:

  return a1;
}

- (GEOMapItemRoutineAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemRoutineAttributes *)-[GEOMapItemRoutineAttributes _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_879;
    else
      v8 = (int *)&readAll__nonRecursiveTag_880;
    GEOMapItemRoutineAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemRoutineAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemRoutineAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x70) == 0))
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapItemRoutineAttributes readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v9;
    if (self->_eventName)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    if (self->_loiIdentifierString)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOMapItemRoutineAttributes readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_loiType;
    *((_BYTE *)v6 + 68) |= 2u;
  }
  if (self->_eventName)
  {
    objc_msgSend(v6, "setEventName:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v4[3] = *(id *)&self->_eventDate;
    *((_BYTE *)v4 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_isEventAllDay;
    *((_BYTE *)v4 + 68) |= 4u;
  }
  if (self->_loiIdentifierString)
  {
    objc_msgSend(v6, "setLoiIdentifierString:");
    v4 = v6;
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
  uint64_t v12;
  void *v13;
  PBUnknownFields *v14;

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
      GEOMapItemRoutineAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapItemRoutineAttributes readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_loiType;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_eventName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_eventDate;
    *(_BYTE *)(v5 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_isEventAllDay;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_loiIdentifierString, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *eventName;
  char v8;
  NSString *loiIdentifierString;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOMapItemRoutineAttributes readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 68);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_loiType != *((_DWORD *)v4 + 15))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_19;
  }
  eventName = self->_eventName;
  if ((unint64_t)eventName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](eventName, "isEqual:"))
      goto LABEL_19;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_eventDate != *((double *)v4 + 3))
      goto LABEL_19;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((flags & 4) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_25;
LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  if ((v6 & 4) == 0)
    goto LABEL_19;
  if (!self->_isEventAllDay)
  {
    if (!*((_BYTE *)v4 + 64))
      goto LABEL_25;
    goto LABEL_19;
  }
  if (!*((_BYTE *)v4 + 64))
    goto LABEL_19;
LABEL_25:
  loiIdentifierString = self->_loiIdentifierString;
  if ((unint64_t)loiIdentifierString | *((_QWORD *)v4 + 5))
    v8 = -[NSString isEqual:](loiIdentifierString, "isEqual:");
  else
    v8 = 1;
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char flags;
  unint64_t v6;
  double eventDate;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;

  -[GEOMapItemRoutineAttributes readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_loiType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_eventName, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    eventDate = self->_eventDate;
    v8 = -eventDate;
    if (eventDate >= 0.0)
      v8 = self->_eventDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((flags & 4) != 0)
    v11 = 2654435761 * self->_isEventAllDay;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v11 ^ -[NSString hash](self->_loiIdentifierString, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v6 = (int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if ((v6[17] & 2) != 0)
  {
    self->_loiType = v6[15];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v6 + 4))
  {
    -[GEOMapItemRoutineAttributes setEventName:](self, "setEventName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_eventDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 4) != 0)
  {
    self->_isEventAllDay = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEOMapItemRoutineAttributes setLoiIdentifierString:](self, "setLoiIdentifierString:");
    v4 = v6;
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
      GEOMapItemRoutineAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_883);
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
  *(_BYTE *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOMapItemRoutineAttributes readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiIdentifierString, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
