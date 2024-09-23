@implementation NNMKProtoBatchedFetchResult

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

- (void)clearMessageAdditions
{
  -[NSMutableArray removeAllObjects](self->_messageAdditions, "removeAllObjects");
}

- (void)addMessageAddition:(id)a3
{
  id v4;
  NSMutableArray *messageAdditions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messageAdditions = self->_messageAdditions;
  v8 = v4;
  if (!messageAdditions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_messageAdditions;
    self->_messageAdditions = v6;

    v4 = v8;
    messageAdditions = self->_messageAdditions;
  }
  -[NSMutableArray addObject:](messageAdditions, "addObject:", v4);

}

- (unint64_t)messageAdditionsCount
{
  return -[NSMutableArray count](self->_messageAdditions, "count");
}

- (id)messageAdditionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messageAdditions, "objectAtIndex:", a3);
}

+ (Class)messageAdditionType
{
  return (Class)objc_opt_class();
}

- (void)clearMessageUpdates
{
  -[NSMutableArray removeAllObjects](self->_messageUpdates, "removeAllObjects");
}

- (void)addMessageUpdate:(id)a3
{
  id v4;
  NSMutableArray *messageUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messageUpdates = self->_messageUpdates;
  v8 = v4;
  if (!messageUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_messageUpdates;
    self->_messageUpdates = v6;

    v4 = v8;
    messageUpdates = self->_messageUpdates;
  }
  -[NSMutableArray addObject:](messageUpdates, "addObject:", v4);

}

- (unint64_t)messageUpdatesCount
{
  return -[NSMutableArray count](self->_messageUpdates, "count");
}

- (id)messageUpdateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messageUpdates, "objectAtIndex:", a3);
}

+ (Class)messageUpdateType
{
  return (Class)objc_opt_class();
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

- (BOOL)hasDateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages != 0;
}

- (void)setShouldTrimDatabase:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_shouldTrimDatabase = a3;
}

- (void)setHasShouldTrimDatabase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShouldTrimDatabase
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NNMKProtoBatchedFetchResult;
  -[NNMKProtoBatchedFetchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoBatchedFetchResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  NSData *dateForRequestingMoreMessages;
  void *v28;
  NSString *mailboxId;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
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
  if (-[NSMutableArray count](self->_messageAdditions, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_messageAdditions, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v7 = self->_messageAdditions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("messageAddition"));
  }
  if (-[NSMutableArray count](self->_messageUpdates, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_messageUpdates, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v14 = self->_messageUpdates;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("messageUpdate"));
  }
  if (-[NSMutableArray count](self->_messageDeletions, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_messageDeletions, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = self->_messageDeletions;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v32);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("messageDeletion"));
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if (dateForRequestingMoreMessages)
    objc_msgSend(v3, "setObject:forKey:", dateForRequestingMoreMessages, CFSTR("dateForRequestingMoreMessages"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldTrimDatabase);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("shouldTrimDatabase"));

  }
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mailboxSyncVersion);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("mailboxSyncVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoBatchedFetchResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_dateSynced)
    PBDataWriterWriteDataField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_messageAdditions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_messageUpdates;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_messageDeletions;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_dateForRequestingMoreMessages)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
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
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  _BYTE *v17;
  _BYTE *v18;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  v18 = v4;
  if (self->_dateSynced)
    objc_msgSend(v4, "setDateSynced:");
  if (-[NNMKProtoBatchedFetchResult messageAdditionsCount](self, "messageAdditionsCount"))
  {
    objc_msgSend(v18, "clearMessageAdditions");
    v5 = -[NNMKProtoBatchedFetchResult messageAdditionsCount](self, "messageAdditionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoBatchedFetchResult messageAdditionAtIndex:](self, "messageAdditionAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addMessageAddition:", v8);

      }
    }
  }
  if (-[NNMKProtoBatchedFetchResult messageUpdatesCount](self, "messageUpdatesCount"))
  {
    objc_msgSend(v18, "clearMessageUpdates");
    v9 = -[NNMKProtoBatchedFetchResult messageUpdatesCount](self, "messageUpdatesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[NNMKProtoBatchedFetchResult messageUpdateAtIndex:](self, "messageUpdateAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addMessageUpdate:", v12);

      }
    }
  }
  if (-[NNMKProtoBatchedFetchResult messageDeletionsCount](self, "messageDeletionsCount"))
  {
    objc_msgSend(v18, "clearMessageDeletions");
    v13 = -[NNMKProtoBatchedFetchResult messageDeletionsCount](self, "messageDeletionsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[NNMKProtoBatchedFetchResult messageDeletionAtIndex:](self, "messageDeletionAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addMessageDeletion:", v16);

      }
    }
  }
  if (self->_dateForRequestingMoreMessages)
    objc_msgSend(v18, "setDateForRequestingMoreMessages:");
  v17 = v18;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v18[72] = self->_shouldTrimDatabase;
    v18[76] |= 4u;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v18, "setMailboxId:");
    v17 = v18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 10) = self->_mailboxSyncVersion;
    v17[76] |= 2u;
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = self->_messageAdditions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v41;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v13), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMessageAddition:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v11);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = self->_messageUpdates;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v19), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMessageUpdate:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v17);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = self->_messageDeletions;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v25), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v6, "addMessageDeletion:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v23);
  }

  v27 = -[NSData copyWithZone:](self->_dateForRequestingMoreMessages, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v27;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 72) = self->_shouldTrimDatabase;
    *(_BYTE *)(v6 + 76) |= 4u;
  }
  v29 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3, (_QWORD)v32);
  v30 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v29;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_mailboxSyncVersion;
    *(_BYTE *)(v6 + 76) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dateSynced;
  NSMutableArray *messageAdditions;
  NSMutableArray *messageUpdates;
  NSMutableArray *messageDeletions;
  NSData *dateForRequestingMoreMessages;
  char has;
  NSString *mailboxId;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_32;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](dateSynced, "isEqual:"))
    goto LABEL_32;
  messageAdditions = self->_messageAdditions;
  if ((unint64_t)messageAdditions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](messageAdditions, "isEqual:"))
      goto LABEL_32;
  }
  messageUpdates = self->_messageUpdates;
  if ((unint64_t)messageUpdates | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](messageUpdates, "isEqual:"))
      goto LABEL_32;
  }
  messageDeletions = self->_messageDeletions;
  if ((unint64_t)messageDeletions | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](messageDeletions, "isEqual:"))
      goto LABEL_32;
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if ((unint64_t)dateForRequestingMoreMessages | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](dateForRequestingMoreMessages, "isEqual:"))
      goto LABEL_32;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0)
      goto LABEL_32;
    if (self->_shouldTrimDatabase)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_32;
  }
  mailboxId = self->_mailboxId;
  if (!((unint64_t)mailboxId | *((_QWORD *)v4 + 4)))
    goto LABEL_28;
  if (!-[NSString isEqual:](mailboxId, "isEqual:"))
  {
LABEL_32:
    v12 = 0;
    goto LABEL_33;
  }
  has = (char)self->_has;
LABEL_28:
  v12 = (*((_BYTE *)v4 + 76) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 10))
      goto LABEL_32;
    v12 = 1;
  }
LABEL_33:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_dateSynced, "hash");
  v5 = -[NSMutableArray hash](self->_messageAdditions, "hash");
  v6 = -[NSMutableArray hash](self->_messageUpdates, "hash");
  v7 = -[NSMutableArray hash](self->_messageDeletions, "hash");
  v8 = -[NSData hash](self->_dateForRequestingMoreMessages, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v9 = 2654435761 * self->_shouldTrimDatabase;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_mailboxId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_mailboxSyncVersion;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
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
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[19] & 1) != 0)
  {
    self->_fullSyncVersion = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NNMKProtoBatchedFetchResult setDateSynced:](self, "setDateSynced:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v5 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[NNMKProtoBatchedFetchResult addMessageAddition:](self, "addMessageAddition:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v5 + 8);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[NNMKProtoBatchedFetchResult addMessageUpdate:](self, "addMessageUpdate:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v5 + 7);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[NNMKProtoBatchedFetchResult addMessageDeletion:](self, "addMessageDeletion:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v5 + 1))
    -[NNMKProtoBatchedFetchResult setDateForRequestingMoreMessages:](self, "setDateForRequestingMoreMessages:");
  if ((*((_BYTE *)v5 + 76) & 4) != 0)
  {
    self->_shouldTrimDatabase = *((_BYTE *)v5 + 72);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 4))
    -[NNMKProtoBatchedFetchResult setMailboxId:](self, "setMailboxId:");
  if ((*((_BYTE *)v5 + 76) & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 10);
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

- (NSMutableArray)messageAdditions
{
  return self->_messageAdditions;
}

- (void)setMessageAdditions:(id)a3
{
  objc_storeStrong((id *)&self->_messageAdditions, a3);
}

- (NSMutableArray)messageUpdates
{
  return self->_messageUpdates;
}

- (void)setMessageUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_messageUpdates, a3);
}

- (NSMutableArray)messageDeletions
{
  return self->_messageDeletions;
}

- (void)setMessageDeletions:(id)a3
{
  objc_storeStrong((id *)&self->_messageDeletions, a3);
}

- (NSData)dateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages;
}

- (void)setDateForRequestingMoreMessages:(id)a3
{
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, a3);
}

- (BOOL)shouldTrimDatabase
{
  return self->_shouldTrimDatabase;
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
  objc_storeStrong((id *)&self->_messageUpdates, 0);
  objc_storeStrong((id *)&self->_messageDeletions, 0);
  objc_storeStrong((id *)&self->_messageAdditions, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, 0);
}

@end
