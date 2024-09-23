@implementation NTPBPrivateDataControllerSyncState

- (void)dealloc
{
  objc_super v3;

  -[NTPBPrivateDataControllerSyncState setZoneStates:](self, "setZoneStates:", 0);
  -[NTPBPrivateDataControllerSyncState setRecordStates:](self, "setRecordStates:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateDataControllerSyncState;
  -[NTPBPrivateDataControllerSyncState dealloc](&v3, sel_dealloc);
}

- (void)clearZoneStates
{
  -[NSMutableArray removeAllObjects](self->_zoneStates, "removeAllObjects");
}

- (void)addZoneStates:(id)a3
{
  NSMutableArray *zoneStates;

  zoneStates = self->_zoneStates;
  if (!zoneStates)
  {
    zoneStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_zoneStates = zoneStates;
  }
  -[NSMutableArray addObject:](zoneStates, "addObject:", a3);
}

- (unint64_t)zoneStatesCount
{
  return -[NSMutableArray count](self->_zoneStates, "count");
}

- (id)zoneStatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_zoneStates, "objectAtIndex:", a3);
}

+ (Class)zoneStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearRecordStates
{
  -[NSMutableArray removeAllObjects](self->_recordStates, "removeAllObjects");
}

- (void)addRecordStates:(id)a3
{
  NSMutableArray *recordStates;

  recordStates = self->_recordStates;
  if (!recordStates)
  {
    recordStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_recordStates = recordStates;
  }
  -[NSMutableArray addObject:](recordStates, "addObject:", a3);
}

- (unint64_t)recordStatesCount
{
  return -[NSMutableArray count](self->_recordStates, "count");
}

- (id)recordStatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recordStates, "objectAtIndex:", a3);
}

+ (Class)recordStatesType
{
  return (Class)objc_opt_class();
}

- (void)setVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateDataControllerSyncState;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPrivateDataControllerSyncState description](&v3, sel_description), -[NTPBPrivateDataControllerSyncState dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *zoneStates;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *recordStates;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[NSMutableArray count](self->_zoneStates, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_zoneStates, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    zoneStates = self->_zoneStates;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](zoneStates, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(zoneStates);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](zoneStates, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("zone_states"));

  }
  if (-[NSMutableArray count](self->_recordStates, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_recordStates, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    recordStates = self->_recordStates;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordStates, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(recordStates);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordStates, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("record_states"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version), CFSTR("version"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPrivateDataControllerSyncStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *zoneStates;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *recordStates;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  zoneStates = self->_zoneStates;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](zoneStates, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(zoneStates);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](zoneStates, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  recordStates = self->_recordStates;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordStates, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(recordStates);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordStates, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *zoneStates;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *recordStates;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
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

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  zoneStates = self->_zoneStates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](zoneStates, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(zoneStates);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addZoneStates:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](zoneStates, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  recordStates = self->_recordStates;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordStates, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(recordStates);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRecordStates:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordStates, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_version;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *zoneStates;
  NSMutableArray *recordStates;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    zoneStates = self->_zoneStates;
    if (!((unint64_t)zoneStates | *((_QWORD *)a3 + 3))
      || (v5 = -[NSMutableArray isEqual:](zoneStates, "isEqual:")) != 0)
    {
      recordStates = self->_recordStates;
      if (!((unint64_t)recordStates | *((_QWORD *)a3 + 2))
        || (v5 = -[NSMutableArray isEqual:](recordStates, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) == 0;
        if ((*(_BYTE *)&self->_has & 1) != 0)
          LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) != 0 && self->_version == *((_QWORD *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSMutableArray hash](self->_zoneStates, "hash");
  v4 = -[NSMutableArray hash](self->_recordStates, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_version;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NTPBPrivateDataControllerSyncState addZoneStates:](self, "addZoneStates:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NTPBPrivateDataControllerSyncState addRecordStates:](self, "addRecordStates:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_version = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSMutableArray)zoneStates
{
  return self->_zoneStates;
}

- (void)setZoneStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)recordStates
{
  return self->_recordStates;
}

- (void)setRecordStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)version
{
  return self->_version;
}

@end
