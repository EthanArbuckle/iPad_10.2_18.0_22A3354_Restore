@implementation GEORouteAnnotation

- (GEORouteAnnotation)init
{
  GEORouteAnnotation *v2;
  GEORouteAnnotation *v3;
  GEORouteAnnotation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteAnnotation;
  v2 = -[GEORouteAnnotation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteAnnotation)initWithData:(id)a3
{
  GEORouteAnnotation *v3;
  GEORouteAnnotation *v4;
  GEORouteAnnotation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteAnnotation;
  v3 = -[GEORouteAnnotation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)deprecatedOffsetMeters
{
  return self->_deprecatedOffsetMeters;
}

- (void)setDeprecatedOffsetMeters:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_deprecatedOffsetMeters = a3;
}

- (void)setHasDeprecatedOffsetMeters:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDeprecatedOffsetMeters
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readArtwork
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
        GEORouteAnnotationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_4789);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasArtwork
{
  -[GEORouteAnnotation _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEORouteAnnotation _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readInfoCard
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
        GEORouteAnnotationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInfoCard_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasInfoCard
{
  -[GEORouteAnnotation _readInfoCard]((uint64_t)self);
  return self->_infoCard != 0;
}

- (GEOMiniCard)infoCard
{
  -[GEORouteAnnotation _readInfoCard]((uint64_t)self);
  return self->_infoCard;
}

- (void)setInfoCard:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_infoCard, a3);
}

- (float)offsetMeters
{
  return self->_offsetMeters;
}

- (void)setOffsetMeters:(float)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_offsetMeters = a3;
}

- (void)setHasOffsetMeters:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOffsetMeters
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
  v8.super_class = (Class)GEORouteAnnotation;
  -[GEORouteAnnotation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteAnnotation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteAnnotation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  double v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

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
      v6 = CFSTR("deprecatedOffsetMeters");
    else
      v6 = CFSTR("deprecated_offset_meters");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("artwork"));

  }
  objc_msgSend((id)a1, "infoCard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("infoCard");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("info_card");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if ((*(_BYTE *)(a1 + 60) & 2) != 0)
  {
    LODWORD(v14) = *(_DWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("offsetMeters");
    else
      v16 = CFSTR("offset_meters");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __48__GEORouteAnnotation__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteAnnotation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORouteAnnotation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteAnnotation)initWithDictionary:(id)a3
{
  return (GEORouteAnnotation *)-[GEORouteAnnotation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  GEOPBTransitArtwork *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOMiniCard *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("deprecatedOffsetMeters");
      else
        v6 = CFSTR("deprecated_offset_meters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDeprecatedOffsetMeters:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOPBTransitArtwork initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOPBTransitArtwork initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(a1, "setArtwork:", v10);

      }
      if (a3)
        v12 = CFSTR("infoCard");
      else
        v12 = CFSTR("info_card");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOMiniCard alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOMiniCard initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOMiniCard initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setInfoCard:", v15);

      }
      if (a3)
        v17 = CFSTR("offsetMeters");
      else
        v17 = CFSTR("offset_meters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "floatValue");
        objc_msgSend(a1, "setOffsetMeters:");
      }

    }
  }

  return a1;
}

- (GEORouteAnnotation)initWithJSON:(id)a3
{
  return (GEORouteAnnotation *)-[GEORouteAnnotation _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4803;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4804;
    GEORouteAnnotationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPBTransitArtwork readAll:](self->_artwork, "readAll:", 1);
    -[GEOMiniCard readAll:](self->_infoCard, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteAnnotationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteAnnotationReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORouteAnnotationIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORouteAnnotation readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v5 = v8;
    if (self->_artwork)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_infoCard)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORouteAnnotation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_deprecatedOffsetMeters;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  if (self->_artwork)
    objc_msgSend(v4, "setArtwork:");
  if (self->_infoCard)
    objc_msgSend(v4, "setInfoCard:");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = LODWORD(self->_offsetMeters);
    *((_BYTE *)v4 + 60) |= 2u;
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
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORouteAnnotationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteAnnotation readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_deprecatedOffsetMeters;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v9 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOMiniCard copyWithZone:](self->_infoCard, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(float *)(v5 + 56) = self->_offsetMeters;
    *(_BYTE *)(v5 + 60) |= 2u;
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
  GEOPBTransitArtwork *artwork;
  GEOMiniCard *infoCard;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEORouteAnnotation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_deprecatedOffsetMeters != *((_DWORD *)v4 + 13))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 3) && !-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:"))
    goto LABEL_15;
  infoCard = self->_infoCard;
  if ((unint64_t)infoCard | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOMiniCard isEqual:](infoCard, "isEqual:"))
      goto LABEL_15;
  }
  v7 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_offsetMeters != *((float *)v4 + 14))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  float offsetMeters;
  double v8;
  long double v9;
  double v10;

  -[GEORouteAnnotation readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_deprecatedOffsetMeters;
  else
    v3 = 0;
  v4 = -[GEOPBTransitArtwork hash](self->_artwork, "hash");
  v5 = -[GEOMiniCard hash](self->_infoCard, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    offsetMeters = self->_offsetMeters;
    v8 = offsetMeters;
    if (offsetMeters < 0.0)
      v8 = -offsetMeters;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  GEOPBTransitArtwork *artwork;
  uint64_t v6;
  GEOMiniCard *infoCard;
  uint64_t v8;
  unsigned int *v9;

  v9 = (unsigned int *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if ((v9[15] & 1) != 0)
  {
    self->_deprecatedOffsetMeters = v9[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  artwork = self->_artwork;
  v6 = *((_QWORD *)v9 + 3);
  if (artwork)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORouteAnnotation setArtwork:](self, "setArtwork:");
  }
  v4 = v9;
LABEL_9:
  infoCard = self->_infoCard;
  v8 = *((_QWORD *)v4 + 4);
  if (infoCard)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOMiniCard mergeFrom:](infoCard, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEORouteAnnotation setInfoCard:](self, "setInfoCard:");
  }
  v4 = v9;
LABEL_15:
  if ((v4[15] & 2) != 0)
  {
    LODWORD(self->_offsetMeters) = v4[14];
    *(_BYTE *)&self->_flags |= 2u;
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
      GEORouteAnnotationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4807);
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
    -[GEORouteAnnotation readAll:](self, "readAll:", 0);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artwork, "clearUnknownFields:", 1);
    -[GEOMiniCard clearUnknownFields:](self->_infoCard, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoCard, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
