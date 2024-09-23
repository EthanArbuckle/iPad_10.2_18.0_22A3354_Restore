@implementation GEOResource

- (GEOResource)init
{
  GEOResource *v2;
  GEOResource *v3;
  GEOResource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOResource;
  v2 = -[GEOResource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 flags;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[GEOResource readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v3 = 2654435761 * self->_resourceType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_filename, "hash");
  v5 = -[NSData hash](self->_checksum, "hash");
  v6 = PBHashBytes();
  v7 = -[NSMutableArray hash](self->_filters, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v9 = 2654435761 * self->_connectionType;
    if ((flags & 4) != 0)
    {
LABEL_6:
      v10 = 2654435761 * self->_preferWiFiAllowedStaleThreshold;
      if ((flags & 0x40) != 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else
  {
    v9 = 0;
    if ((flags & 4) != 0)
      goto LABEL_6;
  }
  v10 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_7:
    v11 = 2654435761 * self->_validationMethod;
    if ((flags & 1) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  v11 = 0;
  if ((flags & 1) != 0)
  {
LABEL_8:
    v12 = 2654435761 * self->_alternateResourceURLIndex;
    if ((flags & 0x20) != 0)
      goto LABEL_9;
LABEL_15:
    v13 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_10;
LABEL_16:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_14:
  v12 = 0;
  if ((flags & 0x20) == 0)
    goto LABEL_15;
LABEL_9:
  v13 = 2654435761 * self->_updateMethod;
  if ((flags & 0x10) == 0)
    goto LABEL_16;
LABEL_10:
  v14 = 2654435761 * self->_timeToLiveSeconds;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  __int16 v5;
  NSString *filename;
  NSData *checksum;
  unint64_t regionsCount;
  BOOL v9;
  NSMutableArray *filters;
  __int16 flags;
  __int16 v13;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOResource readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 56);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_resourceType != *((_DWORD *)v4 + 24))
      goto LABEL_13;
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_13;
  }
  filename = self->_filename;
  if ((unint64_t)filename | (unint64_t)v4[7] && !-[NSString isEqual:](filename, "isEqual:"))
    goto LABEL_13;
  checksum = self->_checksum;
  if ((unint64_t)checksum | (unint64_t)v4[6])
  {
    if (!-[NSData isEqual:](checksum, "isEqual:"))
      goto LABEL_13;
  }
  regionsCount = self->_regionsCount;
  if ((const void *)regionsCount != v4[4])
    goto LABEL_13;
  if (memcmp(self->_regions, v4[3], 24 * regionsCount))
    goto LABEL_13;
  filters = self->_filters;
  if ((unint64_t)filters | (unint64_t)v4[8])
  {
    if (!-[NSMutableArray isEqual:](filters, "isEqual:"))
      goto LABEL_13;
  }
  flags = (__int16)self->_flags;
  v13 = *((_WORD *)v4 + 56);
  if ((flags & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_connectionType != *((_DWORD *)v4 + 22))
      goto LABEL_13;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_preferWiFiAllowedStaleThreshold != *((_DWORD *)v4 + 23))
      goto LABEL_13;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_validationMethod != *((_DWORD *)v4 + 27))
      goto LABEL_13;
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_alternateResourceURLIndex != *((_DWORD *)v4 + 21))
      goto LABEL_13;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_updateMethod != *((_DWORD *)v4 + 26))
      goto LABEL_13;
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 0x10) == 0)
  {
    v9 = (v13 & 0x10) == 0;
    goto LABEL_14;
  }
  if ((v13 & 0x10) != 0 && self->_timeToLiveSeconds == *((_DWORD *)v4 + 25))
  {
    v9 = 1;
    goto LABEL_14;
  }
LABEL_13:
  v9 = 0;
LABEL_14:

  return v9;
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
      v8 = (int *)&readAll__recursiveTag_484_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_485_0;
    GEOResourceReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOResourceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (BOOL)_geo_isRelevantForScales:(id)a3 scenarios:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  BOOL v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[GEOResource filters](self, "filters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v9)
  {
    v22 = 1;
    goto LABEL_19;
  }
  v10 = v9;
  v11 = *(_QWORD *)v26;
  v24 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if (objc_msgSend(v13, "scalesCount"))
      {
        v14 = 0;
        do
        {
          v15 = objc_msgSend(v13, "scaleAtIndex:", v14);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v6, "containsObject:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_17;
        }
        while (++v14 < (unint64_t)objc_msgSend(v13, "scalesCount"));
      }
      if (objc_msgSend(v13, "scenariosCount"))
      {
        v18 = 0;
        while (1)
        {
          v19 = objc_msgSend(v13, "scenarioAtIndex:", v18);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v7, "containsObject:", v20);

          if ((v21 & 1) == 0)
            break;
          if (++v18 >= (unint64_t)objc_msgSend(v13, "scenariosCount"))
            goto LABEL_14;
        }
LABEL_17:
        v22 = 0;
        goto LABEL_19;
      }
LABEL_14:
      v11 = v24;
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    v22 = 1;
    if (v10)
      continue;
    break;
  }
LABEL_19:

  return v22;
}

- (NSMutableArray)filters
{
  -[GEOResource _readFilters]((uint64_t)self);
  return self->_filters;
}

- (int)resourceType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_resourceType;
  else
    return 0;
}

- (NSString)filename
{
  -[GEOResource _readFilename]((uint64_t)self);
  return self->_filename;
}

- (void)_readFilename
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilename_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (int)validationMethod
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_validationMethod;
  else
    return 0;
}

- (int)updateMethod
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_updateMethod;
  else
    return 0;
}

- (BOOL)hasValidationMethod
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (NSData)checksum
{
  -[GEOResource _readChecksum]((uint64_t)self);
  return self->_checksum;
}

- (void)_readChecksum
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChecksum_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)dealloc
{
  objc_super v3;

  -[GEOResource clearRegions](self, "clearRegions");
  v3.receiver = self;
  v3.super_class = (Class)GEOResource;
  -[GEOResource dealloc](&v3, sel_dealloc);
}

- (void)clearRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_regionsSpace = 0;
  self->_regionsCount = 0;
  free(self->_regions);
  self->_regions = 0;
}

- (void)_addNoFlagsFilter:(uint64_t)a1
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_checksum, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t regionsCount;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int16 flags;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOResource readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 96) = self->_resourceType;
      *(_WORD *)(v5 + 112) |= 8u;
    }
    v9 = -[NSString copyWithZone:](self->_filename, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v9;

    v11 = -[NSData copyWithZone:](self->_checksum, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v11;

    regionsCount = self->_regionsCount;
    if (regionsCount)
    {
      -[GEOResource _reserveRegions:](v5, regionsCount);
      memcpy(*(void **)(v5 + 24), self->_regions, 24 * self->_regionsCount);
      *(_QWORD *)(v5 + 32) = self->_regionsCount;
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self->_filters;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v14);
          v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
          objc_msgSend((id)v5, "addFilter:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 88) = self->_connectionType;
      *(_WORD *)(v5 + 112) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_18:
        if ((flags & 0x40) == 0)
          goto LABEL_19;
        goto LABEL_27;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_18;
    }
    *(_DWORD *)(v5 + 92) = self->_preferWiFiAllowedStaleThreshold;
    *(_WORD *)(v5 + 112) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0)
        goto LABEL_20;
      goto LABEL_28;
    }
LABEL_27:
    *(_DWORD *)(v5 + 108) = self->_validationMethod;
    *(_WORD *)(v5 + 112) |= 0x40u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_20:
      if ((flags & 0x20) == 0)
        goto LABEL_21;
      goto LABEL_29;
    }
LABEL_28:
    *(_DWORD *)(v5 + 84) = self->_alternateResourceURLIndex;
    *(_WORD *)(v5 + 112) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_21:
      if ((flags & 0x10) == 0)
      {
LABEL_23:
        v20 = self->_unknownFields;
        v8 = *(id *)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v20;
        goto LABEL_24;
      }
LABEL_22:
      *(_DWORD *)(v5 + 100) = self->_timeToLiveSeconds;
      *(_WORD *)(v5 + 112) |= 0x10u;
      goto LABEL_23;
    }
LABEL_29:
    *(_DWORD *)(v5 + 104) = self->_updateMethod;
    *(_WORD *)(v5 + 112) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOResourceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (void)addFilter:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResource _readFilters]((uint64_t)self);
  -[GEOResource _addNoFlagsFilter:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_readFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilters_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (GEOResource)initWithData:(id)a3
{
  GEOResource *v3;
  GEOResource *v4;
  GEOResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOResource;
  v3 = -[GEOResource initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setResourceType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_resourceType = a3;
}

- (void)setHasResourceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasResourceType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)resourceTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C06070[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_STYLESHEET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_TEXTURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_FONT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_ICON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_XML")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_ATTRIBUTION_LOGO")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_ATTRIBUTION_BADGE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_TYPE_OTHER")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasFilename
{
  -[GEOResource _readFilename]((uint64_t)self);
  return self->_filename != 0;
}

- (void)setFilename:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_filename, a3);
}

- (BOOL)hasChecksum
{
  -[GEOResource _readChecksum]((uint64_t)self);
  return self->_checksum != 0;
}

- (void)setChecksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_checksum, a3);
}

- (void)_readRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegions_tags_462);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)regionsCount
{
  -[GEOResource _readRegions]((uint64_t)self);
  return self->_regionsCount;
}

- (GEOTileSetRegion)regions
{
  -[GEOResource _readRegions]((uint64_t)self);
  return self->_regions;
}

- (uint64_t)_reserveRegions:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (24 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x5887C87EuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 24 * *(_QWORD *)(a1 + 32)), 24 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)addRegion:(GEOTileSetRegion *)a3
{
  GEOTileSetRegion v5;

  -[GEOResource _readRegions]((uint64_t)self);
  v5 = *a3;
  if (self && -[GEOResource _reserveRegions:]((uint64_t)self, 1uLL))
    self->_regions[self->_regionsCount++] = v5;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (GEOTileSetRegion)regionAtIndex:(SEL)a3
{
  GEOTileSetRegion *result;
  unint64_t regionsCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTileSetRegion *v13;

  -[GEOResource _readRegions]((uint64_t)self);
  regionsCount = self->_regionsCount;
  if (regionsCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, regionsCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = &self->_regions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_QWORD *)&retstr->var4 = *(_QWORD *)&v13->var4;
  return result;
}

- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[GEOResource clearRegions](self, "clearRegions");
  if (-[GEOResource _reserveRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_regions, a3, 24 * a4);
    self->_regionsCount = a4;
  }
}

- (void)setFilters:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *filters;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  filters = self->_filters;
  self->_filters = v4;

}

- (void)clearFilters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_filters, "removeAllObjects");
}

- (unint64_t)filtersCount
{
  -[GEOResource _readFilters]((uint64_t)self);
  return -[NSMutableArray count](self->_filters, "count");
}

- (id)filterAtIndex:(unint64_t)a3
{
  -[GEOResource _readFilters]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", a3);
}

+ (Class)filterType
{
  return (Class)objc_opt_class();
}

- (int)connectionType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_connectionType;
  else
    return 1;
}

- (void)setConnectionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C060B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_CELLULAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_PREFER_WIFI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_WIFI_ONLY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)preferWiFiAllowedStaleThreshold
{
  return self->_preferWiFiAllowedStaleThreshold;
}

- (void)setPreferWiFiAllowedStaleThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_preferWiFiAllowedStaleThreshold = a3;
}

- (void)setHasPreferWiFiAllowedStaleThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasPreferWiFiAllowedStaleThreshold
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setValidationMethod:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  self->_validationMethod = a3;
}

- (void)setHasValidationMethod:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4160;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (id)validationMethodAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SHA1");
  if (a3 == 1)
  {
    v3 = CFSTR("CMS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsValidationMethod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHA1")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CMS"));

  return v4;
}

- (unsigned)alternateResourceURLIndex
{
  return self->_alternateResourceURLIndex;
}

- (void)setAlternateResourceURLIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_alternateResourceURLIndex = a3;
}

- (void)setHasAlternateResourceURLIndex:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasAlternateResourceURLIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)setUpdateMethod:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_updateMethod = a3;
}

- (void)setHasUpdateMethod:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4128;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasUpdateMethod
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)updateMethodAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("VERSIONED");
  if (a3 == 1)
  {
    v3 = CFSTR("ETAG");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsUpdateMethod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERSIONED")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ETAG"));

  return v4;
}

- (unsigned)timeToLiveSeconds
{
  return self->_timeToLiveSeconds;
}

- (void)setTimeToLiveSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_timeToLiveSeconds = a3;
}

- (void)setHasTimeToLiveSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4112;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTimeToLiveSeconds
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOResource;
  -[GEOResource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResource _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v34;
  int v35;
  __CFString *v36;
  void *v37;
  int v38;
  __CFString *v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 112) & 8) != 0)
  {
    v5 = *(int *)(a1 + 96);
    if (v5 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C06070[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("resourceType"));

  }
  objc_msgSend((id)a1, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("filename"));

  objc_msgSend((id)a1, "checksum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("checksum"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("checksum"));
    }
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v12 = 0;
      v13 = 0;
      do
      {
        _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v14);

        ++v13;
        v12 += 24;
      }
      while (v13 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("region"));

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v16 = *(id *)(a1 + 64);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("filter"));
  }
  v23 = *(_WORD *)(a1 + 112);
  if ((v23 & 2) != 0)
  {
    v24 = *(int *)(a1 + 88);
    if (v24 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 88));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E1C060B0[v24];
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("connectionType"));

    v23 = *(_WORD *)(a1 + 112);
  }
  if ((v23 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("preferWiFiAllowedStaleThreshold"));

    v23 = *(_WORD *)(a1 + 112);
    if ((v23 & 0x40) == 0)
    {
LABEL_37:
      if ((v23 & 1) == 0)
        goto LABEL_38;
      goto LABEL_53;
    }
  }
  else if ((v23 & 0x40) == 0)
  {
    goto LABEL_37;
  }
  v35 = *(_DWORD *)(a1 + 108);
  if (v35)
  {
    if (v35 == 1)
    {
      v36 = CFSTR("CMS");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 108));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v36 = CFSTR("SHA1");
  }
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("validationMethod"));

  v23 = *(_WORD *)(a1 + 112);
  if ((v23 & 1) == 0)
  {
LABEL_38:
    if ((v23 & 0x20) == 0)
      goto LABEL_39;
LABEL_54:
    v38 = *(_DWORD *)(a1 + 104);
    if (v38)
    {
      if (v38 == 1)
      {
        v39 = CFSTR("ETAG");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 104));
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v39 = CFSTR("VERSIONED");
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("updateMethod"));

    if ((*(_WORD *)(a1 + 112) & 0x10) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("alternateResourceURLIndex"));

  v23 = *(_WORD *)(a1 + 112);
  if ((v23 & 0x20) != 0)
    goto LABEL_54;
LABEL_39:
  if ((v23 & 0x10) != 0)
  {
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("timeToLiveSeconds"));

  }
LABEL_41:
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __41__GEOResource__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E1C00600;
      v31 = v30;
      v41 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v40);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOResource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOResource)initWithDictionary:(id)a3
{
  return (GEOResource *)-[GEOResource _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  GEOResourceFilter *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_91;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_91;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resourceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_STYLESHEET")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_TEXTURE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_FONT")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_ICON")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_XML")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_ATTRIBUTION_LOGO")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_ATTRIBUTION_BADGE")) & 1) != 0)
    {
      v8 = 6;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("RESOURCE_TYPE_OTHER")))
    {
      v8 = 7;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setResourceType:", v8);
LABEL_25:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filename"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(a1, "setFilename:", v10);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("checksum"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
    objc_msgSend(a1, "setChecksum:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v53 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = 0uLL;
            v51 = 0;
            _GEOTileSetRegionFromDictionaryRepresentation(v19, &v50);
            v48 = v50;
            v49 = v51;
            objc_msgSend(a1, "addRegion:", &v48);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v16);
    }

    v5 = v43;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filter"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = [GEOResourceFilter alloc];
            if ((a3 & 1) != 0)
              v28 = -[GEOResourceFilter initWithJSON:](v27, "initWithJSON:", v26);
            else
              v28 = -[GEOResourceFilter initWithDictionary:](v27, "initWithDictionary:", v26);
            v29 = (void *)v28;
            objc_msgSend(a1, "addFilter:", v28);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v23);
    }

    v5 = v43;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("connectionType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v30;
    if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v32 = 0;
    }
    else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_CELLULAR")) & 1) != 0)
    {
      v32 = 1;
    }
    else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_PREFER_WIFI")) & 1) != 0)
    {
      v32 = 2;
    }
    else if (objc_msgSend(v31, "isEqualToString:", CFSTR("RESOURCE_DOWNLOAD_CONNECTION_TYPE_WIFI_ONLY")))
    {
      v32 = 3;
    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_68;
    v32 = objc_msgSend(v30, "intValue");
  }
  objc_msgSend(a1, "setConnectionType:", v32);
LABEL_68:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("preferWiFiAllowedStaleThreshold"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPreferWiFiAllowedStaleThreshold:", objc_msgSend(v33, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("validationMethod"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v34;
    if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SHA1")) & 1) != 0)
      v36 = 0;
    else
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("CMS"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_78;
    v36 = objc_msgSend(v34, "intValue");
  }
  objc_msgSend(a1, "setValidationMethod:", v36);
LABEL_78:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternateResourceURLIndex"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAlternateResourceURLIndex:", objc_msgSend(v37, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateMethod"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v38;
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("VERSIONED")) & 1) != 0)
      v40 = 0;
    else
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("ETAG"));

    goto LABEL_87;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = objc_msgSend(v38, "intValue");
LABEL_87:
    objc_msgSend(a1, "setUpdateMethod:", v40);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeToLiveSeconds"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTimeToLiveSeconds:", objc_msgSend(v41, "unsignedIntValue"));

LABEL_91:
  return a1;
}

- (GEOResource)initWithJSON:(id)a3
{
  return (GEOResource *)-[GEOResource _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 flags;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOResourceIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOResource readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 8) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_filename)
      PBDataWriterWriteStringField();
    if (self->_checksum)
      PBDataWriterWriteDataField();
    if (self->_regionsCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v19 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_regionsCount);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_filters;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  __int16 flags;
  _BYTE v13[24];

  v4 = (id *)a3;
  -[GEOResource readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 18) = self->_readerMarkPos;
  *((_DWORD *)v4 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_resourceType;
    *((_WORD *)v4 + 56) |= 8u;
  }
  if (self->_filename)
    objc_msgSend(v4, "setFilename:");
  if (self->_checksum)
    objc_msgSend(v4, "setChecksum:");
  if (-[GEOResource regionsCount](self, "regionsCount"))
  {
    objc_msgSend(v4, "clearRegions");
    v5 = -[GEOResource regionsCount](self, "regionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOResource regionAtIndex:](self, "regionAtIndex:", i);
        objc_msgSend(v4, "addRegion:", v13);
      }
    }
  }
  if (-[GEOResource filtersCount](self, "filtersCount"))
  {
    objc_msgSend(v4, "clearFilters");
    v8 = -[GEOResource filtersCount](self, "filtersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOResource filterAtIndex:](self, "filterAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addFilter:", v11);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_connectionType;
    *((_WORD *)v4 + 56) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_17:
      if ((flags & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_25;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 23) = self->_preferWiFiAllowedStaleThreshold;
  *((_WORD *)v4 + 56) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0)
      goto LABEL_19;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 27) = self->_validationMethod;
  *((_WORD *)v4 + 56) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 0x20) == 0)
      goto LABEL_20;
LABEL_27:
    *((_DWORD *)v4 + 26) = self->_updateMethod;
    *((_WORD *)v4 + 56) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_26:
  *((_DWORD *)v4 + 21) = self->_alternateResourceURLIndex;
  *((_WORD *)v4 + 56) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_27;
LABEL_20:
  if ((flags & 0x10) != 0)
  {
LABEL_21:
    *((_DWORD *)v4 + 25) = self->_timeToLiveSeconds;
    *((_WORD *)v4 + 56) |= 0x10u;
  }
LABEL_22:

}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int16 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[24];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 56) & 8) != 0)
  {
    self->_resourceType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((_QWORD *)v4 + 7))
    -[GEOResource setFilename:](self, "setFilename:");
  if (*((_QWORD *)v4 + 6))
    -[GEOResource setChecksum:](self, "setChecksum:");
  v5 = objc_msgSend(v4, "regionsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v4, "regionAtIndex:", i);
      -[GEOResource addRegion:](self, "addRegion:", v18);
    }
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *((id *)v4 + 8);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[GEOResource addFilter:](self, "addFilter:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j), (_QWORD)v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  v13 = *((_WORD *)v4 + 56);
  if ((v13 & 2) != 0)
  {
    self->_connectionType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 2u;
    v13 = *((_WORD *)v4 + 56);
    if ((v13 & 4) == 0)
    {
LABEL_19:
      if ((v13 & 0x40) == 0)
        goto LABEL_20;
      goto LABEL_27;
    }
  }
  else if ((v13 & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_preferWiFiAllowedStaleThreshold = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 4u;
  v13 = *((_WORD *)v4 + 56);
  if ((v13 & 0x40) == 0)
  {
LABEL_20:
    if ((v13 & 1) == 0)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_27:
  self->_validationMethod = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_flags |= 0x40u;
  v13 = *((_WORD *)v4 + 56);
  if ((v13 & 1) == 0)
  {
LABEL_21:
    if ((v13 & 0x20) == 0)
      goto LABEL_22;
LABEL_29:
    self->_updateMethod = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_flags |= 0x20u;
    if ((*((_WORD *)v4 + 56) & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_28:
  self->_alternateResourceURLIndex = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_flags |= 1u;
  v13 = *((_WORD *)v4 + 56);
  if ((v13 & 0x20) != 0)
    goto LABEL_29;
LABEL_22:
  if ((v13 & 0x10) != 0)
  {
LABEL_23:
    self->_timeToLiveSeconds = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_24:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOResourceReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_488_0);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1080u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOResource readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_filters;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)_geo_isExplicit
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GEOResource filters](self, "filters", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "scenariosCount"))
        {
          v8 = 0;
          while (objc_msgSend(v7, "scenarioAtIndex:", v8) != 4)
          {
            if (++v8 >= (unint64_t)objc_msgSend(v7, "scenariosCount"))
              goto LABEL_10;
          }
          v9 = 1;
          goto LABEL_15;
        }
LABEL_10:
        ;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_15:

  return v9;
}

@end
