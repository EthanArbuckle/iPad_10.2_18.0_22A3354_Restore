@implementation BMPBHomeKitClientMediaAccessoryControlEvent

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasAccessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier != 0;
}

- (void)clearAccessoryStates
{
  -[NSMutableArray removeAllObjects](self->_accessoryStates, "removeAllObjects");
}

- (void)addAccessoryState:(id)a3
{
  id v4;
  NSMutableArray *accessoryStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  accessoryStates = self->_accessoryStates;
  v8 = v4;
  if (!accessoryStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_accessoryStates;
    self->_accessoryStates = v6;

    v4 = v8;
    accessoryStates = self->_accessoryStates;
  }
  -[NSMutableArray addObject:](accessoryStates, "addObject:", v4);

}

- (unint64_t)accessoryStatesCount
{
  return -[NSMutableArray count](self->_accessoryStates, "count");
}

- (id)accessoryStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_accessoryStates, "objectAtIndex:", a3);
}

+ (Class)accessoryStateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier != 0;
}

- (void)clearZoneUniqueIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_zoneUniqueIdentifiers, "removeAllObjects");
}

- (void)addZoneUniqueIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *zoneUniqueIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers;
  v8 = v4;
  if (!zoneUniqueIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_zoneUniqueIdentifiers;
    self->_zoneUniqueIdentifiers = v6;

    v4 = v8;
    zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers;
  }
  -[NSMutableArray addObject:](zoneUniqueIdentifiers, "addObject:", v4);

}

- (unint64_t)zoneUniqueIdentifiersCount
{
  return -[NSMutableArray count](self->_zoneUniqueIdentifiers, "count");
}

- (id)zoneUniqueIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_zoneUniqueIdentifiers, "objectAtIndex:", a3);
}

+ (Class)zoneUniqueIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRoomUniqueIdentifier
{
  return self->_roomUniqueIdentifier != 0;
}

- (BOOL)hasAccessoryName
{
  return self->_accessoryName != 0;
}

- (BOOL)hasRoomName
{
  return self->_roomName != 0;
}

- (void)clearZoneNames
{
  -[NSMutableArray removeAllObjects](self->_zoneNames, "removeAllObjects");
}

- (void)addZoneNames:(id)a3
{
  id v4;
  NSMutableArray *zoneNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  zoneNames = self->_zoneNames;
  v8 = v4;
  if (!zoneNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_zoneNames;
    self->_zoneNames = v6;

    v4 = v8;
    zoneNames = self->_zoneNames;
  }
  -[NSMutableArray addObject:](zoneNames, "addObject:", v4);

}

- (unint64_t)zoneNamesCount
{
  return -[NSMutableArray count](self->_zoneNames, "count");
}

- (id)zoneNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_zoneNames, "objectAtIndex:", a3);
}

+ (Class)zoneNamesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHomeName
{
  return self->_homeName != 0;
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
  v8.super_class = (Class)BMPBHomeKitClientMediaAccessoryControlEvent;
  -[BMPBHomeKitClientMediaAccessoryControlEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBHomeKitClientMediaAccessoryControlEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  BMPBHomeKitClientBase *base;
  void *v5;
  NSString *accessoryUniqueIdentifier;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *accessoryMediaRouteIdentifier;
  NSMutableArray *zoneUniqueIdentifiers;
  NSString *roomUniqueIdentifier;
  NSString *accessoryName;
  NSString *roomName;
  NSMutableArray *zoneNames;
  NSString *homeName;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  base = self->_base;
  if (base)
  {
    -[BMPBHomeKitClientBase dictionaryRepresentation](base, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("base"));

  }
  accessoryUniqueIdentifier = self->_accessoryUniqueIdentifier;
  if (accessoryUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", accessoryUniqueIdentifier, CFSTR("accessoryUniqueIdentifier"));
  if (-[NSMutableArray count](self->_accessoryStates, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_accessoryStates, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = self->_accessoryStates;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("accessoryState"));
  }
  accessoryMediaRouteIdentifier = self->_accessoryMediaRouteIdentifier;
  if (accessoryMediaRouteIdentifier)
    objc_msgSend(v3, "setObject:forKey:", accessoryMediaRouteIdentifier, CFSTR("accessoryMediaRouteIdentifier"));
  zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers;
  if (zoneUniqueIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", zoneUniqueIdentifiers, CFSTR("zoneUniqueIdentifiers"));
  roomUniqueIdentifier = self->_roomUniqueIdentifier;
  if (roomUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", roomUniqueIdentifier, CFSTR("roomUniqueIdentifier"));
  accessoryName = self->_accessoryName;
  if (accessoryName)
    objc_msgSend(v3, "setObject:forKey:", accessoryName, CFSTR("accessoryName"));
  roomName = self->_roomName;
  if (roomName)
    objc_msgSend(v3, "setObject:forKey:", roomName, CFSTR("roomName"));
  zoneNames = self->_zoneNames;
  if (zoneNames)
    objc_msgSend(v3, "setObject:forKey:", zoneNames, CFSTR("zoneNames"));
  homeName = self->_homeName;
  if (homeName)
    objc_msgSend(v3, "setObject:forKey:", homeName, CFSTR("homeName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHomeKitClientMediaAccessoryControlEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_accessoryUniqueIdentifier)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_accessoryStates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  if (self->_accessoryMediaRouteIdentifier)
    PBDataWriterWriteStringField();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_zoneUniqueIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  if (self->_roomUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accessoryName)
    PBDataWriterWriteStringField();
  if (self->_roomName)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_zoneNames;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_homeName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id v16;

  v16 = a3;
  if (self->_base)
    objc_msgSend(v16, "setBase:");
  if (self->_accessoryUniqueIdentifier)
    objc_msgSend(v16, "setAccessoryUniqueIdentifier:");
  if (-[BMPBHomeKitClientMediaAccessoryControlEvent accessoryStatesCount](self, "accessoryStatesCount"))
  {
    objc_msgSend(v16, "clearAccessoryStates");
    v4 = -[BMPBHomeKitClientMediaAccessoryControlEvent accessoryStatesCount](self, "accessoryStatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BMPBHomeKitClientMediaAccessoryControlEvent accessoryStateAtIndex:](self, "accessoryStateAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAccessoryState:", v7);

      }
    }
  }
  if (self->_accessoryMediaRouteIdentifier)
    objc_msgSend(v16, "setAccessoryMediaRouteIdentifier:");
  if (-[BMPBHomeKitClientMediaAccessoryControlEvent zoneUniqueIdentifiersCount](self, "zoneUniqueIdentifiersCount"))
  {
    objc_msgSend(v16, "clearZoneUniqueIdentifiers");
    v8 = -[BMPBHomeKitClientMediaAccessoryControlEvent zoneUniqueIdentifiersCount](self, "zoneUniqueIdentifiersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[BMPBHomeKitClientMediaAccessoryControlEvent zoneUniqueIdentifiersAtIndex:](self, "zoneUniqueIdentifiersAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addZoneUniqueIdentifiers:", v11);

      }
    }
  }
  if (self->_roomUniqueIdentifier)
    objc_msgSend(v16, "setRoomUniqueIdentifier:");
  if (self->_accessoryName)
    objc_msgSend(v16, "setAccessoryName:");
  if (self->_roomName)
    objc_msgSend(v16, "setRoomName:");
  if (-[BMPBHomeKitClientMediaAccessoryControlEvent zoneNamesCount](self, "zoneNamesCount"))
  {
    objc_msgSend(v16, "clearZoneNames");
    v12 = -[BMPBHomeKitClientMediaAccessoryControlEvent zoneNamesCount](self, "zoneNamesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[BMPBHomeKitClientMediaAccessoryControlEvent zoneNamesAtIndex:](self, "zoneNamesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addZoneNames:", v15);

      }
    }
  }
  if (self->_homeName)
    objc_msgSend(v16, "setHomeName:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
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
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[BMPBHomeKitClientBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_accessoryUniqueIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_accessoryStates;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addAccessoryState:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_accessoryMediaRouteIdentifier, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = self->_zoneUniqueIdentifiers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend(v5, "addZoneUniqueIdentifiers:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v20);
  }

  v24 = -[NSString copyWithZone:](self->_roomUniqueIdentifier, "copyWithZone:", a3);
  v25 = (void *)v5[8];
  v5[8] = v24;

  v26 = -[NSString copyWithZone:](self->_accessoryName, "copyWithZone:", a3);
  v27 = (void *)v5[2];
  v5[2] = v26;

  v28 = -[NSString copyWithZone:](self->_roomName, "copyWithZone:", a3);
  v29 = (void *)v5[7];
  v5[7] = v28;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v30 = self->_zoneNames;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v40;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v34), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend(v5, "addZoneNames:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v32);
  }

  v36 = -[NSString copyWithZone:](self->_homeName, "copyWithZone:", a3);
  v37 = (void *)v5[6];
  v5[6] = v36;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BMPBHomeKitClientBase *base;
  NSString *accessoryUniqueIdentifier;
  NSMutableArray *accessoryStates;
  NSString *accessoryMediaRouteIdentifier;
  NSMutableArray *zoneUniqueIdentifiers;
  NSString *roomUniqueIdentifier;
  NSString *accessoryName;
  NSString *roomName;
  NSMutableArray *zoneNames;
  NSString *homeName;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  base = self->_base;
  if ((unint64_t)base | v4[5])
  {
    if (!-[BMPBHomeKitClientBase isEqual:](base, "isEqual:"))
      goto LABEL_22;
  }
  accessoryUniqueIdentifier = self->_accessoryUniqueIdentifier;
  if ((unint64_t)accessoryUniqueIdentifier | v4[4]
    && !-[NSString isEqual:](accessoryUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_22;
  }
  if (((accessoryStates = self->_accessoryStates, !((unint64_t)accessoryStates | v4[3]))
     || -[NSMutableArray isEqual:](accessoryStates, "isEqual:"))
    && ((accessoryMediaRouteIdentifier = self->_accessoryMediaRouteIdentifier,
         !((unint64_t)accessoryMediaRouteIdentifier | v4[1]))
     || -[NSString isEqual:](accessoryMediaRouteIdentifier, "isEqual:"))
    && ((zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers, !((unint64_t)zoneUniqueIdentifiers | v4[10]))
     || -[NSMutableArray isEqual:](zoneUniqueIdentifiers, "isEqual:"))
    && ((roomUniqueIdentifier = self->_roomUniqueIdentifier, !((unint64_t)roomUniqueIdentifier | v4[8]))
     || -[NSString isEqual:](roomUniqueIdentifier, "isEqual:"))
    && ((accessoryName = self->_accessoryName, !((unint64_t)accessoryName | v4[2]))
     || -[NSString isEqual:](accessoryName, "isEqual:"))
    && ((roomName = self->_roomName, !((unint64_t)roomName | v4[7]))
     || -[NSString isEqual:](roomName, "isEqual:"))
    && ((zoneNames = self->_zoneNames, !((unint64_t)zoneNames | v4[9]))
     || -[NSMutableArray isEqual:](zoneNames, "isEqual:")))
  {
    homeName = self->_homeName;
    if ((unint64_t)homeName | v4[6])
      v15 = -[NSString isEqual:](homeName, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;

  v3 = -[BMPBHomeKitClientBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_accessoryUniqueIdentifier, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_accessoryStates, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_accessoryMediaRouteIdentifier, "hash");
  v7 = -[NSMutableArray hash](self->_zoneUniqueIdentifiers, "hash");
  v8 = v7 ^ -[NSString hash](self->_roomUniqueIdentifier, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_accessoryName, "hash");
  v10 = -[NSString hash](self->_roomName, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_zoneNames, "hash");
  return v9 ^ v11 ^ -[NSString hash](self->_homeName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BMPBHomeKitClientBase *base;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
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
  base = self->_base;
  v6 = *((_QWORD *)v4 + 5);
  if (base)
  {
    if (v6)
      -[BMPBHomeKitClientBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[BMPBHomeKitClientMediaAccessoryControlEvent setBase:](self, "setBase:");
  }
  if (*((_QWORD *)v4 + 4))
    -[BMPBHomeKitClientMediaAccessoryControlEvent setAccessoryUniqueIdentifier:](self, "setAccessoryUniqueIdentifier:");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        -[BMPBHomeKitClientMediaAccessoryControlEvent addAccessoryState:](self, "addAccessoryState:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 1))
    -[BMPBHomeKitClientMediaAccessoryControlEvent setAccessoryMediaRouteIdentifier:](self, "setAccessoryMediaRouteIdentifier:");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = *((id *)v4 + 10);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
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
        -[BMPBHomeKitClientMediaAccessoryControlEvent addZoneUniqueIdentifiers:](self, "addZoneUniqueIdentifiers:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  if (*((_QWORD *)v4 + 8))
    -[BMPBHomeKitClientMediaAccessoryControlEvent setRoomUniqueIdentifier:](self, "setRoomUniqueIdentifier:");
  if (*((_QWORD *)v4 + 2))
    -[BMPBHomeKitClientMediaAccessoryControlEvent setAccessoryName:](self, "setAccessoryName:");
  if (*((_QWORD *)v4 + 7))
    -[BMPBHomeKitClientMediaAccessoryControlEvent setRoomName:](self, "setRoomName:");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = *((id *)v4 + 9);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
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
        -[BMPBHomeKitClientMediaAccessoryControlEvent addZoneNames:](self, "addZoneNames:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k), (_QWORD)v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

  if (*((_QWORD *)v4 + 6))
    -[BMPBHomeKitClientMediaAccessoryControlEvent setHomeName:](self, "setHomeName:");

}

- (BMPBHomeKitClientBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (void)setAccessoryUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, a3);
}

- (NSMutableArray)accessoryStates
{
  return self->_accessoryStates;
}

- (void)setAccessoryStates:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryStates, a3);
}

- (NSString)accessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier;
}

- (void)setAccessoryMediaRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryMediaRouteIdentifier, a3);
}

- (NSMutableArray)zoneUniqueIdentifiers
{
  return self->_zoneUniqueIdentifiers;
}

- (void)setZoneUniqueIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, a3);
}

- (NSString)roomUniqueIdentifier
{
  return self->_roomUniqueIdentifier;
}

- (void)setRoomUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, a3);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryName, a3);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (NSMutableArray)zoneNames
{
  return self->_zoneNames;
}

- (void)setZoneNames:(id)a3
{
  objc_storeStrong((id *)&self->_zoneNames, a3);
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
  objc_storeStrong((id *)&self->_homeName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryStates, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_accessoryMediaRouteIdentifier, 0);
}

@end
