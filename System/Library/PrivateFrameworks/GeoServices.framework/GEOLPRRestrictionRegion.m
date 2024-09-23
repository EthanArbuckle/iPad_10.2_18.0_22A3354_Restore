@implementation GEOLPRRestrictionRegion

- (GEOLPRRestrictionRegion)init
{
  GEOLPRRestrictionRegion *v2;
  GEOLPRRestrictionRegion *v3;
  GEOLPRRestrictionRegion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRestrictionRegion;
  v2 = -[GEOLPRRestrictionRegion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRestrictionRegion)initWithData:(id)a3
{
  GEOLPRRestrictionRegion *v3;
  GEOLPRRestrictionRegion *v4;
  GEOLPRRestrictionRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRestrictionRegion;
  v3 = -[GEOLPRRestrictionRegion initWithData:](&v7, sel_initWithData_, a3);
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
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRRestrictionRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readIdentifier_tags_529);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRestrictionRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  -[GEOLPRRestrictionRegion _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOLPRRestrictionRegion _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRestrictionRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_530);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapRegion
{
  -[GEOLPRRestrictionRegion _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegionE7)mapRegion
{
  -[GEOLPRRestrictionRegion _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readDefinedPlateTypes
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
        GEOLPRRestrictionRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDefinedPlateTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)definedPlateTypes
{
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  return self->_definedPlateTypes;
}

- (void)setDefinedPlateTypes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *definedPlateTypes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  definedPlateTypes = self->_definedPlateTypes;
  self->_definedPlateTypes = v4;

}

- (void)clearDefinedPlateTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_definedPlateTypes, "removeAllObjects");
}

- (void)addDefinedPlateTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  -[GEOLPRRestrictionRegion _addNoFlagsDefinedPlateTypes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsDefinedPlateTypes:(uint64_t)a1
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

- (unint64_t)definedPlateTypesCount
{
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  return -[NSMutableArray count](self->_definedPlateTypes, "count");
}

- (id)definedPlateTypesAtIndex:(unint64_t)a3
{
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_definedPlateTypes, "objectAtIndex:", a3);
}

+ (Class)definedPlateTypesType
{
  return (Class)objc_opt_class();
}

- (void)_readConvertRules
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRestrictionRegionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readConvertRules_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)convertRules
{
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  return self->_convertRules;
}

- (void)setConvertRules:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *convertRules;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  convertRules = self->_convertRules;
  self->_convertRules = v4;

}

- (void)clearConvertRules
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_convertRules, "removeAllObjects");
}

- (void)addConvertRule:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  -[GEOLPRRestrictionRegion _addNoFlagsConvertRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsConvertRule:(uint64_t)a1
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

- (unint64_t)convertRulesCount
{
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  return -[NSMutableArray count](self->_convertRules, "count");
}

- (id)convertRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_convertRules, "objectAtIndex:", a3);
}

+ (Class)convertRuleType
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
  v8.super_class = (Class)GEOLPRRestrictionRegion;
  -[GEOLPRRestrictionRegion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRRestrictionRegion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRestrictionRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const __CFString *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("name"));

  objc_msgSend(a1, "mapRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(a1[3], "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = a1[3];
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("definedPlateTypes");
    else
      v19 = CFSTR("defined_plate_types");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  if (objc_msgSend(a1[2], "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = a1[2];
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation", (_QWORD)v30);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27, (_QWORD)v30);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("convertRule");
    else
      v28 = CFSTR("convert_rule");
    objc_msgSend(v4, "setObject:forKey:", v20, v28, (_QWORD)v30);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRRestrictionRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRRestrictionRegion)initWithDictionary:(id)a3
{
  return (GEOLPRRestrictionRegion *)-[GEOLPRRestrictionRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOMapRegionE7 *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  GEOLPRDefinedPlateType *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  GEOLPRLPRConvertRule *v34;
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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setIdentifier:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setName:", v9);

      }
      if (a3)
        v10 = CFSTR("mapRegion");
      else
        v10 = CFSTR("map_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOMapRegionE7 alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOMapRegionE7 initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOMapRegionE7 initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setMapRegion:", v13);

      }
      if (a3)
        v15 = CFSTR("definedPlateTypes");
      else
        v15 = CFSTR("defined_plate_types");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v38 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v44 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = [GEOLPRDefinedPlateType alloc];
                if ((a3 & 1) != 0)
                  v24 = -[GEOLPRDefinedPlateType initWithJSON:](v23, "initWithJSON:", v22);
                else
                  v24 = -[GEOLPRDefinedPlateType initWithDictionary:](v23, "initWithDictionary:", v22);
                v25 = (void *)v24;
                objc_msgSend(a1, "addDefinedPlateTypes:", v24);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          }
          while (v19);
        }

        v5 = v38;
      }

      if (a3)
        v26 = CFSTR("convertRule");
      else
        v26 = CFSTR("convert_rule");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v28 = v27;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v40 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v34 = [GEOLPRLPRConvertRule alloc];
                if ((a3 & 1) != 0)
                  v35 = -[GEOLPRLPRConvertRule initWithJSON:](v34, "initWithJSON:", v33);
                else
                  v35 = -[GEOLPRLPRConvertRule initWithDictionary:](v34, "initWithDictionary:", v33);
                v36 = (void *)v35;
                objc_msgSend(a1, "addConvertRule:", v35);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v30);
        }

        v5 = v38;
      }

    }
  }

  return a1;
}

- (GEOLPRRestrictionRegion)initWithJSON:(id)a3
{
  return (GEOLPRRestrictionRegion *)-[GEOLPRRestrictionRegion _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_543;
    else
      v8 = (int *)&readAll__nonRecursiveTag_544;
    GEOLPRRestrictionRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRRestrictionRegionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRestrictionRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRestrictionRegionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOLPRRestrictionRegionIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOLPRRestrictionRegion readAll:](self, "readAll:", 0);
    PBDataWriterWriteStringField();
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_definedPlateTypes;
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
    v10 = self->_convertRules;
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
  -[GEOLPRRestrictionRegion readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 14) = self->_readerMarkPos;
  *((_DWORD *)v12 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v12, "setIdentifier:", self->_identifier);
  if (self->_name)
    objc_msgSend(v12, "setName:");
  if (self->_mapRegion)
    objc_msgSend(v12, "setMapRegion:");
  if (-[GEOLPRRestrictionRegion definedPlateTypesCount](self, "definedPlateTypesCount"))
  {
    objc_msgSend(v12, "clearDefinedPlateTypes");
    v4 = -[GEOLPRRestrictionRegion definedPlateTypesCount](self, "definedPlateTypesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRRestrictionRegion definedPlateTypesAtIndex:](self, "definedPlateTypesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDefinedPlateTypes:", v7);

      }
    }
  }
  if (-[GEOLPRRestrictionRegion convertRulesCount](self, "convertRulesCount"))
  {
    objc_msgSend(v12, "clearConvertRules");
    v8 = -[GEOLPRRestrictionRegion convertRulesCount](self, "convertRulesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLPRRestrictionRegion convertRuleAtIndex:](self, "convertRuleAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addConvertRule:", v11);

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
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRRestrictionRegionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRRestrictionRegion readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[GEOMapRegionE7 copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_definedPlateTypes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addDefinedPlateTypes:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = self->_convertRules;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addConvertRule:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *name;
  GEOMapRegionE7 *mapRegion;
  NSMutableArray *definedPlateTypes;
  NSMutableArray *convertRules;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRRestrictionRegion readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         identifier = self->_identifier,
         !((unint64_t)identifier | v4[4]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((name = self->_name, !((unint64_t)name | v4[6])) || -[NSString isEqual:](name, "isEqual:"))
    && ((mapRegion = self->_mapRegion, !((unint64_t)mapRegion | v4[5]))
     || -[GEOMapRegionE7 isEqual:](mapRegion, "isEqual:"))
    && ((definedPlateTypes = self->_definedPlateTypes, !((unint64_t)definedPlateTypes | v4[3]))
     || -[NSMutableArray isEqual:](definedPlateTypes, "isEqual:")))
  {
    convertRules = self->_convertRules;
    if ((unint64_t)convertRules | v4[2])
      v10 = -[NSMutableArray isEqual:](convertRules, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOLPRRestrictionRegion readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[GEOMapRegionE7 hash](self->_mapRegion, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_definedPlateTypes, "hash");
  return v6 ^ -[NSMutableArray hash](self->_convertRules, "hash");
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
  if (v4[4])
    -[GEOLPRRestrictionRegion setIdentifier:](self, "setIdentifier:");
  if (v4[6])
    -[GEOLPRRestrictionRegion setName:](self, "setName:");
  mapRegion = self->_mapRegion;
  v6 = v4[5];
  if (mapRegion)
  {
    if (v6)
      -[GEOMapRegionE7 mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOLPRRestrictionRegion setMapRegion:](self, "setMapRegion:");
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
        -[GEOLPRRestrictionRegion addDefinedPlateTypes:](self, "addDefinedPlateTypes:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4[2];
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
        -[GEOLPRRestrictionRegion addConvertRule:](self, "addConvertRule:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_definedPlateTypes, 0);
  objc_storeStrong((id *)&self->_convertRules, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
