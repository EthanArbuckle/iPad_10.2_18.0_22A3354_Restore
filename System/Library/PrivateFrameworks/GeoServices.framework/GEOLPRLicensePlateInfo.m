@implementation GEOLPRLicensePlateInfo

- (GEOLPRLicensePlateInfo)init
{
  GEOLPRLicensePlateInfo *v2;
  GEOLPRLicensePlateInfo *v3;
  GEOLPRLicensePlateInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateInfo;
  v2 = -[GEOLPRLicensePlateInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateInfo)initWithData:(id)a3
{
  GEOLPRLicensePlateInfo *v3;
  GEOLPRLicensePlateInfo *v4;
  GEOLPRLicensePlateInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateInfo;
  v3 = -[GEOLPRLicensePlateInfo initWithData:](&v7, sel_initWithData_, a3);
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
        GEOLPRLicensePlateInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleTypeKeys_tags_361);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)vehicleTypeKeys
{
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
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

- (void)addVehicleTypeKeys:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateInfo _addNoFlagsVehicleTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsVehicleTypeKeys:(uint64_t)a1
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
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_vehicleTypeKeys, "count");
}

- (id)vehicleTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateInfo _readVehicleTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_vehicleTypeKeys, "objectAtIndex:", a3);
}

+ (Class)vehicleTypeKeysType
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
        GEOLPRLicensePlateInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPowerTypeKeys_tags_362);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)powerTypeKeys
{
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
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

- (void)addPowerTypeKeys:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateInfo _addNoFlagsPowerTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPowerTypeKeys:(uint64_t)a1
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
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_powerTypeKeys, "count");
}

- (id)powerTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateInfo _readPowerTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_powerTypeKeys, "objectAtIndex:", a3);
}

+ (Class)powerTypeKeysType
{
  return (Class)objc_opt_class();
}

- (void)_readLicensePlateStructure
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
        GEOLPRLicensePlateInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicensePlateStructure_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLicensePlateStructure
{
  -[GEOLPRLicensePlateInfo _readLicensePlateStructure]((uint64_t)self);
  return self->_licensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)licensePlateStructure
{
  -[GEOLPRLicensePlateInfo _readLicensePlateStructure]((uint64_t)self);
  return self->_licensePlateStructure;
}

- (void)setLicensePlateStructure:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_licensePlateStructure, a3);
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
  v8.super_class = (Class)GEOLPRLicensePlateInfo;
  -[GEOLPRLicensePlateInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLicensePlateInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[4])
    {
      objc_msgSend(a1, "vehicleTypeKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("vehicleTypeKeys");
      else
        v6 = CFSTR("vehicle_type_keys");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    if (a1[3])
    {
      objc_msgSend(a1, "powerTypeKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v8 = CFSTR("powerTypeKeys");
      else
        v8 = CFSTR("power_type_keys");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "licensePlateStructure");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("licensePlateStructure");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("license_plate_structure");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLicensePlateInfo _dictionaryRepresentation:](self, 1);
}

- (GEOLPRLicensePlateInfo)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateInfo *)-[GEOLPRLicensePlateInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOLPRLicensePlateStructure *v26;
  uint64_t v27;
  void *v28;
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
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("vehicleTypeKeys");
      else
        v6 = CFSTR("vehicle_type_keys");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v35 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = (void *)objc_msgSend(v13, "copy");
                objc_msgSend(a1, "addVehicleTypeKeys:", v14);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v15 = CFSTR("powerTypeKeys");
      else
        v15 = CFSTR("power_type_keys");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = (void *)objc_msgSend(v22, "copy", (_QWORD)v30);
                objc_msgSend(a1, "addPowerTypeKeys:", v23);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v19);
        }

      }
      if (a3)
        v24 = CFSTR("licensePlateStructure");
      else
        v24 = CFSTR("license_plate_structure");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24, (_QWORD)v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = [GEOLPRLicensePlateStructure alloc];
        if ((a3 & 1) != 0)
          v27 = -[GEOLPRLicensePlateStructure initWithJSON:](v26, "initWithJSON:", v25);
        else
          v27 = -[GEOLPRLicensePlateStructure initWithDictionary:](v26, "initWithDictionary:", v25);
        v28 = (void *)v27;
        objc_msgSend(a1, "setLicensePlateStructure:", v27);

      }
    }
  }

  return a1;
}

- (GEOLPRLicensePlateInfo)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateInfo *)-[GEOLPRLicensePlateInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_375;
    else
      v8 = (int *)&readAll__nonRecursiveTag_376;
    GEOLPRLicensePlateInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLPRLicensePlateStructure readAll:](self->_licensePlateStructure, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEOLPRLicensePlateInfoIsDirty((uint64_t)self))
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
    -[GEOLPRLicensePlateInfo readAll:](self, "readAll:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_vehicleTypeKeys;
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
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_powerTypeKeys;
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
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_licensePlateStructure)
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

  v12 = (id *)a3;
  -[GEOLPRLicensePlateInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRLicensePlateInfo vehicleTypeKeysCount](self, "vehicleTypeKeysCount"))
  {
    objc_msgSend(v12, "clearVehicleTypeKeys");
    v4 = -[GEOLPRLicensePlateInfo vehicleTypeKeysCount](self, "vehicleTypeKeysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRLicensePlateInfo vehicleTypeKeysAtIndex:](self, "vehicleTypeKeysAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addVehicleTypeKeys:", v7);

      }
    }
  }
  if (-[GEOLPRLicensePlateInfo powerTypeKeysCount](self, "powerTypeKeysCount"))
  {
    objc_msgSend(v12, "clearPowerTypeKeys");
    v8 = -[GEOLPRLicensePlateInfo powerTypeKeysCount](self, "powerTypeKeysCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLPRLicensePlateInfo powerTypeKeysAtIndex:](self, "powerTypeKeysAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addPowerTypeKeys:", v11);

      }
    }
  }
  if (self->_licensePlateStructure)
    objc_msgSend(v12, "setLicensePlateStructure:");

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
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
      GEOLPRLicensePlateInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLicensePlateInfo readAll:](self, "readAll:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_vehicleTypeKeys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addVehicleTypeKeys:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_powerTypeKeys;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addPowerTypeKeys:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  v18 = -[GEOLPRLicensePlateStructure copyWithZone:](self->_licensePlateStructure, "copyWithZone:", a3);
  v19 = (void *)v5[2];
  v5[2] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *vehicleTypeKeys;
  NSMutableArray *powerTypeKeys;
  GEOLPRLicensePlateStructure *licensePlateStructure;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRLicensePlateInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         vehicleTypeKeys = self->_vehicleTypeKeys,
         !((unint64_t)vehicleTypeKeys | v4[4]))
     || -[NSMutableArray isEqual:](vehicleTypeKeys, "isEqual:"))
    && ((powerTypeKeys = self->_powerTypeKeys, !((unint64_t)powerTypeKeys | v4[3]))
     || -[NSMutableArray isEqual:](powerTypeKeys, "isEqual:")))
  {
    licensePlateStructure = self->_licensePlateStructure;
    if ((unint64_t)licensePlateStructure | v4[2])
      v8 = -[GEOLPRLicensePlateStructure isEqual:](licensePlateStructure, "isEqual:");
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

  -[GEOLPRLicensePlateInfo readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_vehicleTypeKeys, "hash");
  v4 = -[NSMutableArray hash](self->_powerTypeKeys, "hash") ^ v3;
  return v4 ^ -[GEOLPRLicensePlateStructure hash](self->_licensePlateStructure, "hash");
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
  GEOLPRLicensePlateStructure *licensePlateStructure;
  id v16;
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
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[GEOLPRLicensePlateInfo addVehicleTypeKeys:](self, "addVehicleTypeKeys:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v4[3];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[GEOLPRLicensePlateInfo addPowerTypeKeys:](self, "addPowerTypeKeys:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  licensePlateStructure = self->_licensePlateStructure;
  v16 = v4[2];
  if (licensePlateStructure)
  {
    if (v16)
      -[GEOLPRLicensePlateStructure mergeFrom:](licensePlateStructure, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOLPRLicensePlateInfo setLicensePlateStructure:](self, "setLicensePlateStructure:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_powerTypeKeys, 0);
  objc_storeStrong((id *)&self->_licensePlateStructure, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
