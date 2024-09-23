@implementation GEORegionalResource

- (GEORegionalResource)init
{
  GEORegionalResource *v2;
  GEORegionalResource *v3;
  GEORegionalResource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResource;
  v2 = -[GEORegionalResource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORegionalResource)initWithData:(id)a3
{
  GEORegionalResource *v3;
  GEORegionalResource *v4;
  GEORegionalResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResource;
  v3 = -[GEORegionalResource initWithData:](&v7, sel_initWithData_, a3);
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
    *(_WORD *)&self->_flags |= 0x10u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_WORD *)&self->_flags |= 0x100u;
    self->_tileRangesSpace = 0;
    self->_tileRangesCount = 0;
    free(self->_tileRanges);
    self->_tileRanges = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEORegionalResource;
  -[GEORegionalResource dealloc](&v3, sel_dealloc);
}

- (void)_readIcons
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEORegionalResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIcons_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)addIcon:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEORegionalResource _readIcons](a1);
    -[GEORegionalResource _addNoFlagsIcon:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x100u;
  }
}

- (void)_addNoFlagsIcon:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addAttribution:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEORegionalResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributions_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEORegionalResource _addNoFlagsAttribution:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x100u;
  }
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readIconChecksums
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEORegionalResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconChecksums_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)addIconChecksum:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEORegionalResource _readIconChecksums](a1);
    -[GEORegionalResource _addNoFlagsIconChecksum:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x100u;
  }
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)_reserveTileRanges:(uint64_t)result
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
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 24 * v8, 0xDBB1BA69uLL);
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEORegionalResource;
  -[GEORegionalResource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORegionalResource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEORegionalResource readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 96);
  if ((v5 & 1) == 0)
  {
    if ((v5 & 2) == 0)
      goto LABEL_4;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("y"));

    if ((*(_WORD *)(a1 + 96) & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("x"));

  v5 = *(_WORD *)(a1 + 96);
  if ((v5 & 2) != 0)
    goto LABEL_33;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("z"));

  }
LABEL_6:
  if (*(_QWORD *)(a1 + 64))
  {
    -[GEORegionalResource _readIcons](a1);
    v7 = *(id *)(a1 + 64);
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("icon"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("attribution"));
  }
  if (*(_QWORD *)(a1 + 56))
  {
    -[GEORegionalResource _readIconChecksums](a1);
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("iconChecksum"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v18 = 0;
      v19 = 0;
      do
      {
        _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v20);

        ++v19;
        v18 += 24;
      }
      while (v19 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("tileRange"));

  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __49__GEORegionalResource__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v25 = v24;
      v31 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v30);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORegionalResource _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_442;
      else
        v6 = (int *)&readAll__nonRecursiveTag_443;
      GEORegionalResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEORegionalResourceCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEORegionalResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEORegionalResourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  uint64_t v19;
  unint64_t v20;
  PBDataReader *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F0) == 0))
  {
    v21 = self->_reader;
    objc_sync_enter(v21);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v22);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORegionalResource readAll:]((uint64_t)self, 0);
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = self->_icons;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v8);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = self->_attributions;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v12);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = self->_iconChecksums;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v24;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteStringField();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v16);
    }

    if (self->_tileRangesCount)
    {
      v19 = 0;
      v20 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v20;
        v19 += 24;
      }
      while (v20 < self->_tileRangesCount);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  unint64_t tileRangesCount;
  PBUnknownFields *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORegionalResourceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_33;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORegionalResource readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0)
      goto LABEL_7;
LABEL_35:
    *(_DWORD *)(v5 + 88) = self->_y;
    *(_WORD *)(v5 + 96) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 84) = self->_x;
  *(_WORD *)(v5 + 96) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_35;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 92) = self->_z;
    *(_WORD *)(v5 + 96) |= 4u;
  }
LABEL_9:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = self->_icons;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEORegionalResource addIcon:](v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v11);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = self->_attributions;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEORegionalResource addAttribution:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v16);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = self->_iconChecksums;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v28);
        -[GEORegionalResource addIconChecksum:](v5, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v21);
  }

  tileRangesCount = self->_tileRangesCount;
  if (tileRangesCount)
  {
    -[GEORegionalResource _reserveTileRanges:](v5, tileRangesCount);
    memcpy(*(void **)(v5 + 24), self->_tileRanges, 24 * self->_tileRangesCount);
    *(_QWORD *)(v5 + 32) = self->_tileRangesCount;
  }
  v26 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_33:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  __int16 flags;
  __int16 v6;
  NSMutableArray *icons;
  NSMutableArray *attributions;
  NSMutableArray *iconChecksums;
  unint64_t tileRangesCount;
  BOOL v11;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEORegionalResource readAll:]((uint64_t)self, 1);
  -[GEORegionalResource readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 48);
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_x != *((_DWORD *)v4 + 21))
      goto LABEL_25;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_y != *((_DWORD *)v4 + 22))
      goto LABEL_25;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_z != *((_DWORD *)v4 + 23))
      goto LABEL_25;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_25;
  }
  icons = self->_icons;
  if ((unint64_t)icons | (unint64_t)v4[8] && !-[NSMutableArray isEqual:](icons, "isEqual:"))
    goto LABEL_25;
  attributions = self->_attributions;
  if ((unint64_t)attributions | (unint64_t)v4[6])
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:"))
      goto LABEL_25;
  }
  iconChecksums = self->_iconChecksums;
  if ((unint64_t)iconChecksums | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](iconChecksums, "isEqual:"))
      goto LABEL_25;
  }
  tileRangesCount = self->_tileRangesCount;
  if ((const void *)tileRangesCount != v4[4])
    goto LABEL_25;
  v11 = memcmp(self->_tileRanges, v4[3], 24 * tileRangesCount) == 0;
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[GEORegionalResource readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    v4 = 0;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = 2654435761 * self->_x;
  if ((flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_y;
  if ((flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_z;
LABEL_8:
  v7 = v5 ^ v4 ^ v6 ^ -[NSMutableArray hash](self->_icons, "hash");
  v8 = -[NSMutableArray hash](self->_attributions, "hash");
  v9 = v7 ^ v8 ^ -[NSMutableArray hash](self->_iconChecksums, "hash");
  return v9 ^ PBHashBytes();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
