@implementation GEORPIncidentAnnotationDetails

- (GEORPIncidentAnnotationDetails)init
{
  GEORPIncidentAnnotationDetails *v2;
  GEORPIncidentAnnotationDetails *v3;
  GEORPIncidentAnnotationDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPIncidentAnnotationDetails;
  v2 = -[GEORPIncidentAnnotationDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPIncidentAnnotationDetails)initWithData:(id)a3
{
  GEORPIncidentAnnotationDetails *v3;
  GEORPIncidentAnnotationDetails *v4;
  GEORPIncidentAnnotationDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPIncidentAnnotationDetails;
  v3 = -[GEORPIncidentAnnotationDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserLocation
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
        GEORPIncidentAnnotationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUserLocation
{
  -[GEORPIncidentAnnotationDetails _readUserLocation]((uint64_t)self);
  return self->_userLocation != 0;
}

- (GEORPUserLocationDetails)userLocation
{
  -[GEORPIncidentAnnotationDetails _readUserLocation]((uint64_t)self);
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readIncidentId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentAnnotationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIncidentId
{
  -[GEORPIncidentAnnotationDetails _readIncidentId]((uint64_t)self);
  return self->_incidentId != 0;
}

- (NSString)incidentId
{
  -[GEORPIncidentAnnotationDetails _readIncidentId]((uint64_t)self);
  return self->_incidentId;
}

- (void)setIncidentId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_incidentId, a3);
}

- (int)annotationType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_annotationType;
  else
    return 1;
}

- (void)setAnnotationType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_annotationType = a3;
}

- (void)setHasAnnotationType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasAnnotationType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)annotationTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E1C02BC8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAnnotationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOTATION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UP_VOTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOWN_VOTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_UP_VOTE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)incidentType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_incidentType;
  else
    return 0;
}

- (void)setIncidentType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_incidentType = a3;
}

- (void)setHasIncidentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncidentType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)incidentTypeAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E1C02C70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIncidentType:(id)a3
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

- (void)_readIncidentLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentAnnotationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIncidentLocation
{
  -[GEORPIncidentAnnotationDetails _readIncidentLocation]((uint64_t)self);
  return self->_incidentLocation != 0;
}

- (GEOLatLng)incidentLocation
{
  -[GEORPIncidentAnnotationDetails _readIncidentLocation]((uint64_t)self);
  return self->_incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
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
  v8.super_class = (Class)GEORPIncidentAnnotationDetails;
  -[GEORPIncidentAnnotationDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPIncidentAnnotationDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentAnnotationDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  char v11;
  unsigned int v12;
  __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "userLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("userLocation");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("user_location");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend((id)a1, "incidentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("incidentId");
      else
        v10 = CFSTR("incident_id");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    v11 = *(_BYTE *)(a1 + 60);
    if ((v11 & 1) != 0)
    {
      v12 = *(_DWORD *)(a1 + 52) - 1;
      if (v12 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E1C02BC8[v12];
      }
      if (a2)
        v14 = CFSTR("annotationType");
      else
        v14 = CFSTR("annotation_type");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

      v11 = *(_BYTE *)(a1 + 60);
    }
    if ((v11 & 2) != 0)
    {
      v15 = *(int *)(a1 + 56);
      if (v15 >= 0x12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E1C02C70[v15];
      }
      if (a2)
        v17 = CFSTR("incidentType");
      else
        v17 = CFSTR("incident_type");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    objc_msgSend((id)a1, "incidentLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v18, "jsonRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("incidentLocation");
      }
      else
      {
        objc_msgSend(v18, "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("incident_location");
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

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
  return -[GEORPIncidentAnnotationDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentAnnotationDetails)initWithDictionary:(id)a3
{
  return (GEORPIncidentAnnotationDetails *)-[GEORPIncidentAnnotationDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPUserLocationDetails *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  GEOLatLng *v24;
  uint64_t v25;
  void *v26;

  v5 = a2;
  if (!a1)
    goto LABEL_87;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_87;
  if (a3)
    v6 = CFSTR("userLocation");
  else
    v6 = CFSTR("user_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEORPUserLocationDetails alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEORPUserLocationDetails initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEORPUserLocationDetails initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setUserLocation:", v9);

  }
  if (a3)
    v11 = CFSTR("incidentId");
  else
    v11 = CFSTR("incident_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(a1, "setIncidentId:", v13);

  }
  if (a3)
    v14 = CFSTR("annotationType");
  else
    v14 = CFSTR("annotation_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("ANNOTATION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v17 = 1;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("UP_VOTE")) & 1) != 0)
    {
      v17 = 2;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DOWN_VOTE")) & 1) != 0)
    {
      v17 = 3;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("AUTO_UP_VOTE")))
    {
      v17 = 4;
    }
    else
    {
      v17 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_33;
    v17 = objc_msgSend(v15, "intValue");
  }
  objc_msgSend(a1, "setAnnotationType:", v17);
LABEL_33:

  if (a3)
    v18 = CFSTR("incidentType");
  else
    v18 = CFSTR("incident_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
    {
      v21 = 1;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
    {
      v21 = 2;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
    {
      v21 = 3;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
    {
      v21 = 4;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
    {
      v21 = 5;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
    {
      v21 = 6;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
    {
      v21 = 7;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
    {
      v21 = 8;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
    {
      v21 = 9;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
    {
      v21 = 10;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
    {
      v21 = 11;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("MANEUVER_CLOSURE")) & 1) != 0)
    {
      v21 = 12;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("AREA_ADVISORY")) & 1) != 0)
    {
      v21 = 13;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("AREA_CLOSURE")) & 1) != 0)
    {
      v21 = 14;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CONGESTION_ZONE")) & 1) != 0)
    {
      v21 = 15;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SPEED_CHECK")) & 1) != 0)
    {
      v21 = 16;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
    {
      v21 = 17;
    }
    else
    {
      v21 = 0;
    }

    goto LABEL_77;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(v19, "intValue");
LABEL_77:
    objc_msgSend(a1, "setIncidentType:", v21);
  }

  if (a3)
    v22 = CFSTR("incidentLocation");
  else
    v22 = CFSTR("incident_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOLatLng initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOLatLng initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setIncidentLocation:", v25);

  }
LABEL_87:

  return a1;
}

- (GEORPIncidentAnnotationDetails)initWithJSON:(id)a3
{
  return (GEORPIncidentAnnotationDetails *)-[GEORPIncidentAnnotationDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4;
    GEORPIncidentAnnotationDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPUserLocationDetails readAll:](self->_userLocation, "readAll:", 1);
    -[GEOLatLng readAll:](self->_incidentLocation, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentAnnotationDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentAnnotationDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPIncidentAnnotationDetailsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPIncidentAnnotationDetails readAll:](self, "readAll:", 0);
    if (self->_userLocation)
      PBDataWriterWriteSubmessage();
    if (self->_incidentId)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_incidentLocation)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPIncidentAnnotationDetailsClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPIncidentAnnotationDetails _readIncidentLocation]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_incidentLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPIncidentAnnotationDetails _readUserLocation]((uint64_t)self);
  return -[GEORPUserLocationDetails hasGreenTeaWithValue:](self->_userLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEORPIncidentAnnotationDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userLocation)
    objc_msgSend(v6, "setUserLocation:");
  if (self->_incidentId)
    objc_msgSend(v6, "setIncidentId:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_annotationType;
    *((_BYTE *)v6 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_incidentType;
    *((_BYTE *)v6 + 60) |= 2u;
  }
  if (self->_incidentLocation)
  {
    objc_msgSend(v6, "setIncidentLocation:");
    v5 = v6;
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
  uint64_t v11;
  void *v12;
  char flags;
  id v14;

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
      GEORPIncidentAnnotationDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPIncidentAnnotationDetails readAll:](self, "readAll:", 0);
  v9 = -[GEORPUserLocationDetails copyWithZone:](self->_userLocation, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_incidentId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_annotationType;
    *(_BYTE *)(v5 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_incidentType;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v14 = -[GEOLatLng copyWithZone:](self->_incidentLocation, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPUserLocationDetails *userLocation;
  NSString *incidentId;
  GEOLatLng *incidentLocation;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORPIncidentAnnotationDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPUserLocationDetails isEqual:](userLocation, "isEqual:"))
      goto LABEL_18;
  }
  incidentId = self->_incidentId;
  if ((unint64_t)incidentId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](incidentId, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_annotationType != *((_DWORD *)v4 + 13))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_incidentType != *((_DWORD *)v4 + 14))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_18;
  }
  incidentLocation = self->_incidentLocation;
  if ((unint64_t)incidentLocation | *((_QWORD *)v4 + 3))
    v8 = -[GEOLatLng isEqual:](incidentLocation, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEORPIncidentAnnotationDetails readAll:](self, "readAll:", 1);
  v3 = -[GEORPUserLocationDetails hash](self->_userLocation, "hash");
  v4 = -[NSString hash](self->_incidentId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_annotationType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[GEOLatLng hash](self->_incidentLocation, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_incidentType;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[GEOLatLng hash](self->_incidentLocation, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPUserLocationDetails *userLocation;
  uint64_t v6;
  char v7;
  GEOLatLng *incidentLocation;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  userLocation = self->_userLocation;
  v6 = v10[4];
  if (userLocation)
  {
    if (!v6)
      goto LABEL_7;
    -[GEORPUserLocationDetails mergeFrom:](userLocation, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEORPIncidentAnnotationDetails setUserLocation:](self, "setUserLocation:");
  }
  v4 = v10;
LABEL_7:
  if (v4[2])
  {
    -[GEORPIncidentAnnotationDetails setIncidentId:](self, "setIncidentId:");
    v4 = v10;
  }
  v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 1) != 0)
  {
    self->_annotationType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
    v7 = *((_BYTE *)v4 + 60);
  }
  if ((v7 & 2) != 0)
  {
    self->_incidentType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_flags |= 2u;
  }
  incidentLocation = self->_incidentLocation;
  v9 = v4[3];
  if (incidentLocation)
  {
    if (v9)
    {
      -[GEOLatLng mergeFrom:](incidentLocation, "mergeFrom:");
LABEL_18:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[GEORPIncidentAnnotationDetails setIncidentLocation:](self, "setIncidentLocation:");
    goto LABEL_18;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
