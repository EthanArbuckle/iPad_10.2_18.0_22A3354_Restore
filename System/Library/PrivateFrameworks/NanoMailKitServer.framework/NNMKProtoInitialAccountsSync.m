@implementation NNMKProtoInitialAccountsSync

- (void)clearInitialAccounts
{
  -[NSMutableArray removeAllObjects](self->_initialAccounts, "removeAllObjects");
}

- (void)addInitialAccount:(id)a3
{
  id v4;
  NSMutableArray *initialAccounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  initialAccounts = self->_initialAccounts;
  v8 = v4;
  if (!initialAccounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_initialAccounts;
    self->_initialAccounts = v6;

    v4 = v8;
    initialAccounts = self->_initialAccounts;
  }
  -[NSMutableArray addObject:](initialAccounts, "addObject:", v4);

}

- (unint64_t)initialAccountsCount
{
  return -[NSMutableArray count](self->_initialAccounts, "count");
}

- (id)initialAccountAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_initialAccounts, "objectAtIndex:", a3);
}

+ (Class)initialAccountType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInitialSyncVersion
{
  return self->_initialSyncVersion != 0;
}

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSyncVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDateSynced
{
  return self->_dateSynced != 0;
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
  v8.super_class = (Class)NNMKProtoInitialAccountsSync;
  -[NNMKProtoInitialAccountsSync description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoInitialAccountsSync dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *initialSyncVersion;
  void *v12;
  NSData *dateSynced;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_initialAccounts, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_initialAccounts, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = self->_initialAccounts;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("initialAccount"));
  }
  initialSyncVersion = self->_initialSyncVersion;
  if (initialSyncVersion)
    objc_msgSend(v3, "setObject:forKey:", initialSyncVersion, CFSTR("initialSyncVersion"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("fullSyncVersion"));

  }
  dateSynced = self->_dateSynced;
  if (dateSynced)
    objc_msgSend(v3, "setObject:forKey:", dateSynced, CFSTR("dateSynced"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoInitialAccountsSyncReadFrom((uint64_t)self, (uint64_t)a3);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_initialAccounts;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_initialSyncVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_dateSynced)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[NNMKProtoInitialAccountsSync initialAccountsCount](self, "initialAccountsCount"))
  {
    objc_msgSend(v9, "clearInitialAccounts");
    v4 = -[NNMKProtoInitialAccountsSync initialAccountsCount](self, "initialAccountsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NNMKProtoInitialAccountsSync initialAccountAtIndex:](self, "initialAccountAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addInitialAccount:", v7);

      }
    }
  }
  if (self->_initialSyncVersion)
    objc_msgSend(v9, "setInitialSyncVersion:");
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 4) = self->_fullSyncVersion;
    *((_BYTE *)v9 + 40) |= 1u;
  }
  if (self->_dateSynced)
  {
    objc_msgSend(v9, "setDateSynced:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_initialAccounts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addInitialAccount:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_initialSyncVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v14 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3, (_QWORD)v17);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *initialAccounts;
  NSString *initialSyncVersion;
  NSData *dateSynced;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  initialAccounts = self->_initialAccounts;
  if ((unint64_t)initialAccounts | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](initialAccounts, "isEqual:"))
      goto LABEL_13;
  }
  initialSyncVersion = self->_initialSyncVersion;
  if ((unint64_t)initialSyncVersion | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](initialSyncVersion, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((_QWORD *)v4 + 1))
    v8 = -[NSData isEqual:](dateSynced, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSMutableArray hash](self->_initialAccounts, "hash");
  v4 = -[NSString hash](self->_initialSyncVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_fullSyncVersion;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSData hash](self->_dateSynced, "hash");
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[NNMKProtoInitialAccountsSync addInitialAccount:](self, "addInitialAccount:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 4))
    -[NNMKProtoInitialAccountsSync setInitialSyncVersion:](self, "setInitialSyncVersion:");
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
    -[NNMKProtoInitialAccountsSync setDateSynced:](self, "setDateSynced:");

}

- (NSMutableArray)initialAccounts
{
  return self->_initialAccounts;
}

- (void)setInitialAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_initialAccounts, a3);
}

- (NSString)initialSyncVersion
{
  return self->_initialSyncVersion;
}

- (void)setInitialSyncVersion:(id)a3
{
  objc_storeStrong((id *)&self->_initialSyncVersion, a3);
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSData)dateSynced
{
  return self->_dateSynced;
}

- (void)setDateSynced:(id)a3
{
  objc_storeStrong((id *)&self->_dateSynced, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncVersion, 0);
  objc_storeStrong((id *)&self->_initialAccounts, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
}

@end
