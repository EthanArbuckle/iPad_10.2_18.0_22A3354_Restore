@implementation GEORPNewIncidentDetails

- (GEORPNewIncidentDetails)init
{
  GEORPNewIncidentDetails *v2;
  GEORPNewIncidentDetails *v3;
  GEORPNewIncidentDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPNewIncidentDetails;
  v2 = -[GEORPNewIncidentDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPNewIncidentDetails)initWithData:(id)a3
{
  GEORPNewIncidentDetails *v3;
  GEORPNewIncidentDetails *v4;
  GEORPNewIncidentDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPNewIncidentDetails;
  v3 = -[GEORPNewIncidentDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E1C02C70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANEUVER_CLOSURE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AREA_ADVISORY")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AREA_CLOSURE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONGESTION_ZONE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEED_CHECK")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readUserLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPNewIncidentDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserLocation_tags_281);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasUserLocation
{
  -[GEORPNewIncidentDetails _readUserLocation]((uint64_t)self);
  return self->_userLocation != 0;
}

- (GEORPUserLocationDetails)userLocation
{
  -[GEORPNewIncidentDetails _readUserLocation]((uint64_t)self);
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readIncidentLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPNewIncidentDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentLocation_tags_282);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasIncidentLocation
{
  -[GEORPNewIncidentDetails _readIncidentLocation]((uint64_t)self);
  return self->_incidentLocation != 0;
}

- (GEORPIncidentLocation)incidentLocation
{
  -[GEORPNewIncidentDetails _readIncidentLocation]((uint64_t)self);
  return self->_incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_incidentLocation, a3);
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
  v8.super_class = (Class)GEORPNewIncidentDetails;
  -[GEORPNewIncidentDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPNewIncidentDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPNewIncidentDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v5 = *(int *)(a1 + 44);
      if (v5 >= 0x12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C02C70[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    objc_msgSend((id)a1, "userLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("userLocation");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("user_location");
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "incidentLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("incidentLocation");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("incident_location");
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

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
  return -[GEORPNewIncidentDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPNewIncidentDetails)initWithDictionary:(id)a3
{
  return (GEORPNewIncidentDetails *)-[GEORPNewIncidentDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  GEORPUserLocationDetails *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEORPIncidentLocation *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_62;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_62;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MANEUVER_CLOSURE")) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AREA_ADVISORY")) & 1) != 0)
    {
      v8 = 13;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AREA_CLOSURE")) & 1) != 0)
    {
      v8 = 14;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CONGESTION_ZONE")) & 1) != 0)
    {
      v8 = 15;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SPEED_CHECK")) & 1) != 0)
    {
      v8 = 16;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
    {
      v8 = 17;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_44:
    objc_msgSend(a1, "setType:", v8);
  }

  if (a3)
    v9 = CFSTR("userLocation");
  else
    v9 = CFSTR("user_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEORPUserLocationDetails alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEORPUserLocationDetails initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEORPUserLocationDetails initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setUserLocation:", v12);

  }
  if (a3)
    v14 = CFSTR("incidentLocation");
  else
    v14 = CFSTR("incident_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEORPIncidentLocation alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEORPIncidentLocation initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEORPIncidentLocation initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setIncidentLocation:", v17);

  }
LABEL_62:

  return a1;
}

- (GEORPNewIncidentDetails)initWithJSON:(id)a3
{
  return (GEORPNewIncidentDetails *)-[GEORPNewIncidentDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_284;
    else
      v8 = (int *)&readAll__nonRecursiveTag_285;
    GEORPNewIncidentDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPUserLocationDetails readAll:](self->_userLocation, "readAll:", 1);
    -[GEORPIncidentLocation readAll:](self->_incidentLocation, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPNewIncidentDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPNewIncidentDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPNewIncidentDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPNewIncidentDetails readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_userLocation)
      PBDataWriterWriteSubmessage();
    if (self->_incidentLocation)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPNewIncidentDetailsClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPNewIncidentDetails _readIncidentLocation]((uint64_t)self);
  if (-[GEORPIncidentLocation hasGreenTeaWithValue:](self->_incidentLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPNewIncidentDetails _readUserLocation]((uint64_t)self);
  return -[GEORPUserLocationDetails hasGreenTeaWithValue:](self->_userLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPNewIncidentDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_type;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  if (self->_userLocation)
  {
    objc_msgSend(v5, "setUserLocation:");
    v4 = v5;
  }
  if (self->_incidentLocation)
  {
    objc_msgSend(v5, "setIncidentLocation:");
    v4 = v5;
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
      GEORPNewIncidentDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPNewIncidentDetails readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_type;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[GEORPUserLocationDetails copyWithZone:](self->_userLocation, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEORPIncidentLocation copyWithZone:](self->_incidentLocation, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPUserLocationDetails *userLocation;
  GEORPIncidentLocation *incidentLocation;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEORPNewIncidentDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_type != *((_DWORD *)v4 + 11))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((_QWORD *)v4 + 3)
    && !-[GEORPUserLocationDetails isEqual:](userLocation, "isEqual:"))
  {
    goto LABEL_11;
  }
  incidentLocation = self->_incidentLocation;
  if ((unint64_t)incidentLocation | *((_QWORD *)v4 + 2))
    v7 = -[GEORPIncidentLocation isEqual:](incidentLocation, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  -[GEORPNewIncidentDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[GEORPUserLocationDetails hash](self->_userLocation, "hash") ^ v3;
  return v4 ^ -[GEORPIncidentLocation hash](self->_incidentLocation, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEORPUserLocationDetails *userLocation;
  uint64_t v6;
  GEORPIncidentLocation *incidentLocation;
  uint64_t v8;
  int *v9;

  v9 = (int *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if ((v9[12] & 1) != 0)
  {
    self->_type = v9[11];
    *(_BYTE *)&self->_flags |= 1u;
  }
  userLocation = self->_userLocation;
  v6 = *((_QWORD *)v9 + 3);
  if (userLocation)
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPUserLocationDetails mergeFrom:](userLocation, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPNewIncidentDetails setUserLocation:](self, "setUserLocation:");
  }
  v4 = v9;
LABEL_9:
  incidentLocation = self->_incidentLocation;
  v8 = *((_QWORD *)v4 + 2);
  if (incidentLocation)
  {
    if (v8)
    {
      -[GEORPIncidentLocation mergeFrom:](incidentLocation, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[GEORPNewIncidentDetails setIncidentLocation:](self, "setIncidentLocation:");
    goto LABEL_14;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
