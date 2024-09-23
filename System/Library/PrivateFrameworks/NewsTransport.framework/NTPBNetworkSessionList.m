@implementation NTPBNetworkSessionList

- (void)addNetworkEvents:(id)a3
{
  NSMutableArray *networkEvents;

  networkEvents = self->_networkEvents;
  if (!networkEvents)
  {
    networkEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_networkEvents = networkEvents;
  }
  -[NSMutableArray addObject:](networkEvents, "addObject:", a3);
}

- (void)addNetworkSessions:(id)a3
{
  NSMutableArray *networkSessions;

  networkSessions = self->_networkSessions;
  if (!networkSessions)
  {
    networkSessions = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_networkSessions = networkSessions;
  }
  -[NSMutableArray addObject:](networkSessions, "addObject:", a3);
}

- (NSMutableArray)networkSessions
{
  return self->_networkSessions;
}

- (NSMutableArray)networkEvents
{
  return self->_networkEvents;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBNetworkSessionList setNetworkSessions:](self, "setNetworkSessions:", 0);
  -[NTPBNetworkSessionList setNetworkEvents:](self, "setNetworkEvents:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkSessionList;
  -[NTPBNetworkSessionList dealloc](&v3, sel_dealloc);
}

- (void)setNetworkSessions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setNetworkEvents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)clearNetworkSessions
{
  -[NSMutableArray removeAllObjects](self->_networkSessions, "removeAllObjects");
}

- (unint64_t)networkSessionsCount
{
  return -[NSMutableArray count](self->_networkSessions, "count");
}

- (id)networkSessionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networkSessions, "objectAtIndex:", a3);
}

+ (Class)networkSessionsType
{
  return (Class)objc_opt_class();
}

- (void)clearNetworkEvents
{
  -[NSMutableArray removeAllObjects](self->_networkEvents, "removeAllObjects");
}

- (unint64_t)networkEventsCount
{
  return -[NSMutableArray count](self->_networkEvents, "count");
}

- (id)networkEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networkEvents, "objectAtIndex:", a3);
}

+ (Class)networkEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkSessionList;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBNetworkSessionList description](&v3, sel_description), -[NTPBNetworkSessionList dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *networkSessions;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *networkEvents;
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
  if (-[NSMutableArray count](self->_networkSessions, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_networkSessions, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    networkSessions = self->_networkSessions;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkSessions, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(networkSessions);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkSessions, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("network_sessions"));

  }
  if (-[NSMutableArray count](self->_networkEvents, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_networkEvents, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    networkEvents = self->_networkEvents;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkEvents, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(networkEvents);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkEvents, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("network_events"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkSessionListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *networkSessions;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *networkEvents;
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
  networkSessions = self->_networkSessions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkSessions, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(networkSessions);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkSessions, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  networkEvents = self->_networkEvents;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkEvents, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(networkEvents);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkEvents, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *networkSessions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *networkEvents;
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
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  networkSessions = self->_networkSessions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkSessions, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(networkSessions);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addNetworkSessions:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkSessions, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  networkEvents = self->_networkEvents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkEvents, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(networkEvents);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addNetworkEvents:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networkEvents, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *networkSessions;
  NSMutableArray *networkEvents;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    networkSessions = self->_networkSessions;
    if (!((unint64_t)networkSessions | *((_QWORD *)a3 + 2))
      || (v5 = -[NSMutableArray isEqual:](networkSessions, "isEqual:")) != 0)
    {
      networkEvents = self->_networkEvents;
      if ((unint64_t)networkEvents | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSMutableArray isEqual:](networkEvents, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableArray hash](self->_networkSessions, "hash");
  return -[NSMutableArray hash](self->_networkEvents, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
        -[NTPBNetworkSessionList addNetworkSessions:](self, "addNetworkSessions:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 1);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
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
        -[NTPBNetworkSessionList addNetworkEvents:](self, "addNetworkEvents:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

@end
