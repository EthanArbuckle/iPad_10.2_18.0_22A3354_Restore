@implementation NNMKProtoMessageDeletions

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

- (void)clearMessageDeletions
{
  -[NSMutableArray removeAllObjects](self->_messageDeletions, "removeAllObjects");
}

- (void)addMessageDeletion:(id)a3
{
  id v4;
  NSMutableArray *messageDeletions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messageDeletions = self->_messageDeletions;
  v8 = v4;
  if (!messageDeletions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_messageDeletions;
    self->_messageDeletions = v6;

    v4 = v8;
    messageDeletions = self->_messageDeletions;
  }
  -[NSMutableArray addObject:](messageDeletions, "addObject:", v4);

}

- (unint64_t)messageDeletionsCount
{
  return -[NSMutableArray count](self->_messageDeletions, "count");
}

- (id)messageDeletionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messageDeletions, "objectAtIndex:", a3);
}

+ (Class)messageDeletionType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (void)setMailboxSyncVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mailboxSyncVersion = a3;
}

- (void)setHasMailboxSyncVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMailboxSyncVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NNMKProtoMessageDeletions;
  -[NNMKProtoMessageDeletions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageDeletions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *dateSynced;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *mailboxId;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fullSyncVersion"));

  }
  dateSynced = self->_dateSynced;
  if (dateSynced)
    objc_msgSend(v3, "setObject:forKey:", dateSynced, CFSTR("dateSynced"));
  if (-[NSMutableArray count](self->_messageDeletions, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_messageDeletions, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_messageDeletions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("messageDeletion"));
  }
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mailboxSyncVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("mailboxSyncVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageDeletionsReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_dateSynced)
    PBDataWriterWriteDataField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_messageDeletions;
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

  if (self->_mailboxId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v9 = v4;
  if (self->_dateSynced)
    objc_msgSend(v4, "setDateSynced:");
  if (-[NNMKProtoMessageDeletions messageDeletionsCount](self, "messageDeletionsCount"))
  {
    objc_msgSend(v9, "clearMessageDeletions");
    v5 = -[NNMKProtoMessageDeletions messageDeletionsCount](self, "messageDeletionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoMessageDeletions messageDeletionAtIndex:](self, "messageDeletionAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addMessageDeletion:", v8);

      }
    }
  }
  if (self->_mailboxId)
    objc_msgSend(v9, "setMailboxId:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v9 + 8) = self->_mailboxSyncVersion;
    *((_BYTE *)v9 + 48) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_messageDeletions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v6, "addMessageDeletion:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v15;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_mailboxSyncVersion;
    *(_BYTE *)(v6 + 48) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dateSynced;
  NSMutableArray *messageDeletions;
  NSString *mailboxId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((_QWORD *)v4 + 1) && !-[NSData isEqual:](dateSynced, "isEqual:"))
    goto LABEL_17;
  messageDeletions = self->_messageDeletions;
  if ((unint64_t)messageDeletions | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](messageDeletions, "isEqual:"))
      goto LABEL_17;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:"))
      goto LABEL_17;
  }
  v8 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 8))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_dateSynced, "hash");
  v5 = -[NSMutableArray hash](self->_messageDeletions, "hash");
  v6 = -[NSString hash](self->_mailboxId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_mailboxSyncVersion;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  id v6;
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
  v4 = a3;
  v5 = v4;
  if ((v4[12] & 1) != 0)
  {
    self->_fullSyncVersion = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
    -[NNMKProtoMessageDeletions setDateSynced:](self, "setDateSynced:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v5 + 5);
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
        -[NNMKProtoMessageDeletions addMessageDeletion:](self, "addMessageDeletion:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v5 + 3))
    -[NNMKProtoMessageDeletions setMailboxId:](self, "setMailboxId:");
  if ((*((_BYTE *)v5 + 48) & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }

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

- (NSMutableArray)messageDeletions
{
  return self->_messageDeletions;
}

- (void)setMessageDeletions:(id)a3
{
  objc_storeStrong((id *)&self->_messageDeletions, a3);
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxId, a3);
}

- (unsigned)mailboxSyncVersion
{
  return self->_mailboxSyncVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDeletions, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
}

@end
