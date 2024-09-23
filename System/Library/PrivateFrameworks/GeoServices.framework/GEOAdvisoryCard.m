@implementation GEOAdvisoryCard

- (GEOAdvisoryCard)init
{
  GEOAdvisoryCard *v2;
  GEOAdvisoryCard *v3;
  GEOAdvisoryCard *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoryCard;
  v2 = -[GEOAdvisoryCard init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoryCard)initWithData:(id)a3
{
  GEOAdvisoryCard *v3;
  GEOAdvisoryCard *v4;
  GEOAdvisoryCard *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoryCard;
  v3 = -[GEOAdvisoryCard initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTitle
{
  -[GEOAdvisoryCard _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOAdvisoryCard _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetails_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDetails
{
  -[GEOAdvisoryCard _readDetails]((uint64_t)self);
  return self->_details != 0;
}

- (GEOFormattedString)details
{
  -[GEOAdvisoryCard _readDetails]((uint64_t)self);
  return self->_details;
}

- (void)setDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_details, a3);
}

- (void)_readArtworkOverride
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtworkOverride_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasArtworkOverride
{
  -[GEOAdvisoryCard _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOAdvisoryCard _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMetadata
{
  -[GEOAdvisoryCard _readMetadata]((uint64_t)self);
  return self->_metadata != 0;
}

- (GEOFormattedString)metadata
{
  -[GEOAdvisoryCard _readMetadata]((uint64_t)self);
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)_readTimeString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTimeString
{
  -[GEOAdvisoryCard _readTimeString]((uint64_t)self);
  return self->_timeString != 0;
}

- (GEOFormattedString)timeString
{
  -[GEOAdvisoryCard _readTimeString]((uint64_t)self);
  return self->_timeString;
}

- (void)setTimeString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_timeString, a3);
}

- (void)_readAction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAction
{
  -[GEOAdvisoryCard _readAction]((uint64_t)self);
  return self->_action != 0;
}

- (GEOAdvisoryCardAction)action
{
  -[GEOAdvisoryCard _readAction]((uint64_t)self);
  return self->_action;
}

- (void)setAction:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_action, a3);
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
  v8.super_class = (Class)GEOAdvisoryCard;
  -[GEOAdvisoryCard description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAdvisoryCard dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoryCard _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
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
  objc_msgSend(a1, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("details"));

  }
  objc_msgSend(a1, "artworkOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("artworkOverride");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("artwork_override");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend(a1, "metadata");
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
  objc_msgSend(a1, "timeString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("timeString");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("time_string");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend(a1, "action");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v22, "jsonRepresentation");
    else
      objc_msgSend(v22, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("action"));

  }
  v25 = (void *)a1[2];
  if (v25)
  {
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __45__GEOAdvisoryCard__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

      v27 = v30;
    }
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAdvisoryCard _dictionaryRepresentation:](self, 1);
}

void __45__GEOAdvisoryCard__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAdvisoryCard)initWithDictionary:(id)a3
{
  return (GEOAdvisoryCard *)-[GEOAdvisoryCard _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOPBTransitArtwork *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  GEOFormattedString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOFormattedString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  GEOAdvisoryCardAction *v29;
  uint64_t v30;
  void *v31;

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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("details"));
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
        objc_msgSend(a1, "setDetails:", v12);

      }
      if (a3)
        v14 = CFSTR("artworkOverride");
      else
        v14 = CFSTR("artwork_override");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOPBTransitArtwork initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOPBTransitArtwork initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setArtworkOverride:", v17);

      }
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
      if (a3)
        v23 = CFSTR("timeString");
      else
        v23 = CFSTR("time_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOFormattedString initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOFormattedString initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setTimeString:", v26);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = [GEOAdvisoryCardAction alloc];
        if ((a3 & 1) != 0)
          v30 = -[GEOAdvisoryCardAction initWithJSON:](v29, "initWithJSON:", v28);
        else
          v30 = -[GEOAdvisoryCardAction initWithDictionary:](v29, "initWithDictionary:", v28);
        v31 = (void *)v30;
        objc_msgSend(a1, "setAction:", v30);

      }
    }
  }

  return a1;
}

- (GEOAdvisoryCard)initWithJSON:(id)a3
{
  return (GEOAdvisoryCard *)-[GEOAdvisoryCard _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_237;
    else
      v8 = (int *)&readAll__nonRecursiveTag_238;
    GEOAdvisoryCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOAdvisoryCardCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoryCardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoryCardReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOAdvisoryCardIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOAdvisoryCard readAll:](self, "readAll:", 0);
    if (self->_title)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_details)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_artworkOverride)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_timeString)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_action)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOAdvisoryCard _readAction]((uint64_t)self);
  return -[GEOAdvisoryCardAction hasGreenTeaWithValue:](self->_action, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOAdvisoryCard readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title)
    objc_msgSend(v5, "setTitle:");
  if (self->_details)
    objc_msgSend(v5, "setDetails:");
  v4 = v5;
  if (self->_artworkOverride)
  {
    objc_msgSend(v5, "setArtworkOverride:");
    v4 = v5;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    v4 = v5;
  }
  if (self->_timeString)
  {
    objc_msgSend(v5, "setTimeString:");
    v4 = v5;
  }
  if (self->_action)
  {
    objc_msgSend(v5, "setAction:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAdvisoryCard readAll:](self, "readAll:", 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_details, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[GEOPBTransitArtwork copyWithZone:](self->_artworkOverride, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[GEOFormattedString copyWithZone:](self->_metadata, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    v16 = -[GEOFormattedString copyWithZone:](self->_timeString, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    v18 = -[GEOAdvisoryCardAction copyWithZone:](self->_action, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOAdvisoryCardReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *title;
  GEOFormattedString *details;
  GEOPBTransitArtwork *artworkOverride;
  GEOFormattedString *metadata;
  GEOFormattedString *timeString;
  GEOAdvisoryCardAction *action;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOAdvisoryCard readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         title = self->_title,
         !((unint64_t)title | v4[8]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((details = self->_details, !((unint64_t)details | v4[5]))
     || -[GEOFormattedString isEqual:](details, "isEqual:"))
    && ((artworkOverride = self->_artworkOverride, !((unint64_t)artworkOverride | v4[4]))
     || -[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:"))
    && ((metadata = self->_metadata, !((unint64_t)metadata | v4[6]))
     || -[GEOFormattedString isEqual:](metadata, "isEqual:"))
    && ((timeString = self->_timeString, !((unint64_t)timeString | v4[7]))
     || -[GEOFormattedString isEqual:](timeString, "isEqual:")))
  {
    action = self->_action;
    if ((unint64_t)action | v4[3])
      v11 = -[GEOAdvisoryCardAction isEqual:](action, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOAdvisoryCard readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_title, "hash");
  v4 = -[GEOFormattedString hash](self->_details, "hash") ^ v3;
  v5 = -[GEOPBTransitArtwork hash](self->_artworkOverride, "hash");
  v6 = v4 ^ v5 ^ -[GEOFormattedString hash](self->_metadata, "hash");
  v7 = -[GEOFormattedString hash](self->_timeString, "hash");
  return v6 ^ v7 ^ -[GEOAdvisoryCardAction hash](self->_action, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *title;
  uint64_t v5;
  GEOFormattedString *details;
  uint64_t v7;
  GEOPBTransitArtwork *artworkOverride;
  uint64_t v9;
  GEOFormattedString *metadata;
  uint64_t v11;
  GEOFormattedString *timeString;
  uint64_t v13;
  GEOAdvisoryCardAction *action;
  uint64_t v15;
  _QWORD *v16;

  v16 = a3;
  objc_msgSend(v16, "readAll:", 0);
  title = self->_title;
  v5 = v16[8];
  if (title)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOAdvisoryCard setTitle:](self, "setTitle:");
  }
  details = self->_details;
  v7 = v16[5];
  if (details)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](details, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOAdvisoryCard setDetails:](self, "setDetails:");
  }
  artworkOverride = self->_artworkOverride;
  v9 = v16[4];
  if (artworkOverride)
  {
    if (v9)
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOAdvisoryCard setArtworkOverride:](self, "setArtworkOverride:");
  }
  metadata = self->_metadata;
  v11 = v16[6];
  if (metadata)
  {
    if (v11)
      -[GEOFormattedString mergeFrom:](metadata, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOAdvisoryCard setMetadata:](self, "setMetadata:");
  }
  timeString = self->_timeString;
  v13 = v16[7];
  if (timeString)
  {
    if (v13)
      -[GEOFormattedString mergeFrom:](timeString, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOAdvisoryCard setTimeString:](self, "setTimeString:");
  }
  action = self->_action;
  v15 = v16[3];
  if (action)
  {
    if (v15)
      -[GEOAdvisoryCardAction mergeFrom:](action, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOAdvisoryCard setAction:](self, "setAction:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOAdvisoryCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_241);
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
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAdvisoryCard readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_title, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_details, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artworkOverride, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_metadata, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_timeString, "clearUnknownFields:", 1);
    -[GEOAdvisoryCardAction clearUnknownFields:](self->_action, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
