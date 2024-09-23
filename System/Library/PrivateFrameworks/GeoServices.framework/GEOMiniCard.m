@implementation GEOMiniCard

- (GEOMiniCard)init
{
  GEOMiniCard *v2;
  GEOMiniCard *v3;
  GEOMiniCard *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMiniCard;
  v2 = -[GEOMiniCard init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMiniCard)initWithData:(id)a3
{
  GEOMiniCard *v3;
  GEOMiniCard *v4;
  GEOMiniCard *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMiniCard;
  v3 = -[GEOMiniCard initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
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
        GEOMiniCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_3182);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  -[GEOMiniCard _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOMiniCard _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readDetail
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
        GEOMiniCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetail_tags_3183);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDetail
{
  -[GEOMiniCard _readDetail]((uint64_t)self);
  return self->_detail != 0;
}

- (GEOFormattedString)detail
{
  -[GEOMiniCard _readDetail]((uint64_t)self);
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_detail, a3);
}

- (void)_readButtonText
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
        GEOMiniCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButtonText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasButtonText
{
  -[GEOMiniCard _readButtonText]((uint64_t)self);
  return self->_buttonText != 0;
}

- (NSString)buttonText
{
  -[GEOMiniCard _readButtonText]((uint64_t)self);
  return self->_buttonText;
}

- (void)setButtonText:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_buttonText, a3);
}

- (BOOL)shouldEmphasize
{
  return self->_shouldEmphasize;
}

- (void)setShouldEmphasize:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_shouldEmphasize = a3;
}

- (void)setHasShouldEmphasize:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasShouldEmphasize
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readMetadata
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
        GEOMiniCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_3184);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMetadata
{
  -[GEOMiniCard _readMetadata]((uint64_t)self);
  return self->_metadata != 0;
}

- (GEOFormattedString)metadata
{
  -[GEOMiniCard _readMetadata]((uint64_t)self);
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_metadata, a3);
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
  v8.super_class = (Class)GEOMiniCard;
  -[GEOMiniCard description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMiniCard dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMiniCard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("title"));

  }
  objc_msgSend((id)a1, "detail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("detail"));

  }
  objc_msgSend((id)a1, "buttonText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("buttonText");
    else
      v12 = CFSTR("button_text");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("shouldEmphasize");
    else
      v14 = CFSTR("should_emphasize");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("metadata"));

  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __41__GEOMiniCard__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMiniCard _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOMiniCard__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMiniCard)initWithDictionary:(id)a3
{
  return (GEOMiniCard *)-[GEOMiniCard _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOFormattedString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOFormattedString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  GEOFormattedString *v20;
  uint64_t v21;
  void *v22;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOFormattedString initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOFormattedString initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setTitle:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detail"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOFormattedString initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOFormattedString initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setDetail:", v12);

      }
      if (a3)
        v14 = CFSTR("buttonText");
      else
        v14 = CFSTR("button_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setButtonText:", v16);

      }
      if (a3)
        v17 = CFSTR("shouldEmphasize");
      else
        v17 = CFSTR("should_emphasize");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setShouldEmphasize:", objc_msgSend(v18, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOFormattedString initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOFormattedString initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setMetadata:", v21);

      }
    }
  }

  return a1;
}

- (GEOMiniCard)initWithJSON:(id)a3
{
  return (GEOMiniCard *)-[GEOMiniCard _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3193;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3194;
    GEOMiniCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOFormattedString readAll:](self->_title, "readAll:", 1);
    -[GEOFormattedString readAll:](self->_detail, "readAll:", 1);
    -[GEOFormattedString readAll:](self->_metadata, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMiniCardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMiniCardReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOMiniCardIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOMiniCard readAll:](self, "readAll:", 0);
    if (self->_title)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_detail)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_buttonText)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
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
  -[GEOMiniCard readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title)
    objc_msgSend(v5, "setTitle:");
  if (self->_detail)
    objc_msgSend(v5, "setDetail:");
  v4 = v5;
  if (self->_buttonText)
  {
    objc_msgSend(v5, "setButtonText:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v4 + 68) = self->_shouldEmphasize;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    v4 = v5;
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
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

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
      GEOMiniCardReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMiniCard readAll:](self, "readAll:", 0);
  v9 = -[GEOFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOFormattedString copyWithZone:](self->_detail, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_buttonText, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_shouldEmphasize;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v15 = -[GEOFormattedString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *title;
  GEOFormattedString *detail;
  NSString *buttonText;
  char v8;
  GEOFormattedString *metadata;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOMiniCard readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOFormattedString isEqual:](title, "isEqual:"))
      goto LABEL_12;
  }
  detail = self->_detail;
  if ((unint64_t)detail | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOFormattedString isEqual:](detail, "isEqual:"))
      goto LABEL_12;
  }
  buttonText = self->_buttonText;
  if ((unint64_t)buttonText | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](buttonText, "isEqual:"))
      goto LABEL_12;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) != 0)
    {
      if (self->_shouldEmphasize)
      {
        if (*((_BYTE *)v4 + 68))
          goto LABEL_18;
      }
      else if (!*((_BYTE *)v4 + 68))
      {
        goto LABEL_18;
      }
    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
    goto LABEL_12;
LABEL_18:
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 5))
    v8 = -[GEOFormattedString isEqual:](metadata, "isEqual:");
  else
    v8 = 1;
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOMiniCard readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_title, "hash");
  v4 = -[GEOFormattedString hash](self->_detail, "hash");
  v5 = -[NSString hash](self->_buttonText, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_shouldEmphasize;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[GEOFormattedString hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *title;
  uint64_t v6;
  GEOFormattedString *detail;
  uint64_t v8;
  GEOFormattedString *metadata;
  uint64_t v10;
  _QWORD *v11;

  v11 = a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  title = self->_title;
  v6 = v11[6];
  if (title)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOMiniCard setTitle:](self, "setTitle:");
  }
  v4 = v11;
LABEL_7:
  detail = self->_detail;
  v8 = v4[4];
  if (detail)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOMiniCard setDetail:](self, "setDetail:");
  }
  v4 = v11;
LABEL_13:
  if (v4[3])
  {
    -[GEOMiniCard setButtonText:](self, "setButtonText:");
    v4 = v11;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_shouldEmphasize = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_flags |= 1u;
  }
  metadata = self->_metadata;
  v10 = v4[5];
  if (metadata)
  {
    if (v10)
    {
      -[GEOFormattedString mergeFrom:](metadata, "mergeFrom:");
LABEL_22:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[GEOMiniCard setMetadata:](self, "setMetadata:");
    goto LABEL_22;
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
      GEOMiniCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3197);
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
  *(_BYTE *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOMiniCard readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_title, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_detail, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_metadata, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
