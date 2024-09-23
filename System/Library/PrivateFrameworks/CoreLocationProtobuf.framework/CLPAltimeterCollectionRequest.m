@implementation CLPAltimeterCollectionRequest

- (BOOL)hasMeta
{
  return self->_meta != 0;
}

- (void)setStartTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStopTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_stopTimestamp = a3;
}

- (void)setHasStopTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStopTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)collectionType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_collectionType;
  else
    return 1;
}

- (void)setCollectionType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_collectionType = a3;
}

- (void)setHasCollectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCollectionType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)collectionTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E9595950 + a3 - 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCollectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CollectionHVAC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CollectionBiasEstimation")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CollectionSensorCharacterization")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)clearPressures
{
  -[NSMutableArray removeAllObjects](self->_pressures, "removeAllObjects");
}

- (void)addPressure:(id)a3
{
  id v4;
  NSMutableArray *pressures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pressures = self->_pressures;
  v8 = v4;
  if (!pressures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_pressures;
    self->_pressures = v6;

    v4 = v8;
    pressures = self->_pressures;
  }
  -[NSMutableArray addObject:](pressures, "addObject:", v4);

}

- (unint64_t)pressuresCount
{
  return -[NSMutableArray count](self->_pressures, "count");
}

- (id)pressureAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_pressures, "objectAtIndex:", a3);
}

+ (Class)pressureType
{
  return (Class)objc_opt_class();
}

- (void)clearWifiScans
{
  -[NSMutableArray removeAllObjects](self->_wifiScans, "removeAllObjects");
}

- (void)addWifiScan:(id)a3
{
  id v4;
  NSMutableArray *wifiScans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  wifiScans = self->_wifiScans;
  v8 = v4;
  if (!wifiScans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_wifiScans;
    self->_wifiScans = v6;

    v4 = v8;
    wifiScans = self->_wifiScans;
  }
  -[NSMutableArray addObject:](wifiScans, "addObject:", v4);

}

- (unint64_t)wifiScansCount
{
  return -[NSMutableArray count](self->_wifiScans, "count");
}

- (id)wifiScanAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_wifiScans, "objectAtIndex:", a3);
}

+ (Class)wifiScanType
{
  return (Class)objc_opt_class();
}

- (void)clearLocations
{
  -[NSMutableArray removeAllObjects](self->_locations, "removeAllObjects");
}

- (void)addLocations:(id)a3
{
  id v4;
  NSMutableArray *locations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  locations = self->_locations;
  v8 = v4;
  if (!locations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_locations;
    self->_locations = v6;

    v4 = v8;
    locations = self->_locations;
  }
  -[NSMutableArray addObject:](locations, "addObject:", v4);

}

- (unint64_t)locationsCount
{
  return -[NSMutableArray count](self->_locations, "count");
}

- (id)locationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_locations, "objectAtIndex:", a3);
}

+ (Class)locationsType
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
  v8.super_class = (Class)CLPAltimeterCollectionRequest;
  -[CLPAltimeterCollectionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPAltimeterCollectionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPMeta *meta;
  void *v5;
  char has;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  CLPContext *context;
  void *v12;
  CLPLocation *location;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  meta = self->_meta;
  if (meta)
  {
    -[CLPMeta dictionaryRepresentation](meta, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("meta"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("startTimestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_13;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stopTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("stopTimestamp"));

  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_9:
  v9 = self->_collectionType - 1;
  if (v9 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_collectionType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = *(&off_1E9595950 + v9);
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("collectionType"));

LABEL_13:
  context = self->_context;
  if (context)
  {
    -[CLPContext dictionaryRepresentation](context, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("context"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("location"));

  }
  if (-[NSMutableArray count](self->_pressures, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_pressures, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = self->_pressures;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("pressure"));
  }
  if (-[NSMutableArray count](self->_wifiScans, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_wifiScans, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v23 = self->_wifiScans;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("wifiScan"));
  }
  if (-[NSMutableArray count](self->_locations, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = self->_locations;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("locations"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPAltimeterCollectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_meta)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_context)
    PBDataWriterWriteSubmessage();
  if (self->_location)
    PBDataWriterWriteSubmessage();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_pressures;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_wifiScans;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_locations;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (self->_meta)
  {
    objc_msgSend(v4, "setMeta:");
    v4 = v18;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_startTimestamp;
    *((_BYTE *)v4 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_stopTimestamp;
  *((_BYTE *)v4 + 80) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 6) = self->_collectionType;
    *((_BYTE *)v4 + 80) |= 4u;
  }
LABEL_7:
  if (self->_context)
    objc_msgSend(v18, "setContext:");
  if (self->_location)
    objc_msgSend(v18, "setLocation:");
  if (-[CLPAltimeterCollectionRequest pressuresCount](self, "pressuresCount"))
  {
    objc_msgSend(v18, "clearPressures");
    v6 = -[CLPAltimeterCollectionRequest pressuresCount](self, "pressuresCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[CLPAltimeterCollectionRequest pressureAtIndex:](self, "pressureAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addPressure:", v9);

      }
    }
  }
  if (-[CLPAltimeterCollectionRequest wifiScansCount](self, "wifiScansCount"))
  {
    objc_msgSend(v18, "clearWifiScans");
    v10 = -[CLPAltimeterCollectionRequest wifiScansCount](self, "wifiScansCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[CLPAltimeterCollectionRequest wifiScanAtIndex:](self, "wifiScanAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addWifiScan:", v13);

      }
    }
  }
  if (-[CLPAltimeterCollectionRequest locationsCount](self, "locationsCount"))
  {
    objc_msgSend(v18, "clearLocations");
    v14 = -[CLPAltimeterCollectionRequest locationsCount](self, "locationsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[CLPAltimeterCollectionRequest locationsAtIndex:](self, "locationsAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addLocations:", v17);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPMeta copyWithZone:](self->_meta, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_startTimestamp;
    *(_BYTE *)(v5 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_stopTimestamp;
  *(_BYTE *)(v5 + 80) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_collectionType;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
LABEL_5:
  v9 = -[CLPContext copyWithZone:](self->_context, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = self->_pressures;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPressure:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v15);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = self->_wifiScans;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addWifiScan:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v21);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self->_locations;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addLocations:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v27);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPMeta *meta;
  CLPContext *context;
  CLPLocation *location;
  NSMutableArray *pressures;
  NSMutableArray *wifiScans;
  NSMutableArray *locations;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  meta = self->_meta;
  if ((unint64_t)meta | *((_QWORD *)v4 + 7))
  {
    if (!-[CLPMeta isEqual:](meta, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_startTimestamp != *((double *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_29:
    v11 = 0;
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_stopTimestamp != *((double *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_collectionType != *((_DWORD *)v4 + 6))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_29;
  }
  context = self->_context;
  if ((unint64_t)context | *((_QWORD *)v4 + 4) && !-[CLPContext isEqual:](context, "isEqual:"))
    goto LABEL_29;
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 5))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
      goto LABEL_29;
  }
  pressures = self->_pressures;
  if ((unint64_t)pressures | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](pressures, "isEqual:"))
      goto LABEL_29;
  }
  wifiScans = self->_wifiScans;
  if ((unint64_t)wifiScans | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](wifiScans, "isEqual:"))
      goto LABEL_29;
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((_QWORD *)v4 + 6))
    v11 = -[NSMutableArray isEqual:](locations, "isEqual:");
  else
    v11 = 1;
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  double startTimestamp;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double stopTimestamp;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = -[CLPMeta hash](self->_meta, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    startTimestamp = self->_startTimestamp;
    v7 = -startTimestamp;
    if (startTimestamp >= 0.0)
      v7 = self->_startTimestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
  {
    stopTimestamp = self->_stopTimestamp;
    v12 = -stopTimestamp;
    if (stopTimestamp >= 0.0)
      v12 = self->_stopTimestamp;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 4) != 0)
    v15 = 2654435761 * self->_collectionType;
  else
    v15 = 0;
  v16 = v5 ^ v3 ^ v10 ^ v15 ^ -[CLPContext hash](self->_context, "hash");
  v17 = -[CLPLocation hash](self->_location, "hash");
  v18 = v17 ^ -[NSMutableArray hash](self->_pressures, "hash");
  v19 = v16 ^ v18 ^ -[NSMutableArray hash](self->_wifiScans, "hash");
  return v19 ^ -[NSMutableArray hash](self->_locations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPMeta *meta;
  uint64_t v6;
  char v7;
  CLPContext *context;
  uint64_t v9;
  CLPLocation *location;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  meta = self->_meta;
  v6 = *((_QWORD *)v4 + 7);
  if (meta)
  {
    if (v6)
      -[CLPMeta mergeFrom:](meta, "mergeFrom:");
  }
  else if (v6)
  {
    -[CLPAltimeterCollectionRequest setMeta:](self, "setMeta:");
  }
  v7 = *((_BYTE *)v4 + 80);
  if ((v7 & 1) != 0)
  {
    self->_startTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 80);
    if ((v7 & 2) == 0)
    {
LABEL_8:
      if ((v7 & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_stopTimestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
LABEL_9:
    self->_collectionType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_10:
  context = self->_context;
  v9 = *((_QWORD *)v4 + 4);
  if (context)
  {
    if (v9)
      -[CLPContext mergeFrom:](context, "mergeFrom:");
  }
  else if (v9)
  {
    -[CLPAltimeterCollectionRequest setContext:](self, "setContext:");
  }
  location = self->_location;
  v11 = *((_QWORD *)v4 + 5);
  if (location)
  {
    if (v11)
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v11)
  {
    -[CLPAltimeterCollectionRequest setLocation:](self, "setLocation:");
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = *((id *)v4 + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        -[CLPAltimeterCollectionRequest addPressure:](self, "addPressure:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *((id *)v4 + 9);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[CLPAltimeterCollectionRequest addWifiScan:](self, "addWifiScan:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v19);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v4 + 6);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[CLPAltimeterCollectionRequest addLocations:](self, "addLocations:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v24);
  }

}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_storeStrong((id *)&self->_meta, a3);
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)stopTimestamp
{
  return self->_stopTimestamp;
}

- (CLPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSMutableArray)pressures
{
  return self->_pressures;
}

- (void)setPressures:(id)a3
{
  objc_storeStrong((id *)&self->_pressures, a3);
}

- (NSMutableArray)wifiScans
{
  return self->_wifiScans;
}

- (void)setWifiScans:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScans, a3);
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiScans, 0);
  objc_storeStrong((id *)&self->_pressures, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
