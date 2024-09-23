@implementation GEOCompanionTransitAlightMessage

- (GEOCompanionTransitAlightMessage)init
{
  GEOCompanionTransitAlightMessage *v2;
  GEOCompanionTransitAlightMessage *v3;
  GEOCompanionTransitAlightMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionTransitAlightMessage;
  v2 = -[GEOCompanionTransitAlightMessage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionTransitAlightMessage)initWithData:(id)a3
{
  GEOCompanionTransitAlightMessage *v3;
  GEOCompanionTransitAlightMessage *v4;
  GEOCompanionTransitAlightMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionTransitAlightMessage;
  v3 = -[GEOCompanionTransitAlightMessage initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOCompanionTransitAlightMessage _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOCompanionTransitAlightMessage _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasStepID
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)stopID
{
  return self->_stopID;
}

- (void)setStopID:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_stopID = a3;
}

- (void)setHasStopID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStopID
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasArtwork
{
  -[GEOCompanionTransitAlightMessage _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOCompanionTransitAlightMessage _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readTitle
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
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTitle
{
  -[GEOCompanionTransitAlightMessage _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOCompanionTransitAlightMessage _readTitle]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetail_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDetail
{
  -[GEOCompanionTransitAlightMessage _readDetail]((uint64_t)self);
  return self->_detail != 0;
}

- (GEOFormattedString)detail
{
  -[GEOCompanionTransitAlightMessage _readDetail]((uint64_t)self);
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_detail, a3);
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
  v8.super_class = (Class)GEOCompanionTransitAlightMessage;
  -[GEOCompanionTransitAlightMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionTransitAlightMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionTransitAlightMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

    v6 = *(_BYTE *)(a1 + 68);
    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("stepID"));

      v6 = *(_BYTE *)(a1 + 68);
    }
    if ((v6 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("stopID"));

    }
    objc_msgSend((id)a1, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v9, "jsonRepresentation");
      else
        objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("artwork"));

    }
    objc_msgSend((id)a1, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v12, "jsonRepresentation");
      else
        objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("title"));

    }
    objc_msgSend((id)a1, "detail");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v15, "jsonRepresentation");
      else
        objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("detail"));

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
  return -[GEOCompanionTransitAlightMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionTransitAlightMessage)initWithDictionary:(id)a3
{
  return (GEOCompanionTransitAlightMessage *)-[GEOCompanionTransitAlightMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOPBTransitArtwork *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOFormattedString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  GEOFormattedString *v19;
  uint64_t v20;
  void *v21;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setIdentifier:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStepID:", objc_msgSend(v8, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stopID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStopID:", objc_msgSend(v9, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOPBTransitArtwork initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOPBTransitArtwork initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setArtwork:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOFormattedString initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOFormattedString initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setTitle:", v16);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detail"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOFormattedString initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOFormattedString initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setDetail:", v20);

      }
    }
  }

  return a1;
}

- (GEOCompanionTransitAlightMessage)initWithJSON:(id)a3
{
  return (GEOCompanionTransitAlightMessage *)-[GEOCompanionTransitAlightMessage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1044;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1045;
    GEOCompanionTransitAlightMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPBTransitArtwork readAll:](self->_artwork, "readAll:", 1);
    -[GEOFormattedString readAll:](self->_title, "readAll:", 1);
    -[GEOFormattedString readAll:](self->_detail, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionTransitAlightMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionTransitAlightMessageReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOCompanionTransitAlightMessageIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOCompanionTransitAlightMessage readAll:](self, "readAll:", 0);
    if (self->_identifier)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_artwork)
      PBDataWriterWriteSubmessage();
    if (self->_title)
      PBDataWriterWriteSubmessage();
    if (self->_detail)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOCompanionTransitAlightMessage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v6, "setIdentifier:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_stepID;
    *((_BYTE *)v6 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_stopID;
    *((_BYTE *)v6 + 68) |= 2u;
  }
  if (self->_artwork)
  {
    objc_msgSend(v6, "setArtwork:");
    v5 = v6;
  }
  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    v5 = v6;
  }
  if (self->_detail)
  {
    objc_msgSend(v6, "setDetail:");
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
  void *v13;
  id v14;
  void *v15;
  id v16;

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
      GEOCompanionTransitAlightMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionTransitAlightMessage readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_stepID;
    *(_BYTE *)(v5 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_stopID;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v12 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[GEOFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[GEOFormattedString copyWithZone:](self->_detail, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  GEOPBTransitArtwork *artwork;
  GEOFormattedString *title;
  GEOFormattedString *detail;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOCompanionTransitAlightMessage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_stepID != *((_DWORD *)v4 + 15))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_stopID != *((_DWORD *)v4 + 16))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_20;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 2) && !-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:"))
    goto LABEL_20;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOFormattedString isEqual:](title, "isEqual:"))
      goto LABEL_20;
  }
  detail = self->_detail;
  if ((unint64_t)detail | *((_QWORD *)v4 + 3))
    v9 = -[GEOFormattedString isEqual:](detail, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOCompanionTransitAlightMessage readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_stepID;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_stopID;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[GEOPBTransitArtwork hash](self->_artwork, "hash");
  v7 = -[GEOFormattedString hash](self->_title, "hash");
  return v6 ^ v7 ^ -[GEOFormattedString hash](self->_detail, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOPBTransitArtwork *artwork;
  uint64_t v7;
  GEOFormattedString *title;
  uint64_t v9;
  GEOFormattedString *detail;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  if (v12[4])
  {
    -[GEOCompanionTransitAlightMessage setIdentifier:](self, "setIdentifier:");
    v4 = v12;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_stepID = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_stopID = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 2u;
  }
  artwork = self->_artwork;
  v7 = v4[2];
  if (artwork)
  {
    if (!v7)
      goto LABEL_13;
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[GEOCompanionTransitAlightMessage setArtwork:](self, "setArtwork:");
  }
  v4 = v12;
LABEL_13:
  title = self->_title;
  v9 = v4[5];
  if (title)
  {
    if (!v9)
      goto LABEL_19;
    -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[GEOCompanionTransitAlightMessage setTitle:](self, "setTitle:");
  }
  v4 = v12;
LABEL_19:
  detail = self->_detail;
  v11 = v4[3];
  if (detail)
  {
    if (v11)
    {
      -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
LABEL_24:
      v4 = v12;
    }
  }
  else if (v11)
  {
    -[GEOCompanionTransitAlightMessage setDetail:](self, "setDetail:");
    goto LABEL_24;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
