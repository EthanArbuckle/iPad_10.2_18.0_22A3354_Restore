@implementation GEOLPRRegion

- (GEOLPRRegion)init
{
  GEOLPRRegion *v2;
  GEOLPRRegion *v3;
  GEOLPRRegion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRegion;
  v2 = -[GEOLPRRegion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRegion)initWithData:(id)a3
{
  GEOLPRRegion *v3;
  GEOLPRRegion *v4;
  GEOLPRRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRegion;
  v3 = -[GEOLPRRegion initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)displayNames
{
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  return self->_displayNames;
}

- (void)setDisplayNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  displayNames = self->_displayNames;
  self->_displayNames = v4;

}

- (void)clearDisplayNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_displayNames, "removeAllObjects");
}

- (void)addDisplayName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  -[GEOLPRRegion _addNoFlagsDisplayName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsDisplayName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)displayNamesCount
{
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  return -[NSMutableArray count](self->_displayNames, "count");
}

- (id)displayNameAtIndex:(unint64_t)a3
{
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayNames, "objectAtIndex:", a3);
}

+ (Class)displayNameType
{
  return (Class)objc_opt_class();
}

- (void)_readSubRegions
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
        GEOLPRRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubRegions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)subRegions
{
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  return self->_subRegions;
}

- (void)setSubRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *subRegions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  subRegions = self->_subRegions;
  self->_subRegions = v4;

}

- (void)clearSubRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_subRegions, "removeAllObjects");
}

- (void)addSubRegions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  -[GEOLPRRegion _addNoFlagsSubRegions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSubRegions:(uint64_t)a1
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

- (unint64_t)subRegionsCount
{
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_subRegions, "count");
}

- (id)subRegionsAtIndex:(unint64_t)a3
{
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_subRegions, "objectAtIndex:", a3);
}

+ (Class)subRegionsType
{
  return (Class)objc_opt_class();
}

- (void)_readInfo
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
        GEOLPRRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInfo_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasInfo
{
  -[GEOLPRRegion _readInfo]((uint64_t)self);
  return self->_info != 0;
}

- (GEOLPRRegionInfo)info
{
  -[GEOLPRRegion _readInfo]((uint64_t)self);
  return self->_info;
}

- (void)setInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_info, a3);
}

- (void)_readRegionBoundingBox
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
        GEOLPRRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionBoundingBox_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRegionBoundingBox
{
  -[GEOLPRRegion _readRegionBoundingBox]((uint64_t)self);
  return self->_regionBoundingBox != 0;
}

- (GEOLPRBoundingBoxE7)regionBoundingBox
{
  -[GEOLPRRegion _readRegionBoundingBox]((uint64_t)self);
  return self->_regionBoundingBox;
}

- (void)setRegionBoundingBox:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_regionBoundingBox, a3);
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
  v8.super_class = (Class)GEOLPRRegion;
  -[GEOLPRRegion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRRegion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[2], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = a1[2];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("displayName");
    else
      v13 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(a1[5], "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = a1[5];
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation", (_QWORD)v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21, (_QWORD)v31);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("subRegions");
    else
      v22 = CFSTR("sub_regions");
    objc_msgSend(v4, "setObject:forKey:", v14, v22, (_QWORD)v31);

  }
  objc_msgSend(a1, "info");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v23, "jsonRepresentation");
    else
      objc_msgSend(v23, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("info"));

  }
  objc_msgSend(a1, "regionBoundingBox");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("regionBoundingBox");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("region_bounding_box");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRRegion)initWithDictionary:(id)a3
{
  return (GEOLPRRegion *)-[GEOLPRRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOLocalizedString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEOLPRRegion *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  GEOLPRRegionInfo *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  GEOLPRBoundingBoxE7 *v34;
  uint64_t v35;
  void *v36;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("displayName");
      else
        v6 = CFSTR("display_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v38 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v44 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOLocalizedString alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOLocalizedString initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOLocalizedString initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addDisplayName:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          }
          while (v10);
        }

        v5 = v38;
      }

      if (a3)
        v17 = CFSTR("subRegions");
      else
        v17 = CFSTR("sub_regions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v40 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOLPRRegion alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOLPRRegion initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOLPRRegion initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addSubRegions:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v21);
        }

        v5 = v38;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = [GEOLPRRegionInfo alloc];
        if ((a3 & 1) != 0)
          v30 = -[GEOLPRRegionInfo initWithJSON:](v29, "initWithJSON:", v28);
        else
          v30 = -[GEOLPRRegionInfo initWithDictionary:](v29, "initWithDictionary:", v28);
        v31 = (void *)v30;
        objc_msgSend(a1, "setInfo:", v30);

      }
      if (a3)
        v32 = CFSTR("regionBoundingBox");
      else
        v32 = CFSTR("region_bounding_box");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = [GEOLPRBoundingBoxE7 alloc];
        if ((a3 & 1) != 0)
          v35 = -[GEOLPRBoundingBoxE7 initWithJSON:](v34, "initWithJSON:", v33);
        else
          v35 = -[GEOLPRBoundingBoxE7 initWithDictionary:](v34, "initWithDictionary:", v33);
        v36 = (void *)v35;
        objc_msgSend(a1, "setRegionBoundingBox:", v35);

      }
    }
  }

  return a1;
}

- (GEOLPRRegion)initWithJSON:(id)a3
{
  return (GEOLPRRegion *)-[GEOLPRRegion _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_265_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_266_0;
    GEOLPRRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRRegionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRegionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOLPRRegionIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOLPRRegion readAll:](self, "readAll:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_displayNames;
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
    v10 = self->_subRegions;
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

    if (self->_info)
      PBDataWriterWriteSubmessage();
    if (self->_regionBoundingBox)
      PBDataWriterWriteSubmessage();
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
  id *v13;

  v13 = (id *)a3;
  -[GEOLPRRegion readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 12) = self->_readerMarkPos;
  *((_DWORD *)v13 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRRegion displayNamesCount](self, "displayNamesCount"))
  {
    objc_msgSend(v13, "clearDisplayNames");
    v4 = -[GEOLPRRegion displayNamesCount](self, "displayNamesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRRegion displayNameAtIndex:](self, "displayNameAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addDisplayName:", v7);

      }
    }
  }
  if (-[GEOLPRRegion subRegionsCount](self, "subRegionsCount"))
  {
    objc_msgSend(v13, "clearSubRegions");
    v8 = -[GEOLPRRegion subRegionsCount](self, "subRegionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLPRRegion subRegionsAtIndex:](self, "subRegionsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubRegions:", v11);

      }
    }
  }
  if (self->_info)
    objc_msgSend(v13, "setInfo:");
  v12 = v13;
  if (self->_regionBoundingBox)
  {
    objc_msgSend(v13, "setRegionBoundingBox:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  void *v19;
  id v20;
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
      GEOLPRRegionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRRegion readAll:](self, "readAll:", 0);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_displayNames;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addDisplayName:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_subRegions;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addSubRegions:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

  v18 = -[GEOLPRRegionInfo copyWithZone:](self->_info, "copyWithZone:", a3);
  v19 = (void *)v5[3];
  v5[3] = v18;

  v20 = -[GEOLPRBoundingBoxE7 copyWithZone:](self->_regionBoundingBox, "copyWithZone:", a3);
  v21 = (void *)v5[4];
  v5[4] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *displayNames;
  NSMutableArray *subRegions;
  GEOLPRRegionInfo *info;
  GEOLPRBoundingBoxE7 *regionBoundingBox;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRRegion readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         displayNames = self->_displayNames,
         !((unint64_t)displayNames | v4[2]))
     || -[NSMutableArray isEqual:](displayNames, "isEqual:"))
    && ((subRegions = self->_subRegions, !((unint64_t)subRegions | v4[5]))
     || -[NSMutableArray isEqual:](subRegions, "isEqual:"))
    && ((info = self->_info, !((unint64_t)info | v4[3])) || -[GEOLPRRegionInfo isEqual:](info, "isEqual:")))
  {
    regionBoundingBox = self->_regionBoundingBox;
    if ((unint64_t)regionBoundingBox | v4[4])
      v9 = -[GEOLPRBoundingBoxE7 isEqual:](regionBoundingBox, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  -[GEOLPRRegion readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_displayNames, "hash");
  v4 = -[NSMutableArray hash](self->_subRegions, "hash") ^ v3;
  v5 = -[GEOLPRRegionInfo hash](self->_info, "hash");
  return v4 ^ v5 ^ -[GEOLPRBoundingBoxE7 hash](self->_regionBoundingBox, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  GEOLPRRegionInfo *info;
  id v16;
  GEOLPRBoundingBoxE7 *regionBoundingBox;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        -[GEOLPRRegion addDisplayName:](self, "addDisplayName:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v4[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[GEOLPRRegion addSubRegions:](self, "addSubRegions:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v12);
  }

  info = self->_info;
  v16 = v4[3];
  if (info)
  {
    if (v16)
      -[GEOLPRRegionInfo mergeFrom:](info, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOLPRRegion setInfo:](self, "setInfo:");
  }
  regionBoundingBox = self->_regionBoundingBox;
  v18 = v4[4];
  if (regionBoundingBox)
  {
    if (v18)
      -[GEOLPRBoundingBoxE7 mergeFrom:](regionBoundingBox, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEOLPRRegion setRegionBoundingBox:](self, "setRegionBoundingBox:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRegions, 0);
  objc_storeStrong((id *)&self->_regionBoundingBox, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
