@implementation GEOAutomobileOptions

- (GEOAutomobileOptions)init
{
  GEOAutomobileOptions *v2;
  GEOAutomobileOptions *v3;
  GEOAutomobileOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAutomobileOptions;
  v2 = -[GEOAutomobileOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAutomobileOptions)initWithData:(id)a3
{
  GEOAutomobileOptions *v3;
  GEOAutomobileOptions *v4;
  GEOAutomobileOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAutomobileOptions;
  v3 = -[GEOAutomobileOptions initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)includeHistoricTravelTime
{
  return self->_includeHistoricTravelTime;
}

- (void)setIncludeHistoricTravelTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_includeHistoricTravelTime = a3;
}

- (void)setHasIncludeHistoricTravelTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncludeHistoricTravelTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)trafficType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_trafficType;
  else
    return 1;
}

- (void)setTrafficType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_trafficType = a3;
}

- (void)setHasTrafficType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasTrafficType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C08580[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrafficType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATIC_SPEEDS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HISTORICAL_SPEEDS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LIVE_SPEEDS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)includeStaticTravelTime
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) == 0 || self->_includeStaticTravelTime;
}

- (void)setIncludeStaticTravelTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_includeStaticTravelTime = a3;
}

- (void)setHasIncludeStaticTravelTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIncludeStaticTravelTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readUserPreferences
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAutomobileOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserPreferences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUserPreferences
{
  -[GEOAutomobileOptions _readUserPreferences]((uint64_t)self);
  return self->_userPreferences != 0;
}

- (GEOUserPreferences)userPreferences
{
  -[GEOAutomobileOptions _readUserPreferences]((uint64_t)self);
  return self->_userPreferences;
}

- (void)setUserPreferences:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_userPreferences, a3);
}

- (void)_readVehicleSpecifications
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAutomobileOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleSpecifications_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasVehicleSpecifications
{
  -[GEOAutomobileOptions _readVehicleSpecifications]((uint64_t)self);
  return self->_vehicleSpecifications != 0;
}

- (GEOVehicleSpecifications)vehicleSpecifications
{
  -[GEOAutomobileOptions _readVehicleSpecifications]((uint64_t)self);
  return self->_vehicleSpecifications;
}

- (void)setVehicleSpecifications:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_vehicleSpecifications, a3);
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
  v8.super_class = (Class)GEOAutomobileOptions;
  -[GEOAutomobileOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAutomobileOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAutomobileOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  unsigned int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
      goto LABEL_4;
LABEL_13:
    v13 = *(_DWORD *)(a1 + 52) - 1;
    if (v13 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C08580[v13];
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("trafficType"));

    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("includeHistoricTravelTime"));

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 1) != 0)
    goto LABEL_13;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("includeStaticTravelTime");
    else
      v7 = CFSTR("include_static_travel_time");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  objc_msgSend((id)a1, "userPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("userPreferences");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("user_preferences");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "vehicleSpecifications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("vehicleSpecifications");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("vehicle_specifications");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

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
      v26[2] = __50__GEOAutomobileOptions__dictionaryRepresentation___block_invoke;
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
  return -[GEOAutomobileOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOAutomobileOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAutomobileOptions)initWithDictionary:(id)a3
{
  return (GEOAutomobileOptions *)-[GEOAutomobileOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOUserPreferences *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOVehicleSpecifications *v19;
  uint64_t v20;
  void *v21;

  v5 = a2;
  if (!a1)
    goto LABEL_39;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_39;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeHistoricTravelTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeHistoricTravelTime:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATIC_SPEEDS")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HISTORICAL_SPEEDS")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("LIVE_SPEEDS")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 1;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_16:
    objc_msgSend(a1, "setTrafficType:", v9);
  }

  if (a3)
    v10 = CFSTR("includeStaticTravelTime");
  else
    v10 = CFSTR("include_static_travel_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeStaticTravelTime:", objc_msgSend(v11, "BOOLValue"));

  if (a3)
    v12 = CFSTR("userPreferences");
  else
    v12 = CFSTR("user_preferences");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOUserPreferences alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOUserPreferences initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOUserPreferences initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setUserPreferences:", v15);

  }
  if (a3)
    v17 = CFSTR("vehicleSpecifications");
  else
    v17 = CFSTR("vehicle_specifications");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOVehicleSpecifications alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOVehicleSpecifications initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOVehicleSpecifications initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setVehicleSpecifications:", v20);

  }
LABEL_39:

  return a1;
}

- (GEOAutomobileOptions)initWithJSON:(id)a3
{
  return (GEOAutomobileOptions *)-[GEOAutomobileOptions _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_706;
    else
      v8 = (int *)&readAll__nonRecursiveTag_707;
    GEOAutomobileOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOUserPreferences readAll:](self->_userPreferences, "readAll:", 1);
    -[GEOVehicleSpecifications readAll:](self->_vehicleSpecifications, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAutomobileOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAutomobileOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAutomobileOptionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAutomobileOptions readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    v6 = v9;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v6 = v9;
    }
    if (self->_userPreferences)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_vehicleSpecifications)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOAutomobileOptions readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v6 + 56) = self->_includeHistoricTravelTime;
    *((_BYTE *)v6 + 60) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 13) = self->_trafficType;
  *((_BYTE *)v6 + 60) |= 1u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v6 + 57) = self->_includeStaticTravelTime;
    *((_BYTE *)v6 + 60) |= 4u;
  }
LABEL_5:
  if (self->_userPreferences)
  {
    objc_msgSend(v6, "setUserPreferences:");
    v4 = v6;
  }
  if (self->_vehicleSpecifications)
  {
    objc_msgSend(v6, "setVehicleSpecifications:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAutomobileOptions readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_BYTE *)(v5 + 56) = self->_includeHistoricTravelTime;
      *(_BYTE *)(v5 + 60) |= 2u;
      flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          v10 = -[GEOUserPreferences copyWithZone:](self->_userPreferences, "copyWithZone:", a3);
          v11 = *(void **)(v5 + 24);
          *(_QWORD *)(v5 + 24) = v10;

          v12 = -[GEOVehicleSpecifications copyWithZone:](self->_vehicleSpecifications, "copyWithZone:", a3);
          v13 = *(void **)(v5 + 32);
          *(_QWORD *)(v5 + 32) = v12;

          v14 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(_BYTE *)(v5 + 57) = self->_includeStaticTravelTime;
        *(_BYTE *)(v5 + 60) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 52) = self->_trafficType;
    *(_BYTE *)(v5 + 60) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOAutomobileOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOUserPreferences *userPreferences;
  GEOVehicleSpecifications *vehicleSpecifications;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOAutomobileOptions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
      goto LABEL_27;
    if (self->_includeHistoricTravelTime)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_trafficType != *((_DWORD *)v4 + 13))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) != 0)
    {
      if (self->_includeStaticTravelTime)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_23;
    }
LABEL_27:
    v7 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
    goto LABEL_27;
LABEL_23:
  userPreferences = self->_userPreferences;
  if ((unint64_t)userPreferences | *((_QWORD *)v4 + 3)
    && !-[GEOUserPreferences isEqual:](userPreferences, "isEqual:"))
  {
    goto LABEL_27;
  }
  vehicleSpecifications = self->_vehicleSpecifications;
  if ((unint64_t)vehicleSpecifications | *((_QWORD *)v4 + 4))
    v7 = -[GEOVehicleSpecifications isEqual:](vehicleSpecifications, "isEqual:");
  else
    v7 = 1;
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[GEOAutomobileOptions readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_includeHistoricTravelTime;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_trafficType;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_includeStaticTravelTime;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[GEOUserPreferences hash](self->_userPreferences, "hash");
  return v6 ^ -[GEOVehicleSpecifications hash](self->_vehicleSpecifications, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOUserPreferences *userPreferences;
  uint64_t v7;
  GEOVehicleSpecifications *vehicleSpecifications;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  v5 = *((_BYTE *)v10 + 60);
  if ((v5 & 2) != 0)
  {
    self->_includeHistoricTravelTime = *((_BYTE *)v10 + 56);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v10 + 60);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v10 + 60) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_trafficType = *((_DWORD *)v10 + 13);
  *(_BYTE *)&self->_flags |= 1u;
  if ((*((_BYTE *)v10 + 60) & 4) != 0)
  {
LABEL_4:
    self->_includeStaticTravelTime = *((_BYTE *)v10 + 57);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_5:
  userPreferences = self->_userPreferences;
  v7 = *((_QWORD *)v10 + 3);
  if (userPreferences)
  {
    if (!v7)
      goto LABEL_14;
    -[GEOUserPreferences mergeFrom:](userPreferences, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_14;
    -[GEOAutomobileOptions setUserPreferences:](self, "setUserPreferences:");
  }
  v4 = v10;
LABEL_14:
  vehicleSpecifications = self->_vehicleSpecifications;
  v9 = v4[4];
  if (vehicleSpecifications)
  {
    if (v9)
    {
      -[GEOVehicleSpecifications mergeFrom:](vehicleSpecifications, "mergeFrom:");
LABEL_19:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[GEOAutomobileOptions setVehicleSpecifications:](self, "setVehicleSpecifications:");
    goto LABEL_19;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOAutomobileOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_710);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAutomobileOptions readAll:](self, "readAll:", 0);
    -[GEOUserPreferences clearUnknownFields:](self->_userPreferences, "clearUnknownFields:", 1);
    -[GEOVehicleSpecifications clearUnknownFields:](self->_vehicleSpecifications, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleSpecifications, 0);
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
