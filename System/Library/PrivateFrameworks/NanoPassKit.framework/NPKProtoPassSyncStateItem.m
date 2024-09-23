@implementation NPKProtoPassSyncStateItem

- (void)setSequenceCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequenceCounter = a3;
}

- (void)setHasSequenceCounter:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceCounter
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearManifestEntrys
{
  -[NSMutableArray removeAllObjects](self->_manifestEntrys, "removeAllObjects");
}

- (void)addManifestEntry:(id)a3
{
  id v4;
  NSMutableArray *manifestEntrys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  manifestEntrys = self->_manifestEntrys;
  v8 = v4;
  if (!manifestEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_manifestEntrys;
    self->_manifestEntrys = v6;

    v4 = v8;
    manifestEntrys = self->_manifestEntrys;
  }
  -[NSMutableArray addObject:](manifestEntrys, "addObject:", v4);

}

- (unint64_t)manifestEntrysCount
{
  return -[NSMutableArray count](self->_manifestEntrys, "count");
}

- (id)manifestEntryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_manifestEntrys, "objectAtIndex:", a3);
}

+ (Class)manifestEntryType
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
  v8.super_class = (Class)NPKProtoPassSyncStateItem;
  -[NPKProtoPassSyncStateItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passTypeIdentifier;
  NSString *serialNumber;
  void *v7;
  NSData *manifestHash;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v4, "setObject:forKey:", serialNumber, CFSTR("serialNumber"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sequenceCounter);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("sequenceCounter"));

  }
  manifestHash = self->_manifestHash;
  if (manifestHash)
    objc_msgSend(v4, "setObject:forKey:", manifestHash, CFSTR("manifestHash"));
  if (-[NSMutableArray count](self->_manifestEntrys, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_manifestEntrys, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_manifestEntrys;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("manifestEntry"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateItemReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (!self->_passTypeIdentifier)
    -[NPKProtoPassSyncStateItem writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_serialNumber)
    -[NPKProtoPassSyncStateItem writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (!self->_manifestHash)
    -[NPKProtoPassSyncStateItem writeTo:].cold.3();
  PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_manifestEntrys;
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
        PBDataWriterWriteSubmessage();
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
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setPassTypeIdentifier:", self->_passTypeIdentifier);
  objc_msgSend(v8, "setSerialNumber:", self->_serialNumber);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v8 + 8) = self->_sequenceCounter;
    *((_BYTE *)v8 + 48) |= 1u;
  }
  objc_msgSend(v8, "setManifestHash:", self->_manifestHash);
  if (-[NPKProtoPassSyncStateItem manifestEntrysCount](self, "manifestEntrysCount"))
  {
    objc_msgSend(v8, "clearManifestEntrys");
    v4 = -[NPKProtoPassSyncStateItem manifestEntrysCount](self, "manifestEntrysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoPassSyncStateItem manifestEntryAtIndex:](self, "manifestEntryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addManifestEntry:", v7);

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
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passTypeIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_sequenceCounter;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v10 = -[NSData copyWithZone:](self->_manifestHash, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_manifestEntrys;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addManifestEntry:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passTypeIdentifier;
  NSString *serialNumber;
  NSData *manifestHash;
  NSMutableArray *manifestEntrys;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  passTypeIdentifier = self->_passTypeIdentifier;
  if ((unint64_t)passTypeIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](passTypeIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_sequenceCounter != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((_QWORD *)v4 + 2)
    && !-[NSData isEqual:](manifestHash, "isEqual:"))
  {
    goto LABEL_15;
  }
  manifestEntrys = self->_manifestEntrys;
  if ((unint64_t)manifestEntrys | *((_QWORD *)v4 + 1))
    v9 = -[NSMutableArray isEqual:](manifestEntrys, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_passTypeIdentifier, "hash");
  v4 = -[NSString hash](self->_serialNumber, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_sequenceCounter;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSData hash](self->_manifestHash, "hash");
  return v6 ^ -[NSMutableArray hash](self->_manifestEntrys, "hash");
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[NPKProtoPassSyncStateItem setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
  if (*((_QWORD *)v4 + 5))
    -[NPKProtoPassSyncStateItem setSerialNumber:](self, "setSerialNumber:");
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_sequenceCounter = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NPKProtoPassSyncStateItem setManifestHash:](self, "setManifestHash:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
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
        -[NPKProtoPassSyncStateItem addManifestEntry:](self, "addManifestEntry:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (unsigned)sequenceCounter
{
  return self->_sequenceCounter;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHash, a3);
}

- (NSMutableArray)manifestEntrys
{
  return self->_manifestEntrys;
}

- (void)setManifestEntrys:(id)a3
{
  objc_storeStrong((id *)&self->_manifestEntrys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_manifestEntrys, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateItem writeTo:]", "NPKProtoPassSyncStateItem.m", 172, "nil != self->_passTypeIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoPassSyncStateItem writeTo:]", "NPKProtoPassSyncStateItem.m", 177, "nil != self->_serialNumber");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[NPKProtoPassSyncStateItem writeTo:]", "NPKProtoPassSyncStateItem.m", 189, "nil != self->_manifestHash");
}

@end
