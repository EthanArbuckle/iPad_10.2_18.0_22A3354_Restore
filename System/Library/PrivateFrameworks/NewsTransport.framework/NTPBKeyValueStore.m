@implementation NTPBKeyValueStore

- (void)dealloc
{
  objc_super v3;

  -[NTPBKeyValueStore setKeyValuePairs:](self, "setKeyValuePairs:", 0);
  -[NTPBKeyValueStore setPlistSidecar:](self, "setPlistSidecar:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValueStore;
  -[NTPBKeyValueStore dealloc](&v3, sel_dealloc);
}

- (void)setPlistSidecar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setKeyValuePairs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)addKeyValuePairs:(id)a3
{
  NSMutableArray *keyValuePairs;

  keyValuePairs = self->_keyValuePairs;
  if (!keyValuePairs)
  {
    keyValuePairs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_keyValuePairs = keyValuePairs;
  }
  -[NSMutableArray addObject:](keyValuePairs, "addObject:", a3);
}

- (NSData)plistSidecar
{
  return self->_plistSidecar;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBKeyValueStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (int64_t)clientVersion
{
  return self->_clientVersion;
}

- (NSMutableArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setClientVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientVersion = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasClientVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearKeyValuePairs
{
  -[NSMutableArray removeAllObjects](self->_keyValuePairs, "removeAllObjects");
}

- (unint64_t)keyValuePairsCount
{
  return -[NSMutableArray count](self->_keyValuePairs, "count");
}

- (id)keyValuePairsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyValuePairs, "objectAtIndex:", a3);
}

+ (Class)keyValuePairsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPlistSidecar
{
  return self->_plistSidecar != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValueStore;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBKeyValueStore description](&v3, sel_description), -[NTPBKeyValueStore dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *keyValuePairs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSData *plistSidecar;
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
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_version), CFSTR("version"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_clientVersion), CFSTR("client_version"));
  if (-[NSMutableArray count](self->_keyValuePairs, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_keyValuePairs, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    keyValuePairs = self->_keyValuePairs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keyValuePairs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(keyValuePairs);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keyValuePairs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("key_value_pairs"));

  }
  plistSidecar = self->_plistSidecar;
  if (plistSidecar)
    objc_msgSend(v3, "setObject:forKey:", plistSidecar, CFSTR("plist_sidecar"));
  return v3;
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *keyValuePairs;
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
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  keyValuePairs = self->_keyValuePairs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keyValuePairs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(keyValuePairs);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keyValuePairs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if (self->_plistSidecar)
    PBDataWriterWriteDataField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  char has;
  NSMutableArray *keyValuePairs;
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
  v6 = (id *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_version;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_clientVersion;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  keyValuePairs = self->_keyValuePairs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keyValuePairs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(keyValuePairs);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addKeyValuePairs:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keyValuePairs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v6[4] = (id)-[NSData copyWithZone:](self->_plistSidecar, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *keyValuePairs;
  NSData *plistSidecar;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_version != *((_QWORD *)a3 + 2))
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
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_clientVersion != *((_QWORD *)a3 + 1))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_16;
    }
    keyValuePairs = self->_keyValuePairs;
    if (!((unint64_t)keyValuePairs | *((_QWORD *)a3 + 3))
      || (v5 = -[NSMutableArray isEqual:](keyValuePairs, "isEqual:")) != 0)
    {
      plistSidecar = self->_plistSidecar;
      if ((unint64_t)plistSidecar | *((_QWORD *)a3 + 4))
        LOBYTE(v5) = -[NSData isEqual:](plistSidecar, "isEqual:");
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
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_version;
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
  v4 = 2654435761 * self->_clientVersion;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSMutableArray hash](self->_keyValuePairs, "hash");
  return v5 ^ -[NSData hash](self->_plistSidecar, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_clientVersion = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[NTPBKeyValueStore addKeyValuePairs:](self, "addKeyValuePairs:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  if (*((_QWORD *)a3 + 4))
    -[NTPBKeyValueStore setPlistSidecar:](self, "setPlistSidecar:");
}

@end
