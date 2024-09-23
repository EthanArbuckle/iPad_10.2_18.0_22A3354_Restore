@implementation GEORegionalResourceRegion

- (GEORegionalResourceRegion)init
{
  GEORegionalResourceRegion *v2;
  GEORegionalResourceRegion *v3;
  GEORegionalResourceRegion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResourceRegion;
  v2 = -[GEORegionalResourceRegion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORegionalResourceRegion)initWithData:(id)a3
{
  GEORegionalResourceRegion *v3;
  GEORegionalResourceRegion *v4;
  GEORegionalResourceRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResourceRegion;
  v3 = -[GEORegionalResourceRegion initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEORegionalResourceRegion clearTileRanges](self, "clearTileRanges");
  v3.receiver = self;
  v3.super_class = (Class)GEORegionalResourceRegion;
  -[GEORegionalResourceRegion dealloc](&v3, sel_dealloc);
}

- (void)_readTileRanges
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
        GEORegionalResourceRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileRanges_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)tileRangesCount
{
  -[GEORegionalResourceRegion _readTileRanges]((uint64_t)self);
  return self->_tileRangesCount;
}

- (GEOTileSetRegion)tileRanges
{
  -[GEORegionalResourceRegion _readTileRanges]((uint64_t)self);
  return self->_tileRanges;
}

- (uint64_t)_reserveTileRanges:(uint64_t)a1
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x416C091FuLL);
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

- (void)clearTileRanges
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_tileRangesSpace = 0;
  self->_tileRangesCount = 0;
  free(self->_tileRanges);
  self->_tileRanges = 0;
}

- (void)addTileRange:(GEOTileSetRegion *)a3
{
  GEOTileSetRegion v5;

  -[GEORegionalResourceRegion _readTileRanges]((uint64_t)self);
  v5 = *a3;
  if (self && -[GEORegionalResourceRegion _reserveTileRanges:]((uint64_t)self, 1uLL))
    self->_tileRanges[self->_tileRangesCount++] = v5;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (GEOTileSetRegion)tileRangeAtIndex:(SEL)a3
{
  GEOTileSetRegion *result;
  unint64_t tileRangesCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTileSetRegion *v13;

  -[GEORegionalResourceRegion _readTileRanges]((uint64_t)self);
  tileRangesCount = self->_tileRangesCount;
  if (tileRangesCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, tileRangesCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = &self->_tileRanges[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_QWORD *)&retstr->var4 = *(_QWORD *)&v13->var4;
  return result;
}

- (void)setTileRanges:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[GEORegionalResourceRegion clearTileRanges](self, "clearTileRanges");
  if (-[GEORegionalResourceRegion _reserveTileRanges:]((uint64_t)self, a4))
  {
    memcpy(self->_tileRanges, a3, 24 * a4);
    self->_tileRangesCount = a4;
  }
}

- (void)_readIcons
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
        GEORegionalResourceRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIcons_tags_1091);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)icons
{
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *icons;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  icons = self->_icons;
  self->_icons = v4;

}

- (void)clearIcons
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_icons, "removeAllObjects");
}

- (void)addIcon:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  -[GEORegionalResourceRegion _addNoFlagsIcon:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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

- (unint64_t)iconsCount
{
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  return -[NSMutableArray count](self->_icons, "count");
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_icons, "objectAtIndex:", a3);
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
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
        GEORegionalResourceRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributions_tags_1092);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)attributions
{
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  return self->_attributions;
}

- (void)setAttributions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *attributions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  attributions = self->_attributions;
  self->_attributions = v4;

}

- (void)clearAttributions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_attributions, "removeAllObjects");
}

- (void)addAttribution:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  -[GEORegionalResourceRegion _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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

- (unint64_t)attributionsCount
{
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  return -[NSMutableArray count](self->_attributions, "count");
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_attributions, "objectAtIndex:", a3);
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readIconChecksums
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
        GEORegionalResourceRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconChecksums_tags_1093);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)iconChecksums
{
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  return self->_iconChecksums;
}

- (void)setIconChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *iconChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  iconChecksums = self->_iconChecksums;
  self->_iconChecksums = v4;

}

- (void)clearIconChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_iconChecksums, "removeAllObjects");
}

- (void)addIconChecksum:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  -[GEORegionalResourceRegion _addNoFlagsIconChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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

- (unint64_t)iconChecksumsCount
{
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_iconChecksums, "count");
}

- (id)iconChecksumAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_iconChecksums, "objectAtIndex:", a3);
}

+ (Class)iconChecksumType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEORegionalResourceRegion;
  -[GEORegionalResourceRegion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORegionalResourceRegion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResourceRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("tileRange"));

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend((id)a1, "icons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("icon"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = *(id *)(a1 + 48);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("attribution"));
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "iconChecksums");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("iconChecksum"));

  }
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __55__GEORegionalResourceRegion__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORegionalResourceRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEORegionalResourceRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORegionalResourceRegion)initWithDictionary:(id)a3
{
  return (GEORegionalResourceRegion *)-[GEORegionalResourceRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  GEOAttribution *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tileRange"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v57 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v54 = 0uLL;
                v55 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v12, &v54);
                v52 = v54;
                v53 = v55;
                objc_msgSend(a1, "addTileRange:", &v52);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          }
          while (v9);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("icon"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v49 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v20 = (void *)objc_msgSend(v19, "copy");
                objc_msgSend(a1, "addIcon:", v20);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          }
          while (v16);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attribution"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v45;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v45 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = [GEOAttribution alloc];
                if ((a3 & 1) != 0)
                  v29 = -[GEOAttribution initWithJSON:](v28, "initWithJSON:", v27);
                else
                  v29 = -[GEOAttribution initWithDictionary:](v28, "initWithDictionary:", v27);
                v30 = (void *)v29;
                objc_msgSend(a1, "addAttribution:", v29);

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
          }
          while (v24);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iconChecksum"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v41;
          do
          {
            for (m = 0; m != v34; ++m)
            {
              if (*(_QWORD *)v41 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = (void *)objc_msgSend(v37, "copy");
                objc_msgSend(a1, "addIconChecksum:", v38);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
          }
          while (v34);
        }

      }
    }
  }

  return a1;
}

- (GEORegionalResourceRegion)initWithJSON:(id)a3
{
  return (GEORegionalResourceRegion *)-[GEORegionalResourceRegion _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1096;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1097;
    GEORegionalResourceRegionReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORegionalResourceRegionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORegionalResourceRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORegionalResourceRegionReadAllFrom((uint64_t)self, a3, 0);
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
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  PBDataReader *v20;
  void *v21;
  __int128 v22;
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
  uint64_t v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
  {
    v20 = self->_reader;
    objc_sync_enter(v20);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v21);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORegionalResourceRegion readAll:](self, "readAll:", 0);
    if (self->_tileRangesCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v34 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_tileRangesCount);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = self->_icons;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteStringField();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v9);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_attributions;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteSubmessage();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v13);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = self->_iconChecksums;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteStringField();
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      }
      while (v17);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v22);
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  _BYTE v20[24];

  v4 = (id *)a3;
  -[GEORegionalResourceRegion readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 18) = self->_readerMarkPos;
  *((_DWORD *)v4 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORegionalResourceRegion tileRangesCount](self, "tileRangesCount"))
  {
    objc_msgSend(v4, "clearTileRanges");
    v5 = -[GEORegionalResourceRegion tileRangesCount](self, "tileRangesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEORegionalResourceRegion tileRangeAtIndex:](self, "tileRangeAtIndex:", i);
        objc_msgSend(v4, "addTileRange:", v20);
      }
    }
  }
  if (-[GEORegionalResourceRegion iconsCount](self, "iconsCount"))
  {
    objc_msgSend(v4, "clearIcons");
    v8 = -[GEORegionalResourceRegion iconsCount](self, "iconsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORegionalResourceRegion iconAtIndex:](self, "iconAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addIcon:", v11);

      }
    }
  }
  if (-[GEORegionalResourceRegion attributionsCount](self, "attributionsCount"))
  {
    objc_msgSend(v4, "clearAttributions");
    v12 = -[GEORegionalResourceRegion attributionsCount](self, "attributionsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEORegionalResourceRegion attributionAtIndex:](self, "attributionAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAttribution:", v15);

      }
    }
  }
  if (-[GEORegionalResourceRegion iconChecksumsCount](self, "iconChecksumsCount"))
  {
    objc_msgSend(v4, "clearIconChecksums");
    v16 = -[GEORegionalResourceRegion iconChecksumsCount](self, "iconChecksumsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEORegionalResourceRegion iconChecksumAtIndex:](self, "iconChecksumAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addIconChecksum:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  unint64_t tileRangesCount;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
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
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
      GEORegionalResourceRegionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORegionalResourceRegion readAll:](self, "readAll:", 0);
  tileRangesCount = self->_tileRangesCount;
  if (tileRangesCount)
  {
    -[GEORegionalResourceRegion _reserveTileRanges:](v5, tileRangesCount);
    memcpy(*(void **)(v5 + 24), self->_tileRanges, 24 * self->_tileRangesCount);
    *(_QWORD *)(v5 + 32) = self->_tileRangesCount;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = self->_icons;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIcon:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_attributions;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAttribution:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = self->_iconChecksums;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addIconChecksum:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t tileRangesCount;
  char v6;
  NSMutableArray *icons;
  NSMutableArray *attributions;
  NSMutableArray *iconChecksums;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEORegionalResourceRegion readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        tileRangesCount = self->_tileRangesCount,
        tileRangesCount == *((_QWORD *)v4 + 4))
    && !memcmp(self->_tileRanges, *((const void **)v4 + 3), 24 * tileRangesCount)
    && ((icons = self->_icons, !((unint64_t)icons | *((_QWORD *)v4 + 8)))
     || -[NSMutableArray isEqual:](icons, "isEqual:"))
    && ((attributions = self->_attributions, !((unint64_t)attributions | *((_QWORD *)v4 + 6)))
     || -[NSMutableArray isEqual:](attributions, "isEqual:")))
  {
    iconChecksums = self->_iconChecksums;
    if ((unint64_t)iconChecksums | *((_QWORD *)v4 + 7))
      v6 = -[NSMutableArray isEqual:](iconChecksums, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORegionalResourceRegion readAll:](self, "readAll:", 1);
  v3 = PBHashBytes();
  v4 = -[NSMutableArray hash](self->_icons, "hash");
  v5 = v4 ^ -[NSMutableArray hash](self->_attributions, "hash");
  return v5 ^ -[NSMutableArray hash](self->_iconChecksums, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
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
  _QWORD v35[3];
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "tileRangesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      if (v4)
        objc_msgSend(v4, "tileRangeAtIndex:", i);
      else
        memset(v35, 0, sizeof(v35));
      -[GEORegionalResourceRegion addTileRange:](self, "addTileRange:", v35);
    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v4[8];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        -[GEORegionalResourceRegion addIcon:](self, "addIcon:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v4[6];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        -[GEORegionalResourceRegion addAttribution:](self, "addAttribution:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v4[7];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (m = 0; m != v20; ++m)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[GEORegionalResourceRegion addIconChecksum:](self, "addIconChecksum:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * m), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    }
    while (v20);
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
      GEORegionalResourceRegionReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1100);
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
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORegionalResourceRegion readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_attributions;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
