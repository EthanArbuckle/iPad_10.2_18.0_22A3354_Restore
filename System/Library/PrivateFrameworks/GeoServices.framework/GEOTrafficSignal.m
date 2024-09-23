@implementation GEOTrafficSignal

- (GEOTrafficSignal)init
{
  GEOTrafficSignal *v2;
  GEOTrafficSignal *v3;
  GEOTrafficSignal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficSignal;
  v2 = -[GEOTrafficSignal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficSignal)initWithData:(id)a3
{
  GEOTrafficSignal *v3;
  GEOTrafficSignal *v4;
  GEOTrafficSignal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficSignal;
  v3 = -[GEOTrafficSignal initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
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
        GEOTrafficSignalReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_6786);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOTrafficSignal _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOTrafficSignal _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_identifier, a3);
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
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C087C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STOP_LIGHT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STOP_SIGN")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficSignalReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags_6787);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPosition
{
  -[GEOTrafficSignal _readPosition]((uint64_t)self);
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOTrafficSignal _readPosition]((uint64_t)self);
  return self->_position;
}

- (void)setPosition:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (unsigned)countryCodeStyleId
{
  return self->_countryCodeStyleId;
}

- (void)setCountryCodeStyleId:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_countryCodeStyleId = a3;
}

- (void)setHasCountryCodeStyleId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasCountryCodeStyleId
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOTrafficSignal;
  -[GEOTrafficSignal description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTrafficSignal dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficSignal _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  if ((*(_BYTE *)(a1 + 60) & 2) != 0)
  {
    v6 = *(int *)(a1 + 56);
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C087C0[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

  }
  objc_msgSend((id)a1, "position");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("position"));

  }
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("countryCodeStyleId");
    else
      v12 = CFSTR("country_code_style_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(void **)(a1 + 16);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __46__GEOTrafficSignal__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficSignal _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOTrafficSignal__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTrafficSignal)initWithDictionary:(id)a3
{
  return (GEOTrafficSignal *)-[GEOTrafficSignal _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  GEOLatLng *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v5 = a2;
  if (!a1)
    goto LABEL_28;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_28;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setIdentifier:", v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("STOP_LIGHT")) & 1) != 0)
    {
      v10 = 1;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("STOP_SIGN")))
    {
      v10 = 2;
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_16:
    objc_msgSend(a1, "setType:", v10);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEOLatLng initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEOLatLng initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setPosition:", v13);

  }
  if (a3)
    v15 = CFSTR("countryCodeStyleId");
  else
    v15 = CFSTR("country_code_style_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCountryCodeStyleId:", objc_msgSend(v16, "unsignedIntValue"));

LABEL_28:
  return a1;
}

- (GEOTrafficSignal)initWithJSON:(id)a3
{
  return (GEOTrafficSignal *)-[GEOTrafficSignal _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6788;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6789;
    GEOTrafficSignalReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLatLng readAll:](self->_position, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficSignalIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficSignalReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
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
    -[GEOTrafficSignal readAll:](self, "readAll:", 0);
    if (self->_identifier)
      PBDataWriterWriteStringField();
    v5 = v8;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOTrafficSignal _readPosition]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_position, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOTrafficSignal readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v5, "setIdentifier:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_type;
    *((_BYTE *)v5 + 60) |= 2u;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_countryCodeStyleId;
    *((_BYTE *)v4 + 60) |= 1u;
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
  PBUnknownFields *v13;

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
      GEOTrafficSignalReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTrafficSignal readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v11 = -[GEOLatLng copyWithZone:](self->_position, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_countryCodeStyleId;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  char flags;
  char v7;
  GEOLatLng *position;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOTrafficSignal readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_16;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 60);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_16;
  }
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:"))
    {
LABEL_16:
      v9 = 0;
      goto LABEL_17;
    }
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 60);
  }
  v9 = (v7 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_countryCodeStyleId != *((_DWORD *)v4 + 13))
      goto LABEL_16;
    v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOTrafficSignal readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = -[GEOLatLng hash](self->_position, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_countryCodeStyleId;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *position;
  uint64_t v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if (v7[3])
  {
    -[GEOTrafficSignal setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_flags |= 2u;
  }
  position = self->_position;
  v6 = v4[4];
  if (position)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEOTrafficSignal setPosition:](self, "setPosition:");
  }
  v4 = v7;
LABEL_11:
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_countryCodeStyleId = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTrafficSignalReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6792);
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
  *(_BYTE *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTrafficSignal readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_position, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
