@implementation GEORPDirectionsFeedback

- (GEORPDirectionsFeedback)init
{
  GEORPDirectionsFeedback *v2;
  GEORPDirectionsFeedback *v3;
  GEORPDirectionsFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsFeedback;
  v2 = -[GEORPDirectionsFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsFeedback)initWithData:(id)a3
{
  GEORPDirectionsFeedback *v3;
  GEORPDirectionsFeedback *v4;
  GEORPDirectionsFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsFeedback;
  v3 = -[GEORPDirectionsFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsContext
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
        GEORPDirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDirectionsContext
{
  -[GEORPDirectionsFeedback _readDirectionsContext]((uint64_t)self);
  return self->_directionsContext != 0;
}

- (GEORPDirectionsFeedbackContext)directionsContext
{
  -[GEORPDirectionsFeedback _readDirectionsContext]((uint64_t)self);
  return self->_directionsContext;
}

- (void)setDirectionsContext:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_directionsContext, a3);
}

- (void)_readDirectionsCorrections
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
        GEORPDirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDirectionsCorrections
{
  -[GEORPDirectionsFeedback _readDirectionsCorrections]((uint64_t)self);
  return self->_directionsCorrections != 0;
}

- (GEORPDirectionsCorrections)directionsCorrections
{
  -[GEORPDirectionsFeedback _readDirectionsCorrections]((uint64_t)self);
  return self->_directionsCorrections;
}

- (void)setDirectionsCorrections:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_directionsCorrections, a3);
}

- (int)correctionType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_correctionType;
  else
    return 0;
}

- (void)setCorrectionType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasCorrectionType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C03890[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_INSTRUCTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_ARRIVAL_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_OTHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_ROUTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_ETA")))
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
  v8.super_class = (Class)GEORPDirectionsFeedback;
  -[GEORPDirectionsFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDirectionsFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "directionsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("directionsContext");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("directions_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "directionsCorrections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("directionsCorrections");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("directions_corrections");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v13 = *(int *)(a1 + 52);
    if (v13 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C03890[v13];
    }
    if (a2)
      v15 = CFSTR("correctionType");
    else
      v15 = CFSTR("correction_type");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __53__GEORPDirectionsFeedback__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEORPDirectionsFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPDirectionsFeedback)initWithDictionary:(id)a3
{
  return (GEORPDirectionsFeedback *)-[GEORPDirectionsFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPDirectionsFeedbackContext *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPDirectionsCorrections *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("directionsContext");
      else
        v6 = CFSTR("directions_context");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPDirectionsFeedbackContext alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPDirectionsFeedbackContext initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPDirectionsFeedbackContext initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setDirectionsContext:", v9);

      }
      if (a3)
        v11 = CFSTR("directionsCorrections");
      else
        v11 = CFSTR("directions_corrections");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORPDirectionsCorrections alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORPDirectionsCorrections initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORPDirectionsCorrections initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setDirectionsCorrections:", v14);

      }
      if (a3)
        v16 = CFSTR("correctionType");
      else
        v16 = CFSTR("correction_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
        {
          v19 = 0;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_INSTRUCTION")) & 1) != 0)
        {
          v19 = 1;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_ARRIVAL_ENTRY_POINT")) & 1) != 0)
        {
          v19 = 2;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_OTHER")) & 1) != 0)
        {
          v19 = 3;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_ROUTE")) & 1) != 0)
        {
          v19 = 4;
        }
        else if (objc_msgSend(v18, "isEqualToString:", CFSTR("DIRECTIONS_CORRECTION_TYPE_ETA")))
        {
          v19 = 5;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_40:

          goto LABEL_41;
        }
        v19 = objc_msgSend(v17, "intValue");
      }
      objc_msgSend(a1, "setCorrectionType:", v19);
      goto LABEL_40;
    }
  }
LABEL_41:

  return a1;
}

- (GEORPDirectionsFeedback)initWithJSON:(id)a3
{
  return (GEORPDirectionsFeedback *)-[GEORPDirectionsFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_626;
    else
      v8 = (int *)&readAll__nonRecursiveTag_627;
    GEORPDirectionsFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPDirectionsFeedbackContext readAll:](self->_directionsContext, "readAll:", 1);
    -[GEORPDirectionsCorrections readAll:](self->_directionsCorrections, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsFeedbackReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPDirectionsFeedbackIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPDirectionsFeedback readAll:](self, "readAll:", 0);
    if (self->_directionsContext)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_directionsCorrections)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPDirectionsFeedbackClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPDirectionsFeedback _readDirectionsContext]((uint64_t)self);
  if (-[GEORPDirectionsFeedbackContext hasGreenTeaWithValue:](self->_directionsContext, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPDirectionsFeedback _readDirectionsCorrections]((uint64_t)self);
  return -[GEORPDirectionsCorrections hasGreenTeaWithValue:](self->_directionsCorrections, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPDirectionsFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsContext)
    objc_msgSend(v4, "setDirectionsContext:");
  if (self->_directionsCorrections)
    objc_msgSend(v4, "setDirectionsCorrections:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_correctionType;
    *((_BYTE *)v4 + 56) |= 1u;
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
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPDirectionsFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPDirectionsFeedback readAll:](self, "readAll:", 0);
  v9 = -[GEORPDirectionsFeedbackContext copyWithZone:](self->_directionsContext, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEORPDirectionsCorrections copyWithZone:](self->_directionsCorrections, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_correctionType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPDirectionsFeedbackContext *directionsContext;
  GEORPDirectionsCorrections *directionsCorrections;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEORPDirectionsFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionsContext = self->_directionsContext;
  if ((unint64_t)directionsContext | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPDirectionsFeedbackContext isEqual:](directionsContext, "isEqual:"))
      goto LABEL_10;
  }
  directionsCorrections = self->_directionsCorrections;
  if ((unint64_t)directionsCorrections | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPDirectionsCorrections isEqual:](directionsCorrections, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_correctionType == *((_DWORD *)v4 + 13))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEORPDirectionsFeedback readAll:](self, "readAll:", 1);
  v3 = -[GEORPDirectionsFeedbackContext hash](self->_directionsContext, "hash");
  v4 = -[GEORPDirectionsCorrections hash](self->_directionsCorrections, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_correctionType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPDirectionsFeedbackContext *directionsContext;
  uint64_t v6;
  GEORPDirectionsCorrections *directionsCorrections;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  directionsContext = self->_directionsContext;
  v6 = v9[3];
  if (directionsContext)
  {
    if (!v6)
      goto LABEL_7;
    -[GEORPDirectionsFeedbackContext mergeFrom:](directionsContext, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEORPDirectionsFeedback setDirectionsContext:](self, "setDirectionsContext:");
  }
  v4 = v9;
LABEL_7:
  directionsCorrections = self->_directionsCorrections;
  v8 = v4[4];
  if (directionsCorrections)
  {
    if (!v8)
      goto LABEL_13;
    -[GEORPDirectionsCorrections mergeFrom:](directionsCorrections, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEORPDirectionsFeedback setDirectionsCorrections:](self, "setDirectionsCorrections:");
  }
  v4 = v9;
LABEL_13:
  if ((v4[7] & 1) != 0)
  {
    self->_correctionType = *((_DWORD *)v4 + 13);
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
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPDirectionsFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_630);
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
  *(_BYTE *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPDirectionsFeedback readAll:](self, "readAll:", 0);
    -[GEORPDirectionsFeedbackContext clearUnknownFields:](self->_directionsContext, "clearUnknownFields:", 1);
    -[GEORPDirectionsCorrections clearUnknownFields:](self->_directionsCorrections, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsCorrections, 0);
  objc_storeStrong((id *)&self->_directionsContext, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
