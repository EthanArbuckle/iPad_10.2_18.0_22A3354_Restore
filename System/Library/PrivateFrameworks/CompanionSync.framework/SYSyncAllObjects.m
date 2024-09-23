@implementation SYSyncAllObjects

- (void)clearAllObjects
{
  -[NSMutableArray removeAllObjects](self->_allObjects, "removeAllObjects");
}

- (void)addAllObjects:(id)a3
{
  id v4;
  NSMutableArray *allObjects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allObjects = self->_allObjects;
  v8 = v4;
  if (!allObjects)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_allObjects;
    self->_allObjects = v6;

    v4 = v8;
    allObjects = self->_allObjects;
  }
  -[NSMutableArray addObject:](allObjects, "addObject:", v4);

}

- (unint64_t)allObjectsCount
{
  return -[NSMutableArray count](self->_allObjects, "count");
}

- (id)allObjectsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allObjects, "objectAtIndex:", a3);
}

+ (Class)allObjectsType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYSyncAllObjects;
  -[SYSyncAllObjects description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncAllObjects dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SYMessageHeader *header;
  void *v5;
  NSString *syncID;
  void *v7;
  NSMutableArray *allObjects;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  syncID = self->_syncID;
  if (syncID)
    objc_msgSend(v3, "setObject:forKey:", syncID, CFSTR("syncID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

  allObjects = self->_allObjects;
  if (allObjects)
    objc_msgSend(v3, "setObject:forKey:", allObjects, CFSTR("allObjects"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncAllObjectsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_header)
    -[SYSyncAllObjects writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_syncID)
    -[SYSyncAllObjects writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_allObjects;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "setHeader:", self->_header);
  objc_msgSend(v8, "setSyncID:", self->_syncID);
  v8[1] = self->_version;
  if (-[SYSyncAllObjects allObjectsCount](self, "allObjectsCount"))
  {
    objc_msgSend(v8, "clearAllObjects");
    v4 = -[SYSyncAllObjects allObjectsCount](self, "allObjectsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SYSyncAllObjects allObjectsAtIndex:](self, "allObjectsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAllObjects:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
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

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_syncID, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v5[1] = self->_version;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_allObjects;
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
        objc_msgSend(v5, "addAllObjects:", v15);

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
  SYMessageHeader *header;
  NSString *syncID;
  NSMutableArray *allObjects;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((header = self->_header, !((unint64_t)header | v4[3])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((syncID = self->_syncID, !((unint64_t)syncID | v4[4]))
     || -[NSString isEqual:](syncID, "isEqual:"))
    && self->_version == v4[1])
  {
    allObjects = self->_allObjects;
    if ((unint64_t)allObjects | v4[2])
      v8 = -[NSMutableArray isEqual:](allObjects, "isEqual:");
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
  NSUInteger v4;
  unint64_t v5;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_syncID, "hash") ^ v3;
  v5 = 2654435761u * self->_version;
  return v4 ^ -[NSMutableArray hash](self->_allObjects, "hash") ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SYMessageHeader *header;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  header = self->_header;
  v6 = *((_QWORD *)v4 + 3);
  if (header)
  {
    if (v6)
      -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else if (v6)
  {
    -[SYSyncAllObjects setHeader:](self, "setHeader:");
  }
  if (*((_QWORD *)v4 + 4))
    -[SYSyncAllObjects setSyncID:](self, "setSyncID:");
  self->_version = *((_QWORD *)v4 + 1);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[SYSyncAllObjects addAllObjects:](self, "addAllObjects:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
  objc_storeStrong((id *)&self->_syncID, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSMutableArray)allObjects
{
  return self->_allObjects;
}

- (void)setAllObjects:(id)a3
{
  objc_storeStrong((id *)&self->_allObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYSyncAllObjects writeTo:]", "SYSyncAllObjects.m", 142, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncAllObjects writeTo:]", "SYSyncAllObjects.m", 147, "nil != self->_syncID");
}

@end
