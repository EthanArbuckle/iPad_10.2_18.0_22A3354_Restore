@implementation GEORPCorrectedField

- (GEORPCorrectedField)init
{
  GEORPCorrectedField *v2;
  GEORPCorrectedField *v3;
  GEORPCorrectedField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedField;
  v2 = -[GEORPCorrectedField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedField)initWithData:(id)a3
{
  GEORPCorrectedField *v3;
  GEORPCorrectedField *v4;
  GEORPCorrectedField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedField;
  v3 = -[GEORPCorrectedField initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)field
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_field;
  else
    return 0;
}

- (void)setField:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_field = a3;
}

- (void)setHasField:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasField
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)fieldAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E1C0EAA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsField:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_NAME")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_PHONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_HOURS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_URL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_CATEGORY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_STREET")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_CITY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_STATE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_ZIP")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_COUNTRY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_SUBPREMISE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_SUBLOCALITY")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readFieldName
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
        GEORPCorrectedFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFieldName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasFieldName
{
  -[GEORPCorrectedField _readFieldName]((uint64_t)self);
  return self->_fieldName != 0;
}

- (NSString)fieldName
{
  -[GEORPCorrectedField _readFieldName]((uint64_t)self);
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (void)_readOriginalValue
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
        GEORPCorrectedFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalValue_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOriginalValue
{
  -[GEORPCorrectedField _readOriginalValue]((uint64_t)self);
  return self->_originalValue != 0;
}

- (NSString)originalValue
{
  -[GEORPCorrectedField _readOriginalValue]((uint64_t)self);
  return self->_originalValue;
}

- (void)setOriginalValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_originalValue, a3);
}

- (void)_readCorrectedValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedValue_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCorrectedValue
{
  -[GEORPCorrectedField _readCorrectedValue]((uint64_t)self);
  return self->_correctedValue != 0;
}

- (NSString)correctedValue
{
  -[GEORPCorrectedField _readCorrectedValue]((uint64_t)self);
  return self->_correctedValue;
}

- (void)setCorrectedValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_correctedValue, a3);
}

- (BOOL)isMarkedIncorrect
{
  return self->_isMarkedIncorrect;
}

- (void)setIsMarkedIncorrect:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_isMarkedIncorrect = a3;
}

- (void)setHasIsMarkedIncorrect:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsMarkedIncorrect
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEORPCorrectedField;
  -[GEORPCorrectedField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCorrectedField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 60) & 1) != 0)
    {
      v5 = *(int *)(a1 + 52);
      if (v5 >= 0xC)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0EAA8[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("field"));

    }
    objc_msgSend((id)a1, "fieldName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("fieldName");
      else
        v8 = CFSTR("field_name");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend((id)a1, "originalValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("originalValue");
      else
        v10 = CFSTR("original_value");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    objc_msgSend((id)a1, "correctedValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a2)
        v12 = CFSTR("correctedValue");
      else
        v12 = CFSTR("corrected_value");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
    }

    if ((*(_BYTE *)(a1 + 60) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v14 = CFSTR("isMarkedIncorrect");
      else
        v14 = CFSTR("is_marked_incorrect");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

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
  return -[GEORPCorrectedField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedField)initWithDictionary:(id)a3
{
  return (GEORPCorrectedField *)-[GEORPCorrectedField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v5 = a2;
  if (!a1)
    goto LABEL_54;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_54;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("field"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_NAME")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_PHONE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_HOURS")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_URL")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_CATEGORY")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_STREET")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_CITY")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_STATE")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_ZIP")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_COUNTRY")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_SUBPREMISE")) & 1) != 0)
    {
      v8 = 10;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_TYPE_SUBLOCALITY")))
    {
      v8 = 11;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_32:
    objc_msgSend(a1, "setField:", v8);
  }

  if (a3)
    v9 = CFSTR("fieldName");
  else
    v9 = CFSTR("field_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setFieldName:", v11);

  }
  if (a3)
    v12 = CFSTR("originalValue");
  else
    v12 = CFSTR("original_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(a1, "setOriginalValue:", v14);

  }
  if (a3)
    v15 = CFSTR("correctedValue");
  else
    v15 = CFSTR("corrected_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(a1, "setCorrectedValue:", v17);

  }
  if (a3)
    v18 = CFSTR("isMarkedIncorrect");
  else
    v18 = CFSTR("is_marked_incorrect");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsMarkedIncorrect:", objc_msgSend(v19, "BOOLValue"));

LABEL_54:
  return a1;
}

- (GEORPCorrectedField)initWithJSON:(id)a3
{
  return (GEORPCorrectedField *)-[GEORPCorrectedField _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_275_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_276_0;
    GEORPCorrectedFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedFieldReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
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
    -[GEORPCorrectedField readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_fieldName)
      PBDataWriterWriteStringField();
    if (self->_originalValue)
      PBDataWriterWriteStringField();
    if (self->_correctedValue)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPCorrectedField readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_field;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  if (self->_fieldName)
    objc_msgSend(v4, "setFieldName:");
  if (self->_originalValue)
    objc_msgSend(v4, "setOriginalValue:");
  if (self->_correctedValue)
    objc_msgSend(v4, "setCorrectedValue:");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_isMarkedIncorrect;
    *((_BYTE *)v4 + 60) |= 2u;
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
  uint64_t v13;
  void *v14;

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
      GEORPCorrectedFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPCorrectedField readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_field;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_fieldName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_originalValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_correctedValue, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_isMarkedIncorrect;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *fieldName;
  NSString *originalValue;
  NSString *correctedValue;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEORPCorrectedField readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_field != *((_DWORD *)v4 + 13))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_15;
  }
  fieldName = self->_fieldName;
  if ((unint64_t)fieldName | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](fieldName, "isEqual:"))
    goto LABEL_15;
  originalValue = self->_originalValue;
  if ((unint64_t)originalValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](originalValue, "isEqual:"))
      goto LABEL_15;
  }
  correctedValue = self->_correctedValue;
  if ((unint64_t)correctedValue | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](correctedValue, "isEqual:"))
      goto LABEL_15;
  }
  v8 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
    {
LABEL_15:
      v8 = 0;
      goto LABEL_16;
    }
    if (self->_isMarkedIncorrect)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_15;
    }
    v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  -[GEORPCorrectedField readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_field;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_fieldName, "hash");
  v5 = -[NSString hash](self->_originalValue, "hash");
  v6 = -[NSString hash](self->_correctedValue, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v7 = 2654435761 * self->_isMarkedIncorrect;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[15] & 1) != 0)
  {
    self->_field = v5[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 3))
  {
    -[GEORPCorrectedField setFieldName:](self, "setFieldName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[GEORPCorrectedField setOriginalValue:](self, "setOriginalValue:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[GEORPCorrectedField setCorrectedValue:](self, "setCorrectedValue:");
    v4 = v5;
  }
  if ((v4[15] & 2) != 0)
  {
    self->_isMarkedIncorrect = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_correctedValue, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
