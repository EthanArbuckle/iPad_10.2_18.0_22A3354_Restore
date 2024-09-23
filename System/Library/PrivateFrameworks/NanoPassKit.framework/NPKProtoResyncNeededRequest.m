@implementation NPKProtoResyncNeededRequest

- (BOOL)hasExpectedHash
{
  return self->_expectedHash != 0;
}

- (void)clearUniqueIDs
{
  -[NSMutableArray removeAllObjects](self->_uniqueIDs, "removeAllObjects");
}

- (void)addUniqueIDs:(id)a3
{
  id v4;
  NSMutableArray *uniqueIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  uniqueIDs = self->_uniqueIDs;
  v8 = v4;
  if (!uniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_uniqueIDs;
    self->_uniqueIDs = v6;

    v4 = v8;
    uniqueIDs = self->_uniqueIDs;
  }
  -[NSMutableArray addObject:](uniqueIDs, "addObject:", v4);

}

- (unint64_t)uniqueIDsCount
{
  return -[NSMutableArray count](self->_uniqueIDs, "count");
}

- (id)uniqueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_uniqueIDs, "objectAtIndex:", a3);
}

+ (Class)uniqueIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearManifestHashes
{
  -[NSMutableArray removeAllObjects](self->_manifestHashes, "removeAllObjects");
}

- (void)addManifestHashes:(id)a3
{
  id v4;
  NSMutableArray *manifestHashes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  manifestHashes = self->_manifestHashes;
  v8 = v4;
  if (!manifestHashes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_manifestHashes;
    self->_manifestHashes = v6;

    v4 = v8;
    manifestHashes = self->_manifestHashes;
  }
  -[NSMutableArray addObject:](manifestHashes, "addObject:", v4);

}

- (unint64_t)manifestHashesCount
{
  return -[NSMutableArray count](self->_manifestHashes, "count");
}

- (id)manifestHashesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_manifestHashes, "objectAtIndex:", a3);
}

+ (Class)manifestHashesType
{
  return (Class)objc_opt_class();
}

- (void)setFullResyncNeeded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fullResyncNeeded = a3;
}

- (void)setHasFullResyncNeeded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFullResyncNeeded
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setResyncID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resyncID = a3;
}

- (void)setHasResyncID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResyncID
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NPKProtoResyncNeededRequest;
  -[NPKProtoResyncNeededRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoResyncNeededRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoHash *expectedHash;
  void *v5;
  NSMutableArray *uniqueIDs;
  NSMutableArray *manifestHashes;
  char has;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  expectedHash = self->_expectedHash;
  if (expectedHash)
  {
    -[NPKProtoHash dictionaryRepresentation](expectedHash, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("expectedHash"));

  }
  uniqueIDs = self->_uniqueIDs;
  if (uniqueIDs)
    objc_msgSend(v3, "setObject:forKey:", uniqueIDs, CFSTR("uniqueIDs"));
  manifestHashes = self->_manifestHashes;
  if (manifestHashes)
    objc_msgSend(v3, "setObject:forKey:", manifestHashes, CFSTR("manifestHashes"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fullResyncNeeded);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("fullResyncNeeded"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resyncID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("resyncID"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoResyncNeededRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_expectedHash)
    PBDataWriterWriteSubmessage();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_uniqueIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_manifestHashes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteDataField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  char has;
  id v13;

  v13 = a3;
  if (self->_expectedHash)
    objc_msgSend(v13, "setExpectedHash:");
  if (-[NPKProtoResyncNeededRequest uniqueIDsCount](self, "uniqueIDsCount"))
  {
    objc_msgSend(v13, "clearUniqueIDs");
    v4 = -[NPKProtoResyncNeededRequest uniqueIDsCount](self, "uniqueIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoResyncNeededRequest uniqueIDsAtIndex:](self, "uniqueIDsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addUniqueIDs:", v7);

      }
    }
  }
  if (-[NPKProtoResyncNeededRequest manifestHashesCount](self, "manifestHashesCount"))
  {
    objc_msgSend(v13, "clearManifestHashes");
    v8 = -[NPKProtoResyncNeededRequest manifestHashesCount](self, "manifestHashesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoResyncNeededRequest manifestHashesAtIndex:](self, "manifestHashesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addManifestHashes:", v11);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v13 + 40) = self->_fullResyncNeeded;
    *((_BYTE *)v13 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v13 + 6) = self->_resyncID;
    *((_BYTE *)v13 + 44) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char has;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoHash copyWithZone:](self->_expectedHash, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = self->_uniqueIDs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addUniqueIDs:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_manifestHashes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addManifestHashes:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_fullResyncNeeded;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_resyncID;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoHash *expectedHash;
  NSMutableArray *uniqueIDs;
  NSMutableArray *manifestHashes;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  expectedHash = self->_expectedHash;
  if ((unint64_t)expectedHash | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoHash isEqual:](expectedHash, "isEqual:"))
      goto LABEL_20;
  }
  uniqueIDs = self->_uniqueIDs;
  if ((unint64_t)uniqueIDs | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](uniqueIDs, "isEqual:"))
      goto LABEL_20;
  }
  manifestHashes = self->_manifestHashes;
  if ((unint64_t)manifestHashes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](manifestHashes, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_fullResyncNeeded)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_20;
        goto LABEL_16;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_16;
    }
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_20;
LABEL_16:
  v8 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_resyncID != *((_DWORD *)v4 + 6))
      goto LABEL_20;
    v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NPKProtoHash hash](self->_expectedHash, "hash");
  v4 = -[NSMutableArray hash](self->_uniqueIDs, "hash");
  v5 = -[NSMutableArray hash](self->_manifestHashes, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_fullResyncNeeded;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_resyncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoHash *expectedHash;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  expectedHash = self->_expectedHash;
  v6 = *((_QWORD *)v4 + 1);
  if (expectedHash)
  {
    if (v6)
      -[NPKProtoHash mergeFrom:](expectedHash, "mergeFrom:");
  }
  else if (v6)
  {
    -[NPKProtoResyncNeededRequest setExpectedHash:](self, "setExpectedHash:");
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[NPKProtoResyncNeededRequest addUniqueIDs:](self, "addUniqueIDs:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)v4 + 2);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[NPKProtoResyncNeededRequest addManifestHashes:](self, "addManifestHashes:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17 = *((_BYTE *)v4 + 44);
  if ((v17 & 2) != 0)
  {
    self->_fullResyncNeeded = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
    v17 = *((_BYTE *)v4 + 44);
  }
  if ((v17 & 1) != 0)
  {
    self->_resyncID = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NPKProtoHash)expectedHash
{
  return self->_expectedHash;
}

- (void)setExpectedHash:(id)a3
{
  objc_storeStrong((id *)&self->_expectedHash, a3);
}

- (NSMutableArray)uniqueIDs
{
  return self->_uniqueIDs;
}

- (void)setUniqueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIDs, a3);
}

- (NSMutableArray)manifestHashes
{
  return self->_manifestHashes;
}

- (void)setManifestHashes:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHashes, a3);
}

- (BOOL)fullResyncNeeded
{
  return self->_fullResyncNeeded;
}

- (unsigned)resyncID
{
  return self->_resyncID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDs, 0);
  objc_storeStrong((id *)&self->_manifestHashes, 0);
  objc_storeStrong((id *)&self->_expectedHash, 0);
}

@end
