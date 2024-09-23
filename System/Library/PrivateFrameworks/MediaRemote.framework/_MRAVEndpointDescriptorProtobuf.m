@implementation _MRAVEndpointDescriptorProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRAVEndpointDescriptorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)addOutputDevices:(id)a3
{
  id v4;
  NSMutableArray *outputDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  outputDevices = self->_outputDevices;
  v8 = v4;
  if (!outputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_outputDevices;
    self->_outputDevices = v6;

    v4 = v8;
    outputDevices = self->_outputDevices;
  }
  -[NSMutableArray addObject:](outputDevices, "addObject:", v4);

}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setDesignatedGroupLeader:(id)a3
{
  objc_storeStrong((id *)&self->_designatedGroupLeader, a3);
}

- (void)setConnectionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_connectionType = a3;
}

- (void)setCanModifyGroupMembership:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_canModifyGroupMembership = a3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSMutableArray)personalOutputDevices
{
  return self->_personalOutputDevices;
}

- (NSMutableArray)outputDevices
{
  return self->_outputDevices;
}

- (NSString)name
{
  return self->_name;
}

- (_MRAVOutputDeviceDescriptorProtobuf)designatedGroupLeader
{
  return self->_designatedGroupLeader;
}

- (int)connectionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_connectionType;
  else
    return 0;
}

- (BOOL)canModifyGroupMembership
{
  return self->_canModifyGroupMembership;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_personalOutputDevices, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_designatedGroupLeader, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *uniqueIdentifier;
  NSMutableArray *outputDevices;
  _MRAVOutputDeviceDescriptorProtobuf *designatedGroupLeader;
  char has;
  NSString *instanceIdentifier;
  char v11;
  NSMutableArray *personalOutputDevices;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_38;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_38;
  }
  outputDevices = self->_outputDevices;
  if ((unint64_t)outputDevices | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](outputDevices, "isEqual:"))
      goto LABEL_38;
  }
  designatedGroupLeader = self->_designatedGroupLeader;
  if ((unint64_t)designatedGroupLeader | *((_QWORD *)v4 + 2))
  {
    if (!-[_MRAVOutputDeviceDescriptorProtobuf isEqual:](designatedGroupLeader, "isEqual:"))
      goto LABEL_38;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0)
      goto LABEL_38;
    if (self->_isLocalEndpoint)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_38;
  }
  instanceIdentifier = self->_instanceIdentifier;
  if ((unint64_t)instanceIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](instanceIdentifier, "isEqual:"))
      goto LABEL_38;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0)
      goto LABEL_38;
    if (self->_isProxyGroupPlayer)
    {
      if (!*((_BYTE *)v4 + 66))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 66))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_connectionType != *((_DWORD *)v4 + 2))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0)
      goto LABEL_44;
LABEL_38:
    v11 = 0;
    goto LABEL_39;
  }
  if ((*((_BYTE *)v4 + 68) & 2) == 0)
    goto LABEL_38;
  if (!self->_canModifyGroupMembership)
  {
    if (!*((_BYTE *)v4 + 64))
      goto LABEL_44;
    goto LABEL_38;
  }
  if (!*((_BYTE *)v4 + 64))
    goto LABEL_38;
LABEL_44:
  personalOutputDevices = self->_personalOutputDevices;
  if ((unint64_t)personalOutputDevices | *((_QWORD *)v4 + 6))
    v11 = -[NSMutableArray isEqual:](personalOutputDevices, "isEqual:");
  else
    v11 = 1;
LABEL_39:

  return v11;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_uniqueIdentifier)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_outputDevices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  if (self->_designatedGroupLeader)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_instanceIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_20:
      if ((has & 2) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_21:
    PBDataWriterWriteBOOLField();
LABEL_22:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_personalOutputDevices;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (void)clearOutputDevices
{
  -[NSMutableArray removeAllObjects](self->_outputDevices, "removeAllObjects");
}

- (unint64_t)outputDevicesCount
{
  return -[NSMutableArray count](self->_outputDevices, "count");
}

- (id)outputDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_outputDevices, "objectAtIndex:", a3);
}

+ (Class)outputDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDesignatedGroupLeader
{
  return self->_designatedGroupLeader != 0;
}

- (void)setIsLocalEndpoint:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isLocalEndpoint = a3;
}

- (void)setHasIsLocalEndpoint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsLocalEndpoint
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasInstanceIdentifier
{
  return self->_instanceIdentifier != 0;
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isProxyGroupPlayer = a3;
}

- (void)setHasIsProxyGroupPlayer:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsProxyGroupPlayer
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasConnectionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E30C9D10[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Local")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Direct")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Relay")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AirPlaySender")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoteHosted")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LocalHosted")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasCanModifyGroupMembership:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCanModifyGroupMembership
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearPersonalOutputDevices
{
  -[NSMutableArray removeAllObjects](self->_personalOutputDevices, "removeAllObjects");
}

- (void)addPersonalOutputDevices:(id)a3
{
  id v4;
  NSMutableArray *personalOutputDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  personalOutputDevices = self->_personalOutputDevices;
  v8 = v4;
  if (!personalOutputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_personalOutputDevices;
    self->_personalOutputDevices = v6;

    v4 = v8;
    personalOutputDevices = self->_personalOutputDevices;
  }
  -[NSMutableArray addObject:](personalOutputDevices, "addObject:", v4);

}

- (unint64_t)personalOutputDevicesCount
{
  return -[NSMutableArray count](self->_personalOutputDevices, "count");
}

- (id)personalOutputDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_personalOutputDevices, "objectAtIndex:", a3);
}

+ (Class)personalOutputDevicesType
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
  v8.super_class = (Class)_MRAVEndpointDescriptorProtobuf;
  -[_MRAVEndpointDescriptorProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVEndpointDescriptorProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *uniqueIdentifier;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _MRAVOutputDeviceDescriptorProtobuf *designatedGroupLeader;
  void *v15;
  void *v16;
  NSString *instanceIdentifier;
  char has;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v28;
  uint64_t connectionType;
  __CFString *v30;
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
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v4, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  if (-[NSMutableArray count](self->_outputDevices, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_outputDevices, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = self->_outputDevices;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("outputDevices"));
  }
  designatedGroupLeader = self->_designatedGroupLeader;
  if (designatedGroupLeader)
  {
    -[_MRAVOutputDeviceDescriptorProtobuf dictionaryRepresentation](designatedGroupLeader, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("designatedGroupLeader"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocalEndpoint);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("isLocalEndpoint"));

  }
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", instanceIdentifier, CFSTR("instanceIdentifier"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProxyGroupPlayer);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("isProxyGroupPlayer"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_22:
      if ((has & 2) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_22;
  }
  connectionType = self->_connectionType;
  if (connectionType >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionType);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E30C9D10[connectionType];
  }
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("connectionType"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canModifyGroupMembership);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("canModifyGroupMembership"));

  }
LABEL_24:
  if (-[NSMutableArray count](self->_personalOutputDevices, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_personalOutputDevices, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = self->_personalOutputDevices;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("personalOutputDevices"));
  }
  return v4;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;
  char has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  _BYTE *v14;

  v14 = a3;
  if (self->_name)
    objc_msgSend(v14, "setName:");
  if (self->_uniqueIdentifier)
    objc_msgSend(v14, "setUniqueIdentifier:");
  if (-[_MRAVEndpointDescriptorProtobuf outputDevicesCount](self, "outputDevicesCount"))
  {
    objc_msgSend(v14, "clearOutputDevices");
    v4 = -[_MRAVEndpointDescriptorProtobuf outputDevicesCount](self, "outputDevicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRAVEndpointDescriptorProtobuf outputDevicesAtIndex:](self, "outputDevicesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addOutputDevices:", v7);

      }
    }
  }
  if (self->_designatedGroupLeader)
    objc_msgSend(v14, "setDesignatedGroupLeader:");
  v8 = v14;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v14[65] = self->_isLocalEndpoint;
    v14[68] |= 4u;
  }
  if (self->_instanceIdentifier)
  {
    objc_msgSend(v14, "setInstanceIdentifier:");
    v8 = v14;
  }
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_17;
LABEL_25:
    *((_DWORD *)v8 + 2) = self->_connectionType;
    v8[68] |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  v8[66] = self->_isProxyGroupPlayer;
  v8[68] |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_25;
LABEL_17:
  if ((has & 2) != 0)
  {
LABEL_18:
    v8[64] = self->_canModifyGroupMembership;
    v8[68] |= 2u;
  }
LABEL_19:
  if (-[_MRAVEndpointDescriptorProtobuf personalOutputDevicesCount](self, "personalOutputDevicesCount"))
  {
    objc_msgSend(v14, "clearPersonalOutputDevices");
    v10 = -[_MRAVEndpointDescriptorProtobuf personalOutputDevicesCount](self, "personalOutputDevicesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[_MRAVEndpointDescriptorProtobuf personalOutputDevicesAtIndex:](self, "personalOutputDevicesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addPersonalOutputDevices:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char has;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = self->_outputDevices;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOutputDevices:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }

  v16 = -[_MRAVOutputDeviceDescriptorProtobuf copyWithZone:](self->_designatedGroupLeader, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_isLocalEndpoint;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v18 = -[NSString copyWithZone:](self->_instanceIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 66) = self->_isProxyGroupPlayer;
    *(_BYTE *)(v5 + 68) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_12:
      if ((has & 2) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v5 + 8) = self->_connectionType;
  *(_BYTE *)(v5 + 68) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_13:
    *(_BYTE *)(v5 + 64) = self->_canModifyGroupMembership;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
LABEL_14:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_personalOutputDevices;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v5, "addPersonalOutputDevices:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }

  return (id)v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v5 = -[NSMutableArray hash](self->_outputDevices, "hash");
  v6 = -[_MRAVOutputDeviceDescriptorProtobuf hash](self->_designatedGroupLeader, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_isLocalEndpoint;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_instanceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_9:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_10:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_personalOutputDevices, "hash");
  }
  v9 = 2654435761 * self->_isProxyGroupPlayer;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v10 = 2654435761 * self->_connectionType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_7:
  v11 = 2654435761 * self->_canModifyGroupMembership;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_personalOutputDevices, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _MRAVOutputDeviceDescriptorProtobuf *designatedGroupLeader;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[_MRAVEndpointDescriptorProtobuf setName:](self, "setName:");
  if (*((_QWORD *)v4 + 7))
    -[_MRAVEndpointDescriptorProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        -[_MRAVEndpointDescriptorProtobuf addOutputDevices:](self, "addOutputDevices:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  designatedGroupLeader = self->_designatedGroupLeader;
  v11 = *((_QWORD *)v4 + 2);
  if (designatedGroupLeader)
  {
    if (v11)
      -[_MRAVOutputDeviceDescriptorProtobuf mergeFrom:](designatedGroupLeader, "mergeFrom:");
  }
  else if (v11)
  {
    -[_MRAVEndpointDescriptorProtobuf setDesignatedGroupLeader:](self, "setDesignatedGroupLeader:");
  }
  if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    self->_isLocalEndpoint = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 3))
    -[_MRAVEndpointDescriptorProtobuf setInstanceIdentifier:](self, "setInstanceIdentifier:");
  v12 = *((_BYTE *)v4 + 68);
  if ((v12 & 8) != 0)
  {
    self->_isProxyGroupPlayer = *((_BYTE *)v4 + 66);
    *(_BYTE *)&self->_has |= 8u;
    v12 = *((_BYTE *)v4 + 68);
    if ((v12 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 2) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_connectionType = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_24:
    self->_canModifyGroupMembership = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_25:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v4 + 6);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[_MRAVEndpointDescriptorProtobuf addPersonalOutputDevices:](self, "addPersonalOutputDevices:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)setOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevices, a3);
}

- (BOOL)isLocalEndpoint
{
  return self->_isLocalEndpoint;
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_instanceIdentifier, a3);
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (void)setPersonalOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_personalOutputDevices, a3);
}

@end
