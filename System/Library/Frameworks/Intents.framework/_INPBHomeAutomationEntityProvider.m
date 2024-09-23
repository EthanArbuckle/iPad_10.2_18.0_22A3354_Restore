@implementation _INPBHomeAutomationEntityProvider

- (void)setAccessoryNames:(id)a3
{
  NSArray *v4;
  NSArray *accessoryNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  accessoryNames = self->_accessoryNames;
  self->_accessoryNames = v4;

}

- (void)clearAccessoryNames
{
  -[NSArray removeAllObjects](self->_accessoryNames, "removeAllObjects");
}

- (void)addAccessoryNames:(id)a3
{
  id v4;
  NSArray *accessoryNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  accessoryNames = self->_accessoryNames;
  v8 = v4;
  if (!accessoryNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_accessoryNames;
    self->_accessoryNames = v6;

    v4 = v8;
    accessoryNames = self->_accessoryNames;
  }
  -[NSArray addObject:](accessoryNames, "addObject:", v4);

}

- (unint64_t)accessoryNamesCount
{
  return -[NSArray count](self->_accessoryNames, "count");
}

- (id)accessoryNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_accessoryNames, "objectAtIndexedSubscript:", a3);
}

- (void)setDestinationDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDeviceId, a3);
}

- (BOOL)hasDestinationDeviceId
{
  return self->_destinationDeviceId != 0;
}

- (void)setHomeName:(id)a3
{
  objc_storeStrong((id *)&self->_homeName, a3);
}

- (BOOL)hasHomeName
{
  return self->_homeName != 0;
}

- (void)setIntentDeviceQuantifier:(id)a3
{
  objc_storeStrong((id *)&self->_intentDeviceQuantifier, a3);
}

- (BOOL)hasIntentDeviceQuantifier
{
  return self->_intentDeviceQuantifier != 0;
}

- (void)setIntentDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_intentDeviceType, a3);
}

- (BOOL)hasIntentDeviceType
{
  return self->_intentDeviceType != 0;
}

- (void)setIntentFromEntities:(id)a3
{
  NSArray *v4;
  NSArray *intentFromEntities;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentFromEntities = self->_intentFromEntities;
  self->_intentFromEntities = v4;

}

- (void)clearIntentFromEntities
{
  -[NSArray removeAllObjects](self->_intentFromEntities, "removeAllObjects");
}

- (void)addIntentFromEntities:(id)a3
{
  id v4;
  NSArray *intentFromEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentFromEntities = self->_intentFromEntities;
  v8 = v4;
  if (!intentFromEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentFromEntities;
    self->_intentFromEntities = v6;

    v4 = v8;
    intentFromEntities = self->_intentFromEntities;
  }
  -[NSArray addObject:](intentFromEntities, "addObject:", v4);

}

- (unint64_t)intentFromEntitiesCount
{
  return -[NSArray count](self->_intentFromEntities, "count");
}

- (id)intentFromEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentFromEntities, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentPlaceHint:(id)a3
{
  objc_storeStrong((id *)&self->_intentPlaceHint, a3);
}

- (BOOL)hasIntentPlaceHint
{
  return self->_intentPlaceHint != 0;
}

- (void)setIntentReference:(id)a3
{
  objc_storeStrong((id *)&self->_intentReference, a3);
}

- (BOOL)hasIntentReference
{
  return self->_intentReference != 0;
}

- (void)setRoomNames:(id)a3
{
  NSArray *v4;
  NSArray *roomNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  roomNames = self->_roomNames;
  self->_roomNames = v4;

}

- (void)clearRoomNames
{
  -[NSArray removeAllObjects](self->_roomNames, "removeAllObjects");
}

- (void)addRoomNames:(id)a3
{
  id v4;
  NSArray *roomNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  roomNames = self->_roomNames;
  v8 = v4;
  if (!roomNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_roomNames;
    self->_roomNames = v6;

    v4 = v8;
    roomNames = self->_roomNames;
  }
  -[NSArray addObject:](roomNames, "addObject:", v4);

}

- (unint64_t)roomNamesCount
{
  return -[NSArray count](self->_roomNames, "count");
}

- (id)roomNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_roomNames, "objectAtIndexedSubscript:", a3);
}

- (void)setServiceGroups:(id)a3
{
  NSArray *v4;
  NSArray *serviceGroups;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  serviceGroups = self->_serviceGroups;
  self->_serviceGroups = v4;

}

- (void)clearServiceGroups
{
  -[NSArray removeAllObjects](self->_serviceGroups, "removeAllObjects");
}

- (void)addServiceGroups:(id)a3
{
  id v4;
  NSArray *serviceGroups;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  serviceGroups = self->_serviceGroups;
  v8 = v4;
  if (!serviceGroups)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_serviceGroups;
    self->_serviceGroups = v6;

    v4 = v8;
    serviceGroups = self->_serviceGroups;
  }
  -[NSArray addObject:](serviceGroups, "addObject:", v4);

}

- (unint64_t)serviceGroupsCount
{
  return -[NSArray count](self->_serviceGroups, "count");
}

- (id)serviceGroupsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_serviceGroups, "objectAtIndexedSubscript:", a3);
}

- (void)setServiceNames:(id)a3
{
  NSArray *v4;
  NSArray *serviceNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  serviceNames = self->_serviceNames;
  self->_serviceNames = v4;

}

- (void)clearServiceNames
{
  -[NSArray removeAllObjects](self->_serviceNames, "removeAllObjects");
}

- (void)addServiceNames:(id)a3
{
  id v4;
  NSArray *serviceNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  serviceNames = self->_serviceNames;
  v8 = v4;
  if (!serviceNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_serviceNames;
    self->_serviceNames = v6;

    v4 = v8;
    serviceNames = self->_serviceNames;
  }
  -[NSArray addObject:](serviceNames, "addObject:", v4);

}

- (unint64_t)serviceNamesCount
{
  return -[NSArray count](self->_serviceNames, "count");
}

- (id)serviceNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_serviceNames, "objectAtIndexedSubscript:", a3);
}

- (void)setZoneNames:(id)a3
{
  NSArray *v4;
  NSArray *zoneNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  zoneNames = self->_zoneNames;
  self->_zoneNames = v4;

}

- (void)clearZoneNames
{
  -[NSArray removeAllObjects](self->_zoneNames, "removeAllObjects");
}

- (void)addZoneNames:(id)a3
{
  id v4;
  NSArray *zoneNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  zoneNames = self->_zoneNames;
  v8 = v4;
  if (!zoneNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_zoneNames;
    self->_zoneNames = v6;

    v4 = v8;
    zoneNames = self->_zoneNames;
  }
  -[NSArray addObject:](zoneNames, "addObject:", v4);

}

- (unint64_t)zoneNamesCount
{
  return -[NSArray count](self->_zoneNames, "count");
}

- (id)zoneNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_zoneNames, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeAutomationEntityProviderReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v5 = self->_accessoryNames;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v68;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v68 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v7);
  }

  -[_INPBHomeAutomationEntityProvider destinationDeviceId](self, "destinationDeviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBHomeAutomationEntityProvider destinationDeviceId](self, "destinationDeviceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeAutomationEntityProvider homeName](self, "homeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBHomeAutomationEntityProvider homeName](self, "homeName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeAutomationEntityProvider intentDeviceQuantifier](self, "intentDeviceQuantifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBHomeAutomationEntityProvider intentDeviceQuantifier](self, "intentDeviceQuantifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeAutomationEntityProvider intentDeviceType](self, "intentDeviceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBHomeAutomationEntityProvider intentDeviceType](self, "intentDeviceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v18 = self->_intentFromEntities;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v64;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v64 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v20);
  }

  -[_INPBHomeAutomationEntityProvider intentPlaceHint](self, "intentPlaceHint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_INPBHomeAutomationEntityProvider intentPlaceHint](self, "intentPlaceHint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeAutomationEntityProvider intentReference](self, "intentReference");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[_INPBHomeAutomationEntityProvider intentReference](self, "intentReference");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v27 = self->_roomNames;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v60;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v60 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteSubmessage();
        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    }
    while (v29);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v32 = self->_serviceGroups;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v56;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v56 != v35)
          objc_enumerationMutation(v32);
        PBDataWriterWriteSubmessage();
        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    }
    while (v34);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = self->_serviceNames;
  v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v52;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(v37);
        PBDataWriterWriteSubmessage();
        ++v41;
      }
      while (v39 != v41);
      v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
    }
    while (v39);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v42 = self->_zoneNames;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v48;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v48 != v45)
          objc_enumerationMutation(v42);
        PBDataWriterWriteSubmessage();
        ++v46;
      }
      while (v44 != v46);
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
    }
    while (v44);
  }

}

- (_INPBHomeAutomationEntityProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHomeAutomationEntityProvider *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHomeAutomationEntityProvider *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHomeAutomationEntityProvider *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHomeAutomationEntityProvider initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBHomeAutomationEntityProvider data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHomeAutomationEntityProvider *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = -[_INPBHomeAutomationEntityProvider init](+[_INPBHomeAutomationEntityProvider allocWithZone:](_INPBHomeAutomationEntityProvider, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_accessoryNames, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setAccessoryNames:](v5, "setAccessoryNames:", v6);

  v7 = -[_INPBString copyWithZone:](self->_destinationDeviceId, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setDestinationDeviceId:](v5, "setDestinationDeviceId:", v7);

  v8 = -[_INPBString copyWithZone:](self->_homeName, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setHomeName:](v5, "setHomeName:", v8);

  v9 = -[_INPBString copyWithZone:](self->_intentDeviceQuantifier, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setIntentDeviceQuantifier:](v5, "setIntentDeviceQuantifier:", v9);

  v10 = -[_INPBString copyWithZone:](self->_intentDeviceType, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setIntentDeviceType:](v5, "setIntentDeviceType:", v10);

  v11 = (void *)-[NSArray copyWithZone:](self->_intentFromEntities, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setIntentFromEntities:](v5, "setIntentFromEntities:", v11);

  v12 = -[_INPBString copyWithZone:](self->_intentPlaceHint, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setIntentPlaceHint:](v5, "setIntentPlaceHint:", v12);

  v13 = -[_INPBString copyWithZone:](self->_intentReference, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setIntentReference:](v5, "setIntentReference:", v13);

  v14 = (void *)-[NSArray copyWithZone:](self->_roomNames, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setRoomNames:](v5, "setRoomNames:", v14);

  v15 = (void *)-[NSArray copyWithZone:](self->_serviceGroups, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setServiceGroups:](v5, "setServiceGroups:", v15);

  v16 = (void *)-[NSArray copyWithZone:](self->_serviceNames, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setServiceNames:](v5, "setServiceNames:", v16);

  v17 = (void *)-[NSArray copyWithZone:](self->_zoneNames, "copyWithZone:", a3);
  -[_INPBHomeAutomationEntityProvider setZoneNames:](v5, "setZoneNames:", v17);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  BOOL v67;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  -[_INPBHomeAutomationEntityProvider accessoryNames](self, "accessoryNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider accessoryNames](self, "accessoryNames");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBHomeAutomationEntityProvider accessoryNames](self, "accessoryNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider destinationDeviceId](self, "destinationDeviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider destinationDeviceId](self, "destinationDeviceId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBHomeAutomationEntityProvider destinationDeviceId](self, "destinationDeviceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationDeviceId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider homeName](self, "homeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider homeName](self, "homeName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBHomeAutomationEntityProvider homeName](self, "homeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider intentDeviceQuantifier](self, "intentDeviceQuantifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentDeviceQuantifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider intentDeviceQuantifier](self, "intentDeviceQuantifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBHomeAutomationEntityProvider intentDeviceQuantifier](self, "intentDeviceQuantifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentDeviceQuantifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider intentDeviceType](self, "intentDeviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentDeviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider intentDeviceType](self, "intentDeviceType");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBHomeAutomationEntityProvider intentDeviceType](self, "intentDeviceType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentDeviceType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider intentFromEntities](self, "intentFromEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentFromEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider intentFromEntities](self, "intentFromEntities");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBHomeAutomationEntityProvider intentFromEntities](self, "intentFromEntities");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentFromEntities");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider intentPlaceHint](self, "intentPlaceHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentPlaceHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider intentPlaceHint](self, "intentPlaceHint");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBHomeAutomationEntityProvider intentPlaceHint](self, "intentPlaceHint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentPlaceHint");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider intentReference](self, "intentReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider intentReference](self, "intentReference");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBHomeAutomationEntityProvider intentReference](self, "intentReference");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentReference");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider roomNames](self, "roomNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "roomNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider roomNames](self, "roomNames");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBHomeAutomationEntityProvider roomNames](self, "roomNames");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roomNames");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider serviceGroups](self, "serviceGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider serviceGroups](self, "serviceGroups");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBHomeAutomationEntityProvider serviceGroups](self, "serviceGroups");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceGroups");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider serviceNames](self, "serviceNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBHomeAutomationEntityProvider serviceNames](self, "serviceNames");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_INPBHomeAutomationEntityProvider serviceNames](self, "serviceNames");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceNames");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBHomeAutomationEntityProvider zoneNames](self, "zoneNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBHomeAutomationEntityProvider zoneNames](self, "zoneNames");
    v62 = objc_claimAutoreleasedReturnValue();
    if (!v62)
    {

LABEL_65:
      v67 = 1;
      goto LABEL_63;
    }
    v63 = (void *)v62;
    -[_INPBHomeAutomationEntityProvider zoneNames](self, "zoneNames");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneNames");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if ((v66 & 1) != 0)
      goto LABEL_65;
  }
  else
  {
LABEL_61:

  }
LABEL_62:
  v67 = 0;
LABEL_63:

  return v67;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NSArray hash](self->_accessoryNames, "hash");
  v4 = -[_INPBString hash](self->_destinationDeviceId, "hash") ^ v3;
  v5 = -[_INPBString hash](self->_homeName, "hash");
  v6 = v4 ^ v5 ^ -[_INPBString hash](self->_intentDeviceQuantifier, "hash");
  v7 = -[_INPBString hash](self->_intentDeviceType, "hash");
  v8 = v7 ^ -[NSArray hash](self->_intentFromEntities, "hash");
  v9 = v6 ^ v8 ^ -[_INPBString hash](self->_intentPlaceHint, "hash");
  v10 = -[_INPBString hash](self->_intentReference, "hash");
  v11 = v10 ^ -[NSArray hash](self->_roomNames, "hash");
  v12 = v11 ^ -[NSArray hash](self->_serviceGroups, "hash");
  v13 = v9 ^ v12 ^ -[NSArray hash](self->_serviceNames, "hash");
  return v13 ^ -[NSArray hash](self->_zoneNames, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_accessoryNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v5 = self->_accessoryNames;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v80;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v80 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accessoryNames"));
  }
  -[_INPBHomeAutomationEntityProvider destinationDeviceId](self, "destinationDeviceId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("destinationDeviceId"));

  -[_INPBHomeAutomationEntityProvider homeName](self, "homeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("homeName"));

  -[_INPBHomeAutomationEntityProvider intentDeviceQuantifier](self, "intentDeviceQuantifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("intentDeviceQuantifier"));

  -[_INPBHomeAutomationEntityProvider intentDeviceType](self, "intentDeviceType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("intentDeviceType"));

  if (-[NSArray count](self->_intentFromEntities, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v20 = self->_intentFromEntities;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v76;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v76 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v24), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("intentFromEntities"));
  }
  -[_INPBHomeAutomationEntityProvider intentPlaceHint](self, "intentPlaceHint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("intentPlaceHint"));

  -[_INPBHomeAutomationEntityProvider intentReference](self, "intentReference");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("intentReference"));

  if (-[NSArray count](self->_roomNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v31 = self->_roomNames;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v72;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v72 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v35), "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

          ++v35;
        }
        while (v33 != v35);
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
      }
      while (v33);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("roomNames"));
  }
  if (-[NSArray count](self->_serviceGroups, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v38 = self->_serviceGroups;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v68;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v68 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v42), "dictionaryRepresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v43);

          ++v42;
        }
        while (v40 != v42);
        v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
      }
      while (v40);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("serviceGroups"));
  }
  if (-[NSArray count](self->_serviceNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v45 = self->_serviceNames;
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v63, v84, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v64;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v64 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v49), "dictionaryRepresentation");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v50);

          ++v49;
        }
        while (v47 != v49);
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v63, v84, 16);
      }
      while (v47);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("serviceNames"));
  }
  if (-[NSArray count](self->_zoneNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v52 = self->_zoneNames;
    v53 = -[NSArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v59, v83, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v60;
      do
      {
        v56 = 0;
        do
        {
          if (*(_QWORD *)v60 != v55)
            objc_enumerationMutation(v52);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v56), "dictionaryRepresentation", (_QWORD)v59);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v57);

          ++v56;
        }
        while (v54 != v56);
        v54 = -[NSArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v59, v83, 16);
      }
      while (v54);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("zoneNames"));
  }
  return v3;
}

- (NSArray)accessoryNames
{
  return self->_accessoryNames;
}

- (_INPBString)destinationDeviceId
{
  return self->_destinationDeviceId;
}

- (_INPBString)homeName
{
  return self->_homeName;
}

- (_INPBString)intentDeviceQuantifier
{
  return self->_intentDeviceQuantifier;
}

- (_INPBString)intentDeviceType
{
  return self->_intentDeviceType;
}

- (NSArray)intentFromEntities
{
  return self->_intentFromEntities;
}

- (_INPBString)intentPlaceHint
{
  return self->_intentPlaceHint;
}

- (_INPBString)intentReference
{
  return self->_intentReference;
}

- (NSArray)roomNames
{
  return self->_roomNames;
}

- (NSArray)serviceGroups
{
  return self->_serviceGroups;
}

- (NSArray)serviceNames
{
  return self->_serviceNames;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_serviceNames, 0);
  objc_storeStrong((id *)&self->_serviceGroups, 0);
  objc_storeStrong((id *)&self->_roomNames, 0);
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_intentPlaceHint, 0);
  objc_storeStrong((id *)&self->_intentFromEntities, 0);
  objc_storeStrong((id *)&self->_intentDeviceType, 0);
  objc_storeStrong((id *)&self->_intentDeviceQuantifier, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_destinationDeviceId, 0);
  objc_storeStrong((id *)&self->_accessoryNames, 0);
}

+ (Class)accessoryNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentFromEntitiesType
{
  return (Class)objc_opt_class();
}

+ (Class)roomNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)serviceGroupsType
{
  return (Class)objc_opt_class();
}

+ (Class)serviceNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)zoneNamesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
