@implementation GEOTransitListTimeInstruction

- (GEOTransitListTimeInstruction)init
{
  GEOTransitListTimeInstruction *v2;
  GEOTransitListTimeInstruction *v3;
  GEOTransitListTimeInstruction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitListTimeInstruction;
  v2 = -[GEOTransitListTimeInstruction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitListTimeInstruction)initWithData:(id)a3
{
  GEOTransitListTimeInstruction *v3;
  GEOTransitListTimeInstruction *v4;
  GEOTransitListTimeInstruction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitListTimeInstruction;
  v3 = -[GEOTransitListTimeInstruction initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPrimaryText
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
        GEOTransitListTimeInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrimaryText_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPrimaryText
{
  -[GEOTransitListTimeInstruction _readPrimaryText]((uint64_t)self);
  return self->_primaryText != 0;
}

- (GEOFormattedString)primaryText
{
  -[GEOTransitListTimeInstruction _readPrimaryText]((uint64_t)self);
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_primaryText, a3);
}

- (void)_readSecondaryText
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
        GEOTransitListTimeInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryText_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSecondaryText
{
  -[GEOTransitListTimeInstruction _readSecondaryText]((uint64_t)self);
  return self->_secondaryText != 0;
}

- (GEOFormattedString)secondaryText
{
  -[GEOTransitListTimeInstruction _readSecondaryText]((uint64_t)self);
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_secondaryText, a3);
}

- (BOOL)hideWhenListCollapsed
{
  return self->_hideWhenListCollapsed;
}

- (void)setHideWhenListCollapsed:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_hideWhenListCollapsed = a3;
}

- (void)setHasHideWhenListCollapsed:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasHideWhenListCollapsed
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOTransitListTimeInstruction;
  -[GEOTransitListTimeInstruction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitListTimeInstruction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitListTimeInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "primaryText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("primaryText");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("primary_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "secondaryText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("secondaryText");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("secondary_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("hideWhenListCollapsed");
    else
      v14 = CFSTR("hide_when_list_collapsed");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __59__GEOTransitListTimeInstruction__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitListTimeInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOTransitListTimeInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitListTimeInstruction)initWithDictionary:(id)a3
{
  return (GEOTransitListTimeInstruction *)-[GEOTransitListTimeInstruction _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOFormattedString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOFormattedString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("primaryText");
      else
        v6 = CFSTR("primary_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOFormattedString initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOFormattedString initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPrimaryText:", v9);

      }
      if (a3)
        v11 = CFSTR("secondaryText");
      else
        v11 = CFSTR("secondary_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOFormattedString initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOFormattedString initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setSecondaryText:", v14);

      }
      if (a3)
        v16 = CFSTR("hideWhenListCollapsed");
      else
        v16 = CFSTR("hide_when_list_collapsed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHideWhenListCollapsed:", objc_msgSend(v17, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOTransitListTimeInstruction)initWithJSON:(id)a3
{
  return (GEOTransitListTimeInstruction *)-[GEOTransitListTimeInstruction _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6893;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6894;
    GEOTransitListTimeInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOFormattedString readAll:](self->_primaryText, "readAll:", 1);
    -[GEOFormattedString readAll:](self->_secondaryText, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitListTimeInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitListTimeInstructionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitListTimeInstructionIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitListTimeInstruction readAll:](self, "readAll:", 0);
    if (self->_primaryText)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_secondaryText)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOTransitListTimeInstruction readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_primaryText)
    objc_msgSend(v4, "setPrimaryText:");
  if (self->_secondaryText)
    objc_msgSend(v4, "setSecondaryText:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v4 + 52) = self->_hideWhenListCollapsed;
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
      GEOTransitListTimeInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitListTimeInstruction readAll:](self, "readAll:", 0);
  v9 = -[GEOFormattedString copyWithZone:](self->_primaryText, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOFormattedString copyWithZone:](self->_secondaryText, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_hideWhenListCollapsed;
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
  GEOFormattedString *primaryText;
  GEOFormattedString *secondaryText;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOTransitListTimeInstruction readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  primaryText = self->_primaryText;
  if ((unint64_t)primaryText | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOFormattedString isEqual:](primaryText, "isEqual:"))
      goto LABEL_8;
  }
  secondaryText = self->_secondaryText;
  if ((unint64_t)secondaryText | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOFormattedString isEqual:](secondaryText, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_hideWhenListCollapsed)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOTransitListTimeInstruction readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_primaryText, "hash");
  v4 = -[GEOFormattedString hash](self->_secondaryText, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_hideWhenListCollapsed;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *primaryText;
  uint64_t v6;
  GEOFormattedString *secondaryText;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  primaryText = self->_primaryText;
  v6 = v9[3];
  if (primaryText)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOFormattedString mergeFrom:](primaryText, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOTransitListTimeInstruction setPrimaryText:](self, "setPrimaryText:");
  }
  v4 = v9;
LABEL_7:
  secondaryText = self->_secondaryText;
  v8 = v4[4];
  if (secondaryText)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOFormattedString mergeFrom:](secondaryText, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOTransitListTimeInstruction setSecondaryText:](self, "setSecondaryText:");
  }
  v4 = v9;
LABEL_13:
  if ((v4[7] & 1) != 0)
  {
    self->_hideWhenListCollapsed = *((_BYTE *)v4 + 52);
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
      GEOTransitListTimeInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6897);
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
    -[GEOTransitListTimeInstruction readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_primaryText, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_secondaryText, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  return -[GEOTransitListTimeInstruction hasPrimaryText](self, "hasPrimaryText")
      || -[GEOTransitListTimeInstruction hasSecondaryText](self, "hasSecondaryText");
}

- (void)_transit_mergeFrom:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  -[GEOTransitListTimeInstruction primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "primaryText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (!v7)
  {
    v11 = v6;
    goto LABEL_19;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v8 = (id)_MergedGlobals_219;
  v9 = v7;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v9, "conformsToProtocol:", _MergedGlobals_219))
  {
    v10 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if ((v10 & 1) != 0)
    {
LABEL_14:
      if (objc_msgSend(v9, "conformsToProtocol:", v8)
        && objc_msgSend(v6, "conformsToProtocol:", v8))
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        v9 = v6;
      }
      v11 = v9;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_14;
    }
    objc_msgSend(v9, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      goto LABEL_14;
  }
  v11 = 0;
LABEL_18:

LABEL_19:
  -[GEOTransitListTimeInstruction setPrimaryText:](self, "setPrimaryText:", v11);

  -[GEOTransitListTimeInstruction secondaryText](self, "secondaryText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "secondaryText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = v15;
  if (v17)
  {
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    v18 = (id)_MergedGlobals_219;
    v19 = v17;
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    if (objc_msgSend(v19, "conformsToProtocol:", _MergedGlobals_219))
    {
      v20 = objc_msgSend(v19, "_transit_hasAnyFieldSet");

      if ((v20 & 1) != 0)
      {
LABEL_32:
        if (objc_msgSend(v19, "conformsToProtocol:", v18)
          && objc_msgSend(v16, "conformsToProtocol:", v18))
        {
          objc_msgSend(v16, "_transit_mergeFrom:", v19);
          v19 = v16;
        }
        v21 = v19;
        goto LABEL_36;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_32;
      }
      objc_msgSend(v19, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
        goto LABEL_32;
    }
    v21 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v21 = v16;
LABEL_37:

  -[GEOTransitListTimeInstruction setSecondaryText:](self, "setSecondaryText:", v21);
}

@end
