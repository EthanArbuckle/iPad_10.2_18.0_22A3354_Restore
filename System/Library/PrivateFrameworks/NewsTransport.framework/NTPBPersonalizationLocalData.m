@implementation NTPBPersonalizationLocalData

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationLocalDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (NSData)remoteRecordData
{
  return self->_remoteRecordData;
}

- (NSMutableArray)aggregates
{
  return self->_aggregates;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBPersonalizationLocalData setOpenChangeGroupDeltas:](self, "setOpenChangeGroupDeltas:", 0);
  -[NTPBPersonalizationLocalData setClosedChangeGroups:](self, "setClosedChangeGroups:", 0);
  -[NTPBPersonalizationLocalData setRemoteRecordData:](self, "setRemoteRecordData:", 0);
  -[NTPBPersonalizationLocalData setCurrentInstanceIdentifier:](self, "setCurrentInstanceIdentifier:", 0);
  -[NTPBPersonalizationLocalData setAggregates:](self, "setAggregates:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationLocalData;
  -[NTPBPersonalizationLocalData dealloc](&v3, sel_dealloc);
}

- (void)setRemoteRecordData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setOpenChangeGroupDeltas:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setCurrentInstanceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setClosedChangeGroups:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setAggregates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)clearOpenChangeGroupDeltas
{
  -[NSMutableArray removeAllObjects](self->_openChangeGroupDeltas, "removeAllObjects");
}

- (void)addOpenChangeGroupDeltas:(id)a3
{
  NSMutableArray *openChangeGroupDeltas;

  openChangeGroupDeltas = self->_openChangeGroupDeltas;
  if (!openChangeGroupDeltas)
  {
    openChangeGroupDeltas = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_openChangeGroupDeltas = openChangeGroupDeltas;
  }
  -[NSMutableArray addObject:](openChangeGroupDeltas, "addObject:", a3);
}

- (unint64_t)openChangeGroupDeltasCount
{
  return -[NSMutableArray count](self->_openChangeGroupDeltas, "count");
}

- (id)openChangeGroupDeltasAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_openChangeGroupDeltas, "objectAtIndex:", a3);
}

+ (Class)openChangeGroupDeltasType
{
  return (Class)objc_opt_class();
}

- (void)clearClosedChangeGroups
{
  -[NSMutableArray removeAllObjects](self->_closedChangeGroups, "removeAllObjects");
}

- (void)addClosedChangeGroups:(id)a3
{
  NSMutableArray *closedChangeGroups;

  closedChangeGroups = self->_closedChangeGroups;
  if (!closedChangeGroups)
  {
    closedChangeGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_closedChangeGroups = closedChangeGroups;
  }
  -[NSMutableArray addObject:](closedChangeGroups, "addObject:", a3);
}

- (unint64_t)closedChangeGroupsCount
{
  return -[NSMutableArray count](self->_closedChangeGroups, "count");
}

- (id)closedChangeGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_closedChangeGroups, "objectAtIndex:", a3);
}

+ (Class)closedChangeGroupsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRemoteRecordData
{
  return self->_remoteRecordData != 0;
}

- (BOOL)hasCurrentInstanceIdentifier
{
  return self->_currentInstanceIdentifier != 0;
}

- (void)clearAggregates
{
  -[NSMutableArray removeAllObjects](self->_aggregates, "removeAllObjects");
}

- (void)addAggregates:(id)a3
{
  NSMutableArray *aggregates;

  aggregates = self->_aggregates;
  if (!aggregates)
  {
    aggregates = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_aggregates = aggregates;
  }
  -[NSMutableArray addObject:](aggregates, "addObject:", a3);
}

- (unint64_t)aggregatesCount
{
  return -[NSMutableArray count](self->_aggregates, "count");
}

- (id)aggregatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_aggregates, "objectAtIndex:", a3);
}

+ (Class)aggregatesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationLocalData;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPersonalizationLocalData description](&v3, sel_description), -[NTPBPersonalizationLocalData dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *openChangeGroupDeltas;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *closedChangeGroups;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSData *remoteRecordData;
  NSString *currentInstanceIdentifier;
  void *v18;
  NSMutableArray *aggregates;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  __int128 v25;
  __int128 v26;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[NSMutableArray count](self->_openChangeGroupDeltas, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_openChangeGroupDeltas, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    openChangeGroupDeltas = self->_openChangeGroupDeltas;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](openChangeGroupDeltas, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(openChangeGroupDeltas);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](openChangeGroupDeltas, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("open_change_group_deltas"));

  }
  if (-[NSMutableArray count](self->_closedChangeGroups, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_closedChangeGroups, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    closedChangeGroups = self->_closedChangeGroups;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](closedChangeGroups, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(closedChangeGroups);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](closedChangeGroups, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("closed_change_groups"));

  }
  remoteRecordData = self->_remoteRecordData;
  if (remoteRecordData)
    objc_msgSend(v3, "setObject:forKey:", remoteRecordData, CFSTR("remote_record_data"));
  currentInstanceIdentifier = self->_currentInstanceIdentifier;
  if (currentInstanceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", currentInstanceIdentifier, CFSTR("current_instance_identifier"));
  if (-[NSMutableArray count](self->_aggregates, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_aggregates, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    aggregates = self->_aggregates;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](aggregates, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(aggregates);
          objc_msgSend(v18, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](aggregates, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v21);
    }
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("aggregates"));

  }
  return v3;
}

- (void)writeTo:(id)a3
{
  NSMutableArray *openChangeGroupDeltas;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *closedChangeGroups;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *aggregates;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  __int128 v19;
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
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  openChangeGroupDeltas = self->_openChangeGroupDeltas;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](openChangeGroupDeltas, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(openChangeGroupDeltas);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](openChangeGroupDeltas, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  closedChangeGroups = self->_closedChangeGroups;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](closedChangeGroups, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(closedChangeGroups);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](closedChangeGroups, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v11);
  }
  if (self->_remoteRecordData)
    PBDataWriterWriteDataField();
  if (self->_currentInstanceIdentifier)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  aggregates = self->_aggregates;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](aggregates, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(aggregates);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](aggregates, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *openChangeGroupDeltas;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *closedChangeGroups;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *aggregates;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  __int128 v25;
  __int128 v26;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  openChangeGroupDeltas = self->_openChangeGroupDeltas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](openChangeGroupDeltas, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(openChangeGroupDeltas);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addOpenChangeGroupDeltas:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](openChangeGroupDeltas, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  closedChangeGroups = self->_closedChangeGroups;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](closedChangeGroups, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(closedChangeGroups);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addClosedChangeGroups:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](closedChangeGroups, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v14);
  }

  v5[5] = (id)-[NSData copyWithZone:](self->_remoteRecordData, "copyWithZone:", a3);
  v5[3] = (id)-[NSString copyWithZone:](self->_currentInstanceIdentifier, "copyWithZone:", a3);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  aggregates = self->_aggregates;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](aggregates, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(aggregates);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v5, "addAggregates:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](aggregates, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *openChangeGroupDeltas;
  NSMutableArray *closedChangeGroups;
  NSData *remoteRecordData;
  NSString *currentInstanceIdentifier;
  NSMutableArray *aggregates;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    openChangeGroupDeltas = self->_openChangeGroupDeltas;
    if (!((unint64_t)openChangeGroupDeltas | *((_QWORD *)a3 + 4))
      || (v5 = -[NSMutableArray isEqual:](openChangeGroupDeltas, "isEqual:")) != 0)
    {
      closedChangeGroups = self->_closedChangeGroups;
      if (!((unint64_t)closedChangeGroups | *((_QWORD *)a3 + 2))
        || (v5 = -[NSMutableArray isEqual:](closedChangeGroups, "isEqual:")) != 0)
      {
        remoteRecordData = self->_remoteRecordData;
        if (!((unint64_t)remoteRecordData | *((_QWORD *)a3 + 5))
          || (v5 = -[NSData isEqual:](remoteRecordData, "isEqual:")) != 0)
        {
          currentInstanceIdentifier = self->_currentInstanceIdentifier;
          if (!((unint64_t)currentInstanceIdentifier | *((_QWORD *)a3 + 3))
            || (v5 = -[NSString isEqual:](currentInstanceIdentifier, "isEqual:")) != 0)
          {
            aggregates = self->_aggregates;
            if ((unint64_t)aggregates | *((_QWORD *)a3 + 1))
              LOBYTE(v5) = -[NSMutableArray isEqual:](aggregates, "isEqual:");
            else
              LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSMutableArray hash](self->_openChangeGroupDeltas, "hash");
  v4 = -[NSMutableArray hash](self->_closedChangeGroups, "hash") ^ v3;
  v5 = -[NSData hash](self->_remoteRecordData, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_currentInstanceIdentifier, "hash");
  return v6 ^ -[NSMutableArray hash](self->_aggregates, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
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

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[NTPBPersonalizationLocalData addOpenChangeGroupDeltas:](self, "addOpenChangeGroupDeltas:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[NTPBPersonalizationLocalData addClosedChangeGroups:](self, "addClosedChangeGroups:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }
  if (*((_QWORD *)a3 + 5))
    -[NTPBPersonalizationLocalData setRemoteRecordData:](self, "setRemoteRecordData:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBPersonalizationLocalData setCurrentInstanceIdentifier:](self, "setCurrentInstanceIdentifier:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 1);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NTPBPersonalizationLocalData addAggregates:](self, "addAggregates:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }
}

- (NSMutableArray)openChangeGroupDeltas
{
  return self->_openChangeGroupDeltas;
}

- (NSMutableArray)closedChangeGroups
{
  return self->_closedChangeGroups;
}

- (NSString)currentInstanceIdentifier
{
  return self->_currentInstanceIdentifier;
}

@end
