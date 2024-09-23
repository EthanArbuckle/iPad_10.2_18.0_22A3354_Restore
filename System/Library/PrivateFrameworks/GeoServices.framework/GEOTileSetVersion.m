@implementation GEOTileSetVersion

- (GEOTileSetVersion)init
{
  GEOTileSetVersion *v2;
  GEOTileSetVersion *v3;
  GEOTileSetVersion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTileSetVersion;
  v2 = -[GEOTileSetVersion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileSetVersion)initWithData:(id)a3
{
  GEOTileSetVersion *v3;
  GEOTileSetVersion *v4;
  GEOTileSetVersion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTileSetVersion;
  v3 = -[GEOTileSetVersion initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)&self->_flags |= 8u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_BYTE *)&self->_flags |= 0x20u;
    self->_availableTilesSpace = 0;
    self->_availableTilesCount = 0;
    free(self->_availableTiles);
    self->_availableTiles = 0;
    os_unfair_lock_lock_with_options();
    *(_BYTE *)&self->_flags |= 0x10u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_BYTE *)&self->_flags |= 0x20u;
    self->_genericTilesSpace = 0;
    self->_genericTilesCount = 0;
    free(self->_genericTiles);
    self->_genericTiles = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOTileSetVersion;
  -[GEOTileSetVersion dealloc](&v3, sel_dealloc);
}

- (void)_readAvailableTiles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetVersionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAvailableTiles_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (uint64_t)_reserveAvailableTiles:(uint64_t)result
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 32);
    v4 = v3 + a2;
    if (v3 + a2 <= v3)
      return 0;
    v5 = *(_QWORD *)(result + 40);
    if (v5 >= v4)
      return 1;
    v6 = v5 + a2;
    if (v5 + a2)
    {
      v7 = 1;
      while (1)
      {
        v8 = v7;
        if (v7 >= v6)
          break;
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    if (v8 < a2)
      return 0;
LABEL_11:
    if (24 * v8 < v8)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 24 * v8, 0x7B08A0EDuLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 24 * v2[4]), 24 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (void)_readGenericTiles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetVersionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGenericTiles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (uint64_t)_reserveGenericTiles:(uint64_t)result
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 56);
    v4 = v3 + a2;
    if (v3 + a2 <= v3)
      return 0;
    v5 = *(_QWORD *)(result + 64);
    if (v5 >= v4)
      return 1;
    v6 = v5 + a2;
    if (v5 + a2)
    {
      v7 = 1;
      while (1)
      {
        v8 = v7;
        if (v7 >= v6)
          break;
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    if (v8 < a2)
      return 0;
LABEL_11:
    if (16 * v8 < v8)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 48), 16 * v8, 0x4CB67AF0uLL);
    if (result)
    {
      v2[8] = v8;
      v2[6] = result;
      bzero((void *)(result + 16 * v2[7]), 16 * (v8 - v2[7]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)genericTileAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOTileSetVersion _readGenericTiles](result);
    v4 = *(_QWORD *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOTileSetVersion;
  -[GEOTileSetVersion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileSetVersion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTileSetVersion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v29;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  -[GEOTileSetVersion readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("identifier"));

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v7;
        v6 += 24;
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("availableTiles"));

  }
  if ((*(_BYTE *)(a1 + 96) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timeToLiveSeconds"));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    v29 = v3;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 56));
    if (*(_QWORD *)(a1 + 56))
    {
      v11 = 0;
      for (i = 0; i < *(_QWORD *)(a1 + 56); ++i)
      {
        v13 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13 + v11;
        v16 = *(_BYTE *)(v13 + v11 + 12);
        if ((v16 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v13 + v11));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("resourceIndex"));

          v16 = *(_BYTE *)(v15 + 12);
          if ((v16 & 2) == 0)
          {
LABEL_14:
            if ((v16 & 4) != 0)
              goto LABEL_18;
            goto LABEL_24;
          }
        }
        else if ((*(_BYTE *)(v13 + v11 + 12) & 2) == 0)
        {
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v13 + v11 + 4));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("textureIndex"));

        if ((*(_BYTE *)(v15 + 12) & 4) != 0)
        {
LABEL_18:
          v19 = *(_DWORD *)(v13 + v11 + 8);
          if (v19 == 1)
          {
            v20 = CFSTR("WATER");
          }
          else if (v19 == 2)
          {
            v20 = CFSTR("NO_TILE");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(v13 + v11 + 8));
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("tileType"));

        }
LABEL_24:
        objc_msgSend(v10, "addObject:", v14);

        v11 += 16;
      }
    }
    v3 = v29;
    objc_msgSend(v29, "setObject:forKey:", v10, CFSTR("genericTile"));

  }
  if ((*(_BYTE *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("supportedLanguagesVersion"));

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __47__GEOTileSetVersion__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v26 = v25;
      v32 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v31);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (id)jsonRepresentation
{
  return -[GEOTileSetVersion _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_317;
      else
        v6 = (int *)&readAll__nonRecursiveTag_318;
      GEOTileSetVersionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __47__GEOTileSetVersion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOTileSetVersionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t i;
  GEOGenericTile *v10;
  char var3;
  PBDataReader *v12;
  void *v13;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTileSetVersion readAll:]((uint64_t)self, 0);
    PBDataWriterWriteUint32Field();
    if (self->_availableTilesCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_availableTilesCount);
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_genericTilesCount)
    {
      v8 = 0;
      for (i = 0; i < self->_genericTilesCount; ++i)
      {
        PBDataWriterPlaceMark();
        v10 = &self->_genericTiles[v8];
        var3 = (char)v10->var3;
        if ((var3 & 4) != 0)
        {
          PBDataWriterWriteInt32Field();
          var3 = (char)v10->var3;
          if ((var3 & 2) != 0)
          {
LABEL_17:
            PBDataWriterWriteUint32Field();
            if ((*(_BYTE *)&v10->var3 & 1) == 0)
              goto LABEL_14;
LABEL_13:
            PBDataWriterWriteUint32Field();
            goto LABEL_14;
          }
        }
        else if ((*(_BYTE *)&v10->var3 & 2) != 0)
        {
          goto LABEL_17;
        }
        if ((var3 & 1) != 0)
          goto LABEL_13;
LABEL_14:
        PBDataWriterRecallMark();
        ++v8;
      }
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  PBDataReader *reader;
  PBDataReader *v6;
  id v7;
  unint64_t availableTilesCount;
  unint64_t genericTilesCount;
  PBUnknownFields *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v6 = reader;
    objc_sync_enter(v6);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTileSetVersionReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v7 = (id)v4;
      objc_sync_exit(v6);

      goto LABEL_14;
    }
    objc_sync_exit(v6);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTileSetVersion readAll:]((uint64_t)self, 0);
  *(_DWORD *)(v4 + 84) = self->_identifier;
  availableTilesCount = self->_availableTilesCount;
  if (availableTilesCount)
  {
    -[GEOTileSetVersion _reserveAvailableTiles:](v4, availableTilesCount);
    memcpy(*(void **)(v4 + 24), self->_availableTiles, 24 * self->_availableTilesCount);
    *(_QWORD *)(v4 + 32) = self->_availableTilesCount;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 92) = self->_timeToLiveSeconds;
    *(_BYTE *)(v4 + 96) |= 2u;
  }
  genericTilesCount = self->_genericTilesCount;
  if (genericTilesCount)
  {
    -[GEOTileSetVersion _reserveGenericTiles:](v4, genericTilesCount);
    memcpy(*(void **)(v4 + 48), self->_genericTiles, 16 * self->_genericTilesCount);
    *(_QWORD *)(v4 + 56) = self->_genericTilesCount;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 88) = self->_supportedLanguagesVersion;
    *(_BYTE *)(v4 + 96) |= 1u;
  }
  v10 = self->_unknownFields;
  v7 = *(id *)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v10;
LABEL_14:

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t availableTilesCount;
  BOOL v6;
  char flags;
  char v9;
  unint64_t genericTilesCount;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_5;
  -[GEOTileSetVersion readAll:]((uint64_t)self, 1);
  -[GEOTileSetVersion readAll:]((uint64_t)v4, 1);
  if (self->_identifier != *((_DWORD *)v4 + 21))
    goto LABEL_5;
  availableTilesCount = self->_availableTilesCount;
  if ((const void *)availableTilesCount != v4[4] || memcmp(self->_availableTiles, v4[3], 24 * availableTilesCount))
    goto LABEL_5;
  flags = (char)self->_flags;
  v9 = *((_BYTE *)v4 + 96);
  if ((flags & 2) != 0)
  {
    if (((_BYTE)v4[12] & 2) == 0 || self->_timeToLiveSeconds != *((_DWORD *)v4 + 23))
      goto LABEL_5;
  }
  else if (((_BYTE)v4[12] & 2) != 0)
  {
    goto LABEL_5;
  }
  genericTilesCount = self->_genericTilesCount;
  if ((const void *)genericTilesCount == v4[7] && !memcmp(self->_genericTiles, v4[6], 16 * genericTilesCount))
  {
    v6 = (v9 & 1) == 0;
    if ((flags & 1) == 0)
      goto LABEL_6;
    if ((v9 & 1) != 0 && self->_supportedLanguagesVersion == *((_DWORD *)v4 + 22))
    {
      v6 = 1;
      goto LABEL_6;
    }
  }
LABEL_5:
  v6 = 0;
LABEL_6:

  return v6;
}

- (unint64_t)hash
{
  unsigned int identifier;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOTileSetVersion readAll:]((uint64_t)self, 1);
  identifier = self->_identifier;
  v4 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_timeToLiveSeconds;
  else
    v5 = 0;
  v6 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_supportedLanguagesVersion;
  else
    v7 = 0;
  return v4 ^ (2654435761 * identifier) ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
