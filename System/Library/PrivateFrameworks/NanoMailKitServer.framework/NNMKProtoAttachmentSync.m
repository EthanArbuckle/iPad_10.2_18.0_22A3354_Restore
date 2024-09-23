@implementation NNMKProtoAttachmentSync

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

- (BOOL)hasMessageId
{
  return self->_messageId != 0;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasAttachmentData
{
  return self->_attachmentData != 0;
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
  v8.super_class = (Class)NNMKProtoAttachmentSync;
  -[NNMKProtoAttachmentSync description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoAttachmentSync dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *messageId;
  NSString *contentId;
  NSData *attachmentData;
  NSString *mailboxId;

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
  messageId = self->_messageId;
  if (messageId)
    objc_msgSend(v3, "setObject:forKey:", messageId, CFSTR("messageId"));
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("contentId"));
  attachmentData = self->_attachmentData;
  if (attachmentData)
    objc_msgSend(v3, "setObject:forKey:", attachmentData, CFSTR("attachmentData"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAttachmentSyncReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_dateSynced)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_messageId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_contentId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_attachmentData)
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
    v4[8] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v5 = v4;
  if (self->_dateSynced)
  {
    objc_msgSend(v4, "setDateSynced:");
    v4 = v5;
  }
  if (self->_messageId)
  {
    objc_msgSend(v5, "setMessageId:");
    v4 = v5;
  }
  if (self->_contentId)
  {
    objc_msgSend(v5, "setContentId:");
    v4 = v5;
  }
  if (self->_attachmentData)
  {
    objc_msgSend(v5, "setAttachmentData:");
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_messageId, "copyWithZone:", a3);
  v10 = (void *)v6[6];
  v6[6] = v9;

  v11 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[NSData copyWithZone:](self->_attachmentData, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  v15 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dateSynced;
  NSString *messageId;
  NSString *contentId;
  NSData *attachmentData;
  NSString *mailboxId;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 8))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](dateSynced, "isEqual:"))
    goto LABEL_17;
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:"))
      goto LABEL_17;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:"))
      goto LABEL_17;
  }
  attachmentData = self->_attachmentData;
  if ((unint64_t)attachmentData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](attachmentData, "isEqual:"))
      goto LABEL_17;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 5))
    v10 = -[NSString isEqual:](mailboxId, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_dateSynced, "hash") ^ v3;
  v5 = -[NSString hash](self->_messageId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_contentId, "hash");
  v7 = -[NSData hash](self->_attachmentData, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_mailboxId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[14] & 1) != 0)
  {
    self->_fullSyncVersion = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NNMKProtoAttachmentSync setDateSynced:](self, "setDateSynced:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NNMKProtoAttachmentSync setMessageId:](self, "setMessageId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NNMKProtoAttachmentSync setContentId:](self, "setContentId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoAttachmentSync setAttachmentData:](self, "setAttachmentData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NNMKProtoAttachmentSync setMailboxId:](self, "setMailboxId:");
    v4 = v5;
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

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (NSData)attachmentData
{
  return self->_attachmentData;
}

- (void)setAttachmentData:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentData, a3);
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
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_attachmentData, 0);
}

@end
