@implementation GEOTransitStepUpdate

- (GEOTransitStepUpdate)init
{
  GEOTransitStepUpdate *v2;
  GEOTransitStepUpdate *v3;
  GEOTransitStepUpdate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitStepUpdate;
  v2 = -[GEOTransitStepUpdate init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitStepUpdate)initWithData:(id)a3
{
  GEOTransitStepUpdate *v3;
  GEOTransitStepUpdate *v4;
  GEOTransitStepUpdate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitStepUpdate;
  v3 = -[GEOTransitStepUpdate initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUpdateIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUpdateIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUpdateIdentifier
{
  -[GEOTransitStepUpdate _readUpdateIdentifier]((uint64_t)self);
  return self->_updateIdentifier != 0;
}

- (NSData)updateIdentifier
{
  -[GEOTransitStepUpdate _readUpdateIdentifier]((uint64_t)self);
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (void)_readInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasInstructions
{
  -[GEOTransitStepUpdate _readInstructions]((uint64_t)self);
  return self->_instructions != 0;
}

- (GEOInstructionSet)instructions
{
  -[GEOTransitStepUpdate _readInstructions]((uint64_t)self);
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (void)_readVehiclePositionInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehiclePositionInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehiclePositionInfo
{
  -[GEOTransitStepUpdate _readVehiclePositionInfo]((uint64_t)self);
  return self->_vehiclePositionInfo != 0;
}

- (GEOTransitVehiclePositionInfo)vehiclePositionInfo
{
  -[GEOTransitStepUpdate _readVehiclePositionInfo]((uint64_t)self);
  return self->_vehiclePositionInfo;
}

- (void)setVehiclePositionInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_vehiclePositionInfo, a3);
}

- (void)_readScheduleInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScheduleInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasScheduleInfo
{
  -[GEOTransitStepUpdate _readScheduleInfo]((uint64_t)self);
  return self->_scheduleInfo != 0;
}

- (GEOTransitScheduleInfo)scheduleInfo
{
  -[GEOTransitStepUpdate _readScheduleInfo]((uint64_t)self);
  return self->_scheduleInfo;
}

- (void)setScheduleInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_scheduleInfo, a3);
}

- (void)_readBoardingInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBoardingInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasBoardingInfo
{
  -[GEOTransitStepUpdate _readBoardingInfo]((uint64_t)self);
  return self->_boardingInfo != 0;
}

- (GEOTransitBoardingInfo)boardingInfo
{
  -[GEOTransitStepUpdate _readBoardingInfo]((uint64_t)self);
  return self->_boardingInfo;
}

- (void)setBoardingInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_boardingInfo, a3);
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
  v8.super_class = (Class)GEOTransitStepUpdate;
  -[GEOTransitStepUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitStepUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitStepUpdate _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("updateIdentifier"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("update_identifier"));
    }
  }

  objc_msgSend(a1, "instructions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("instructions"));

  }
  objc_msgSend(a1, "vehiclePositionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("vehiclePositionInfo");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("vehicle_position_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend(a1, "scheduleInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("scheduleInfo");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("schedule_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  objc_msgSend(a1, "boardingInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("boardingInfo");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("boarding_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = (void *)a1[2];
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __50__GEOTransitStepUpdate__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitStepUpdate _dictionaryRepresentation:](self, 1);
}

void __50__GEOTransitStepUpdate__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitStepUpdate)initWithDictionary:(id)a3
{
  return (GEOTransitStepUpdate *)-[GEOTransitStepUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOInstructionSet *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  GEOTransitVehiclePositionInfo *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOTransitScheduleInfo *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOTransitBoardingInfo *v25;
  uint64_t v26;
  void *v27;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("updateIdentifier");
      else
        v6 = CFSTR("update_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        objc_msgSend(a1, "setUpdateIdentifier:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOInstructionSet alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOInstructionSet initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOInstructionSet initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setInstructions:", v11);

      }
      if (a3)
        v13 = CFSTR("vehiclePositionInfo");
      else
        v13 = CFSTR("vehicle_position_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOTransitVehiclePositionInfo alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOTransitVehiclePositionInfo initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOTransitVehiclePositionInfo initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setVehiclePositionInfo:", v16);

      }
      if (a3)
        v18 = CFSTR("scheduleInfo");
      else
        v18 = CFSTR("schedule_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOTransitScheduleInfo alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOTransitScheduleInfo initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOTransitScheduleInfo initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setScheduleInfo:", v21);

      }
      if (a3)
        v23 = CFSTR("boardingInfo");
      else
        v23 = CFSTR("boarding_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOTransitBoardingInfo alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOTransitBoardingInfo initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOTransitBoardingInfo initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setBoardingInfo:", v26);

      }
    }
  }

  return a1;
}

- (GEOTransitStepUpdate)initWithJSON:(id)a3
{
  return (GEOTransitStepUpdate *)-[GEOTransitStepUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_475;
    else
      v8 = (int *)&readAll__nonRecursiveTag_476;
    GEOTransitStepUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitStepUpdateCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitStepUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitStepUpdateReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitStepUpdateIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitStepUpdate readAll:](self, "readAll:", 0);
    if (self->_updateIdentifier)
      PBDataWriterWriteDataField();
    v5 = v8;
    if (self->_instructions)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_vehiclePositionInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_scheduleInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_boardingInfo)
    {
      PBDataWriterWriteSubmessage();
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
  -[GEOTransitStepUpdate readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_updateIdentifier)
    objc_msgSend(v5, "setUpdateIdentifier:");
  if (self->_instructions)
    objc_msgSend(v5, "setInstructions:");
  v4 = v5;
  if (self->_vehiclePositionInfo)
  {
    objc_msgSend(v5, "setVehiclePositionInfo:");
    v4 = v5;
  }
  if (self->_scheduleInfo)
  {
    objc_msgSend(v5, "setScheduleInfo:");
    v4 = v5;
  }
  if (self->_boardingInfo)
  {
    objc_msgSend(v5, "setBoardingInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitStepUpdate readAll:](self, "readAll:", 0);
    v8 = -[NSData copyWithZone:](self->_updateIdentifier, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v8;

    v10 = -[GEOInstructionSet copyWithZone:](self->_instructions, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[GEOTransitVehiclePositionInfo copyWithZone:](self->_vehiclePositionInfo, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v12;

    v14 = -[GEOTransitScheduleInfo copyWithZone:](self->_scheduleInfo, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    v16 = -[GEOTransitBoardingInfo copyWithZone:](self->_boardingInfo, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOTransitStepUpdateReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *updateIdentifier;
  GEOInstructionSet *instructions;
  GEOTransitVehiclePositionInfo *vehiclePositionInfo;
  GEOTransitScheduleInfo *scheduleInfo;
  GEOTransitBoardingInfo *boardingInfo;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTransitStepUpdate readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         updateIdentifier = self->_updateIdentifier,
         !((unint64_t)updateIdentifier | v4[6]))
     || -[NSData isEqual:](updateIdentifier, "isEqual:"))
    && ((instructions = self->_instructions, !((unint64_t)instructions | v4[4]))
     || -[GEOInstructionSet isEqual:](instructions, "isEqual:"))
    && ((vehiclePositionInfo = self->_vehiclePositionInfo, !((unint64_t)vehiclePositionInfo | v4[7]))
     || -[GEOTransitVehiclePositionInfo isEqual:](vehiclePositionInfo, "isEqual:"))
    && ((scheduleInfo = self->_scheduleInfo, !((unint64_t)scheduleInfo | v4[5]))
     || -[GEOTransitScheduleInfo isEqual:](scheduleInfo, "isEqual:")))
  {
    boardingInfo = self->_boardingInfo;
    if ((unint64_t)boardingInfo | v4[3])
      v10 = -[GEOTransitBoardingInfo isEqual:](boardingInfo, "isEqual:");
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
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[GEOTransitStepUpdate readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_updateIdentifier, "hash");
  v4 = -[GEOInstructionSet hash](self->_instructions, "hash") ^ v3;
  v5 = -[GEOTransitVehiclePositionInfo hash](self->_vehiclePositionInfo, "hash");
  v6 = v4 ^ v5 ^ -[GEOTransitScheduleInfo hash](self->_scheduleInfo, "hash");
  return v6 ^ -[GEOTransitBoardingInfo hash](self->_boardingInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOInstructionSet *instructions;
  uint64_t v5;
  GEOTransitVehiclePositionInfo *vehiclePositionInfo;
  uint64_t v7;
  GEOTransitScheduleInfo *scheduleInfo;
  uint64_t v9;
  GEOTransitBoardingInfo *boardingInfo;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  if (v12[6])
    -[GEOTransitStepUpdate setUpdateIdentifier:](self, "setUpdateIdentifier:");
  instructions = self->_instructions;
  v5 = v12[4];
  if (instructions)
  {
    if (v5)
      -[GEOInstructionSet mergeFrom:](instructions, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOTransitStepUpdate setInstructions:](self, "setInstructions:");
  }
  vehiclePositionInfo = self->_vehiclePositionInfo;
  v7 = v12[7];
  if (vehiclePositionInfo)
  {
    if (v7)
      -[GEOTransitVehiclePositionInfo mergeFrom:](vehiclePositionInfo, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOTransitStepUpdate setVehiclePositionInfo:](self, "setVehiclePositionInfo:");
  }
  scheduleInfo = self->_scheduleInfo;
  v9 = v12[5];
  if (scheduleInfo)
  {
    if (v9)
      -[GEOTransitScheduleInfo mergeFrom:](scheduleInfo, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOTransitStepUpdate setScheduleInfo:](self, "setScheduleInfo:");
  }
  boardingInfo = self->_boardingInfo;
  v11 = v12[3];
  if (boardingInfo)
  {
    if (v11)
      -[GEOTransitBoardingInfo mergeFrom:](boardingInfo, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOTransitStepUpdate setBoardingInfo:](self, "setBoardingInfo:");
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
      GEOTransitStepUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_479);
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
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitStepUpdate readAll:](self, "readAll:", 0);
    -[GEOInstructionSet clearUnknownFields:](self->_instructions, "clearUnknownFields:", 1);
    -[GEOTransitVehiclePositionInfo clearUnknownFields:](self->_vehiclePositionInfo, "clearUnknownFields:", 1);
    -[GEOTransitScheduleInfo clearUnknownFields:](self->_scheduleInfo, "clearUnknownFields:", 1);
    -[GEOTransitBoardingInfo clearUnknownFields:](self->_boardingInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehiclePositionInfo, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleInfo, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_boardingInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
