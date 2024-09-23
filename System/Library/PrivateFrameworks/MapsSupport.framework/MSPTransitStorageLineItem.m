@implementation MSPTransitStorageLineItem

- (MSPTransitStorageLineItem)initWithLineItem:(id)a3
{
  id v4;
  MSPTransitStorageLineItem *v5;
  MSPTransitStorageLine *v6;
  MSPTransitStorageAttribution *v7;
  void *v8;
  MSPTransitStorageAttribution *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MSPTransitStorageIncident *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MSPTransitStorageLineItem;
  v5 = -[MSPTransitStorageLineItem init](&v23, sel_init);
  if (v5)
  {
    v6 = -[MSPTransitStorageLine initWithLine:]([MSPTransitStorageLine alloc], "initWithLine:", v4);
    -[MSPTransitStorageLineItem setLine:](v5, "setLine:", v6);

    v7 = [MSPTransitStorageAttribution alloc];
    objc_msgSend(v4, "attribution");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MSPTransitStorageAttribution initWithAttribution:](v7, "initWithAttribution:", v8);
    -[MSPTransitStorageLineItem setTransitAttribution:](v5, "setTransitAttribution:", v9);

    v10 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "incidents", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = -[MSPTransitStorageIncident initWithIncident:]([MSPTransitStorageIncident alloc], "initWithIncident:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

    -[MSPTransitStorageLineItem setIncidents:](v5, "setIncidents:", v10);
    objc_msgSend(v4, "mapRegion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageLineItem setStoredMapRegion:](v5, "setStoredMapRegion:", v17);

  }
  return v5;
}

- (unint64_t)muid
{
  void *v2;
  unint64_t v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "muid");

  return v3;
}

- (GEOMapItemIdentifier)identifier
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;

  -[MSPTransitStorageLineItem storedMapRegion](self, "storedMapRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D271C0]);
    -[MSPTransitStorageLineItem line](self, "line");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "muid");
    -[MSPTransitStorageLineItem storedMapRegion](self, "storedMapRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerLat");
    v9 = v8;
    -[MSPTransitStorageLineItem storedMapRegion](self, "storedMapRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerLng");
    v12 = (void *)objc_msgSend(v4, "initWithMUID:resultProviderID:coordinate:", v6, 0, v9, v11);

  }
  else
  {
    -[MSPTransitStorageLineItem line](self, "line");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (GEOMapItemIdentifier *)v12;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOTransitSystem)system
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "system");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitSystem *)v3;
}

- (unint64_t)departureTimeDisplayStyle
{
  void *v2;
  unint64_t v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "departureTimeDisplayStyle");

  return v3;
}

- (BOOL)departuresAreVehicleSpecific
{
  void *v2;
  char v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "departuresAreVehicleSpecific");

  return v3;
}

- (GEOTransitArtworkDataSource)artwork
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitArtworkDataSource *)v3;
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modeArtwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitArtworkDataSource *)v3;
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternateArtwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitArtworkDataSource *)v3;
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerArtwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitArtworkDataSource *)v3;
}

- (BOOL)hasLineColorString
{
  void *v2;
  char v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLineColorString");

  return v3;
}

- (NSString)lineColorString
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineColorString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)showVehicleNumber
{
  void *v2;
  char v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showVehicleNumber");

  return v3;
}

- (NSArray)operatingHours
{
  void *v2;
  void *v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operatingHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)labelItems
{
  return 0;
}

- (BOOL)isIncidentsTTLExpired
{
  return 0;
}

- (BOOL)hasIncidentComponent
{
  void *v2;
  BOOL v3;

  -[MSPTransitStorageLineItem incidents](self, "incidents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasEncyclopedicInfo
{
  return 0;
}

- (GEOEncyclopedicInfo)encyclopedicInfo
{
  return 0;
}

- (BOOL)isBus
{
  void *v2;
  char v3;

  -[MSPTransitStorageLineItem line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBus");

  return v3;
}

- (BOOL)hasLine
{
  return self->_line != 0;
}

- (BOOL)hasStoredMapRegion
{
  return self->_storedMapRegion != 0;
}

- (BOOL)hasTransitAttribution
{
  return self->_transitAttribution != 0;
}

- (void)clearIncidents
{
  -[NSMutableArray removeAllObjects](self->_incidents, "removeAllObjects");
}

- (void)addIncidents:(id)a3
{
  id v4;
  NSMutableArray *incidents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  incidents = self->_incidents;
  v8 = v4;
  if (!incidents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_incidents;
    self->_incidents = v6;

    v4 = v8;
    incidents = self->_incidents;
  }
  -[NSMutableArray addObject:](incidents, "addObject:", v4);

}

- (unint64_t)incidentsCount
{
  return -[NSMutableArray count](self->_incidents, "count");
}

- (id)incidentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_incidents, "objectAtIndex:", a3);
}

+ (Class)incidentsType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageLineItem;
  -[MSPTransitStorageLineItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageLineItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MSPTransitStorageLine *line;
  void *v5;
  GEOMapRegion *storedMapRegion;
  void *v7;
  MSPTransitStorageAttribution *transitAttribution;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  PBUnknownFields *unknownFields;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  line = self->_line;
  if (line)
  {
    -[MSPTransitStorageLine dictionaryRepresentation](line, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("line"));

  }
  storedMapRegion = self->_storedMapRegion;
  if (storedMapRegion)
  {
    -[GEOMapRegion dictionaryRepresentation](storedMapRegion, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("stored_map_region"));

  }
  transitAttribution = self->_transitAttribution;
  if (transitAttribution)
  {
    -[MSPTransitStorageAttribution dictionaryRepresentation](transitAttribution, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("transit_attribution"));

  }
  if (-[NSMutableArray count](self->_incidents, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_incidents, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_incidents;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("incidents"));
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageLineItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_line)
    PBDataWriterWriteSubmessage();
  if (self->_storedMapRegion)
    PBDataWriterWriteSubmessage();
  if (self->_transitAttribution)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_incidents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_line)
    objc_msgSend(v8, "setLine:");
  if (self->_storedMapRegion)
    objc_msgSend(v8, "setStoredMapRegion:");
  if (self->_transitAttribution)
    objc_msgSend(v8, "setTransitAttribution:");
  if (-[MSPTransitStorageLineItem incidentsCount](self, "incidentsCount"))
  {
    objc_msgSend(v8, "clearIncidents");
    v4 = -[MSPTransitStorageLineItem incidentsCount](self, "incidentsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MSPTransitStorageLineItem incidentsAtIndex:](self, "incidentsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addIncidents:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MSPTransitStorageLine copyWithZone:](self->_line, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[GEOMapRegion copyWithZone:](self->_storedMapRegion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[MSPTransitStorageAttribution copyWithZone:](self->_transitAttribution, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_incidents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addIncidents:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MSPTransitStorageLine *line;
  GEOMapRegion *storedMapRegion;
  MSPTransitStorageAttribution *transitAttribution;
  NSMutableArray *incidents;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((line = self->_line, !((unint64_t)line | v4[3])) || -[MSPTransitStorageLine isEqual:](line, "isEqual:"))
    && ((storedMapRegion = self->_storedMapRegion, !((unint64_t)storedMapRegion | v4[4]))
     || -[GEOMapRegion isEqual:](storedMapRegion, "isEqual:"))
    && ((transitAttribution = self->_transitAttribution, !((unint64_t)transitAttribution | v4[5]))
     || -[MSPTransitStorageAttribution isEqual:](transitAttribution, "isEqual:")))
  {
    incidents = self->_incidents;
    if ((unint64_t)incidents | v4[2])
      v9 = -[NSMutableArray isEqual:](incidents, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[MSPTransitStorageLine hash](self->_line, "hash");
  v4 = -[GEOMapRegion hash](self->_storedMapRegion, "hash") ^ v3;
  v5 = -[MSPTransitStorageAttribution hash](self->_transitAttribution, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_incidents, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MSPTransitStorageLine *line;
  uint64_t v6;
  GEOMapRegion *storedMapRegion;
  uint64_t v8;
  MSPTransitStorageAttribution *transitAttribution;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  line = self->_line;
  v6 = *((_QWORD *)v4 + 3);
  if (line)
  {
    if (v6)
      -[MSPTransitStorageLine mergeFrom:](line, "mergeFrom:");
  }
  else if (v6)
  {
    -[MSPTransitStorageLineItem setLine:](self, "setLine:");
  }
  storedMapRegion = self->_storedMapRegion;
  v8 = *((_QWORD *)v4 + 4);
  if (storedMapRegion)
  {
    if (v8)
      -[GEOMapRegion mergeFrom:](storedMapRegion, "mergeFrom:");
  }
  else if (v8)
  {
    -[MSPTransitStorageLineItem setStoredMapRegion:](self, "setStoredMapRegion:");
  }
  transitAttribution = self->_transitAttribution;
  v10 = *((_QWORD *)v4 + 5);
  if (transitAttribution)
  {
    if (v10)
      -[MSPTransitStorageAttribution mergeFrom:](transitAttribution, "mergeFrom:");
  }
  else if (v10)
  {
    -[MSPTransitStorageLineItem setTransitAttribution:](self, "setTransitAttribution:");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v4 + 2);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[MSPTransitStorageLineItem addIncidents:](self, "addIncidents:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (MSPTransitStorageLine)line
{
  return self->_line;
}

- (void)setLine:(id)a3
{
  objc_storeStrong((id *)&self->_line, a3);
}

- (GEOMapRegion)storedMapRegion
{
  return self->_storedMapRegion;
}

- (void)setStoredMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_storedMapRegion, a3);
}

- (MSPTransitStorageAttribution)transitAttribution
{
  return self->_transitAttribution;
}

- (void)setTransitAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_transitAttribution, a3);
}

- (NSArray)incidents
{
  return &self->_incidents->super;
}

- (void)setIncidents:(id)a3
{
  objc_storeStrong((id *)&self->_incidents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitAttribution, 0);
  objc_storeStrong((id *)&self->_storedMapRegion, 0);
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
