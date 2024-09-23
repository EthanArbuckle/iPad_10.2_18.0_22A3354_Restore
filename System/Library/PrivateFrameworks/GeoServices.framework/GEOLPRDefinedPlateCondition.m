@implementation GEOLPRDefinedPlateCondition

- (GEOLPRDefinedPlateCondition)init
{
  GEOLPRDefinedPlateCondition *v2;
  GEOLPRDefinedPlateCondition *v3;
  GEOLPRDefinedPlateCondition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRDefinedPlateCondition;
  v2 = -[GEOLPRDefinedPlateCondition init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRDefinedPlateCondition)initWithData:(id)a3
{
  GEOLPRDefinedPlateCondition *v3;
  GEOLPRDefinedPlateCondition *v4;
  GEOLPRDefinedPlateCondition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRDefinedPlateCondition;
  v3 = -[GEOLPRDefinedPlateCondition initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVehicleTypeKeys
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
        GEOLPRDefinedPlateConditionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleTypeKeys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)vehicleTypeKeys
{
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  return self->_vehicleTypeKeys;
}

- (void)setVehicleTypeKeys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *vehicleTypeKeys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  vehicleTypeKeys = self->_vehicleTypeKeys;
  self->_vehicleTypeKeys = v4;

}

- (void)clearVehicleTypeKeys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_vehicleTypeKeys, "removeAllObjects");
}

- (void)addVehicleTypeKey:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRDefinedPlateCondition _addNoFlagsVehicleTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsVehicleTypeKey:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)vehicleTypeKeysCount
{
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_vehicleTypeKeys, "count");
}

- (id)vehicleTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateCondition _readVehicleTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_vehicleTypeKeys, "objectAtIndex:", a3);
}

+ (Class)vehicleTypeKeyType
{
  return (Class)objc_opt_class();
}

- (void)_readPowerTypeKeys
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
        GEOLPRDefinedPlateConditionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPowerTypeKeys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)powerTypeKeys
{
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  return self->_powerTypeKeys;
}

- (void)setPowerTypeKeys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *powerTypeKeys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  powerTypeKeys = self->_powerTypeKeys;
  self->_powerTypeKeys = v4;

}

- (void)clearPowerTypeKeys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_powerTypeKeys, "removeAllObjects");
}

- (void)addPowerTypeKey:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  -[GEOLPRDefinedPlateCondition _addNoFlagsPowerTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPowerTypeKey:(uint64_t)a1
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

- (unint64_t)powerTypeKeysCount
{
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_powerTypeKeys, "count");
}

- (id)powerTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateCondition _readPowerTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_powerTypeKeys, "objectAtIndex:", a3);
}

+ (Class)powerTypeKeyType
{
  return (Class)objc_opt_class();
}

- (void)_readPlateMatchConditions
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
        GEOLPRDefinedPlateConditionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlateMatchConditions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)plateMatchConditions
{
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  return self->_plateMatchConditions;
}

- (void)setPlateMatchConditions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *plateMatchConditions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  plateMatchConditions = self->_plateMatchConditions;
  self->_plateMatchConditions = v4;

}

- (void)clearPlateMatchConditions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_plateMatchConditions, "removeAllObjects");
}

- (void)addPlateMatchCondition:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  -[GEOLPRDefinedPlateCondition _addNoFlagsPlateMatchCondition:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPlateMatchCondition:(uint64_t)a1
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

- (unint64_t)plateMatchConditionsCount
{
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  return -[NSMutableArray count](self->_plateMatchConditions, "count");
}

- (id)plateMatchConditionAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateCondition _readPlateMatchConditions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_plateMatchConditions, "objectAtIndex:", a3);
}

+ (Class)plateMatchConditionType
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
  v8.super_class = (Class)GEOLPRDefinedPlateCondition;
  -[GEOLPRDefinedPlateCondition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRDefinedPlateCondition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRDefinedPlateCondition _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)a1, "vehicleTypeKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("vehicleTypeKey");
    else
      v6 = CFSTR("vehicle_type_key");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend((id)a1, "powerTypeKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("powerTypeKey");
    else
      v8 = CFSTR("power_type_key");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = *(id *)(a1 + 16);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16, (_QWORD)v19);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("plateMatchCondition");
    else
      v17 = CFSTR("plate_match_condition");
    objc_msgSend(v4, "setObject:forKey:", v9, v17, (_QWORD)v19);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRDefinedPlateCondition _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRDefinedPlateCondition)initWithDictionary:(id)a3
{
  return (GEOLPRDefinedPlateCondition *)-[GEOLPRDefinedPlateCondition _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  GEOLPRPlateMatchCondition *v32;
  uint64_t v33;
  void *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("vehicleTypeKey");
      else
        v6 = CFSTR("vehicle_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v46 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = (void *)objc_msgSend(v13, "copy");
                objc_msgSend(a1, "addVehicleTypeKey:", v14);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v15 = CFSTR("powerTypeKey");
      else
        v15 = CFSTR("power_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v42;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v42 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = (void *)objc_msgSend(v22, "copy");
                objc_msgSend(a1, "addPowerTypeKey:", v23);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v19);
        }

      }
      if (a3)
        v24 = CFSTR("plateMatchCondition");
      else
        v24 = CFSTR("plate_match_condition");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v5;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v38;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v38 != v29)
                objc_enumerationMutation(v26);
              v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = [GEOLPRPlateMatchCondition alloc];
                if ((a3 & 1) != 0)
                  v33 = -[GEOLPRPlateMatchCondition initWithJSON:](v32, "initWithJSON:", v31);
                else
                  v33 = -[GEOLPRPlateMatchCondition initWithDictionary:](v32, "initWithDictionary:", v31);
                v34 = (void *)v33;
                objc_msgSend(a1, "addPlateMatchCondition:", v33);

              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          }
          while (v28);
        }

        v5 = v36;
      }

    }
  }

  return a1;
}

- (GEOLPRDefinedPlateCondition)initWithJSON:(id)a3
{
  return (GEOLPRDefinedPlateCondition *)-[GEOLPRDefinedPlateCondition _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_14;
    else
      v8 = (int *)&readAll__nonRecursiveTag_14;
    GEOLPRDefinedPlateConditionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRDefinedPlateConditionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRDefinedPlateConditionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRDefinedPlateConditionReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRDefinedPlateCondition readAll:](self, "readAll:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_vehicleTypeKeys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_powerTypeKeys;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_plateMatchConditions;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id *v16;

  v16 = (id *)a3;
  -[GEOLPRDefinedPlateCondition readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 10) = self->_readerMarkPos;
  *((_DWORD *)v16 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRDefinedPlateCondition vehicleTypeKeysCount](self, "vehicleTypeKeysCount"))
  {
    objc_msgSend(v16, "clearVehicleTypeKeys");
    v4 = -[GEOLPRDefinedPlateCondition vehicleTypeKeysCount](self, "vehicleTypeKeysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRDefinedPlateCondition vehicleTypeKeyAtIndex:](self, "vehicleTypeKeyAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addVehicleTypeKey:", v7);

      }
    }
  }
  if (-[GEOLPRDefinedPlateCondition powerTypeKeysCount](self, "powerTypeKeysCount"))
  {
    objc_msgSend(v16, "clearPowerTypeKeys");
    v8 = -[GEOLPRDefinedPlateCondition powerTypeKeysCount](self, "powerTypeKeysCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLPRDefinedPlateCondition powerTypeKeyAtIndex:](self, "powerTypeKeyAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addPowerTypeKey:", v11);

      }
    }
  }
  if (-[GEOLPRDefinedPlateCondition plateMatchConditionsCount](self, "plateMatchConditionsCount"))
  {
    objc_msgSend(v16, "clearPlateMatchConditions");
    v12 = -[GEOLPRDefinedPlateCondition plateMatchConditionsCount](self, "plateMatchConditionsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOLPRDefinedPlateCondition plateMatchConditionAtIndex:](self, "plateMatchConditionAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addPlateMatchCondition:", v15);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
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
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRDefinedPlateConditionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRDefinedPlateCondition readAll:](self, "readAll:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_vehicleTypeKeys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addVehicleTypeKey:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_powerTypeKeys;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addPowerTypeKey:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v14);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_plateMatchConditions;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v5, "addPlateMatchCondition:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v19);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *vehicleTypeKeys;
  NSMutableArray *powerTypeKeys;
  NSMutableArray *plateMatchConditions;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRDefinedPlateCondition readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         vehicleTypeKeys = self->_vehicleTypeKeys,
         !((unint64_t)vehicleTypeKeys | v4[4]))
     || -[NSMutableArray isEqual:](vehicleTypeKeys, "isEqual:"))
    && ((powerTypeKeys = self->_powerTypeKeys, !((unint64_t)powerTypeKeys | v4[3]))
     || -[NSMutableArray isEqual:](powerTypeKeys, "isEqual:")))
  {
    plateMatchConditions = self->_plateMatchConditions;
    if ((unint64_t)plateMatchConditions | v4[2])
      v8 = -[NSMutableArray isEqual:](plateMatchConditions, "isEqual:");
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

  -[GEOLPRDefinedPlateCondition readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_vehicleTypeKeys, "hash");
  v4 = -[NSMutableArray hash](self->_powerTypeKeys, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_plateMatchConditions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[GEOLPRDefinedPlateCondition addVehicleTypeKey:](self, "addVehicleTypeKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4[3];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[GEOLPRDefinedPlateCondition addPowerTypeKey:](self, "addPowerTypeKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4[2];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[GEOLPRDefinedPlateCondition addPlateMatchCondition:](self, "addPlateMatchCondition:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_powerTypeKeys, 0);
  objc_storeStrong((id *)&self->_plateMatchConditions, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
