@implementation NNMKProtoInitialMessagesSync

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

- (void)clearInitialMessages
{
  -[NSMutableArray removeAllObjects](self->_initialMessages, "removeAllObjects");
}

- (void)addInitialMessage:(id)a3
{
  id v4;
  NSMutableArray *initialMessages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  initialMessages = self->_initialMessages;
  v8 = v4;
  if (!initialMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_initialMessages;
    self->_initialMessages = v6;

    v4 = v8;
    initialMessages = self->_initialMessages;
  }
  -[NSMutableArray addObject:](initialMessages, "addObject:", v4);

}

- (unint64_t)initialMessagesCount
{
  return -[NSMutableArray count](self->_initialMessages, "count");
}

- (id)initialMessageAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_initialMessages, "objectAtIndex:", a3);
}

+ (Class)initialMessageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages != 0;
}

- (void)setSyncedMailboxType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_syncedMailboxType = a3;
}

- (void)setHasSyncedMailboxType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncedMailboxType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSyncedMailboxAccountId
{
  return self->_syncedMailboxAccountId != 0;
}

- (BOOL)hasSyncedMailboxURL
{
  return self->_syncedMailboxURL != 0;
}

- (BOOL)hasSyncedMailboxCustomName
{
  return self->_syncedMailboxCustomName != 0;
}

- (BOOL)hasMailbox
{
  return self->_mailbox != 0;
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

- (void)setOrganizedByThread:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_organizedByThread = a3;
}

- (void)setHasOrganizedByThread:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOrganizedByThread
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)NNMKProtoInitialMessagesSync;
  -[NNMKProtoInitialMessagesSync description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoInitialMessagesSync dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v14;
  NSString *syncedMailboxAccountId;
  NSString *syncedMailboxURL;
  NSString *syncedMailboxCustomName;
  NNMKProtoMailbox *mailbox;
  void *v19;
  char has;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
  if (-[NSMutableArray count](self->_initialMessages, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_initialMessages, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_initialMessages;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v24);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("initialMessage"));
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if (dateForRequestingMoreMessages)
    objc_msgSend(v3, "setObject:forKey:", dateForRequestingMoreMessages, CFSTR("dateForRequestingMoreMessages"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncedMailboxType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("syncedMailboxType"));

  }
  syncedMailboxAccountId = self->_syncedMailboxAccountId;
  if (syncedMailboxAccountId)
    objc_msgSend(v3, "setObject:forKey:", syncedMailboxAccountId, CFSTR("syncedMailboxAccountId"));
  syncedMailboxURL = self->_syncedMailboxURL;
  if (syncedMailboxURL)
    objc_msgSend(v3, "setObject:forKey:", syncedMailboxURL, CFSTR("syncedMailboxURL"));
  syncedMailboxCustomName = self->_syncedMailboxCustomName;
  if (syncedMailboxCustomName)
    objc_msgSend(v3, "setObject:forKey:", syncedMailboxCustomName, CFSTR("syncedMailboxCustomName"));
  mailbox = self->_mailbox;
  if (mailbox)
  {
    -[NNMKProtoMailbox dictionaryRepresentation](mailbox, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("mailbox"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mailboxSyncVersion);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("mailboxSyncVersion"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_organizedByThread);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("organizedByThread"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoInitialMessagesSyncReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_dateSynced)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_initialMessages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_dateForRequestingMoreMessages)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_syncedMailboxAccountId)
    PBDataWriterWriteStringField();
  if (self->_syncedMailboxURL)
    PBDataWriterWriteStringField();
  if (self->_syncedMailboxCustomName)
    PBDataWriterWriteStringField();
  if (self->_mailbox)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _DWORD *v9;
  char has;
  id v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 92) |= 1u;
  }
  v11 = v4;
  if (self->_dateSynced)
    objc_msgSend(v4, "setDateSynced:");
  if (-[NNMKProtoInitialMessagesSync initialMessagesCount](self, "initialMessagesCount"))
  {
    objc_msgSend(v11, "clearInitialMessages");
    v5 = -[NNMKProtoInitialMessagesSync initialMessagesCount](self, "initialMessagesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoInitialMessagesSync initialMessageAtIndex:](self, "initialMessageAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addInitialMessage:", v8);

      }
    }
  }
  if (self->_dateForRequestingMoreMessages)
    objc_msgSend(v11, "setDateForRequestingMoreMessages:");
  v9 = v11;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v11 + 18) = self->_syncedMailboxType;
    *((_BYTE *)v11 + 92) |= 4u;
  }
  if (self->_syncedMailboxAccountId)
  {
    objc_msgSend(v11, "setSyncedMailboxAccountId:");
    v9 = v11;
  }
  if (self->_syncedMailboxURL)
  {
    objc_msgSend(v11, "setSyncedMailboxURL:");
    v9 = v11;
  }
  if (self->_syncedMailboxCustomName)
  {
    objc_msgSend(v11, "setSyncedMailboxCustomName:");
    v9 = v11;
  }
  if (self->_mailbox)
  {
    objc_msgSend(v11, "setMailbox:");
    v9 = v11;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9[12] = self->_mailboxSyncVersion;
    *((_BYTE *)v9 + 92) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_BYTE *)v9 + 88) = self->_organizedByThread;
    *((_BYTE *)v9 + 92) |= 8u;
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
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  char has;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = self->_initialMessages;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v6, "addInitialMessage:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  v15 = -[NSData copyWithZone:](self->_dateForRequestingMoreMessages, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v15;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_syncedMailboxType;
    *(_BYTE *)(v6 + 92) |= 4u;
  }
  v17 = -[NSString copyWithZone:](self->_syncedMailboxAccountId, "copyWithZone:", a3, (_QWORD)v27);
  v18 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v17;

  v19 = -[NSString copyWithZone:](self->_syncedMailboxURL, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v19;

  v21 = -[NSString copyWithZone:](self->_syncedMailboxCustomName, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v21;

  v23 = -[NNMKProtoMailbox copyWithZone:](self->_mailbox, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v23;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_mailboxSyncVersion;
    *(_BYTE *)(v6 + 92) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v6 + 88) = self->_organizedByThread;
    *(_BYTE *)(v6 + 92) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dateSynced;
  NSMutableArray *initialMessages;
  NSData *dateForRequestingMoreMessages;
  NSString *syncedMailboxAccountId;
  NSString *syncedMailboxURL;
  NSString *syncedMailboxCustomName;
  NNMKProtoMailbox *mailbox;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_33;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](dateSynced, "isEqual:"))
    goto LABEL_33;
  initialMessages = self->_initialMessages;
  if ((unint64_t)initialMessages | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](initialMessages, "isEqual:"))
      goto LABEL_33;
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if ((unint64_t)dateForRequestingMoreMessages | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](dateForRequestingMoreMessages, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_syncedMailboxType != *((_DWORD *)v4 + 18))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_33;
  }
  syncedMailboxAccountId = self->_syncedMailboxAccountId;
  if ((unint64_t)syncedMailboxAccountId | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](syncedMailboxAccountId, "isEqual:"))
  {
    goto LABEL_33;
  }
  syncedMailboxURL = self->_syncedMailboxURL;
  if ((unint64_t)syncedMailboxURL | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](syncedMailboxURL, "isEqual:"))
      goto LABEL_33;
  }
  syncedMailboxCustomName = self->_syncedMailboxCustomName;
  if ((unint64_t)syncedMailboxCustomName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](syncedMailboxCustomName, "isEqual:"))
      goto LABEL_33;
  }
  mailbox = self->_mailbox;
  if ((unint64_t)mailbox | *((_QWORD *)v4 + 5))
  {
    if (!-[NNMKProtoMailbox isEqual:](mailbox, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 12))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_33;
  }
  v12 = (*((_BYTE *)v4 + 92) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0)
    {
LABEL_33:
      v12 = 0;
      goto LABEL_34;
    }
    if (self->_organizedByThread)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_33;
    }
    v12 = 1;
  }
LABEL_34:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v14 = 2654435761 * self->_fullSyncVersion;
  else
    v14 = 0;
  v3 = -[NSData hash](self->_dateSynced, "hash");
  v4 = -[NSMutableArray hash](self->_initialMessages, "hash");
  v5 = -[NSData hash](self->_dateForRequestingMoreMessages, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_syncedMailboxType;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_syncedMailboxAccountId, "hash");
  v8 = -[NSString hash](self->_syncedMailboxURL, "hash");
  v9 = -[NSString hash](self->_syncedMailboxCustomName, "hash");
  v10 = -[NNMKProtoMailbox hash](self->_mailbox, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_mailboxSyncVersion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_11:
    v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_9:
  v12 = 2654435761 * self->_organizedByThread;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
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
  NNMKProtoMailbox *mailbox;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[23] & 1) != 0)
  {
    self->_fullSyncVersion = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NNMKProtoInitialMessagesSync setDateSynced:](self, "setDateSynced:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *((id *)v5 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NNMKProtoInitialMessagesSync addInitialMessage:](self, "addInitialMessage:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v5 + 1))
    -[NNMKProtoInitialMessagesSync setDateForRequestingMoreMessages:](self, "setDateForRequestingMoreMessages:");
  if ((*((_BYTE *)v5 + 92) & 4) != 0)
  {
    self->_syncedMailboxType = *((_DWORD *)v5 + 18);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 7))
    -[NNMKProtoInitialMessagesSync setSyncedMailboxAccountId:](self, "setSyncedMailboxAccountId:");
  if (*((_QWORD *)v5 + 10))
    -[NNMKProtoInitialMessagesSync setSyncedMailboxURL:](self, "setSyncedMailboxURL:");
  if (*((_QWORD *)v5 + 8))
    -[NNMKProtoInitialMessagesSync setSyncedMailboxCustomName:](self, "setSyncedMailboxCustomName:");
  mailbox = self->_mailbox;
  v12 = *((_QWORD *)v5 + 5);
  if (mailbox)
  {
    if (v12)
      -[NNMKProtoMailbox mergeFrom:](mailbox, "mergeFrom:");
  }
  else if (v12)
  {
    -[NNMKProtoInitialMessagesSync setMailbox:](self, "setMailbox:");
  }
  v13 = *((_BYTE *)v5 + 92);
  if ((v13 & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v13 = *((_BYTE *)v5 + 92);
  }
  if ((v13 & 8) != 0)
  {
    self->_organizedByThread = *((_BYTE *)v5 + 88);
    *(_BYTE *)&self->_has |= 8u;
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

- (NSMutableArray)initialMessages
{
  return self->_initialMessages;
}

- (void)setInitialMessages:(id)a3
{
  objc_storeStrong((id *)&self->_initialMessages, a3);
}

- (NSData)dateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages;
}

- (void)setDateForRequestingMoreMessages:(id)a3
{
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, a3);
}

- (unsigned)syncedMailboxType
{
  return self->_syncedMailboxType;
}

- (NSString)syncedMailboxAccountId
{
  return self->_syncedMailboxAccountId;
}

- (void)setSyncedMailboxAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_syncedMailboxAccountId, a3);
}

- (NSString)syncedMailboxURL
{
  return self->_syncedMailboxURL;
}

- (void)setSyncedMailboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_syncedMailboxURL, a3);
}

- (NSString)syncedMailboxCustomName
{
  return self->_syncedMailboxCustomName;
}

- (void)setSyncedMailboxCustomName:(id)a3
{
  objc_storeStrong((id *)&self->_syncedMailboxCustomName, a3);
}

- (NNMKProtoMailbox)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_mailbox, a3);
}

- (unsigned)mailboxSyncVersion
{
  return self->_mailboxSyncVersion;
}

- (BOOL)organizedByThread
{
  return self->_organizedByThread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedMailboxURL, 0);
  objc_storeStrong((id *)&self->_syncedMailboxCustomName, 0);
  objc_storeStrong((id *)&self->_syncedMailboxAccountId, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_initialMessages, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, 0);
}

@end
