@implementation GEOLPRLicensePlateRegion

- (GEOLPRLicensePlateRegion)init
{
  GEOLPRLicensePlateRegion *v2;
  GEOLPRLicensePlateRegion *v3;
  GEOLPRLicensePlateRegion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateRegion;
  v2 = -[GEOLPRLicensePlateRegion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateRegion)initWithData:(id)a3
{
  GEOLPRLicensePlateRegion *v3;
  GEOLPRLicensePlateRegion *v4;
  GEOLPRLicensePlateRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateRegion;
  v3 = -[GEOLPRLicensePlateRegion initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)identifier
{
  PBDataReader *reader;
  PBDataReader *v4;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRLicensePlateRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readIdentifier_tags_0);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readMapRegion
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
        GEOLPRLicensePlateRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapRegion
{
  -[GEOLPRLicensePlateRegion _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegionE7)mapRegion
{
  -[GEOLPRLicensePlateRegion _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readLicensePlateInfos
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
        GEOLPRLicensePlateRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicensePlateInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)licensePlateInfos
{
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  return self->_licensePlateInfos;
}

- (void)setLicensePlateInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *licensePlateInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  licensePlateInfos = self->_licensePlateInfos;
  self->_licensePlateInfos = v4;

}

- (void)clearLicensePlateInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_licensePlateInfos, "removeAllObjects");
}

- (void)addLicensePlateInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  -[GEOLPRLicensePlateRegion _addNoFlagsLicensePlateInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLicensePlateInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)licensePlateInfosCount
{
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_licensePlateInfos, "count");
}

- (id)licensePlateInfoAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_licensePlateInfos, "objectAtIndex:", a3);
}

+ (Class)licensePlateInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRegions
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
        GEOLPRLicensePlateRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)regions
{
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  regions = self->_regions;
  self->_regions = v4;

}

- (void)clearRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_regions, "removeAllObjects");
}

- (void)addRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  -[GEOLPRLicensePlateRegion _addNoFlagsRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsRegion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)regionsCount
{
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_regions, "count");
}

- (id)regionAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regions, "objectAtIndex:", a3);
}

+ (Class)regionType
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
  v8.super_class = (Class)GEOLPRLicensePlateRegion;
  -[GEOLPRLicensePlateRegion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLicensePlateRegion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(a1, "mapRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (objc_msgSend(a1[3], "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = a1[3];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("licensePlateInfo");
    else
      v18 = CFSTR("license_plate_info");
    objc_msgSend(v4, "setObject:forKey:", v10, v18);

  }
  if (objc_msgSend(a1[5], "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = a1[5];
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation", (_QWORD)v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v26, (_QWORD)v28);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v22);
    }

    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("region"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLicensePlateRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRLicensePlateRegion)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateRegion *)-[GEOLPRLicensePlateRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOMapRegionE7 *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOLPRLicensePlateInfo *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  GEOLPRRestrictionRegion *v31;
  uint64_t v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
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
      if (a3)
        v8 = CFSTR("mapRegion");
      else
        v8 = CFSTR("map_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOMapRegionE7 alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOMapRegionE7 initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOMapRegionE7 initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setMapRegion:", v11);

      }
      if (a3)
        v13 = CFSTR("licensePlateInfo");
      else
        v13 = CFSTR("license_plate_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = [GEOLPRLicensePlateInfo alloc];
                if ((a3 & 1) != 0)
                  v22 = -[GEOLPRLicensePlateInfo initWithJSON:](v21, "initWithJSON:", v20);
                else
                  v22 = -[GEOLPRLicensePlateInfo initWithDictionary:](v21, "initWithDictionary:", v20);
                v23 = (void *)v22;
                objc_msgSend(a1, "addLicensePlateInfo:", v22);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          }
          while (v17);
        }

        v5 = v35;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v37 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = [GEOLPRRestrictionRegion alloc];
                if ((a3 & 1) != 0)
                  v32 = -[GEOLPRRestrictionRegion initWithJSON:](v31, "initWithJSON:", v30);
                else
                  v32 = -[GEOLPRRestrictionRegion initWithDictionary:](v31, "initWithDictionary:", v30);
                v33 = (void *)v32;
                objc_msgSend(a1, "addRegion:", v32);

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v27);
        }

        v5 = v35;
      }

    }
  }

  return a1;
}

- (GEOLPRLicensePlateRegion)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateRegion *)-[GEOLPRLicensePlateRegion _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_410;
    else
      v8 = (int *)&readAll__nonRecursiveTag_411;
    GEOLPRLicensePlateRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRLicensePlateRegionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateRegionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRLicensePlateRegionIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRLicensePlateRegion readAll:](self, "readAll:", 0);
    PBDataWriterWriteStringField();
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_licensePlateInfos;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_regions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOLPRLicensePlateRegion readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v12, "setIdentifier:", self->_identifier);
  if (self->_mapRegion)
    objc_msgSend(v12, "setMapRegion:");
  if (-[GEOLPRLicensePlateRegion licensePlateInfosCount](self, "licensePlateInfosCount"))
  {
    objc_msgSend(v12, "clearLicensePlateInfos");
    v4 = -[GEOLPRLicensePlateRegion licensePlateInfosCount](self, "licensePlateInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRLicensePlateRegion licensePlateInfoAtIndex:](self, "licensePlateInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addLicensePlateInfo:", v7);

      }
    }
  }
  if (-[GEOLPRLicensePlateRegion regionsCount](self, "regionsCount"))
  {
    objc_msgSend(v12, "clearRegions");
    v8 = -[GEOLPRLicensePlateRegion regionsCount](self, "regionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLPRLicensePlateRegion regionAtIndex:](self, "regionAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addRegion:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLPRLicensePlateRegionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLicensePlateRegion readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[GEOMapRegionE7 copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_licensePlateInfos;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addLicensePlateInfo:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_regions;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addRegion:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  GEOMapRegionE7 *mapRegion;
  NSMutableArray *licensePlateInfos;
  NSMutableArray *regions;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRLicensePlateRegion readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         identifier = self->_identifier,
         !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((mapRegion = self->_mapRegion, !((unint64_t)mapRegion | v4[4]))
     || -[GEOMapRegionE7 isEqual:](mapRegion, "isEqual:"))
    && ((licensePlateInfos = self->_licensePlateInfos, !((unint64_t)licensePlateInfos | v4[3]))
     || -[NSMutableArray isEqual:](licensePlateInfos, "isEqual:")))
  {
    regions = self->_regions;
    if ((unint64_t)regions | v4[5])
      v9 = -[NSMutableArray isEqual:](regions, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOLPRLicensePlateRegion readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[GEOMapRegionE7 hash](self->_mapRegion, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_licensePlateInfos, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_regions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOMapRegionE7 *mapRegion;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[2])
    -[GEOLPRLicensePlateRegion setIdentifier:](self, "setIdentifier:");
  mapRegion = self->_mapRegion;
  v6 = v4[4];
  if (mapRegion)
  {
    if (v6)
      -[GEOMapRegionE7 mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOLPRLicensePlateRegion setMapRegion:](self, "setMapRegion:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v4[3];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[GEOLPRLicensePlateRegion addLicensePlateInfo:](self, "addLicensePlateInfo:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4[5];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[GEOLPRLicensePlateRegion addRegion:](self, "addRegion:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_licensePlateInfos, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
