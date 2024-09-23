@implementation CLPLocationCollectionRequest

- (void)clearLocations
{
  -[NSMutableArray removeAllObjects](self->_locations, "removeAllObjects");
}

- (void)addLocation:(id)a3
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

- (id)locationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_locations, "objectAtIndex:", a3);
}

+ (Class)locationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setRat:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRat
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMcc:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMcc
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMnc:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMnc
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearAppBundleIds
{
  -[NSMutableArray removeAllObjects](self->_appBundleIds, "removeAllObjects");
}

- (void)addAppBundleIds:(id)a3
{
  id v4;
  NSMutableArray *appBundleIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appBundleIds = self->_appBundleIds;
  v8 = v4;
  if (!appBundleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_appBundleIds;
    self->_appBundleIds = v6;

    v4 = v8;
    appBundleIds = self->_appBundleIds;
  }
  -[NSMutableArray addObject:](appBundleIds, "addObject:", v4);

}

- (unint64_t)appBundleIdsCount
{
  return -[NSMutableArray count](self->_appBundleIds, "count");
}

- (id)appBundleIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appBundleIds, "objectAtIndex:", a3);
}

+ (Class)appBundleIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccessoryMeta
{
  return self->_accessoryMeta != 0;
}

- (void)clearAccessoryLocations
{
  -[NSMutableArray removeAllObjects](self->_accessoryLocations, "removeAllObjects");
}

- (void)addAccessoryLocation:(id)a3
{
  id v4;
  NSMutableArray *accessoryLocations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  accessoryLocations = self->_accessoryLocations;
  v8 = v4;
  if (!accessoryLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_accessoryLocations;
    self->_accessoryLocations = v6;

    v4 = v8;
    accessoryLocations = self->_accessoryLocations;
  }
  -[NSMutableArray addObject:](accessoryLocations, "addObject:", v4);

}

- (unint64_t)accessoryLocationsCount
{
  return -[NSMutableArray count](self->_accessoryLocations, "count");
}

- (id)accessoryLocationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_accessoryLocations, "objectAtIndex:", a3);
}

+ (Class)accessoryLocationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPipelineMetadata
{
  return self->_pipelineMetadata != 0;
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
  v8.super_class = (Class)CLPLocationCollectionRequest;
  -[CLPLocationCollectionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLocationCollectionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *appBundleId;
  NSString *tripId;
  char has;
  void *v16;
  NSMutableArray *appBundleIds;
  CLPAccessoryMeta *accessoryMeta;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  CLPLocationProcessingPipelineMetadata *pipelineMetadata;
  void *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  meta = self->_meta;
  if (meta)
  {
    -[CLPMeta dictionaryRepresentation](meta, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("meta"));

  }
  if (-[NSMutableArray count](self->_locations, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = self->_locations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("location"));
  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v3, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  tripId = self->_tripId;
  if (tripId)
    objc_msgSend(v3, "setObject:forKey:", tripId, CFSTR("tripId"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rat);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("rat"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 2) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mcc);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("mcc"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mnc);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("mnc"));

  }
LABEL_20:
  appBundleIds = self->_appBundleIds;
  if (appBundleIds)
    objc_msgSend(v3, "setObject:forKey:", appBundleIds, CFSTR("appBundleIds"));
  accessoryMeta = self->_accessoryMeta;
  if (accessoryMeta)
  {
    -[CLPAccessoryMeta dictionaryRepresentation](accessoryMeta, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("accessoryMeta"));

  }
  if (-[NSMutableArray count](self->_accessoryLocations, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_accessoryLocations, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = self->_accessoryLocations;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v32);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("accessoryLocation"));
  }
  pipelineMetadata = self->_pipelineMetadata;
  if (pipelineMetadata)
  {
    -[CLPLocationProcessingPipelineMetadata dictionaryRepresentation](pipelineMetadata, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("pipelineMetadata"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationCollectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char has;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
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
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_meta)
    -[CLPLocationCollectionRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = self->_locations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v8);
  }

  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  if (!self->_tripId)
    -[CLPLocationCollectionRequest writeTo:].cold.2();
  PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_14:
      if ((has & 2) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_15:
    PBDataWriterWriteInt32Field();
LABEL_16:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_appBundleIds;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  if (self->_accessoryMeta)
    PBDataWriterWriteSubmessage();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_accessoryLocations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

  if (self->_pipelineMetadata)
    PBDataWriterWriteSubmessage();

}

- (unsigned)requestTypeCode
{
  return 101;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "setMeta:", self->_meta);
  if (-[CLPLocationCollectionRequest locationsCount](self, "locationsCount"))
  {
    objc_msgSend(v17, "clearLocations");
    v4 = -[CLPLocationCollectionRequest locationsCount](self, "locationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[CLPLocationCollectionRequest locationAtIndex:](self, "locationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addLocation:", v7);

      }
    }
  }
  if (self->_appBundleId)
    objc_msgSend(v17, "setAppBundleId:");
  objc_msgSend(v17, "setTripId:", self->_tripId);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_25:
    *((_DWORD *)v17 + 12) = self->_mcc;
    *((_BYTE *)v17 + 96) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)v17 + 20) = self->_rat;
  *((_BYTE *)v17 + 96) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_25;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v17 + 16) = self->_mnc;
    *((_BYTE *)v17 + 96) |= 2u;
  }
LABEL_11:
  if (-[CLPLocationCollectionRequest appBundleIdsCount](self, "appBundleIdsCount"))
  {
    objc_msgSend(v17, "clearAppBundleIds");
    v9 = -[CLPLocationCollectionRequest appBundleIdsCount](self, "appBundleIdsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[CLPLocationCollectionRequest appBundleIdsAtIndex:](self, "appBundleIdsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAppBundleIds:", v12);

      }
    }
  }
  if (self->_accessoryMeta)
    objc_msgSend(v17, "setAccessoryMeta:");
  if (-[CLPLocationCollectionRequest accessoryLocationsCount](self, "accessoryLocationsCount"))
  {
    objc_msgSend(v17, "clearAccessoryLocations");
    v13 = -[CLPLocationCollectionRequest accessoryLocationsCount](self, "accessoryLocationsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[CLPLocationCollectionRequest accessoryLocationAtIndex:](self, "accessoryLocationAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAccessoryLocation:", v16);

      }
    }
  }
  if (self->_pipelineMetadata)
    objc_msgSend(v17, "setPipelineMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char has;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  id v33;
  void *v34;
  __int128 v36;
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
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPMeta copyWithZone:](self->_meta, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = self->_locations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocation:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[NSString copyWithZone:](self->_tripId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v16;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_rat;
    *(_BYTE *)(v5 + 96) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 48) = self->_mcc;
  *(_BYTE *)(v5 + 96) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 64) = self->_mnc;
    *(_BYTE *)(v5 + 96) |= 2u;
  }
LABEL_12:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v19 = self->_appBundleIds;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAppBundleIds:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v21);
  }

  v25 = -[CLPAccessoryMeta copyWithZone:](self->_accessoryMeta, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v27 = self->_accessoryLocations;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v5, "addAccessoryLocation:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v29);
  }

  v33 = -[CLPLocationProcessingPipelineMetadata copyWithZone:](self->_pipelineMetadata, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v33;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPMeta *meta;
  NSMutableArray *locations;
  NSString *appBundleId;
  NSString *tripId;
  NSMutableArray *appBundleIds;
  CLPAccessoryMeta *accessoryMeta;
  NSMutableArray *accessoryLocations;
  CLPLocationProcessingPipelineMetadata *pipelineMetadata;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  meta = self->_meta;
  if ((unint64_t)meta | *((_QWORD *)v4 + 7))
  {
    if (!-[CLPMeta isEqual:](meta, "isEqual:"))
      goto LABEL_33;
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:"))
      goto LABEL_33;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_33;
  }
  tripId = self->_tripId;
  if ((unint64_t)tripId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](tripId, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_rat != *((_DWORD *)v4 + 20))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
LABEL_33:
    v13 = 0;
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_mcc != *((_DWORD *)v4 + 12))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_mnc != *((_DWORD *)v4 + 16))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_33;
  }
  appBundleIds = self->_appBundleIds;
  if ((unint64_t)appBundleIds | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](appBundleIds, "isEqual:"))
  {
    goto LABEL_33;
  }
  accessoryMeta = self->_accessoryMeta;
  if ((unint64_t)accessoryMeta | *((_QWORD *)v4 + 2))
  {
    if (!-[CLPAccessoryMeta isEqual:](accessoryMeta, "isEqual:"))
      goto LABEL_33;
  }
  accessoryLocations = self->_accessoryLocations;
  if ((unint64_t)accessoryLocations | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](accessoryLocations, "isEqual:"))
      goto LABEL_33;
  }
  pipelineMetadata = self->_pipelineMetadata;
  if ((unint64_t)pipelineMetadata | *((_QWORD *)v4 + 9))
    v13 = -[CLPLocationProcessingPipelineMetadata isEqual:](pipelineMetadata, "isEqual:");
  else
    v13 = 1;
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v3 = -[CLPMeta hash](self->_meta, "hash");
  v4 = -[NSMutableArray hash](self->_locations, "hash");
  v5 = -[NSString hash](self->_appBundleId, "hash");
  v6 = -[NSString hash](self->_tripId, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v7 = 2654435761 * self->_rat;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_mcc;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v9 = 2654435761 * self->_mnc;
LABEL_8:
  v10 = v4 ^ v3 ^ v5 ^ v6;
  v11 = v7 ^ v8 ^ v9 ^ -[NSMutableArray hash](self->_appBundleIds, "hash");
  v12 = v10 ^ v11 ^ -[CLPAccessoryMeta hash](self->_accessoryMeta, "hash");
  v13 = -[NSMutableArray hash](self->_accessoryLocations, "hash");
  return v12 ^ v13 ^ -[CLPLocationProcessingPipelineMetadata hash](self->_pipelineMetadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPMeta *meta;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  CLPAccessoryMeta *accessoryMeta;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  CLPLocationProcessingPipelineMetadata *pipelineMetadata;
  uint64_t v26;
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
    -[CLPLocationCollectionRequest setMeta:](self, "setMeta:");
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        -[CLPLocationCollectionRequest addLocation:](self, "addLocation:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 3))
    -[CLPLocationCollectionRequest setAppBundleId:](self, "setAppBundleId:");
  if (*((_QWORD *)v4 + 11))
    -[CLPLocationCollectionRequest setTripId:](self, "setTripId:");
  v12 = *((_BYTE *)v4 + 96);
  if ((v12 & 4) != 0)
  {
    self->_rat = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 4u;
    v12 = *((_BYTE *)v4 + 96);
    if ((v12 & 1) == 0)
    {
LABEL_19:
      if ((v12 & 2) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 96) & 1) == 0)
  {
    goto LABEL_19;
  }
  self->_mcc = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_20:
    self->_mnc = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_21:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = *((id *)v4 + 4);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        -[CLPLocationCollectionRequest addAppBundleIds:](self, "addAppBundleIds:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v15);
  }

  accessoryMeta = self->_accessoryMeta;
  v19 = *((_QWORD *)v4 + 2);
  if (accessoryMeta)
  {
    if (v19)
      -[CLPAccessoryMeta mergeFrom:](accessoryMeta, "mergeFrom:");
  }
  else if (v19)
  {
    -[CLPLocationCollectionRequest setAccessoryMeta:](self, "setAccessoryMeta:");
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = *((id *)v4 + 1);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        -[CLPLocationCollectionRequest addAccessoryLocation:](self, "addAccessoryLocation:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k), (_QWORD)v27);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v22);
  }

  pipelineMetadata = self->_pipelineMetadata;
  v26 = *((_QWORD *)v4 + 9);
  if (pipelineMetadata)
  {
    if (v26)
      -[CLPLocationProcessingPipelineMetadata mergeFrom:](pipelineMetadata, "mergeFrom:");
  }
  else if (v26)
  {
    -[CLPLocationCollectionRequest setPipelineMetadata:](self, "setPipelineMetadata:");
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

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (NSString)tripId
{
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
  objc_storeStrong((id *)&self->_tripId, a3);
}

- (int)rat
{
  return self->_rat;
}

- (int)mcc
{
  return self->_mcc;
}

- (int)mnc
{
  return self->_mnc;
}

- (NSMutableArray)appBundleIds
{
  return self->_appBundleIds;
}

- (void)setAppBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIds, a3);
}

- (CLPAccessoryMeta)accessoryMeta
{
  return self->_accessoryMeta;
}

- (void)setAccessoryMeta:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryMeta, a3);
}

- (NSMutableArray)accessoryLocations
{
  return self->_accessoryLocations;
}

- (void)setAccessoryLocations:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLocations, a3);
}

- (CLPLocationProcessingPipelineMetadata)pipelineMetadata
{
  return self->_pipelineMetadata;
}

- (void)setPipelineMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripId, 0);
  objc_storeStrong((id *)&self->_pipelineMetadata, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_appBundleIds, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_accessoryMeta, 0);
  objc_storeStrong((id *)&self->_accessoryLocations, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPLocationCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 22207, "self->_meta != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPLocationCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 22226, "nil != self->_tripId");
}

@end
