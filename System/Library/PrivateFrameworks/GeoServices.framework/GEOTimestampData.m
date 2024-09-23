@implementation GEOTimestampData

- (GEOTimestampData)init
{
  GEOTimestampData *v2;
  GEOTimestampData *v3;
  GEOTimestampData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTimestampData;
  v2 = -[GEOTimestampData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTimestampData)initWithData:(id)a3
{
  GEOTimestampData *v3;
  GEOTimestampData *v4;
  GEOTimestampData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTimestampData;
  v3 = -[GEOTimestampData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)timestampVal
{
  return self->_timestampVal;
}

- (void)setTimestampVal:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_timestampVal = a3;
}

- (void)setHasTimestampVal:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasTimestampVal
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readTimezone
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
        GEOTimestampDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_6301);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTimezone
{
  -[GEOTimestampData _readTimezone]((uint64_t)self);
  return self->_timezone != 0;
}

- (NSString)timezone
{
  -[GEOTimestampData _readTimezone]((uint64_t)self);
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (BOOL)displayTimezone
{
  return self->_displayTimezone;
}

- (void)setDisplayTimezone:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_displayTimezone = a3;
}

- (void)setHasDisplayTimezone:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDisplayTimezone
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readFormatPattern
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
        GEOTimestampDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormatPattern_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasFormatPattern
{
  -[GEOTimestampData _readFormatPattern]((uint64_t)self);
  return self->_formatPattern != 0;
}

- (NSString)formatPattern
{
  __CFString *formatPattern;

  -[GEOTimestampData _readFormatPattern]((uint64_t)self);
  if (self->_formatPattern)
    formatPattern = (__CFString *)self->_formatPattern;
  else
    formatPattern = CFSTR("jjmm");
  return (NSString *)formatPattern;
}

- (void)setFormatPattern:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_formatPattern, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOTimestampData;
  -[GEOTimestampData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTimestampData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimestampData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
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
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("timestampVal");
    else
      v6 = CFSTR("timestamp_val");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "timezone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("timezone"));

  if ((*(_BYTE *)(a1 + 60) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("displayTimezone");
    else
      v9 = CFSTR("display_timezone");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "formatPattern");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("formatPattern");
    else
      v11 = CFSTR("format_pattern");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

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
      v19[2] = __46__GEOTimestampData__dictionaryRepresentation___block_invoke;
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
  return -[GEOTimestampData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOTimestampData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTimestampData)initWithDictionary:(id)a3
{
  return (GEOTimestampData *)-[GEOTimestampData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("timestampVal");
      else
        v6 = CFSTR("timestamp_val");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTimestampVal:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timezone"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setTimezone:", v9);

      }
      if (a3)
        v10 = CFSTR("displayTimezone");
      else
        v10 = CFSTR("display_timezone");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDisplayTimezone:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("formatPattern");
      else
        v12 = CFSTR("format_pattern");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setFormatPattern:", v14);

      }
    }
  }

  return a1;
}

- (GEOTimestampData)initWithJSON:(id)a3
{
  return (GEOTimestampData *)-[GEOTimestampData _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6316;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6317;
    GEOTimestampDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimestampDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimestampDataReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOTimestampData readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v5 = v8;
    if (self->_timezone)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v8;
    }
    if (self->_formatPattern)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOTimestampData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_timestampVal;
    *((_BYTE *)v5 + 60) |= 1u;
  }
  if (self->_timezone)
  {
    objc_msgSend(v5, "setTimezone:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_displayTimezone;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  if (self->_formatPattern)
  {
    objc_msgSend(v5, "setFormatPattern:");
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
  uint64_t v11;
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
      GEOTimestampDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTimestampData readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_timestampVal;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_displayTimezone;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v11 = -[NSString copyWithZone:](self->_formatPattern, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *timezone;
  char v8;
  NSString *formatPattern;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOTimestampData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 60);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_timestampVal != *((_DWORD *)v4 + 13))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_14;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](timezone, "isEqual:"))
      goto LABEL_14;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((flags & 2) == 0)
  {
    if ((v6 & 2) == 0)
      goto LABEL_20;
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  if ((v6 & 2) == 0)
    goto LABEL_14;
  if (!self->_displayTimezone)
  {
    if (!*((_BYTE *)v4 + 56))
      goto LABEL_20;
    goto LABEL_14;
  }
  if (!*((_BYTE *)v4 + 56))
    goto LABEL_14;
LABEL_20:
  formatPattern = self->_formatPattern;
  if ((unint64_t)formatPattern | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](formatPattern, "isEqual:");
  else
    v8 = 1;
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  -[GEOTimestampData readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_timestampVal;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_timezone, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_displayTimezone;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_formatPattern, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v5 = (unsigned int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[15] & 1) != 0)
  {
    self->_timestampVal = v5[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[GEOTimestampData setTimezone:](self, "setTimezone:");
    v4 = v5;
  }
  if ((v4[15] & 2) != 0)
  {
    self->_displayTimezone = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOTimestampData setFormatPattern:](self, "setFormatPattern:");
    v4 = v5;
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
      GEOTimestampDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6320);
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
    -[GEOTimestampData readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_formatPattern, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)displayTimeZone
{
  _BOOL4 v3;

  v3 = -[GEOTimestampData hasDisplayTimezone](self, "hasDisplayTimezone");
  if (v3)
    LOBYTE(v3) = -[GEOTimestampData displayTimezone](self, "displayTimezone");
  return v3;
}

- (double)timeStamp
{
  return (double)-[GEOTimestampData timestampVal](self, "timestampVal");
}

- (NSTimeZone)timeZone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEOTimestampData timezone](self, "timezone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0C99E80];
    -[GEOTimestampData timezone](self, "timezone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZoneWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSTimeZone *)v6;
}

@end
