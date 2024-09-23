@implementation GEORPFeedbackLayoutConfigParameters

- (GEORPFeedbackLayoutConfigParameters)init
{
  GEORPFeedbackLayoutConfigParameters *v2;
  GEORPFeedbackLayoutConfigParameters *v3;
  GEORPFeedbackLayoutConfigParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackLayoutConfigParameters;
  v2 = -[GEORPFeedbackLayoutConfigParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackLayoutConfigParameters)initWithData:(id)a3
{
  GEORPFeedbackLayoutConfigParameters *v3;
  GEORPFeedbackLayoutConfigParameters *v4;
  GEORPFeedbackLayoutConfigParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackLayoutConfigParameters;
  v3 = -[GEORPFeedbackLayoutConfigParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)formType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_formType;
  else
    return 0;
}

- (void)setFormType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_formType = a3;
}

- (void)setHasFormType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasFormType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)formTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C134E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFormType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_WORKFLOW")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_ADD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_EDIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_ADD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_GROUNDVIEW")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_NEW_INCIDENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_IMAGE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackLayoutConfigParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_8);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapRegion
{
  -[GEORPFeedbackLayoutConfigParameters _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEORPFeedbackLayoutConfigParameters _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackLayoutConfigParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinate_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCoordinate
{
  -[GEORPFeedbackLayoutConfigParameters _readCoordinate]((uint64_t)self);
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPFeedbackLayoutConfigParameters _readCoordinate]((uint64_t)self);
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackLayoutConfigParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsId
{
  -[GEORPFeedbackLayoutConfigParameters _readMapsId]((uint64_t)self);
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEORPFeedbackLayoutConfigParameters _readMapsId]((uint64_t)self);
  return self->_mapsId;
}

- (void)setMapsId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_mapsId, a3);
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
  v8.super_class = (Class)GEORPFeedbackLayoutConfigParameters;
  -[GEORPFeedbackLayoutConfigParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackLayoutConfigParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLayoutConfigParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      v5 = *(int *)(a1 + 52);
      if (v5 >= 0xA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C134E8[v5];
      }
      if (a2)
        v7 = CFSTR("formType");
      else
        v7 = CFSTR("form_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "mapRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "jsonRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("mapRegion");
      }
      else
      {
        objc_msgSend(v8, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("map_region");
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    objc_msgSend((id)a1, "coordinate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v12, "jsonRepresentation");
      else
        objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("coordinate"));

    }
    objc_msgSend((id)a1, "mapsId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "jsonRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("mapsId");
      }
      else
      {
        objc_msgSend(v15, "dictionaryRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("maps_id");
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

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
  return -[GEORPFeedbackLayoutConfigParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackLayoutConfigParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLayoutConfigParameters *)-[GEORPFeedbackLayoutConfigParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEOMapRegion *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  GEOLatLng *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOPDMapsIdentifier *v21;
  uint64_t v22;
  void *v23;

  v5 = a2;
  if (!a1)
    goto LABEL_54;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_54;
  if (a3)
    v6 = CFSTR("formType");
  else
    v6 = CFSTR("form_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_WORKFLOW")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_ADD")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_EDIT")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_ADD")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_GROUNDVIEW")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_NEW_INCIDENT")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_IMAGE")) & 1) != 0)
    {
      v9 = 8;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING")))
    {
      v9 = 9;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_31:
    objc_msgSend(a1, "setFormType:", v9);
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
    v12 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEOMapRegion initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEOMapRegion initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setMapRegion:", v13);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEOLatLng initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEOLatLng initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setCoordinate:", v17);

  }
  if (a3)
    v19 = CFSTR("mapsId");
  else
    v19 = CFSTR("maps_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEOPDMapsIdentifier initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEOPDMapsIdentifier initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(a1, "setMapsId:", v22);

  }
LABEL_54:

  return a1;
}

- (GEORPFeedbackLayoutConfigParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackLayoutConfigParameters *)-[GEORPFeedbackLayoutConfigParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_68;
    else
      v8 = (int *)&readAll__nonRecursiveTag_68;
    GEORPFeedbackLayoutConfigParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOMapRegion readAll:](self->_mapRegion, "readAll:", 1);
    -[GEOLatLng readAll:](self->_coordinate, "readAll:", 1);
    -[GEOPDMapsIdentifier readAll:](self->_mapsId, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLayoutConfigParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLayoutConfigParametersReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEORPFeedbackLayoutConfigParameters readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    if (self->_coordinate)
      PBDataWriterWriteSubmessage();
    if (self->_mapsId)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackLayoutConfigParameters _readCoordinate]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_coordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackLayoutConfigParameters _readMapRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackLayoutConfigParameters _readMapsId]((uint64_t)self);
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackLayoutConfigParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_formType;
    *((_BYTE *)v5 + 56) |= 1u;
  }
  if (self->_mapRegion)
  {
    objc_msgSend(v5, "setMapRegion:");
    v4 = v5;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v5, "setCoordinate:");
    v4 = v5;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v5, "setMapsId:");
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
  void *v12;
  id v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEORPFeedbackLayoutConfigParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackLayoutConfigParameters readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_formType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v9 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *mapRegion;
  GEOLatLng *coordinate;
  GEOPDMapsIdentifier *mapsId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEORPFeedbackLayoutConfigParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_formType != *((_DWORD *)v4 + 13))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 3) && !-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
    goto LABEL_13;
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:"))
      goto LABEL_13;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 4))
    v8 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEORPFeedbackLayoutConfigParameters readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_formType;
  else
    v3 = 0;
  v4 = -[GEOMapRegion hash](self->_mapRegion, "hash") ^ v3;
  v5 = -[GEOLatLng hash](self->_coordinate, "hash");
  return v4 ^ v5 ^ -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOMapRegion *mapRegion;
  uint64_t v6;
  GEOLatLng *coordinate;
  uint64_t v8;
  GEOPDMapsIdentifier *mapsId;
  uint64_t v10;
  int *v11;

  v11 = (int *)a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  if ((v11[14] & 1) != 0)
  {
    self->_formType = v11[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  mapRegion = self->_mapRegion;
  v6 = *((_QWORD *)v11 + 3);
  if (mapRegion)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPFeedbackLayoutConfigParameters setMapRegion:](self, "setMapRegion:");
  }
  v4 = v11;
LABEL_9:
  coordinate = self->_coordinate;
  v8 = *((_QWORD *)v4 + 2);
  if (coordinate)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEORPFeedbackLayoutConfigParameters setCoordinate:](self, "setCoordinate:");
  }
  v4 = v11;
LABEL_15:
  mapsId = self->_mapsId;
  v10 = *((_QWORD *)v4 + 4);
  if (mapsId)
  {
    if (v10)
    {
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
LABEL_20:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[GEORPFeedbackLayoutConfigParameters setMapsId:](self, "setMapsId:");
    goto LABEL_20;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
