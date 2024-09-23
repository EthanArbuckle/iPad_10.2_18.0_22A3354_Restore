@implementation GEORPLayoutField

- (GEORPLayoutField)init
{
  GEORPLayoutField *v2;
  GEORPLayoutField *v3;
  GEORPLayoutField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPLayoutField;
  v2 = -[GEORPLayoutField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPLayoutField)initWithData:(id)a3
{
  GEORPLayoutField *v3;
  GEORPLayoutField *v4;
  GEORPLayoutField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPLayoutField;
  v3 = -[GEORPLayoutField initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  if (a3 < 8)
    return off_1E1C135C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_WORKFLOW")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_POI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_ADDRESS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_OTHER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_GROUNDVIEW")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_INCIDENT_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_POI_IMAGE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPLayoutFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_16);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasName
{
  -[GEORPLayoutField _readName]((uint64_t)self);
  return self->_name != 0;
}

- (GEORPFeedbackLayoutFieldName)name
{
  -[GEORPLayoutField _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readDisplayText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPLayoutFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDisplayText
{
  -[GEORPLayoutField _readDisplayText]((uint64_t)self);
  return self->_displayText != 0;
}

- (NSString)displayText
{
  -[GEORPLayoutField _readDisplayText]((uint64_t)self);
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_displayText, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEnabled
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_ordinal = a3;
}

- (void)setHasOrdinal:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasOrdinal
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
  v8.super_class = (Class)GEORPLayoutField;
  -[GEORPLayoutField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPLayoutField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPLayoutField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  char v12;
  void *v13;
  void *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 56) & 2) != 0)
    {
      v5 = *(int *)(a1 + 48);
      if (v5 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 48));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C135C8[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    objc_msgSend((id)a1, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("name"));

    }
    objc_msgSend((id)a1, "displayText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a2)
        v11 = CFSTR("displayText");
      else
        v11 = CFSTR("display_text");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);
    }

    v12 = *(_BYTE *)(a1 + 56);
    if ((v12 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("enabled"));

      v12 = *(_BYTE *)(a1 + 56);
    }
    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("ordinal"));

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
  return -[GEORPLayoutField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPLayoutField)initWithDictionary:(id)a3
{
  return (GEORPLayoutField *)-[GEORPLayoutField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEORPFeedbackLayoutFieldName *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a2;
  if (!a1)
    goto LABEL_40;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_40;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_WORKFLOW")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_POI")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_ADDRESS")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_OTHER")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_GROUNDVIEW")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_INCIDENT_TYPE")) & 1) != 0)
    {
      v8 = 6;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FIELD_TYPE_POI_IMAGE")))
    {
      v8 = 7;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_24:
    objc_msgSend(a1, "setType:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEORPFeedbackLayoutFieldName alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEORPFeedbackLayoutFieldName initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEORPFeedbackLayoutFieldName initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setName:", v11);

  }
  if (a3)
    v13 = CFSTR("displayText");
  else
    v13 = CFSTR("display_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setDisplayText:", v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnabled:", objc_msgSend(v16, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ordinal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOrdinal:", objc_msgSend(v17, "unsignedIntValue"));

LABEL_40:
  return a1;
}

- (GEORPLayoutField)initWithJSON:(id)a3
{
  return (GEORPLayoutField *)-[GEORPLayoutField _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_345_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_346_0;
    GEORPLayoutFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORPFeedbackLayoutFieldName readAll:](self->_name, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPLayoutFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPLayoutFieldReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORPLayoutField readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_name)
      PBDataWriterWriteSubmessage();
    if (self->_displayText)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint32Field();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEORPLayoutField readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 8) = self->_readerMarkPos;
  *((_DWORD *)v6 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_type;
    *((_BYTE *)v6 + 56) |= 2u;
  }
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    v4 = v6;
  }
  if (self->_displayText)
  {
    objc_msgSend(v6, "setDisplayText:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v4 + 52) = self->_enabled;
    *((_BYTE *)v4 + 56) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_ordinal;
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
  uint64_t v11;
  void *v12;
  char flags;

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
      GEORPLayoutFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPLayoutField readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v9 = -[GEORPFeedbackLayoutFieldName copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_displayText, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_enabled;
    *(_BYTE *)(v5 + 56) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_ordinal;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPFeedbackLayoutFieldName *name;
  NSString *displayText;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEORPLayoutField readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 12))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 3) && !-[GEORPFeedbackLayoutFieldName isEqual:](name, "isEqual:"))
    goto LABEL_23;
  displayText = self->_displayText;
  if ((unint64_t)displayText | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayText, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) != 0)
    {
      if (self->_enabled)
      {
        if (!*((_BYTE *)v4 + 52))
          goto LABEL_23;
        goto LABEL_19;
      }
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_19;
    }
LABEL_23:
    v7 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
    goto LABEL_23;
LABEL_19:
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_ordinal != *((_DWORD *)v4 + 11))
      goto LABEL_23;
    v7 = 1;
  }
LABEL_24:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  -[GEORPLayoutField readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[GEORPFeedbackLayoutFieldName hash](self->_name, "hash");
  v5 = -[NSString hash](self->_displayText, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v6 = 2654435761 * self->_enabled;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v7 = 2654435761 * self->_ordinal;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEORPFeedbackLayoutFieldName *name;
  uint64_t v6;
  char v7;
  int *v8;

  v8 = (int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if ((v8[14] & 2) != 0)
  {
    self->_type = v8[12];
    *(_BYTE *)&self->_flags |= 2u;
  }
  name = self->_name;
  v6 = *((_QWORD *)v8 + 3);
  if (name)
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPFeedbackLayoutFieldName mergeFrom:](name, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPLayoutField setName:](self, "setName:");
  }
  v4 = v8;
LABEL_9:
  if (*((_QWORD *)v4 + 2))
  {
    -[GEORPLayoutField setDisplayText:](self, "setDisplayText:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 4) != 0)
  {
    self->_enabled = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_flags |= 4u;
    v7 = *((_BYTE *)v4 + 56);
  }
  if ((v7 & 1) != 0)
  {
    self->_ordinal = v4[11];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
