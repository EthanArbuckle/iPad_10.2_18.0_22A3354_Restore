@implementation NTPBPersonalizationChangeGroup

- (void)dealloc
{
  objc_super v3;

  -[NTPBPersonalizationChangeGroup setDeltas:](self, "setDeltas:", 0);
  -[NTPBPersonalizationChangeGroup setInstanceIdentifier:](self, "setInstanceIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationChangeGroup;
  -[NTPBPersonalizationChangeGroup dealloc](&v3, sel_dealloc);
}

- (void)clearDeltas
{
  -[NSMutableArray removeAllObjects](self->_deltas, "removeAllObjects");
}

- (void)addDeltas:(id)a3
{
  NSMutableArray *deltas;

  deltas = self->_deltas;
  if (!deltas)
  {
    deltas = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_deltas = deltas;
  }
  -[NSMutableArray addObject:](deltas, "addObject:", a3);
}

- (unint64_t)deltasCount
{
  return -[NSMutableArray count](self->_deltas, "count");
}

- (id)deltasAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_deltas, "objectAtIndex:", a3);
}

+ (Class)deltasType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInstanceIdentifier
{
  return self->_instanceIdentifier != 0;
}

- (void)setChangeNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_changeNumber = a3;
}

- (void)setHasChangeNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationChangeGroup;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPersonalizationChangeGroup description](&v3, sel_description), -[NTPBPersonalizationChangeGroup dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *deltas;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *instanceIdentifier;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[NSMutableArray count](self->_deltas, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_deltas, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    deltas = self->_deltas;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deltas, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(deltas);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deltas, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("deltas"));

  }
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", instanceIdentifier, CFSTR("instance_identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_changeNumber), CFSTR("change_number"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationChangeGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *deltas;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  deltas = self->_deltas;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deltas, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(deltas);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deltas, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (self->_instanceIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *deltas;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  deltas = self->_deltas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deltas, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(deltas);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDeltas:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deltas, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_instanceIdentifier, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_changeNumber;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *deltas;
  NSString *instanceIdentifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    deltas = self->_deltas;
    if (!((unint64_t)deltas | *((_QWORD *)a3 + 2)) || (v5 = -[NSMutableArray isEqual:](deltas, "isEqual:")) != 0)
    {
      instanceIdentifier = self->_instanceIdentifier;
      if (!((unint64_t)instanceIdentifier | *((_QWORD *)a3 + 3))
        || (v5 = -[NSString isEqual:](instanceIdentifier, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) == 0;
        if ((*(_BYTE *)&self->_has & 1) != 0)
          LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) != 0 && self->_changeNumber == *((_QWORD *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSMutableArray hash](self->_deltas, "hash");
  v4 = -[NSString hash](self->_instanceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_changeNumber;
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
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
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
        -[NTPBPersonalizationChangeGroup addDeltas:](self, "addDeltas:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if (*((_QWORD *)a3 + 3))
    -[NTPBPersonalizationChangeGroup setInstanceIdentifier:](self, "setInstanceIdentifier:");
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_changeNumber = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSMutableArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)changeNumber
{
  return self->_changeNumber;
}

@end
