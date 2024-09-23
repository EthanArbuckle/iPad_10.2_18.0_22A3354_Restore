@implementation GEOLPRRoot

- (GEOLPRRoot)init
{
  GEOLPRRoot *v2;
  GEOLPRRoot *v3;
  GEOLPRRoot *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRoot;
  v2 = -[GEOLPRRoot init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRoot)initWithData:(id)a3
{
  GEOLPRRoot *v3;
  GEOLPRRoot *v4;
  GEOLPRRoot *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRoot;
  v3 = -[GEOLPRRoot initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRootReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegions_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)regions
{
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  regions = self->_regions;
  self->_regions = v4;

}

- (void)clearRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_regions, "removeAllObjects");
}

- (void)addRegions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  -[GEOLPRRoot _addNoFlagsRegions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsRegions:(uint64_t)a1
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

- (unint64_t)regionsCount
{
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_regions, "count");
}

- (id)regionsAtIndex:(unint64_t)a3
{
  -[GEOLPRRoot _readRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regions, "objectAtIndex:", a3);
}

+ (Class)regionsType
{
  return (Class)objc_opt_class();
}

- (void)_readPowerTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRootReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPowerTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableDictionary)powerTypes
{
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  return self->_powerTypes;
}

- (void)setPowerTypes:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *powerTypes;

  v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  powerTypes = self->_powerTypes;
  self->_powerTypes = v4;

}

- (void)clearPowerTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableDictionary removeAllObjects](self->_powerTypes, "removeAllObjects");
}

- (void)setPowerTypesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  -[GEOLPRRoot _setNoFlagsPowerTypesValue:forKey:]((uint64_t)self, v7, v6);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_setNoFlagsPowerTypesValue:(void *)a3 forKey:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(void **)(a1 + 16);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v7;

      v6 = *(void **)(a1 + 16);
    }
    objc_msgSend(v6, "setObject:forKey:", v9, v5);
  }

}

- (id)powerTypesForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  -[NSMutableDictionary objectForKey:](self->_powerTypes, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumeratePowerTypesUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_powerTypes, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (unint64_t)powerTypesCount
{
  -[GEOLPRRoot _readPowerTypes]((uint64_t)self);
  return -[NSMutableDictionary count](self->_powerTypes, "count");
}

+ (Class)powerTypesType
{
  return (Class)objc_opt_class();
}

- (void)_readVehicleTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRootReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableDictionary)vehicleTypes
{
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  return self->_vehicleTypes;
}

- (void)setVehicleTypes:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *vehicleTypes;

  v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  vehicleTypes = self->_vehicleTypes;
  self->_vehicleTypes = v4;

}

- (void)clearVehicleTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableDictionary removeAllObjects](self->_vehicleTypes, "removeAllObjects");
}

- (void)setVehicleTypesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  -[GEOLPRRoot _setNoFlagsVehicleTypesValue:forKey:]((uint64_t)self, v7, v6);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_setNoFlagsVehicleTypesValue:(void *)a3 forKey:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(void **)(a1 + 32);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v7;

      v6 = *(void **)(a1 + 32);
    }
    objc_msgSend(v6, "setObject:forKey:", v9, v5);
  }

}

- (id)vehicleTypesForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  -[NSMutableDictionary objectForKey:](self->_vehicleTypes, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateVehicleTypesUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_vehicleTypes, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (unint64_t)vehicleTypesCount
{
  -[GEOLPRRoot _readVehicleTypes]((uint64_t)self);
  return -[NSMutableDictionary count](self->_vehicleTypes, "count");
}

+ (Class)vehicleTypesType
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
  v8.super_class = (Class)GEOLPRRoot;
  -[GEOLPRRoot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRRoot dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRoot _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  id v20;
  id v21;
  const __CFString *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  char v29;
  _QWORD v30[4];
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[3], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = a1[3];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("regions"));
  }
  v13 = objc_msgSend(a1[2], "count");
  v14 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
    v16 = a1[2];
    v30[0] = v14;
    v30[1] = 3221225472;
    v30[2] = __40__GEOLPRRoot__dictionaryRepresentation___block_invoke;
    v30[3] = &unk_1E1C10AB0;
    v31 = v15;
    v32 = a2;
    v17 = v15;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v30);
    if (a2)
      v18 = CFSTR("powerTypes");
    else
      v18 = CFSTR("power_types");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  if (objc_msgSend(a1[4], "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
    v20 = a1[4];
    v24 = v14;
    v25 = 3221225472;
    v26 = __40__GEOLPRRoot__dictionaryRepresentation___block_invoke_2;
    v27 = &unk_1E1C10AD8;
    v28 = v19;
    v29 = a2;
    v21 = v19;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", &v24);
    if (a2)
      v22 = CFSTR("vehicleTypes");
    else
      v22 = CFSTR("vehicle_types");
    objc_msgSend(v4, "setObject:forKey:", v21, v22, v24, v25, v26, v27);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRRoot _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

void __40__GEOLPRRoot__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  int v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a2;
  if (v5)
    objc_msgSend(a3, "jsonRepresentation");
  else
    objc_msgSend(a3, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

void __40__GEOLPRRoot__dictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  int v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a2;
  if (v5)
    objc_msgSend(a3, "jsonRepresentation");
  else
    objc_msgSend(a3, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

- (GEOLPRRoot)initWithDictionary:(id)a3
{
  return (GEOLPRRoot *)-[GEOLPRRoot _initWithDictionary:isJSON:](self, a3, 0);
}

- (_QWORD)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOLPRRegion *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  GEOLPRPowerType *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  GEOLPRVehicleType *v41;
  int v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (_QWORD *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("regions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v55 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEOLPRRegion alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEOLPRRegion initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEOLPRRegion initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addRegions:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
          }
          while (v9);
        }

      }
      if (a3)
        v16 = CFSTR("powerTypes");
      else
        v16 = CFSTR("power_types");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v45 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = a3;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)a1[2];
        a1[2] = v18;

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v20 = v17;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v51 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
              objc_msgSend(v20, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)a1[2];
              v28 = -[GEOLPRPowerType initWithDictionary:]([GEOLPRPowerType alloc], "initWithDictionary:", v26);
              objc_msgSend(v27, "setObject:forKey:", v28, v25);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v22);
        }

        v5 = v45;
        a3 = v43;
      }

      if (a3)
        v29 = CFSTR("vehicleTypes");
      else
        v29 = CFSTR("vehicle_types");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)a1[4];
        a1[4] = v31;

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = v30;
        v33 = v30;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v47;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v47 != v36)
                objc_enumerationMutation(v33);
              v38 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
              objc_msgSend(v33, "objectForKeyedSubscript:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (void *)a1[4];
              v41 = -[GEOLPRVehicleType initWithDictionary:]([GEOLPRVehicleType alloc], "initWithDictionary:", v39);
              objc_msgSend(v40, "setObject:forKey:", v41, v38);

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          }
          while (v35);
        }

        v30 = v44;
        v5 = v45;
      }

    }
  }

  return a1;
}

- (GEOLPRRoot)initWithJSON:(id)a3
{
  return (GEOLPRRoot *)-[GEOLPRRoot _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_56;
    else
      v8 = (int *)&readAll__nonRecursiveTag_56;
    GEOLPRRootReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRRootCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRootIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRootReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableDictionary *powerTypes;
  uint64_t v11;
  id v12;
  NSMutableDictionary *vehicleTypes;
  PBDataReader *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRRootIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOLPRRoot readAll:](self, "readAll:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_regions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    powerTypes = self->_powerTypes;
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __22__GEOLPRRoot_writeTo___block_invoke;
    v18[3] = &unk_1E1C10B00;
    v12 = v4;
    v19 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](powerTypes, "enumerateKeysAndObjectsUsingBlock:", v18);

    vehicleTypes = self->_vehicleTypes;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __22__GEOLPRRoot_writeTo___block_invoke_2;
    v16[3] = &unk_1E1C10B28;
    v17 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vehicleTypes, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
}

uint64_t __22__GEOLPRRoot_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

uint64_t __22__GEOLPRRoot_writeTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id *v10;
  id v11;
  id v12;
  NSMutableDictionary *powerTypes;
  unint64_t v14;
  id *v15;
  id v16;
  id v17;
  NSMutableDictionary *vehicleTypes;
  id *v19;
  _QWORD v20[4];
  id *v21;
  _QWORD v22[4];
  id *v23;

  v19 = (id *)a3;
  -[GEOLPRRoot readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v19 + 1, self->_reader);
  *((_DWORD *)v19 + 10) = self->_readerMarkPos;
  *((_DWORD *)v19 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRRoot regionsCount](self, "regionsCount"))
  {
    objc_msgSend(v19, "clearRegions");
    v4 = -[GEOLPRRoot regionsCount](self, "regionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRRoot regionsAtIndex:](self, "regionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addRegions:", v7);

      }
    }
  }
  v8 = -[GEOLPRRoot powerTypesCount](self, "powerTypesCount");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(v19, "clearPowerTypes");
    v10 = v19;
    if (!v19[2])
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = v19[2];
      v19[2] = v11;

      v10 = v19;
    }
    powerTypes = self->_powerTypes;
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __21__GEOLPRRoot_copyTo___block_invoke;
    v22[3] = &unk_1E1C10B00;
    v23 = v10;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](powerTypes, "enumerateKeysAndObjectsUsingBlock:", v22);

  }
  v14 = -[GEOLPRRoot vehicleTypesCount](self, "vehicleTypesCount");
  v15 = v19;
  if (v14)
  {
    objc_msgSend(v19, "clearVehicleTypes");
    if (!v19[4])
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = v19[4];
      v19[4] = v16;

    }
    vehicleTypes = self->_vehicleTypes;
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __21__GEOLPRRoot_copyTo___block_invoke_2;
    v20[3] = &unk_1E1C10B28;
    v21 = v19;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vehicleTypes, "enumerateKeysAndObjectsUsingBlock:", v20);

    v15 = v19;
  }

}

void __21__GEOLPRRoot_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v6, v5);

}

void __21__GEOLPRRoot_copyTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  _QWORD *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSMutableDictionary *powerTypes;
  id v19;
  void *v20;
  NSMutableDictionary *vehicleTypes;
  _QWORD v23[4];
  _QWORD *v24;
  _NSZone *v25;
  _QWORD v26[4];
  _QWORD *v27;
  _NSZone *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRRootReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = v5;
      objc_sync_exit(v7);

LABEL_16:
      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRRoot readAll:](self, "readAll:", 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_regions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addRegions:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

  v14 = -[NSMutableDictionary count](self->_powerTypes, "count");
  v15 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    objc_msgSend(v5, "clearPowerTypes");
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = (void *)v5[2];
    v5[2] = v16;

    powerTypes = self->_powerTypes;
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __27__GEOLPRRoot_copyWithZone___block_invoke;
    v26[3] = &unk_1E1C10B50;
    v28 = a3;
    v27 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](powerTypes, "enumerateKeysAndObjectsUsingBlock:", v26);

  }
  if (-[NSMutableDictionary count](self->_vehicleTypes, "count"))
  {
    objc_msgSend(v5, "clearVehicleTypes");
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = (void *)v5[4];
    v5[4] = v19;

    vehicleTypes = self->_vehicleTypes;
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __27__GEOLPRRoot_copyWithZone___block_invoke_2;
    v23[3] = &unk_1E1C10B78;
    v25 = a3;
    v24 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vehicleTypes, "enumerateKeysAndObjectsUsingBlock:", v23);
    v8 = v24;
    goto LABEL_16;
  }
  return v5;
}

void __27__GEOLPRRoot_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v7, v6);

}

void __27__GEOLPRRoot_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v7, v6);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *regions;
  NSMutableDictionary *powerTypes;
  NSMutableDictionary *vehicleTypes;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRRoot readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         regions = self->_regions,
         !((unint64_t)regions | v4[3]))
     || -[NSMutableArray isEqual:](regions, "isEqual:"))
    && ((powerTypes = self->_powerTypes, !((unint64_t)powerTypes | v4[2]))
     || -[NSMutableDictionary isEqual:](powerTypes, "isEqual:")))
  {
    vehicleTypes = self->_vehicleTypes;
    if ((unint64_t)vehicleTypes | v4[4])
      v8 = -[NSMutableDictionary isEqual:](vehicleTypes, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLPRRoot readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_regions, "hash");
  v4 = -[NSMutableDictionary hash](self->_powerTypes, "hash") ^ v3;
  return v4 ^ -[NSMutableDictionary hash](self->_vehicleTypes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *powerTypes;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *vehicleTypes;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4[3];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[GEOLPRRoot addRegions:](self, "addRegions:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9++), (_QWORD)v16);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (v4[2])
  {
    powerTypes = self->_powerTypes;
    if (powerTypes)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](powerTypes, "addEntriesFromDictionary:");
    }
    else
    {
      v11 = (NSMutableDictionary *)objc_msgSend(v4[2], "copy");
      v12 = self->_powerTypes;
      self->_powerTypes = v11;

    }
  }
  if (v4[4])
  {
    vehicleTypes = self->_vehicleTypes;
    if (vehicleTypes)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](vehicleTypes, "addEntriesFromDictionary:");
    }
    else
    {
      v14 = (NSMutableDictionary *)objc_msgSend(v4[4], "copy");
      v15 = self->_vehicleTypes;
      self->_vehicleTypes = v14;

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypes, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
