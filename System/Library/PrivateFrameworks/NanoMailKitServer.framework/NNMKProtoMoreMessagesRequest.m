@implementation NNMKProtoMoreMessagesRequest

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFullSyncVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBeforeDateReceived
{
  return self->_beforeDateReceived != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (void)setFilterType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_filterType = a3;
}

- (void)setHasFilterType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFilterType
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
  v8.super_class = (Class)NNMKProtoMoreMessagesRequest;
  -[NNMKProtoMoreMessagesRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessagesRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *beforeDateReceived;
  NSString *mailboxId;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fullSyncVersion"));

  }
  beforeDateReceived = self->_beforeDateReceived;
  if (beforeDateReceived)
    objc_msgSend(v3, "setObject:forKey:", beforeDateReceived, CFSTR("beforeDateReceived"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_filterType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("filterType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMoreMessagesRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_beforeDateReceived)
    PBDataWriterWriteDataField();
  if (self->_mailboxId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[5] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  v5 = v4;
  if (self->_beforeDateReceived)
  {
    objc_msgSend(v4, "setBeforeDateReceived:");
    v4 = v5;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v5, "setMailboxId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_filterType;
    *((_BYTE *)v4 + 32) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_beforeDateReceived, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  v9 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_filterType;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *beforeDateReceived;
  NSString *mailboxId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 5))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  beforeDateReceived = self->_beforeDateReceived;
  if ((unint64_t)beforeDateReceived | *((_QWORD *)v4 + 1)
    && !-[NSData isEqual:](beforeDateReceived, "isEqual:"))
  {
    goto LABEL_15;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:"))
      goto LABEL_15;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 4))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_beforeDateReceived, "hash");
  v5 = -[NSString hash](self->_mailboxId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_filterType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[8] & 2) != 0)
  {
    self->_fullSyncVersion = v4[5];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoMoreMessagesRequest setBeforeDateReceived:](self, "setBeforeDateReceived:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NNMKProtoMoreMessagesRequest setMailboxId:](self, "setMailboxId:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_filterType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
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

- (unsigned)filterType
{
  return self->_filterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_beforeDateReceived, 0);
}

@end
