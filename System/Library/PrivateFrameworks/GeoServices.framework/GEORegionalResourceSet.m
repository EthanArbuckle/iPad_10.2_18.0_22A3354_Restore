@implementation GEORegionalResourceSet

- (GEOTileSetRegion)regionAtIndex:(SEL)a3
{
  GEOTileSetRegion *result;
  unint64_t regionsCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTileSetRegion *v13;

  -[GEORegionalResourceSet _readRegions]((uint64_t)self);
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

- (unint64_t)regionsCount
{
  -[GEORegionalResourceSet _readRegions]((uint64_t)self);
  return self->_regionsCount;
}

- (void)_readRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegions_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x5518D065uLL);
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

- (void)_addNoFlagsResource:(uint64_t)a1
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

- (NSMutableArray)resources
{
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  return self->_resources;
}

- (void)_readResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResources_tags_1116);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEORegionalResourceSet)init
{
  GEORegionalResourceSet *v2;
  GEORegionalResourceSet *v3;
  GEORegionalResourceSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResourceSet;
  v2 = -[GEORegionalResourceSet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
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
      v8 = (int *)&readAll__recursiveTag_1119;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1120;
    GEORegionalResourceSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORegionalResourceSetCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEORegionalResourceSet)initWithData:(id)a3
{
  GEORegionalResourceSet *v3;
  GEORegionalResourceSet *v4;
  GEORegionalResourceSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResourceSet;
  v3 = -[GEORegionalResourceSet initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEORegionalResourceSet clearRegions](self, "clearRegions");
  v3.receiver = self;
  v3.super_class = (Class)GEORegionalResourceSet;
  -[GEORegionalResourceSet dealloc](&v3, sel_dealloc);
}

- (GEOTileSetRegion)regions
{
  -[GEORegionalResourceSet _readRegions]((uint64_t)self);
  return self->_regions;
}

- (void)clearRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  self->_regionsSpace = 0;
  self->_regionsCount = 0;
  free(self->_regions);
  self->_regions = 0;
}

- (void)addRegion:(GEOTileSetRegion *)a3
{
  GEOTileSetRegion v5;

  -[GEORegionalResourceSet _readRegions]((uint64_t)self);
  v5 = *a3;
  if (self && -[GEORegionalResourceSet _reserveRegions:]((uint64_t)self, 1uLL))
    self->_regions[self->_regionsCount++] = v5;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[GEORegionalResourceSet clearRegions](self, "clearRegions");
  if (-[GEORegionalResourceSet _reserveRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_regions, a3, 24 * a4);
    self->_regionsCount = a4;
  }
}

- (void)setResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *resources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  resources = self->_resources;
  self->_resources = v4;

}

- (void)clearResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_resources, "removeAllObjects");
}

- (void)addResource:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  -[GEORegionalResourceSet _addNoFlagsResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unint64_t)resourcesCount
{
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  return -[NSMutableArray count](self->_resources, "count");
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_resources, "objectAtIndex:", a3);
}

+ (Class)resourceType
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
  v8.super_class = (Class)GEORegionalResourceSet;
  -[GEORegionalResourceSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORegionalResourceSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResourceSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("region"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = *(id *)(a1 + 48);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("resource"));
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
      v24[2] = __52__GEORegionalResourceSet__dictionaryRepresentation___block_invoke;
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
  return -[GEORegionalResourceSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEORegionalResourceSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORegionalResourceSet)initWithDictionary:(id)a3
{
  return (GEORegionalResourceSet *)-[GEORegionalResourceSet _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t v19;
  GEOResource *v20;
  uint64_t v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v24 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v34 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = 0uLL;
                v32 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v12, &v31);
                v29 = v31;
                v30 = v32;
                objc_msgSend(a1, "addRegion:", &v29);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v9);
        }

        v5 = v24;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resource"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v26 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v20 = [GEOResource alloc];
                if ((a3 & 1) != 0)
                  v21 = -[GEOResource initWithJSON:](v20, "initWithJSON:", v19);
                else
                  v21 = -[GEOResource initWithDictionary:](v20, "initWithDictionary:", v19);
                v22 = (void *)v21;
                objc_msgSend(a1, "addResource:", v21);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          }
          while (v16);
        }

        v5 = v24;
      }

    }
  }

  return a1;
}

- (GEORegionalResourceSet)initWithJSON:(id)a3
{
  return (GEORegionalResourceSet *)-[GEORegionalResourceSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORegionalResourceSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORegionalResourceSetReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORegionalResourceSetIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORegionalResourceSet readAll:](self, "readAll:", 0);
    if (self->_regionsCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v18 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_regionsCount);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_resources;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
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
  _BYTE v12[24];

  v4 = (id *)a3;
  -[GEORegionalResourceSet readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 14) = self->_readerMarkPos;
  *((_DWORD *)v4 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORegionalResourceSet regionsCount](self, "regionsCount"))
  {
    objc_msgSend(v4, "clearRegions");
    v5 = -[GEORegionalResourceSet regionsCount](self, "regionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEORegionalResourceSet regionAtIndex:](self, "regionAtIndex:", i);
        objc_msgSend(v4, "addRegion:", v12);
      }
    }
  }
  if (-[GEORegionalResourceSet resourcesCount](self, "resourcesCount"))
  {
    objc_msgSend(v4, "clearResources");
    v8 = -[GEORegionalResourceSet resourcesCount](self, "resourcesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORegionalResourceSet resourceAtIndex:](self, "resourceAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addResource:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  unint64_t regionsCount;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORegionalResourceSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORegionalResourceSet readAll:](self, "readAll:", 0);
  regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    -[GEORegionalResourceSet _reserveRegions:](v5, regionsCount);
    memcpy(*(void **)(v5 + 24), self->_regions, 24 * self->_regionsCount);
    *(_QWORD *)(v5 + 32) = self->_regionsCount;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_resources;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addResource:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t regionsCount;
  char v6;
  NSMutableArray *resources;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEORegionalResourceSet readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        regionsCount = self->_regionsCount,
        regionsCount == *((_QWORD *)v4 + 4))
    && !memcmp(self->_regions, *((const void **)v4 + 3), 24 * regionsCount))
  {
    resources = self->_resources;
    if ((unint64_t)resources | *((_QWORD *)v4 + 6))
      v6 = -[NSMutableArray isEqual:](resources, "isEqual:");
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

  -[GEORegionalResourceSet readAll:](self, "readAll:", 1);
  v3 = PBHashBytes();
  return -[NSMutableArray hash](self->_resources, "hash") ^ v3;
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[3];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "regionsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      if (v4)
        objc_msgSend(v4, "regionAtIndex:", i);
      else
        memset(v17, 0, sizeof(v17));
      -[GEORegionalResourceSet addRegion:](self, "addRegion:", v17);
    }
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4[6];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[GEORegionalResourceSet addResource:](self, "addResource:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
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
      GEORegionalResourceSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1123);
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
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORegionalResourceSet readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_resources;
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
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
