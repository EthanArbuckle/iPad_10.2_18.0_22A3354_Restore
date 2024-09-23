@implementation BMPBHomeKitClientAccessoryControlEvent

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasAccessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier != 0;
}

- (BOOL)hasAccessoryState
{
  return self->_accessoryState != 0;
}

- (BOOL)hasServiceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier != 0;
}

- (BOOL)hasServiceType
{
  return self->_serviceType != 0;
}

- (BOOL)hasCharacteristicType
{
  return self->_characteristicType != 0;
}

- (BOOL)hasServiceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier != 0;
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

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasRoomName
{
  return self->_roomName != 0;
}

- (BOOL)hasServiceGroupName
{
  return self->_serviceGroupName != 0;
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
  v8.super_class = (Class)BMPBHomeKitClientAccessoryControlEvent;
  -[BMPBHomeKitClientAccessoryControlEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBHomeKitClientAccessoryControlEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  BMPBAccessoryState *accessoryState;
  void *v8;
  NSString *serviceUniqueIdentifier;
  NSString *serviceType;
  NSString *characteristicType;
  NSString *serviceGroupUniqueIdentifier;
  NSMutableArray *zoneUniqueIdentifiers;
  NSString *roomUniqueIdentifier;
  NSString *accessoryName;
  NSString *serviceName;
  NSString *roomName;
  NSString *serviceGroupName;
  NSMutableArray *zoneNames;
  NSString *homeName;

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
  accessoryState = self->_accessoryState;
  if (accessoryState)
  {
    -[BMPBAccessoryState dictionaryRepresentation](accessoryState, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("accessoryState"));

  }
  serviceUniqueIdentifier = self->_serviceUniqueIdentifier;
  if (serviceUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceUniqueIdentifier, CFSTR("serviceUniqueIdentifier"));
  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(v3, "setObject:forKey:", serviceType, CFSTR("serviceType"));
  characteristicType = self->_characteristicType;
  if (characteristicType)
    objc_msgSend(v3, "setObject:forKey:", characteristicType, CFSTR("characteristicType"));
  serviceGroupUniqueIdentifier = self->_serviceGroupUniqueIdentifier;
  if (serviceGroupUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceGroupUniqueIdentifier, CFSTR("serviceGroupUniqueIdentifier"));
  zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers;
  if (zoneUniqueIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", zoneUniqueIdentifiers, CFSTR("zoneUniqueIdentifiers"));
  roomUniqueIdentifier = self->_roomUniqueIdentifier;
  if (roomUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", roomUniqueIdentifier, CFSTR("roomUniqueIdentifier"));
  accessoryName = self->_accessoryName;
  if (accessoryName)
    objc_msgSend(v3, "setObject:forKey:", accessoryName, CFSTR("accessoryName"));
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v3, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  roomName = self->_roomName;
  if (roomName)
    objc_msgSend(v3, "setObject:forKey:", roomName, CFSTR("roomName"));
  serviceGroupName = self->_serviceGroupName;
  if (serviceGroupName)
    objc_msgSend(v3, "setObject:forKey:", serviceGroupName, CFSTR("serviceGroupName"));
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
  return BMPBHomeKitClientAccessoryControlEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_accessoryUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accessoryState)
    PBDataWriterWriteSubmessage();
  if (self->_serviceUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_serviceType)
    PBDataWriterWriteStringField();
  if (self->_characteristicType)
    PBDataWriterWriteStringField();
  if (self->_serviceGroupUniqueIdentifier)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_zoneUniqueIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_roomUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accessoryName)
    PBDataWriterWriteStringField();
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  if (self->_roomName)
    PBDataWriterWriteStringField();
  if (self->_serviceGroupName)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_zoneNames;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
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
  id v12;

  v12 = a3;
  if (self->_base)
    objc_msgSend(v12, "setBase:");
  if (self->_accessoryUniqueIdentifier)
    objc_msgSend(v12, "setAccessoryUniqueIdentifier:");
  if (self->_accessoryState)
    objc_msgSend(v12, "setAccessoryState:");
  if (self->_serviceUniqueIdentifier)
    objc_msgSend(v12, "setServiceUniqueIdentifier:");
  if (self->_serviceType)
    objc_msgSend(v12, "setServiceType:");
  if (self->_characteristicType)
    objc_msgSend(v12, "setCharacteristicType:");
  if (self->_serviceGroupUniqueIdentifier)
    objc_msgSend(v12, "setServiceGroupUniqueIdentifier:");
  if (-[BMPBHomeKitClientAccessoryControlEvent zoneUniqueIdentifiersCount](self, "zoneUniqueIdentifiersCount"))
  {
    objc_msgSend(v12, "clearZoneUniqueIdentifiers");
    v4 = -[BMPBHomeKitClientAccessoryControlEvent zoneUniqueIdentifiersCount](self, "zoneUniqueIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BMPBHomeKitClientAccessoryControlEvent zoneUniqueIdentifiersAtIndex:](self, "zoneUniqueIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addZoneUniqueIdentifiers:", v7);

      }
    }
  }
  if (self->_roomUniqueIdentifier)
    objc_msgSend(v12, "setRoomUniqueIdentifier:");
  if (self->_accessoryName)
    objc_msgSend(v12, "setAccessoryName:");
  if (self->_serviceName)
    objc_msgSend(v12, "setServiceName:");
  if (self->_roomName)
    objc_msgSend(v12, "setRoomName:");
  if (self->_serviceGroupName)
    objc_msgSend(v12, "setServiceGroupName:");
  if (-[BMPBHomeKitClientAccessoryControlEvent zoneNamesCount](self, "zoneNamesCount"))
  {
    objc_msgSend(v12, "clearZoneNames");
    v8 = -[BMPBHomeKitClientAccessoryControlEvent zoneNamesCount](self, "zoneNamesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[BMPBHomeKitClientAccessoryControlEvent zoneNamesAtIndex:](self, "zoneNamesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addZoneNames:", v11);

      }
    }
  }
  if (self->_homeName)
    objc_msgSend(v12, "setHomeName:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[BMPBHomeKitClientBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_accessoryUniqueIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[BMPBAccessoryState copyWithZone:](self->_accessoryState, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_serviceUniqueIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[13];
  v5[13] = v12;

  v14 = -[NSString copyWithZone:](self->_serviceType, "copyWithZone:", a3);
  v15 = (void *)v5[12];
  v5[12] = v14;

  v16 = -[NSString copyWithZone:](self->_characteristicType, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSString copyWithZone:](self->_serviceGroupUniqueIdentifier, "copyWithZone:", a3);
  v19 = (void *)v5[10];
  v5[10] = v18;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v20 = self->_zoneUniqueIdentifiers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v50;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v50 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend(v5, "addZoneUniqueIdentifiers:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v22);
  }

  v26 = -[NSString copyWithZone:](self->_roomUniqueIdentifier, "copyWithZone:", a3);
  v27 = (void *)v5[8];
  v5[8] = v26;

  v28 = -[NSString copyWithZone:](self->_accessoryName, "copyWithZone:", a3);
  v29 = (void *)v5[1];
  v5[1] = v28;

  v30 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v31 = (void *)v5[11];
  v5[11] = v30;

  v32 = -[NSString copyWithZone:](self->_roomName, "copyWithZone:", a3);
  v33 = (void *)v5[7];
  v5[7] = v32;

  v34 = -[NSString copyWithZone:](self->_serviceGroupName, "copyWithZone:", a3);
  v35 = (void *)v5[9];
  v5[9] = v34;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v36 = self->_zoneNames;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v46;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v40), "copyWithZone:", a3, (_QWORD)v45);
        objc_msgSend(v5, "addZoneNames:", v41);

        ++v40;
      }
      while (v38 != v40);
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v38);
  }

  v42 = -[NSString copyWithZone:](self->_homeName, "copyWithZone:", a3);
  v43 = (void *)v5[6];
  v5[6] = v42;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BMPBHomeKitClientBase *base;
  NSString *accessoryUniqueIdentifier;
  BMPBAccessoryState *accessoryState;
  NSString *serviceUniqueIdentifier;
  NSString *serviceType;
  NSString *characteristicType;
  NSString *serviceGroupUniqueIdentifier;
  NSMutableArray *zoneUniqueIdentifiers;
  NSString *roomUniqueIdentifier;
  NSString *accessoryName;
  NSString *serviceName;
  NSString *roomName;
  NSString *serviceGroupName;
  NSMutableArray *zoneNames;
  NSString *homeName;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  base = self->_base;
  if ((unint64_t)base | v4[4])
  {
    if (!-[BMPBHomeKitClientBase isEqual:](base, "isEqual:"))
      goto LABEL_32;
  }
  accessoryUniqueIdentifier = self->_accessoryUniqueIdentifier;
  if ((unint64_t)accessoryUniqueIdentifier | v4[3]
    && !-[NSString isEqual:](accessoryUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  accessoryState = self->_accessoryState;
  if ((unint64_t)accessoryState | v4[2] && !-[BMPBAccessoryState isEqual:](accessoryState, "isEqual:"))
    goto LABEL_32;
  serviceUniqueIdentifier = self->_serviceUniqueIdentifier;
  if ((unint64_t)serviceUniqueIdentifier | v4[13]
    && !-[NSString isEqual:](serviceUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  serviceType = self->_serviceType;
  if ((unint64_t)serviceType | v4[12] && !-[NSString isEqual:](serviceType, "isEqual:"))
    goto LABEL_32;
  characteristicType = self->_characteristicType;
  if ((unint64_t)characteristicType | v4[5]
    && !-[NSString isEqual:](characteristicType, "isEqual:"))
  {
    goto LABEL_32;
  }
  serviceGroupUniqueIdentifier = self->_serviceGroupUniqueIdentifier;
  if ((unint64_t)serviceGroupUniqueIdentifier | v4[10]
    && !-[NSString isEqual:](serviceGroupUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  if (((zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers, !((unint64_t)zoneUniqueIdentifiers | v4[15]))
     || -[NSMutableArray isEqual:](zoneUniqueIdentifiers, "isEqual:"))
    && ((roomUniqueIdentifier = self->_roomUniqueIdentifier, !((unint64_t)roomUniqueIdentifier | v4[8]))
     || -[NSString isEqual:](roomUniqueIdentifier, "isEqual:"))
    && ((accessoryName = self->_accessoryName, !((unint64_t)accessoryName | v4[1]))
     || -[NSString isEqual:](accessoryName, "isEqual:"))
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[11]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((roomName = self->_roomName, !((unint64_t)roomName | v4[7]))
     || -[NSString isEqual:](roomName, "isEqual:"))
    && ((serviceGroupName = self->_serviceGroupName, !((unint64_t)serviceGroupName | v4[9]))
     || -[NSString isEqual:](serviceGroupName, "isEqual:"))
    && ((zoneNames = self->_zoneNames, !((unint64_t)zoneNames | v4[14]))
     || -[NSMutableArray isEqual:](zoneNames, "isEqual:")))
  {
    homeName = self->_homeName;
    if ((unint64_t)homeName | v4[6])
      v20 = -[NSString isEqual:](homeName, "isEqual:");
    else
      v20 = 1;
  }
  else
  {
LABEL_32:
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;

  v3 = -[BMPBHomeKitClientBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_accessoryUniqueIdentifier, "hash") ^ v3;
  v5 = -[BMPBAccessoryState hash](self->_accessoryState, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_serviceUniqueIdentifier, "hash");
  v7 = -[NSString hash](self->_serviceType, "hash");
  v8 = v7 ^ -[NSString hash](self->_characteristicType, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_serviceGroupUniqueIdentifier, "hash");
  v10 = -[NSMutableArray hash](self->_zoneUniqueIdentifiers, "hash");
  v11 = v10 ^ -[NSString hash](self->_roomUniqueIdentifier, "hash");
  v12 = v11 ^ -[NSString hash](self->_accessoryName, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_serviceName, "hash");
  v14 = -[NSString hash](self->_roomName, "hash");
  v15 = v14 ^ -[NSString hash](self->_serviceGroupName, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_zoneNames, "hash");
  return v13 ^ v16 ^ -[NSString hash](self->_homeName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BMPBHomeKitClientBase *base;
  uint64_t v6;
  BMPBAccessoryState *accessoryState;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  base = self->_base;
  v6 = *((_QWORD *)v4 + 4);
  if (base)
  {
    if (v6)
      -[BMPBHomeKitClientBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[BMPBHomeKitClientAccessoryControlEvent setBase:](self, "setBase:");
  }
  if (*((_QWORD *)v4 + 3))
    -[BMPBHomeKitClientAccessoryControlEvent setAccessoryUniqueIdentifier:](self, "setAccessoryUniqueIdentifier:");
  accessoryState = self->_accessoryState;
  v8 = *((_QWORD *)v4 + 2);
  if (accessoryState)
  {
    if (v8)
      -[BMPBAccessoryState mergeFrom:](accessoryState, "mergeFrom:");
  }
  else if (v8)
  {
    -[BMPBHomeKitClientAccessoryControlEvent setAccessoryState:](self, "setAccessoryState:");
  }
  if (*((_QWORD *)v4 + 13))
    -[BMPBHomeKitClientAccessoryControlEvent setServiceUniqueIdentifier:](self, "setServiceUniqueIdentifier:");
  if (*((_QWORD *)v4 + 12))
    -[BMPBHomeKitClientAccessoryControlEvent setServiceType:](self, "setServiceType:");
  if (*((_QWORD *)v4 + 5))
    -[BMPBHomeKitClientAccessoryControlEvent setCharacteristicType:](self, "setCharacteristicType:");
  if (*((_QWORD *)v4 + 10))
    -[BMPBHomeKitClientAccessoryControlEvent setServiceGroupUniqueIdentifier:](self, "setServiceGroupUniqueIdentifier:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *((id *)v4 + 15);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        -[BMPBHomeKitClientAccessoryControlEvent addZoneUniqueIdentifiers:](self, "addZoneUniqueIdentifiers:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  if (*((_QWORD *)v4 + 8))
    -[BMPBHomeKitClientAccessoryControlEvent setRoomUniqueIdentifier:](self, "setRoomUniqueIdentifier:");
  if (*((_QWORD *)v4 + 1))
    -[BMPBHomeKitClientAccessoryControlEvent setAccessoryName:](self, "setAccessoryName:");
  if (*((_QWORD *)v4 + 11))
    -[BMPBHomeKitClientAccessoryControlEvent setServiceName:](self, "setServiceName:");
  if (*((_QWORD *)v4 + 7))
    -[BMPBHomeKitClientAccessoryControlEvent setRoomName:](self, "setRoomName:");
  if (*((_QWORD *)v4 + 9))
    -[BMPBHomeKitClientAccessoryControlEvent setServiceGroupName:](self, "setServiceGroupName:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 14);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[BMPBHomeKitClientAccessoryControlEvent addZoneNames:](self, "addZoneNames:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  if (*((_QWORD *)v4 + 6))
    -[BMPBHomeKitClientAccessoryControlEvent setHomeName:](self, "setHomeName:");

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

- (BMPBAccessoryState)accessoryState
{
  return self->_accessoryState;
}

- (void)setAccessoryState:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryState, a3);
}

- (NSString)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (void)setServiceUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void)setCharacteristicType:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicType, a3);
}

- (NSString)serviceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier;
}

- (void)setServiceGroupUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceGroupUniqueIdentifier, a3);
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

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (NSString)serviceGroupName
{
  return self->_serviceGroupName;
}

- (void)setServiceGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceGroupName, a3);
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
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceGroupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceGroupName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryState, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
}

@end
