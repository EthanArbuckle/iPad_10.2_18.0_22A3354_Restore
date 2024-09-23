@implementation NNMKProtoMoreMessagesForConversationRequest

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

- (BOOL)hasBeforeDateReceived
{
  return self->_beforeDateReceived != 0;
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
  v8.super_class = (Class)NNMKProtoMoreMessagesForConversationRequest;
  -[NNMKProtoMoreMessagesForConversationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessagesForConversationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *beforeDateReceived;
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
  beforeDateReceived = self->_beforeDateReceived;
  if (beforeDateReceived)
    objc_msgSend(v3, "setObject:forKey:", beforeDateReceived, CFSTR("beforeDateReceived"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMoreMessagesForConversationRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_beforeDateReceived)
  {
    PBDataWriterWriteDataField();
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
    v4[6] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_conversationId)
  {
    objc_msgSend(v4, "setConversationId:");
    v4 = v5;
  }
  if (self->_beforeDateReceived)
  {
    objc_msgSend(v5, "setBeforeDateReceived:");
    v4 = v5;
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
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_conversationId, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSData copyWithZone:](self->_beforeDateReceived, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *conversationId;
  NSData *beforeDateReceived;
  NSString *mailboxId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](conversationId, "isEqual:"))
  {
    goto LABEL_13;
  }
  beforeDateReceived = self->_beforeDateReceived;
  if ((unint64_t)beforeDateReceived | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](beforeDateReceived, "isEqual:"))
      goto LABEL_13;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](mailboxId, "isEqual:");
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_conversationId, "hash") ^ v3;
  v5 = -[NSData hash](self->_beforeDateReceived, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_mailboxId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_fullSyncVersion = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NNMKProtoMoreMessagesForConversationRequest setConversationId:](self, "setConversationId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoMoreMessagesForConversationRequest setBeforeDateReceived:](self, "setBeforeDateReceived:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NNMKProtoMoreMessagesForConversationRequest setMailboxId:](self, "setMailboxId:");
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

- (NSData)beforeDateReceived
{
  return self->_beforeDateReceived;
}

- (void)setBeforeDateReceived:(id)a3
{
  objc_storeStrong((id *)&self->_beforeDateReceived, a3);
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
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_beforeDateReceived, 0);
}

@end
