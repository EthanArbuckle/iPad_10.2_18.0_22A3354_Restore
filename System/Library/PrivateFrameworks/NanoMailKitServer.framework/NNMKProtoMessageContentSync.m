@implementation NNMKProtoMessageContentSync

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

- (void)setMainAlternativeValid:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mainAlternativeValid = a3;
}

- (void)setHasMainAlternativeValid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMainAlternativeValid
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasPreview
{
  return self->_preview != 0;
}

- (void)setPartiallyLoaded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_partiallyLoaded = a3;
}

- (void)setHasPartiallyLoaded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPartiallyLoaded
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearAttachments
{
  -[NSMutableArray removeAllObjects](self->_attachments, "removeAllObjects");
}

- (void)addAttachment:(id)a3
{
  id v4;
  NSMutableArray *attachments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attachments = self->_attachments;
  v8 = v4;
  if (!attachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_attachments;
    self->_attachments = v6;

    v4 = v8;
    attachments = self->_attachments;
  }
  -[NSMutableArray addObject:](attachments, "addObject:", v4);

}

- (unint64_t)attachmentsCount
{
  return -[NSMutableArray count](self->_attachments, "count");
}

- (id)attachmentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attachments, "objectAtIndex:", a3);
}

+ (Class)attachmentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNotificationMessage
{
  return self->_notificationMessage != 0;
}

- (BOOL)hasHtmlContentData
{
  return self->_htmlContentData != 0;
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
  v8.super_class = (Class)NNMKProtoMessageContentSync;
  -[NNMKProtoMessageContentSync description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageContentSync dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  NSData *text;
  NSData *preview;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NNMKProtoMessage *notificationMessage;
  void *v19;
  NSData *htmlContentData;
  NSString *mailboxId;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_mainAlternativeValid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("mainAlternativeValid"));

  }
  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  preview = self->_preview;
  if (preview)
    objc_msgSend(v3, "setObject:forKey:", preview, CFSTR("preview"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_partiallyLoaded);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("partiallyLoaded"));

  }
  if (-[NSMutableArray count](self->_attachments, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_attachments, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = self->_attachments;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("attachment"));
  }
  notificationMessage = self->_notificationMessage;
  if (notificationMessage)
  {
    -[NNMKProtoMessage dictionaryRepresentation](notificationMessage, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("notificationMessage"));

  }
  htmlContentData = self->_htmlContentData;
  if (htmlContentData)
    objc_msgSend(v3, "setObject:forKey:", htmlContentData, CFSTR("htmlContentData"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v3, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageContentSyncReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_messageId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_text)
    PBDataWriterWriteDataField();
  if (self->_preview)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_attachments;
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

  if (self->_notificationMessage)
    PBDataWriterWriteSubmessage();
  if (self->_htmlContentData)
    PBDataWriterWriteDataField();
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
  void *v9;
  _DWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  v10 = v4;
  if (self->_dateSynced)
  {
    objc_msgSend(v4, "setDateSynced:");
    v4 = v10;
  }
  if (self->_messageId)
  {
    objc_msgSend(v10, "setMessageId:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 80) = self->_mainAlternativeValid;
    *((_BYTE *)v4 + 84) |= 2u;
  }
  if (self->_text)
  {
    objc_msgSend(v10, "setText:");
    v4 = v10;
  }
  if (self->_preview)
  {
    objc_msgSend(v10, "setPreview:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 81) = self->_partiallyLoaded;
    *((_BYTE *)v4 + 84) |= 4u;
  }
  if (-[NNMKProtoMessageContentSync attachmentsCount](self, "attachmentsCount"))
  {
    objc_msgSend(v10, "clearAttachments");
    v5 = -[NNMKProtoMessageContentSync attachmentsCount](self, "attachmentsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoMessageContentSync attachmentAtIndex:](self, "attachmentAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAttachment:", v8);

      }
    }
  }
  if (self->_notificationMessage)
    objc_msgSend(v10, "setNotificationMessage:");
  v9 = v10;
  if (self->_htmlContentData)
  {
    objc_msgSend(v10, "setHtmlContentData:");
    v9 = v10;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v10, "setMailboxId:");
    v9 = v10;
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_messageId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 80) = self->_mainAlternativeValid;
    *(_BYTE *)(v6 + 84) |= 2u;
  }
  v11 = -[NSData copyWithZone:](self->_text, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v11;

  v13 = -[NSData copyWithZone:](self->_preview, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 81) = self->_partiallyLoaded;
    *(_BYTE *)(v6 + 84) |= 4u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = self->_attachments;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v19), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v6, "addAttachment:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  v21 = -[NNMKProtoMessage copyWithZone:](self->_notificationMessage, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v21;

  v23 = -[NSData copyWithZone:](self->_htmlContentData, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v23;

  v25 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dateSynced;
  NSString *messageId;
  NSData *text;
  NSData *preview;
  NSMutableArray *attachments;
  NNMKProtoMessage *notificationMessage;
  NSData *htmlContentData;
  NSString *mailboxId;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_39;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](dateSynced, "isEqual:"))
    goto LABEL_39;
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0)
      goto LABEL_39;
    if (self->_mainAlternativeValid)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_39;
  }
  text = self->_text;
  if ((unint64_t)text | *((_QWORD *)v4 + 9) && !-[NSData isEqual:](text, "isEqual:"))
    goto LABEL_39;
  preview = self->_preview;
  if ((unint64_t)preview | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](preview, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) != 0)
    {
      if (self->_partiallyLoaded)
      {
        if (!*((_BYTE *)v4 + 81))
          goto LABEL_39;
        goto LABEL_31;
      }
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_31;
    }
LABEL_39:
    v13 = 0;
    goto LABEL_40;
  }
  if ((*((_BYTE *)v4 + 84) & 4) != 0)
    goto LABEL_39;
LABEL_31:
  attachments = self->_attachments;
  if ((unint64_t)attachments | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](attachments, "isEqual:"))
  {
    goto LABEL_39;
  }
  notificationMessage = self->_notificationMessage;
  if ((unint64_t)notificationMessage | *((_QWORD *)v4 + 7))
  {
    if (!-[NNMKProtoMessage isEqual:](notificationMessage, "isEqual:"))
      goto LABEL_39;
  }
  htmlContentData = self->_htmlContentData;
  if ((unint64_t)htmlContentData | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](htmlContentData, "isEqual:"))
      goto LABEL_39;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 5))
    v13 = -[NSString isEqual:](mailboxId, "isEqual:");
  else
    v13 = 1;
LABEL_40:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_dateSynced, "hash");
  v5 = -[NSString hash](self->_messageId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_mainAlternativeValid;
  else
    v6 = 0;
  v7 = -[NSData hash](self->_text, "hash");
  v8 = -[NSData hash](self->_preview, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v9 = 2654435761 * self->_partiallyLoaded;
  else
    v9 = 0;
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = -[NSMutableArray hash](self->_attachments, "hash");
  v12 = v11 ^ -[NNMKProtoMessage hash](self->_notificationMessage, "hash");
  v13 = v12 ^ -[NSData hash](self->_htmlContentData, "hash");
  return v10 ^ v13 ^ -[NSString hash](self->_mailboxId, "hash");
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
  NNMKProtoMessage *notificationMessage;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[21] & 1) != 0)
  {
    self->_fullSyncVersion = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NNMKProtoMessageContentSync setDateSynced:](self, "setDateSynced:");
  if (*((_QWORD *)v5 + 6))
    -[NNMKProtoMessageContentSync setMessageId:](self, "setMessageId:");
  if ((*((_BYTE *)v5 + 84) & 2) != 0)
  {
    self->_mainAlternativeValid = *((_BYTE *)v5 + 80);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 9))
    -[NNMKProtoMessageContentSync setText:](self, "setText:");
  if (*((_QWORD *)v5 + 8))
    -[NNMKProtoMessageContentSync setPreview:](self, "setPreview:");
  if ((*((_BYTE *)v5 + 84) & 4) != 0)
  {
    self->_partiallyLoaded = *((_BYTE *)v5 + 81);
    *(_BYTE *)&self->_has |= 4u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *((id *)v5 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NNMKProtoMessageContentSync addAttachment:](self, "addAttachment:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  notificationMessage = self->_notificationMessage;
  v12 = *((_QWORD *)v5 + 7);
  if (notificationMessage)
  {
    if (v12)
      -[NNMKProtoMessage mergeFrom:](notificationMessage, "mergeFrom:");
  }
  else if (v12)
  {
    -[NNMKProtoMessageContentSync setNotificationMessage:](self, "setNotificationMessage:");
  }
  if (*((_QWORD *)v5 + 4))
    -[NNMKProtoMessageContentSync setHtmlContentData:](self, "setHtmlContentData:");
  if (*((_QWORD *)v5 + 5))
    -[NNMKProtoMessageContentSync setMailboxId:](self, "setMailboxId:");

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

- (BOOL)mainAlternativeValid
{
  return self->_mainAlternativeValid;
}

- (NSData)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSData)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (BOOL)partiallyLoaded
{
  return self->_partiallyLoaded;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NNMKProtoMessage)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_notificationMessage, a3);
}

- (NSData)htmlContentData
{
  return self->_htmlContentData;
}

- (void)setHtmlContentData:(id)a3
{
  objc_storeStrong((id *)&self->_htmlContentData, a3);
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
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
