@implementation HMPBActionSet

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)clearActions
{
  -[NSMutableArray removeAllObjects](self->_actions, "removeAllObjects");
}

- (void)addActions:(id)a3
{
  id v4;
  NSMutableArray *actions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actions = self->_actions;
  v8 = v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_actions;
    self->_actions = v6;

    v4 = v8;
    actions = self->_actions;
  }
  -[NSMutableArray addObject:](actions, "addObject:", v4);

}

- (unint64_t)actionsCount
{
  return -[NSMutableArray count](self->_actions, "count");
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", a3);
}

- (BOOL)hasActionSetType
{
  return self->_actionSetType != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasHomeUUID
{
  return self->_homeUUID != 0;
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
  v8.super_class = (Class)HMPBActionSet;
  -[HMPBActionSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBActionSet dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *actionSetType;
  NSData *uuid;
  NSData *homeUUID;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if (-[NSMutableArray count](self->_actions, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_actions, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_actions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("actions"));
  }
  actionSetType = self->_actionSetType;
  if (actionSetType)
    objc_msgSend(v4, "setObject:forKey:", actionSetType, CFSTR("actionSetType"));
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v4, "setObject:forKey:", uuid, CFSTR("uuid"));
  homeUUID = self->_homeUUID;
  if (homeUUID)
    objc_msgSend(v4, "setObject:forKey:", homeUUID, CFSTR("homeUUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBActionSetReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_name)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_actions;
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

  if (self->_actionSetType)
    PBDataWriterWriteStringField();
  if (self->_uuid)
    PBDataWriterWriteDataField();
  if (self->_homeUUID)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_name)
    objc_msgSend(v9, "setName:");
  if (-[HMPBActionSet actionsCount](self, "actionsCount"))
  {
    objc_msgSend(v9, "clearActions");
    v4 = -[HMPBActionSet actionsCount](self, "actionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMPBActionSet actionsAtIndex:](self, "actionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addActions:", v7);

      }
    }
  }
  if (self->_actionSetType)
    objc_msgSend(v9, "setActionSetType:");
  v8 = v9;
  if (self->_uuid)
  {
    objc_msgSend(v9, "setUuid:");
    v8 = v9;
  }
  if (self->_homeUUID)
  {
    objc_msgSend(v9, "setHomeUUID:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_actions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addActions:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_actionSetType, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  v16 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSData copyWithZone:](self->_homeUUID, "copyWithZone:", a3);
  v19 = (void *)v5[3];
  v5[3] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSMutableArray *actions;
  NSString *actionSetType;
  NSData *uuid;
  NSData *homeUUID;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[4])) || -[NSString isEqual:](name, "isEqual:"))
    && ((actions = self->_actions, !((unint64_t)actions | v4[2]))
     || -[NSMutableArray isEqual:](actions, "isEqual:"))
    && ((actionSetType = self->_actionSetType, !((unint64_t)actionSetType | v4[1]))
     || -[NSString isEqual:](actionSetType, "isEqual:"))
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[5])) || -[NSData isEqual:](uuid, "isEqual:")))
  {
    homeUUID = self->_homeUUID;
    if ((unint64_t)homeUUID | v4[3])
      v10 = -[NSData isEqual:](homeUUID, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSMutableArray hash](self->_actions, "hash") ^ v3;
  v5 = -[NSString hash](self->_actionSetType, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_uuid, "hash");
  return v6 ^ -[NSData hash](self->_homeUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[HMPBActionSet setName:](self, "setName:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HMPBActionSet addActions:](self, "addActions:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 1))
    -[HMPBActionSet setActionSetType:](self, "setActionSetType:");
  if (*((_QWORD *)v4 + 5))
    -[HMPBActionSet setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 3))
    -[HMPBActionSet setHomeUUID:](self, "setHomeUUID:");

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetType, a3);
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSData)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_homeUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

@end
