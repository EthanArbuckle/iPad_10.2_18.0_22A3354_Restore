@implementation HMMediaGroupProtoMediaParticipantData

- (BOOL)hasDestination
{
  return self->_destination != 0;
}

- (BOOL)hasDestinationController
{
  return self->_destinationController != 0;
}

- (void)clearBackupGroups
{
  -[NSMutableArray removeAllObjects](self->_backupGroups, "removeAllObjects");
}

- (void)addBackupGroups:(id)a3
{
  id v4;
  NSMutableArray *backupGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  backupGroups = self->_backupGroups;
  v8 = v4;
  if (!backupGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_backupGroups;
    self->_backupGroups = v6;

    v4 = v8;
    backupGroups = self->_backupGroups;
  }
  -[NSMutableArray addObject:](backupGroups, "addObject:", v4);

}

- (unint64_t)backupGroupsCount
{
  return -[NSMutableArray count](self->_backupGroups, "count");
}

- (id)backupGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_backupGroups, "objectAtIndex:", a3);
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
  v8.super_class = (Class)HMMediaGroupProtoMediaParticipantData;
  -[HMMediaGroupProtoMediaParticipantData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaParticipantData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMMediaGroupProtoMediaDestination *destination;
  void *v5;
  HMMediaGroupProtoMediaDestinationControllerData *destinationController;
  void *v7;
  NSMutableArray *backupGroups;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  destination = self->_destination;
  if (destination)
  {
    -[HMMediaGroupProtoMediaDestination dictionaryRepresentation](destination, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("destination"));

  }
  destinationController = self->_destinationController;
  if (destinationController)
  {
    -[HMMediaGroupProtoMediaDestinationControllerData dictionaryRepresentation](destinationController, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("destinationController"));

  }
  backupGroups = self->_backupGroups;
  if (backupGroups)
    objc_msgSend(v3, "setObject:forKey:", backupGroups, CFSTR("backupGroups"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaParticipantDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_destination)
    PBDataWriterWriteSubmessage();
  if (self->_destinationController)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_backupGroups;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_destination)
    objc_msgSend(v8, "setDestination:");
  if (self->_destinationController)
    objc_msgSend(v8, "setDestinationController:");
  if (-[HMMediaGroupProtoMediaParticipantData backupGroupsCount](self, "backupGroupsCount"))
  {
    objc_msgSend(v8, "clearBackupGroups");
    v4 = -[HMMediaGroupProtoMediaParticipantData backupGroupsCount](self, "backupGroupsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMMediaGroupProtoMediaParticipantData backupGroupsAtIndex:](self, "backupGroupsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addBackupGroups:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HMMediaGroupProtoMediaDestination copyWithZone:](self->_destination, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HMMediaGroupProtoMediaDestinationControllerData copyWithZone:](self->_destinationController, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_backupGroups;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addBackupGroups:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HMMediaGroupProtoMediaDestination *destination;
  HMMediaGroupProtoMediaDestinationControllerData *destinationController;
  NSMutableArray *backupGroups;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((destination = self->_destination, !((unint64_t)destination | v4[2]))
     || -[HMMediaGroupProtoMediaDestination isEqual:](destination, "isEqual:"))
    && ((destinationController = self->_destinationController, !((unint64_t)destinationController | v4[3]))
     || -[HMMediaGroupProtoMediaDestinationControllerData isEqual:](destinationController, "isEqual:")))
  {
    backupGroups = self->_backupGroups;
    if ((unint64_t)backupGroups | v4[1])
      v8 = -[NSMutableArray isEqual:](backupGroups, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HMMediaGroupProtoMediaDestination hash](self->_destination, "hash");
  v4 = -[HMMediaGroupProtoMediaDestinationControllerData hash](self->_destinationController, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_backupGroups, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HMMediaGroupProtoMediaDestination *destination;
  uint64_t v6;
  HMMediaGroupProtoMediaDestinationControllerData *destinationController;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  destination = self->_destination;
  v6 = *((_QWORD *)v4 + 2);
  if (destination)
  {
    if (v6)
      -[HMMediaGroupProtoMediaDestination mergeFrom:](destination, "mergeFrom:");
  }
  else if (v6)
  {
    -[HMMediaGroupProtoMediaParticipantData setDestination:](self, "setDestination:");
  }
  destinationController = self->_destinationController;
  v8 = *((_QWORD *)v4 + 3);
  if (destinationController)
  {
    if (v8)
      -[HMMediaGroupProtoMediaDestinationControllerData mergeFrom:](destinationController, "mergeFrom:");
  }
  else if (v8)
  {
    -[HMMediaGroupProtoMediaParticipantData setDestinationController:](self, "setDestinationController:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 1);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[HMMediaGroupProtoMediaParticipantData addBackupGroups:](self, "addBackupGroups:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (HMMediaGroupProtoMediaDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (HMMediaGroupProtoMediaDestinationControllerData)destinationController
{
  return self->_destinationController;
}

- (void)setDestinationController:(id)a3
{
  objc_storeStrong((id *)&self->_destinationController, a3);
}

- (NSMutableArray)backupGroups
{
  return self->_backupGroups;
}

- (void)setBackupGroups:(id)a3
{
  objc_storeStrong((id *)&self->_backupGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationController, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_backupGroups, 0);
}

+ (Class)backupGroupsType
{
  return (Class)objc_opt_class();
}

@end
