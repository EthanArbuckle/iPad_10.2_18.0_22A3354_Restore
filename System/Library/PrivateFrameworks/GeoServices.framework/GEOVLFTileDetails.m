@implementation GEOVLFTileDetails

- (BOOL)hasTileId
{
  return self->_tileId != 0;
}

- (GEOVLFUsageTileID)tileId
{
  return self->_tileId;
}

- (void)setTileId:(id)a3
{
  objc_storeStrong((id *)&self->_tileId, a3);
}

- (unsigned)tileSizeBytes
{
  return self->_tileSizeBytes;
}

- (void)setTileSizeBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_tileSizeBytes = a3;
}

- (void)setHasTileSizeBytes:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTileSizeBytes
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
  v8.super_class = (Class)GEOVLFTileDetails;
  -[GEOVLFTileDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFTileDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFTileDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "tileId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("tileId");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("tile_id");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("tileSizeBytes");
      else
        v10 = CFSTR("tile_size_bytes");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

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
  return -[GEOVLFTileDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFTileDetails)initWithDictionary:(id)a3
{
  return (GEOVLFTileDetails *)-[GEOVLFTileDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOVLFUsageTileID *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tileId");
      else
        v6 = CFSTR("tile_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOVLFUsageTileID alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOVLFUsageTileID initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOVLFUsageTileID initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setTileId:", v9);

      }
      if (a3)
        v11 = CFSTR("tileSizeBytes");
      else
        v11 = CFSTR("tile_size_bytes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTileSizeBytes:", objc_msgSend(v12, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOVLFTileDetails)initWithJSON:(id)a3
{
  return (GEOVLFTileDetails *)-[GEOVLFTileDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFTileDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFTileDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tileId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLFTileDetails readAll:](self, "readAll:", 0);
  if (self->_tileId)
    objc_msgSend(v4, "setTileId:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_tileSizeBytes;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOVLFUsageTileID copyWithZone:](self->_tileId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_tileSizeBytes;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOVLFUsageTileID *tileId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOVLFTileDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  tileId = self->_tileId;
  if ((unint64_t)tileId | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOVLFUsageTileID isEqual:](tileId, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_tileSizeBytes == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOVLFTileDetails readAll:](self, "readAll:", 1);
  v3 = -[GEOVLFUsageTileID hash](self->_tileId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_tileSizeBytes;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOVLFUsageTileID *tileId;
  uint64_t v5;
  unsigned int *v6;

  v6 = (unsigned int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  tileId = self->_tileId;
  v5 = *((_QWORD *)v6 + 1);
  if (tileId)
  {
    if (v5)
      -[GEOVLFUsageTileID mergeFrom:](tileId, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOVLFTileDetails setTileId:](self, "setTileId:");
  }
  if ((v6[5] & 1) != 0)
  {
    self->_tileSizeBytes = v6[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileId, 0);
}

@end
