@implementation NNMKProtoMessageMailboxMoves

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

- (void)clearMessageIds
{
  -[NSMutableArray removeAllObjects](self->_messageIds, "removeAllObjects");
}

- (void)addMessageIds:(id)a3
{
  id v4;
  NSMutableArray *messageIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messageIds = self->_messageIds;
  v8 = v4;
  if (!messageIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_messageIds;
    self->_messageIds = v6;

    v4 = v8;
    messageIds = self->_messageIds;
  }
  -[NSMutableArray addObject:](messageIds, "addObject:", v4);

}

- (unint64_t)messageIdsCount
{
  return -[NSMutableArray count](self->_messageIds, "count");
}

- (id)messageIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messageIds, "objectAtIndex:", a3);
}

+ (Class)messageIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
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
  v8.super_class = (Class)NNMKProtoMessageMailboxMoves;
  -[NNMKProtoMessageMailboxMoves description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageMailboxMoves dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *messageIds;
  NSString *mailboxId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fullSyncVersion"));

  }
  messageIds = self->_messageIds;
  if (messageIds)
    objc_msgSend(v3, "setObject:forKey:", messageIds, CFSTR("messageIds"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageMailboxMovesReadFrom((uint64_t)self, (uint64_t)a3);
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
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_messageIds;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_mailboxId)
    PBDataWriterWriteStringField();

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
    v4[2] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v9 = v4;
  if (-[NNMKProtoMessageMailboxMoves messageIdsCount](self, "messageIdsCount"))
  {
    objc_msgSend(v9, "clearMessageIds");
    v5 = -[NNMKProtoMessageMailboxMoves messageIdsCount](self, "messageIdsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoMessageMailboxMoves messageIdsAtIndex:](self, "messageIdsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addMessageIds:", v8);

      }
    }
  }
  if (self->_mailboxId)
    objc_msgSend(v9, "setMailboxId:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_messageIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v6, "addMessageIds:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v14 = (void *)v6[2];
  v6[2] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *messageIds;
  NSString *mailboxId;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  messageIds = self->_messageIds;
  if ((unint64_t)messageIds | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](messageIds, "isEqual:"))
  {
    goto LABEL_11;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](mailboxId, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_messageIds, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_mailboxId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
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
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 3);
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
        -[NNMKProtoMessageMailboxMoves addMessageIds:](self, "addMessageIds:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (v5[2])
    -[NNMKProtoMessageMailboxMoves setMailboxId:](self, "setMailboxId:");

}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSMutableArray)messageIds
{
  return self->_messageIds;
}

- (void)setMessageIds:(id)a3
{
  objc_storeStrong((id *)&self->_messageIds, a3);
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIds, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
}

@end
