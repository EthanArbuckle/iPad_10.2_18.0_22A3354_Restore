@implementation GEOLogMsgStateNavigation

- (int)lineType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_lineType;
  else
    return 0;
}

- (void)setLineType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_lineType = a3;
}

- (void)setHasLineType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLineType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)lineTypeAsString:(int)a3
{
  if (a3 < 0x1C)
    return off_1E1C22D88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLineType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_LINE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_PATH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_PATH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINOR_ROAD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_ROAD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_MAJOR_ROAD")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_ROAD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHWAY")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAJOR_HIGHWAY")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREEWAY_CONTROLLED")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREEWAY_UNCONTROLLED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATER")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_BORDER")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARKING_STRUCTURE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_ROAD")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_TRANSFER")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_OVERPASS")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_OVERPASS_STEPS")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_OVERPASS_RAMP")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_UNDERPASS")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_UNDERPASS_STEPS")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEDESTRIAN_UNDERPASS_RAMP")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_ROAD")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GATE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARKING_LOT_ROAD")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_STATION_GRAPH")) & 1) != 0)
  {
    v4 = 26;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIDDEN")))
  {
    v4 = 27;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)navState
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_navState;
  else
    return 0;
}

- (void)setNavState:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_navState = a3;
}

- (void)setHasNavState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNavState
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)navStateAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C22E68[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_NAVIGATING")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROCEEDING_TO_ROUTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF_ROUTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAD_ROUTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECALCULATING")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ROUTE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_SEGMENT")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)distanceToDestination
{
  return self->_distanceToDestination;
}

- (void)setDistanceToDestination:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_distanceToDestination = a3;
}

- (void)setHasDistanceToDestination:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceToDestination
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasNavCameraState
{
  return self->_navCameraState != 0;
}

- (GEONavCameraState)navCameraState
{
  return self->_navCameraState;
}

- (void)setNavCameraState:(id)a3
{
  objc_storeStrong((id *)&self->_navCameraState, a3);
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
  v8.super_class = (Class)GEOLogMsgStateNavigation;
  -[GEOLogMsgStateNavigation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateNavigation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateNavigation _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v12;
  __CFString *v13;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 32) & 4) == 0)
      goto LABEL_4;
LABEL_23:
    v16 = *(int *)(a1 + 28);
    if (v16 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C22E68[v16];
    }
    if (a2)
      v18 = CFSTR("navState");
    else
      v18 = CFSTR("nav_state");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    if ((*(_BYTE *)(a1 + 32) & 1) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  v12 = *(int *)(a1 + 24);
  if (v12 >= 0x1C)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E1C22D88[v12];
  }
  if (a2)
    v15 = CFSTR("lineType");
  else
    v15 = CFSTR("line_type");
  objc_msgSend(v4, "setObject:forKey:", v13, v15);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_23;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("distanceToDestination");
    else
      v7 = CFSTR("distance_to_destination");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  objc_msgSend((id)a1, "navCameraState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("navCameraState");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("nav_camera_state");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateNavigation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateNavigation)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateNavigation *)-[GEOLogMsgStateNavigation _initWithDictionary:isJSON:](self, a3, 0);
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
  id v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEONavCameraState *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  if (!a1)
    goto LABEL_107;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_107;
  if (a3)
    v6 = CFSTR("lineType");
  else
    v6 = CFSTR("line_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_LINE_TYPE")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_PATH")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PRIVATE_PATH")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MINOR_ROAD")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOCAL_ROAD")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOCAL_MAJOR_ROAD")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CONNECTOR_ROAD")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HIGHWAY")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAJOR_HIGHWAY")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FREEWAY_CONTROLLED")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FREEWAY_UNCONTROLLED")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATER")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SPUTNIK_BORDER")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PARKING_STRUCTURE")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_ROAD")) & 1) != 0)
    {
      v9 = 15;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_TRANSFER")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_OVERPASS")) & 1) != 0)
    {
      v9 = 17;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_OVERPASS_STEPS")) & 1) != 0)
    {
      v9 = 18;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_OVERPASS_RAMP")) & 1) != 0)
    {
      v9 = 19;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_UNDERPASS")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_UNDERPASS_STEPS")) & 1) != 0)
    {
      v9 = 21;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PEDESTRIAN_UNDERPASS_RAMP")) & 1) != 0)
    {
      v9 = 22;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SERVICE_ROAD")) & 1) != 0)
    {
      v9 = 23;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GATE")) & 1) != 0)
    {
      v9 = 24;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PARKING_LOT_ROAD")) & 1) != 0)
    {
      v9 = 25;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_STATION_GRAPH")) & 1) != 0)
    {
      v9 = 26;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("HIDDEN")))
    {
      v9 = 27;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_68;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setLineType:", v9);
LABEL_68:

  if (a3)
    v10 = CFSTR("navState");
  else
    v10 = CFSTR("nav_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NOT_NAVIGATING")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PROCEEDING_TO_ROUTE")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ON_ROUTE")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("OFF_ROUTE")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("BAD_ROUTE")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RECALCULATING")) & 1) != 0)
    {
      v13 = 5;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("END_OF_ROUTE")) & 1) != 0)
    {
      v13 = 6;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("END_OF_SEGMENT")))
    {
      v13 = 7;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_92;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_92:
    objc_msgSend(a1, "setNavState:", v13);
  }

  if (a3)
    v14 = CFSTR("distanceToDestination");
  else
    v14 = CFSTR("distance_to_destination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(a1, "setDistanceToDestination:");
  }

  if (a3)
    v16 = CFSTR("navCameraState");
  else
    v16 = CFSTR("nav_camera_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEONavCameraState alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEONavCameraState initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEONavCameraState initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setNavCameraState:", v19);

  }
LABEL_107:

  return a1;
}

- (GEOLogMsgStateNavigation)initWithJSON:(id)a3
{
  return (GEOLogMsgStateNavigation *)-[GEOLogMsgStateNavigation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateNavigationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateNavigationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:
  if (self->_navCameraState)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOLogMsgStateNavigation readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_lineType;
    *((_BYTE *)v6 + 32) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 7) = self->_navState;
  *((_BYTE *)v6 + 32) |= 4u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v6 + 1) = *(_QWORD *)&self->_distanceToDestination;
    *((_BYTE *)v6 + 32) |= 1u;
  }
LABEL_5:
  if (self->_navCameraState)
  {
    objc_msgSend(v6, "setNavCameraState:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_navState;
    *(_BYTE *)(v5 + 32) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_lineType;
  *(_BYTE *)(v5 + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_distanceToDestination;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
LABEL_5:
  v8 = -[GEONavCameraState copyWithZone:](self->_navCameraState, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEONavCameraState *navCameraState;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOLogMsgStateNavigation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_lineType != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_navState != *((_DWORD *)v4 + 7))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_distanceToDestination != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_19;
  }
  navCameraState = self->_navCameraState;
  if ((unint64_t)navCameraState | *((_QWORD *)v4 + 2))
    v6 = -[GEONavCameraState isEqual:](navCameraState, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double distanceToDestination;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  -[GEOLogMsgStateNavigation readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    return v4 ^ v3 ^ v9 ^ -[GEONavCameraState hash](self->_navCameraState, "hash");
  }
  v3 = 2654435761 * self->_lineType;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_navState;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_4:
  distanceToDestination = self->_distanceToDestination;
  v6 = -distanceToDestination;
  if (distanceToDestination >= 0.0)
    v6 = self->_distanceToDestination;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ -[GEONavCameraState hash](self->_navCameraState, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  GEONavCameraState *navCameraState;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 32);
  if ((v5 & 2) != 0)
  {
    self->_lineType = *((_DWORD *)v8 + 6);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v8 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v8 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_navState = *((_DWORD *)v8 + 7);
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v8 + 32) & 1) != 0)
  {
LABEL_4:
    self->_distanceToDestination = *((double *)v8 + 1);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:
  navCameraState = self->_navCameraState;
  v7 = *((_QWORD *)v8 + 2);
  if (navCameraState)
  {
    if (v7)
    {
      -[GEONavCameraState mergeFrom:](navCameraState, "mergeFrom:");
LABEL_13:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOLogMsgStateNavigation setNavCameraState:](self, "setNavCameraState:");
    goto LABEL_13;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navCameraState, 0);
}

@end
