@implementation NNMKProtoFetchRequest

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

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (void)setWantsBatchedResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wantsBatchedResponse = a3;
}

- (void)setHasWantsBatchedResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWantsBatchedResponse
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCurrentMessageIdsAndStatus
{
  return self->_currentMessageIdsAndStatus != 0;
}

- (BOOL)hasCurrentDateForRequestingMoreMessages
{
  return self->_currentDateForRequestingMoreMessages != 0;
}

- (void)setWillTrimDatabaseAfterResults:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_willTrimDatabaseAfterResults = a3;
}

- (void)setHasWillTrimDatabaseAfterResults:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWillTrimDatabaseAfterResults
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NNMKProtoFetchRequest;
  -[NNMKProtoFetchRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoFetchRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *conversationId;
  void *v6;
  NSData *currentMessageIdsAndStatus;
  NSData *currentDateForRequestingMoreMessages;
  void *v9;
  NSString *mailboxId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fullSyncVersion"));

  }
  conversationId = self->_conversationId;
  if (conversationId)
    objc_msgSend(v3, "setObject:forKey:", conversationId, CFSTR("conversationId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wantsBatchedResponse);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("wantsBatchedResponse"));

  }
  currentMessageIdsAndStatus = self->_currentMessageIdsAndStatus;
  if (currentMessageIdsAndStatus)
    objc_msgSend(v3, "setObject:forKey:", currentMessageIdsAndStatus, CFSTR("currentMessageIdsAndStatus"));
  currentDateForRequestingMoreMessages = self->_currentDateForRequestingMoreMessages;
  if (currentDateForRequestingMoreMessages)
    objc_msgSend(v3, "setObject:forKey:", currentDateForRequestingMoreMessages, CFSTR("currentDateForRequestingMoreMessages"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_willTrimDatabaseAfterResults);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("willTrimDatabaseAfterResults"));

  }
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoFetchRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_conversationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_currentMessageIdsAndStatus)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_currentDateForRequestingMoreMessages)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_mailboxId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  v5 = v4;
  if (self->_conversationId)
  {
    objc_msgSend(v4, "setConversationId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_wantsBatchedResponse;
    *((_BYTE *)v4 + 52) |= 2u;
  }
  if (self->_currentMessageIdsAndStatus)
  {
    objc_msgSend(v5, "setCurrentMessageIdsAndStatus:");
    v4 = v5;
  }
  if (self->_currentDateForRequestingMoreMessages)
  {
    objc_msgSend(v5, "setCurrentDateForRequestingMoreMessages:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 49) = self->_willTrimDatabaseAfterResults;
    *((_BYTE *)v4 + 52) |= 4u;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v5, "setMailboxId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_conversationId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 48) = self->_wantsBatchedResponse;
    *(_BYTE *)(v6 + 52) |= 2u;
  }
  v9 = -[NSData copyWithZone:](self->_currentMessageIdsAndStatus, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  v11 = -[NSData copyWithZone:](self->_currentDateForRequestingMoreMessages, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 49) = self->_willTrimDatabaseAfterResults;
    *(_BYTE *)(v6 + 52) |= 4u;
  }
  v13 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *conversationId;
  NSData *currentMessageIdsAndStatus;
  NSData *currentDateForRequestingMoreMessages;
  char v9;
  NSString *mailboxId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 8))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_26;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:"))
      goto LABEL_26;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
      goto LABEL_26;
    if (self->_wantsBatchedResponse)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_26;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_26;
  }
  currentMessageIdsAndStatus = self->_currentMessageIdsAndStatus;
  if ((unint64_t)currentMessageIdsAndStatus | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](currentMessageIdsAndStatus, "isEqual:"))
  {
    goto LABEL_26;
  }
  currentDateForRequestingMoreMessages = self->_currentDateForRequestingMoreMessages;
  if ((unint64_t)currentDateForRequestingMoreMessages | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](currentDateForRequestingMoreMessages, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_32;
LABEL_26:
    v9 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 52) & 4) == 0)
    goto LABEL_26;
  if (!self->_willTrimDatabaseAfterResults)
  {
    if (!*((_BYTE *)v4 + 49))
      goto LABEL_32;
    goto LABEL_26;
  }
  if (!*((_BYTE *)v4 + 49))
    goto LABEL_26;
LABEL_32:
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](mailboxId, "isEqual:");
  else
    v9 = 1;
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_conversationId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_wantsBatchedResponse;
  else
    v5 = 0;
  v6 = -[NSData hash](self->_currentMessageIdsAndStatus, "hash");
  v7 = -[NSData hash](self->_currentDateForRequestingMoreMessages, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_willTrimDatabaseAfterResults;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_mailboxId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoFetchRequest setConversationId:](self, "setConversationId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_wantsBatchedResponse = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NNMKProtoFetchRequest setCurrentMessageIdsAndStatus:](self, "setCurrentMessageIdsAndStatus:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NNMKProtoFetchRequest setCurrentDateForRequestingMoreMessages:](self, "setCurrentDateForRequestingMoreMessages:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    self->_willTrimDatabaseAfterResults = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NNMKProtoFetchRequest setMailboxId:](self, "setMailboxId:");
    v4 = v5;
  }

}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (BOOL)wantsBatchedResponse
{
  return self->_wantsBatchedResponse;
}

- (NSData)currentMessageIdsAndStatus
{
  return self->_currentMessageIdsAndStatus;
}

- (void)setCurrentMessageIdsAndStatus:(id)a3
{
  objc_storeStrong((id *)&self->_currentMessageIdsAndStatus, a3);
}

- (NSData)currentDateForRequestingMoreMessages
{
  return self->_currentDateForRequestingMoreMessages;
}

- (void)setCurrentDateForRequestingMoreMessages:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateForRequestingMoreMessages, a3);
}

- (BOOL)willTrimDatabaseAfterResults
{
  return self->_willTrimDatabaseAfterResults;
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
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_currentMessageIdsAndStatus, 0);
  objc_storeStrong((id *)&self->_currentDateForRequestingMoreMessages, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
}

@end
