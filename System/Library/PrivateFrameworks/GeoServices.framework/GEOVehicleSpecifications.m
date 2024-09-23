@implementation GEOVehicleSpecifications

- (GEOVehicleSpecifications)init
{
  GEOVehicleSpecifications *v2;
  GEOVehicleSpecifications *v3;
  GEOVehicleSpecifications *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVehicleSpecifications;
  v2 = -[GEOVehicleSpecifications init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVehicleSpecifications)initWithData:(id)a3
{
  GEOVehicleSpecifications *v3;
  GEOVehicleSpecifications *v4;
  GEOVehicleSpecifications *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVehicleSpecifications;
  v3 = -[GEOVehicleSpecifications initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLprInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVehicleSpecificationsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLprInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLprInfo
{
  -[GEOVehicleSpecifications _readLprInfo]((uint64_t)self);
  return self->_lprInfo != 0;
}

- (GEOLPRInfo)lprInfo
{
  -[GEOVehicleSpecifications _readLprInfo]((uint64_t)self);
  return self->_lprInfo;
}

- (void)setLprInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_lprInfo, a3);
}

- (void)_readEvInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVehicleSpecificationsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvInfo_tags_7292);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEvInfo
{
  -[GEOVehicleSpecifications _readEvInfo]((uint64_t)self);
  return self->_evInfo != 0;
}

- (GEOEVInfo)evInfo
{
  -[GEOVehicleSpecifications _readEvInfo]((uint64_t)self);
  return self->_evInfo;
}

- (void)setEvInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_evInfo, a3);
}

- (void)_readVehicleInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVehicleSpecificationsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasVehicleInfo
{
  -[GEOVehicleSpecifications _readVehicleInfo]((uint64_t)self);
  return self->_vehicleInfo != 0;
}

- (GEOVehicleInfo)vehicleInfo
{
  -[GEOVehicleSpecifications _readVehicleInfo]((uint64_t)self);
  return self->_vehicleInfo;
}

- (void)setVehicleInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_vehicleInfo, a3);
}

- (int)lprPlateMissingReason
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_lprPlateMissingReason;
  else
    return 1;
}

- (void)setLprPlateMissingReason:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_lprPlateMissingReason = a3;
}

- (void)setHasLprPlateMissingReason:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasLprPlateMissingReason
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)lprPlateMissingReasonAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C08840[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLprPlateMissingReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSELECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_RULES_APPLY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNABLE_TO_MASK_PLATE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)GEOVehicleSpecifications;
  -[GEOVehicleSpecifications description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVehicleSpecifications dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVehicleSpecifications _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  unsigned int v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "lprInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("lprInfo");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("lpr_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "evInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("evInfo");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("ev_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "vehicleInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("vehicleInfo");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("vehicle_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v17 = *(_DWORD *)(a1 + 60) - 1;
    if (v17 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E1C08840[v17];
    }
    if (a2)
      v19 = CFSTR("lprPlateMissingReason");
    else
      v19 = CFSTR("lpr_plate_missing_reason");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __54__GEOVehicleSpecifications__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVehicleSpecifications _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOVehicleSpecifications__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOVehicleSpecifications)initWithDictionary:(id)a3
{
  return (GEOVehicleSpecifications *)-[GEOVehicleSpecifications _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLPRInfo *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOEVInfo *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOVehicleInfo *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("lprInfo");
      else
        v6 = CFSTR("lpr_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLPRInfo alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLPRInfo initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLPRInfo initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setLprInfo:", v9);

      }
      if (a3)
        v11 = CFSTR("evInfo");
      else
        v11 = CFSTR("ev_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOEVInfo alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOEVInfo initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOEVInfo initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setEvInfo:", v14);

      }
      if (a3)
        v16 = CFSTR("vehicleInfo");
      else
        v16 = CFSTR("vehicle_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOVehicleInfo alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOVehicleInfo initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOVehicleInfo initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setVehicleInfo:", v19);

      }
      if (a3)
        v21 = CFSTR("lprPlateMissingReason");
      else
        v21 = CFSTR("lpr_plate_missing_reason");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("UNSELECTED")) & 1) != 0)
        {
          v24 = 1;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("NO_RULES_APPLY")) & 1) != 0)
        {
          v24 = 2;
        }
        else if (objc_msgSend(v23, "isEqualToString:", CFSTR("UNABLE_TO_MASK_PLATE")))
        {
          v24 = 3;
        }
        else
        {
          v24 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_42:

          goto LABEL_43;
        }
        v24 = objc_msgSend(v22, "intValue");
      }
      objc_msgSend(a1, "setLprPlateMissingReason:", v24);
      goto LABEL_42;
    }
  }
LABEL_43:

  return a1;
}

- (GEOVehicleSpecifications)initWithJSON:(id)a3
{
  return (GEOVehicleSpecifications *)-[GEOVehicleSpecifications _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7308;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7309;
    GEOVehicleSpecificationsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLPRInfo readAll:](self->_lprInfo, "readAll:", 1);
    -[GEOEVInfo readAll:](self->_evInfo, "readAll:", 1);
    -[GEOVehicleInfo readAll:](self->_vehicleInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVehicleSpecificationsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVehicleSpecificationsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVehicleSpecificationsIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVehicleSpecifications readAll:](self, "readAll:", 0);
    if (self->_lprInfo)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_evInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_vehicleInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOVehicleSpecifications readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_lprInfo)
    objc_msgSend(v5, "setLprInfo:");
  if (self->_evInfo)
    objc_msgSend(v5, "setEvInfo:");
  v4 = v5;
  if (self->_vehicleInfo)
  {
    objc_msgSend(v5, "setVehicleInfo:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_lprPlateMissingReason;
    *((_BYTE *)v4 + 64) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  PBUnknownFields *v15;

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
      GEOVehicleSpecificationsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVehicleSpecifications readAll:](self, "readAll:", 0);
  v9 = -[GEOLPRInfo copyWithZone:](self->_lprInfo, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOEVInfo copyWithZone:](self->_evInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOVehicleInfo copyWithZone:](self->_vehicleInfo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_lprPlateMissingReason;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLPRInfo *lprInfo;
  GEOEVInfo *evInfo;
  GEOVehicleInfo *vehicleInfo;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOVehicleSpecifications readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  lprInfo = self->_lprInfo;
  if ((unint64_t)lprInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLPRInfo isEqual:](lprInfo, "isEqual:"))
      goto LABEL_12;
  }
  evInfo = self->_evInfo;
  if ((unint64_t)evInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOEVInfo isEqual:](evInfo, "isEqual:"))
      goto LABEL_12;
  }
  vehicleInfo = self->_vehicleInfo;
  if ((unint64_t)vehicleInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOVehicleInfo isEqual:](vehicleInfo, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) != 0 && self->_lprPlateMissingReason == *((_DWORD *)v4 + 15))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOVehicleSpecifications readAll:](self, "readAll:", 1);
  v3 = -[GEOLPRInfo hash](self->_lprInfo, "hash");
  v4 = -[GEOEVInfo hash](self->_evInfo, "hash");
  v5 = -[GEOVehicleInfo hash](self->_vehicleInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_lprPlateMissingReason;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLPRInfo *lprInfo;
  uint64_t v6;
  GEOEVInfo *evInfo;
  uint64_t v8;
  GEOVehicleInfo *vehicleInfo;
  uint64_t v10;
  _QWORD *v11;

  v11 = a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  lprInfo = self->_lprInfo;
  v6 = v11[4];
  if (lprInfo)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLPRInfo mergeFrom:](lprInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOVehicleSpecifications setLprInfo:](self, "setLprInfo:");
  }
  v4 = v11;
LABEL_7:
  evInfo = self->_evInfo;
  v8 = v4[3];
  if (evInfo)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOEVInfo mergeFrom:](evInfo, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOVehicleSpecifications setEvInfo:](self, "setEvInfo:");
  }
  v4 = v11;
LABEL_13:
  vehicleInfo = self->_vehicleInfo;
  v10 = v4[5];
  if (vehicleInfo)
  {
    if (!v10)
      goto LABEL_19;
    -[GEOVehicleInfo mergeFrom:](vehicleInfo, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[GEOVehicleSpecifications setVehicleInfo:](self, "setVehicleInfo:");
  }
  v4 = v11;
LABEL_19:
  if ((v4[8] & 1) != 0)
  {
    self->_lprPlateMissingReason = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOVehicleSpecificationsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7312);
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
  *(_BYTE *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOVehicleSpecifications readAll:](self, "readAll:", 0);
    -[GEOLPRInfo clearUnknownFields:](self->_lprInfo, "clearUnknownFields:", 1);
    -[GEOEVInfo clearUnknownFields:](self->_evInfo, "clearUnknownFields:", 1);
    -[GEOVehicleInfo clearUnknownFields:](self->_vehicleInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleInfo, 0);
  objc_storeStrong((id *)&self->_lprInfo, 0);
  objc_storeStrong((id *)&self->_evInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
