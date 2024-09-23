@implementation NTPBFeedItemInventory

- (void)dealloc
{
  objc_super v3;

  -[NTPBFeedItemInventory setLastRefreshed:](self, "setLastRefreshed:", 0);
  -[NTPBFeedItemInventory setFeedItems:](self, "setFeedItems:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItemInventory;
  -[NTPBFeedItemInventory dealloc](&v3, sel_dealloc);
}

- (void)setInventoryVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_inventoryVersion = a3;
}

- (void)setHasInventoryVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInventoryVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFeedItemVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_feedItemVersion = a3;
}

- (void)setHasFeedItemVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedItemVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLastRefreshed
{
  return self->_lastRefreshed != 0;
}

- (void)clearFeedItems
{
  -[NSMutableArray removeAllObjects](self->_feedItems, "removeAllObjects");
}

- (void)addFeedItems:(id)a3
{
  NSMutableArray *feedItems;

  feedItems = self->_feedItems;
  if (!feedItems)
  {
    feedItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_feedItems = feedItems;
  }
  -[NSMutableArray addObject:](feedItems, "addObject:", a3);
}

- (unint64_t)feedItemsCount
{
  return -[NSMutableArray count](self->_feedItems, "count");
}

- (id)feedItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_feedItems, "objectAtIndex:", a3);
}

+ (Class)feedItemsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItemInventory;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBFeedItemInventory description](&v3, sel_description), -[NTPBFeedItemInventory dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NTPBDate *lastRefreshed;
  void *v6;
  NSMutableArray *feedItems;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inventoryVersion), CFSTR("inventory_version"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_feedItemVersion), CFSTR("feed_item_version"));
  lastRefreshed = self->_lastRefreshed;
  if (lastRefreshed)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastRefreshed, "dictionaryRepresentation"), CFSTR("last_refreshed"));
  if (-[NSMutableArray count](self->_feedItems, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_feedItems, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    feedItems = self->_feedItems;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](feedItems, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(feedItems);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](feedItems, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("feed_items"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedItemInventoryReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *feedItems;
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

  v15 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_lastRefreshed)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  feedItems = self->_feedItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](feedItems, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(feedItems);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](feedItems, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  NSMutableArray *feedItems;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_inventoryVersion;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_feedItemVersion;
    *(_BYTE *)(v5 + 40) |= 1u;
  }

  v6[4] = -[NTPBDate copyWithZone:](self->_lastRefreshed, "copyWithZone:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  feedItems = self->_feedItems;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](feedItems, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(feedItems);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addFeedItems:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](feedItems, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBDate *lastRefreshed;
  NSMutableArray *feedItems;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_inventoryVersion != *((_DWORD *)a3 + 6))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_feedItemVersion != *((_DWORD *)a3 + 2))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_16;
    }
    lastRefreshed = self->_lastRefreshed;
    if (!((unint64_t)lastRefreshed | *((_QWORD *)a3 + 4))
      || (v5 = -[NTPBDate isEqual:](lastRefreshed, "isEqual:")) != 0)
    {
      feedItems = self->_feedItems;
      if ((unint64_t)feedItems | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSMutableArray isEqual:](feedItems, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_inventoryVersion;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_feedItemVersion;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NTPBDate hash](self->_lastRefreshed, "hash");
  return v5 ^ -[NSMutableArray hash](self->_feedItems, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  NTPBDate *lastRefreshed;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_inventoryVersion = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_feedItemVersion = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  lastRefreshed = self->_lastRefreshed;
  v7 = *((_QWORD *)a3 + 4);
  if (lastRefreshed)
  {
    if (v7)
      -[NTPBDate mergeFrom:](lastRefreshed, "mergeFrom:");
  }
  else if (v7)
  {
    -[NTPBFeedItemInventory setLastRefreshed:](self, "setLastRefreshed:");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)*((_QWORD *)a3 + 2);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[NTPBFeedItemInventory addFeedItems:](self, "addFeedItems:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
}

- (unsigned)inventoryVersion
{
  return self->_inventoryVersion;
}

- (unsigned)feedItemVersion
{
  return self->_feedItemVersion;
}

- (NTPBDate)lastRefreshed
{
  return self->_lastRefreshed;
}

- (void)setLastRefreshed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
