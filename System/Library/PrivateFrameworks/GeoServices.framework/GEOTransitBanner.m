@implementation GEOTransitBanner

- (GEOTransitBanner)init
{
  GEOTransitBanner *v2;
  GEOTransitBanner *v3;
  GEOTransitBanner *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBanner;
  v2 = -[GEOTransitBanner init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBanner)initWithData:(id)a3
{
  GEOTransitBanner *v3;
  GEOTransitBanner *v4;
  GEOTransitBanner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBanner;
  v3 = -[GEOTransitBanner initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBannerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrimaryText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPrimaryText
{
  -[GEOTransitBanner _readPrimaryText]((uint64_t)self);
  return self->_primaryText != 0;
}

- (GEOFormattedString)primaryText
{
  -[GEOTransitBanner _readPrimaryText]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBannerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSecondaryText
{
  -[GEOTransitBanner _readSecondaryText]((uint64_t)self);
  return self->_secondaryText != 0;
}

- (GEOFormattedString)secondaryText
{
  -[GEOTransitBanner _readSecondaryText]((uint64_t)self);
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_secondaryText, a3);
}

- (void)_readArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBannerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasArtwork
{
  -[GEOTransitBanner _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOTransitBanner _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_artwork, a3);
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
  v8.super_class = (Class)GEOTransitBanner;
  -[GEOTransitBanner description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitBanner dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBanner _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
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
  void *v14;
  void *v15;
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
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "primaryText");
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
  objc_msgSend(a1, "secondaryText");
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
  objc_msgSend(a1, "artwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("artwork"));

  }
  v16 = (void *)a1[2];
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
      v23[2] = __46__GEOTransitBanner__dictionaryRepresentation___block_invoke;
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
  return -[GEOTransitBanner _dictionaryRepresentation:](self, 1);
}

void __46__GEOTransitBanner__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitBanner)initWithDictionary:(id)a3
{
  return (GEOTransitBanner *)-[GEOTransitBanner _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v16;
  GEOPBTransitArtwork *v17;
  uint64_t v18;
  void *v19;

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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOPBTransitArtwork initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOPBTransitArtwork initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setArtwork:", v18);

      }
    }
  }

  return a1;
}

- (GEOTransitBanner)initWithJSON:(id)a3
{
  return (GEOTransitBanner *)-[GEOTransitBanner _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6;
    GEOTransitBannerReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOFormattedString readAll:](self->_primaryText, "readAll:", 1);
    -[GEOFormattedString readAll:](self->_secondaryText, "readAll:", 1);
    -[GEOPBTransitArtwork readAll:](self->_artwork, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBannerIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBannerReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitBannerIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitBanner readAll:](self, "readAll:", 0);
    if (self->_primaryText)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_secondaryText)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_artwork)
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
  -[GEOTransitBanner readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_primaryText)
    objc_msgSend(v5, "setPrimaryText:");
  if (self->_secondaryText)
    objc_msgSend(v5, "setSecondaryText:");
  v4 = v5;
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitBanner readAll:](self, "readAll:", 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_primaryText, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_secondaryText, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOTransitBannerReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *primaryText;
  GEOFormattedString *secondaryText;
  GEOPBTransitArtwork *artwork;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTransitBanner readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         primaryText = self->_primaryText,
         !((unint64_t)primaryText | v4[4]))
     || -[GEOFormattedString isEqual:](primaryText, "isEqual:"))
    && ((secondaryText = self->_secondaryText, !((unint64_t)secondaryText | v4[5]))
     || -[GEOFormattedString isEqual:](secondaryText, "isEqual:")))
  {
    artwork = self->_artwork;
    if ((unint64_t)artwork | v4[3])
      v8 = -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  -[GEOTransitBanner readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_primaryText, "hash");
  v4 = -[GEOFormattedString hash](self->_secondaryText, "hash") ^ v3;
  return v4 ^ -[GEOPBTransitArtwork hash](self->_artwork, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *primaryText;
  uint64_t v5;
  GEOFormattedString *secondaryText;
  uint64_t v7;
  GEOPBTransitArtwork *artwork;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  primaryText = self->_primaryText;
  v5 = v10[4];
  if (primaryText)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](primaryText, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOTransitBanner setPrimaryText:](self, "setPrimaryText:");
  }
  secondaryText = self->_secondaryText;
  v7 = v10[5];
  if (secondaryText)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](secondaryText, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOTransitBanner setSecondaryText:](self, "setSecondaryText:");
  }
  artwork = self->_artwork;
  v9 = v10[3];
  if (artwork)
  {
    if (v9)
      -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOTransitBanner setArtwork:](self, "setArtwork:");
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
      GEOTransitBannerReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_0);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitBanner readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_primaryText, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_secondaryText, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artwork, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
