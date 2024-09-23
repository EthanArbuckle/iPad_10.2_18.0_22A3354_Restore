@implementation NNMKProtoMoreMessages

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

- (void)clearAddedMessages
{
  -[NSMutableArray removeAllObjects](self->_addedMessages, "removeAllObjects");
}

- (void)addAddedMessage:(id)a3
{
  id v4;
  NSMutableArray *addedMessages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  addedMessages = self->_addedMessages;
  v8 = v4;
  if (!addedMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_addedMessages;
    self->_addedMessages = v6;

    v4 = v8;
    addedMessages = self->_addedMessages;
  }
  -[NSMutableArray addObject:](addedMessages, "addObject:", v4);

}

- (unint64_t)addedMessagesCount
{
  return -[NSMutableArray count](self->_addedMessages, "count");
}

- (id)addedMessageAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_addedMessages, "objectAtIndex:", a3);
}

+ (Class)addedMessageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages != 0;
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
  v8.super_class = (Class)NNMKProtoMoreMessages;
  -[NNMKProtoMoreMessages description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessages dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *dateForRequestingMoreMessages;
  NSString *mailboxId;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fullSyncVersion"));

  }
  dateSynced = self->_dateSynced;
  if (dateSynced)
    objc_msgSend(v3, "setObject:forKey:", dateSynced, CFSTR("dateSynced"));
  if (-[NSMutableArray count](self->_addedMessages, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_addedMessages, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_addedMessages;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("addedMessage"));
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if (dateForRequestingMoreMessages)
    objc_msgSend(v3, "setObject:forKey:", dateForRequestingMoreMessages, CFSTR("dateForRequestingMoreMessages"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mailboxSyncVersion);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("mailboxSyncVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMoreMessagesReadFrom(self, (uint64_t)a3);
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
  v5 = self->_addedMessages;
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

  if (self->_dateForRequestingMoreMessages)
    PBDataWriterWriteDataField();
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
  _DWORD *v9;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  v10 = v4;
  if (self->_dateSynced)
    objc_msgSend(v4, "setDateSynced:");
  if (-[NNMKProtoMoreMessages addedMessagesCount](self, "addedMessagesCount"))
  {
    objc_msgSend(v10, "clearAddedMessages");
    v5 = -[NNMKProtoMoreMessages addedMessagesCount](self, "addedMessagesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoMoreMessages addedMessageAtIndex:](self, "addedMessageAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAddedMessage:", v8);

      }
    }
  }
  if (self->_dateForRequestingMoreMessages)
    objc_msgSend(v10, "setDateForRequestingMoreMessages:");
  v9 = v10;
  if (self->_mailboxId)
  {
    objc_msgSend(v10, "setMailboxId:");
    v9 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9[12] = self->_mailboxSyncVersion;
    *((_BYTE *)v9 + 52) |= 2u;
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
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_addedMessages;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v6, "addAddedMessage:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v15 = -[NSData copyWithZone:](self->_dateForRequestingMoreMessages, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v15;

  v17 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v17;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_mailboxSyncVersion;
    *(_BYTE *)(v6 + 52) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dateSynced;
  NSMutableArray *addedMessages;
  NSData *dateForRequestingMoreMessages;
  NSString *mailboxId;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](dateSynced, "isEqual:"))
    goto LABEL_19;
  addedMessages = self->_addedMessages;
  if ((unint64_t)addedMessages | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](addedMessages, "isEqual:"))
      goto LABEL_19;
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if ((unint64_t)dateForRequestingMoreMessages | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](dateForRequestingMoreMessages, "isEqual:"))
      goto LABEL_19;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 12))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_dateSynced, "hash");
  v5 = -[NSMutableArray hash](self->_addedMessages, "hash");
  v6 = -[NSData hash](self->_dateForRequestingMoreMessages, "hash");
  v7 = -[NSString hash](self->_mailboxId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_mailboxSyncVersion;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
  if ((v4[13] & 1) != 0)
  {
    self->_fullSyncVersion = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[NNMKProtoMoreMessages setDateSynced:](self, "setDateSynced:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v5 + 1);
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
        -[NNMKProtoMoreMessages addAddedMessage:](self, "addAddedMessage:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v5 + 2))
    -[NNMKProtoMoreMessages setDateForRequestingMoreMessages:](self, "setDateForRequestingMoreMessages:");
  if (*((_QWORD *)v5 + 5))
    -[NNMKProtoMoreMessages setMailboxId:](self, "setMailboxId:");
  if ((*((_BYTE *)v5 + 52) & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 12);
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

- (NSMutableArray)addedMessages
{
  return self->_addedMessages;
}

- (void)setAddedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_addedMessages, a3);
}

- (NSData)dateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages;
}

- (void)setDateForRequestingMoreMessages:(id)a3
{
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, a3);
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
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, 0);
  objc_storeStrong((id *)&self->_addedMessages, 0);
}

@end
