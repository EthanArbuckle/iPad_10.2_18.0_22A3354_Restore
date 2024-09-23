@implementation NNMKProtoMessage

- (BOOL)hasMessageId
{
  return self->_messageId != 0;
}

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (void)setStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasFrom
{
  return self->_from != 0;
}

- (void)clearTos
{
  -[NSMutableArray removeAllObjects](self->_tos, "removeAllObjects");
}

- (void)addTo:(id)a3
{
  id v4;
  NSMutableArray *tos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tos = self->_tos;
  v8 = v4;
  if (!tos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_tos;
    self->_tos = v6;

    v4 = v8;
    tos = self->_tos;
  }
  -[NSMutableArray addObject:](tos, "addObject:", v4);

}

- (unint64_t)tosCount
{
  return -[NSMutableArray count](self->_tos, "count");
}

- (id)toAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tos, "objectAtIndex:", a3);
}

+ (Class)toType
{
  return (Class)objc_opt_class();
}

- (void)clearCcs
{
  -[NSMutableArray removeAllObjects](self->_ccs, "removeAllObjects");
}

- (void)addCc:(id)a3
{
  id v4;
  NSMutableArray *ccs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ccs = self->_ccs;
  v8 = v4;
  if (!ccs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_ccs;
    self->_ccs = v6;

    v4 = v8;
    ccs = self->_ccs;
  }
  -[NSMutableArray addObject:](ccs, "addObject:", v4);

}

- (unint64_t)ccsCount
{
  return -[NSMutableArray count](self->_ccs, "count");
}

- (id)ccAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ccs, "objectAtIndex:", a3);
}

+ (Class)ccType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateSent
{
  return self->_dateSent != 0;
}

- (BOOL)hasDateReceived
{
  return self->_dateReceived != 0;
}

- (BOOL)hasMessageIdHeader
{
  return self->_messageIdHeader != 0;
}

- (void)clearBccs
{
  -[NSMutableArray removeAllObjects](self->_bccs, "removeAllObjects");
}

- (void)addBcc:(id)a3
{
  id v4;
  NSMutableArray *bccs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bccs = self->_bccs;
  v8 = v4;
  if (!bccs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_bccs;
    self->_bccs = v6;

    v4 = v8;
    bccs = self->_bccs;
  }
  -[NSMutableArray addObject:](bccs, "addObject:", v4);

}

- (unint64_t)bccsCount
{
  return -[NSMutableArray count](self->_bccs, "count");
}

- (id)bccAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bccs, "objectAtIndex:", a3);
}

+ (Class)bccType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRemoteId
{
  return self->_remoteId != 0;
}

- (BOOL)hasNotificationMessageId
{
  return self->_notificationMessageId != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (void)setIsThreadSpecific:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isThreadSpecific = a3;
}

- (void)setHasIsThreadSpecific:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsThreadSpecific
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsSpecialMailboxSpecific:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSpecialMailboxSpecific = a3;
}

- (void)setHasIsSpecialMailboxSpecific:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSpecialMailboxSpecific
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPublisherBulletinId
{
  return self->_publisherBulletinId != 0;
}

- (void)setStatusVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_statusVersion = a3;
}

- (void)setHasStatusVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatusVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NNMKProtoMessage;
  -[NNMKProtoMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *messageId;
  NSString *accountId;
  NSString *conversationId;
  NSString *subject;
  void *v9;
  NSString *from;
  NSMutableArray *tos;
  NSMutableArray *ccs;
  NSData *dateSent;
  NSData *dateReceived;
  NSString *messageIdHeader;
  NSMutableArray *bccs;
  NSString *remoteId;
  NSString *notificationMessageId;
  NSString *mailboxId;
  char has;
  void *v21;
  void *v22;
  NSString *publisherBulletinId;
  void *v24;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  messageId = self->_messageId;
  if (messageId)
    objc_msgSend(v3, "setObject:forKey:", messageId, CFSTR("messageId"));
  accountId = self->_accountId;
  if (accountId)
    objc_msgSend(v4, "setObject:forKey:", accountId, CFSTR("accountId"));
  conversationId = self->_conversationId;
  if (conversationId)
    objc_msgSend(v4, "setObject:forKey:", conversationId, CFSTR("conversationId"));
  subject = self->_subject;
  if (subject)
    objc_msgSend(v4, "setObject:forKey:", subject, CFSTR("subject"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_status);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("status"));

  }
  from = self->_from;
  if (from)
    objc_msgSend(v4, "setObject:forKey:", from, CFSTR("from"));
  tos = self->_tos;
  if (tos)
    objc_msgSend(v4, "setObject:forKey:", tos, CFSTR("to"));
  ccs = self->_ccs;
  if (ccs)
    objc_msgSend(v4, "setObject:forKey:", ccs, CFSTR("cc"));
  dateSent = self->_dateSent;
  if (dateSent)
    objc_msgSend(v4, "setObject:forKey:", dateSent, CFSTR("dateSent"));
  dateReceived = self->_dateReceived;
  if (dateReceived)
    objc_msgSend(v4, "setObject:forKey:", dateReceived, CFSTR("dateReceived"));
  messageIdHeader = self->_messageIdHeader;
  if (messageIdHeader)
    objc_msgSend(v4, "setObject:forKey:", messageIdHeader, CFSTR("messageIdHeader"));
  bccs = self->_bccs;
  if (bccs)
    objc_msgSend(v4, "setObject:forKey:", bccs, CFSTR("bcc"));
  remoteId = self->_remoteId;
  if (remoteId)
    objc_msgSend(v4, "setObject:forKey:", remoteId, CFSTR("remoteId"));
  notificationMessageId = self->_notificationMessageId;
  if (notificationMessageId)
    objc_msgSend(v4, "setObject:forKey:", notificationMessageId, CFSTR("notificationMessageId"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v4, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isThreadSpecific);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("isThreadSpecific"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isSpecialMailboxSpecific);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("isSpecialMailboxSpecific"));

  }
  publisherBulletinId = self->_publisherBulletinId;
  if (publisherBulletinId)
    objc_msgSend(v4, "setObject:forKey:", publisherBulletinId, CFSTR("publisherBulletinId"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_statusVersion);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("statusVersion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char has;
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
  if (self->_messageId)
    PBDataWriterWriteStringField();
  if (self->_accountId)
    PBDataWriterWriteStringField();
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  if (self->_subject)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_from)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_tos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_ccs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  if (self->_dateSent)
    PBDataWriterWriteDataField();
  if (self->_dateReceived)
    PBDataWriterWriteDataField();
  if (self->_messageIdHeader)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = self->_bccs;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  if (self->_remoteId)
    PBDataWriterWriteStringField();
  if (self->_notificationMessageId)
    PBDataWriterWriteStringField();
  if (self->_mailboxId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_publisherBulletinId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  id v4;
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
  char has;
  id v19;

  v4 = a3;
  v19 = v4;
  if (self->_messageId)
  {
    objc_msgSend(v4, "setMessageId:");
    v4 = v19;
  }
  if (self->_accountId)
  {
    objc_msgSend(v19, "setAccountId:");
    v4 = v19;
  }
  if (self->_conversationId)
  {
    objc_msgSend(v19, "setConversationId:");
    v4 = v19;
  }
  if (self->_subject)
  {
    objc_msgSend(v19, "setSubject:");
    v4 = v19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_status;
    *((_BYTE *)v4 + 148) |= 2u;
  }
  if (self->_from)
    objc_msgSend(v19, "setFrom:");
  if (-[NNMKProtoMessage tosCount](self, "tosCount"))
  {
    objc_msgSend(v19, "clearTos");
    v5 = -[NNMKProtoMessage tosCount](self, "tosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoMessage toAtIndex:](self, "toAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addTo:", v8);

      }
    }
  }
  if (-[NNMKProtoMessage ccsCount](self, "ccsCount"))
  {
    objc_msgSend(v19, "clearCcs");
    v9 = -[NNMKProtoMessage ccsCount](self, "ccsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[NNMKProtoMessage ccAtIndex:](self, "ccAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addCc:", v12);

      }
    }
  }
  if (self->_dateSent)
    objc_msgSend(v19, "setDateSent:");
  if (self->_dateReceived)
    objc_msgSend(v19, "setDateReceived:");
  if (self->_messageIdHeader)
    objc_msgSend(v19, "setMessageIdHeader:");
  if (-[NNMKProtoMessage bccsCount](self, "bccsCount"))
  {
    objc_msgSend(v19, "clearBccs");
    v13 = -[NNMKProtoMessage bccsCount](self, "bccsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[NNMKProtoMessage bccAtIndex:](self, "bccAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addBcc:", v16);

      }
    }
  }
  if (self->_remoteId)
    objc_msgSend(v19, "setRemoteId:");
  v17 = v19;
  if (self->_notificationMessageId)
  {
    objc_msgSend(v19, "setNotificationMessageId:");
    v17 = v19;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v19, "setMailboxId:");
    v17 = v19;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v17[144] = self->_isThreadSpecific;
    v17[148] |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v17 + 16) = self->_isSpecialMailboxSpecific;
    v17[148] |= 1u;
  }
  if (self->_publisherBulletinId)
  {
    objc_msgSend(v19, "setPublisherBulletinId:");
    v17 = v19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v17 + 31) = self->_statusVersion;
    v17[148] |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char has;
  uint64_t v47;
  void *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_messageId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSString copyWithZone:](self->_accountId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_conversationId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_subject, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_status;
    *(_BYTE *)(v5 + 148) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_from, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v16 = self->_tos;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v59 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTo:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v18);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = self->_ccs;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCc:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v24);
  }

  v28 = -[NSData copyWithZone:](self->_dateSent, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v28;

  v30 = -[NSData copyWithZone:](self->_dateReceived, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v30;

  v32 = -[NSString copyWithZone:](self->_messageIdHeader, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v32;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v34 = self->_bccs;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v51 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v50);
        objc_msgSend((id)v5, "addBcc:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v36);
  }

  v40 = -[NSString copyWithZone:](self->_remoteId, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v40;

  v42 = -[NSString copyWithZone:](self->_notificationMessageId, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v42;

  v44 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v44;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 144) = self->_isThreadSpecific;
    *(_BYTE *)(v5 + 148) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_isSpecialMailboxSpecific;
    *(_BYTE *)(v5 + 148) |= 1u;
  }
  v47 = -[NSString copyWithZone:](self->_publisherBulletinId, "copyWithZone:", a3, (_QWORD)v50);
  v48 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v47;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_statusVersion;
    *(_BYTE *)(v5 + 148) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *messageId;
  NSString *accountId;
  NSString *conversationId;
  NSString *subject;
  NSString *from;
  NSMutableArray *tos;
  NSMutableArray *ccs;
  NSData *dateSent;
  NSData *dateReceived;
  NSString *messageIdHeader;
  NSMutableArray *bccs;
  NSString *remoteId;
  NSString *notificationMessageId;
  NSString *mailboxId;
  char has;
  NSString *publisherBulletinId;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:"))
      goto LABEL_55;
  }
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:"))
      goto LABEL_55;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:"))
      goto LABEL_55;
  }
  subject = self->_subject;
  if ((unint64_t)subject | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](subject, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 2) == 0 || self->_status != *((_DWORD *)v4 + 30))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 148) & 2) != 0)
  {
    goto LABEL_55;
  }
  from = self->_from;
  if ((unint64_t)from | *((_QWORD *)v4 + 7) && !-[NSString isEqual:](from, "isEqual:"))
    goto LABEL_55;
  tos = self->_tos;
  if ((unint64_t)tos | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](tos, "isEqual:"))
      goto LABEL_55;
  }
  ccs = self->_ccs;
  if ((unint64_t)ccs | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](ccs, "isEqual:"))
      goto LABEL_55;
  }
  dateSent = self->_dateSent;
  if ((unint64_t)dateSent | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](dateSent, "isEqual:"))
      goto LABEL_55;
  }
  dateReceived = self->_dateReceived;
  if ((unint64_t)dateReceived | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](dateReceived, "isEqual:"))
      goto LABEL_55;
  }
  messageIdHeader = self->_messageIdHeader;
  if ((unint64_t)messageIdHeader | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](messageIdHeader, "isEqual:"))
      goto LABEL_55;
  }
  bccs = self->_bccs;
  if ((unint64_t)bccs | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](bccs, "isEqual:"))
      goto LABEL_55;
  }
  remoteId = self->_remoteId;
  if ((unint64_t)remoteId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](remoteId, "isEqual:"))
      goto LABEL_55;
  }
  notificationMessageId = self->_notificationMessageId;
  if ((unint64_t)notificationMessageId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](notificationMessageId, "isEqual:"))
      goto LABEL_55;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:"))
      goto LABEL_55;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 8) == 0)
      goto LABEL_55;
    if (self->_isThreadSpecific)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_55;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_55;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 1) == 0 || self->_isSpecialMailboxSpecific != *((_DWORD *)v4 + 16))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    goto LABEL_55;
  }
  publisherBulletinId = self->_publisherBulletinId;
  if ((unint64_t)publisherBulletinId | *((_QWORD *)v4 + 13))
  {
    if (-[NSString isEqual:](publisherBulletinId, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_51;
    }
LABEL_55:
    v21 = 0;
    goto LABEL_56;
  }
LABEL_51:
  v21 = (*((_BYTE *)v4 + 148) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 4) == 0 || self->_statusVersion != *((_DWORD *)v4 + 31))
      goto LABEL_55;
    v21 = 1;
  }
LABEL_56:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;

  v22 = -[NSString hash](self->_messageId, "hash");
  v21 = -[NSString hash](self->_accountId, "hash");
  v20 = -[NSString hash](self->_conversationId, "hash");
  v19 = -[NSString hash](self->_subject, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v18 = 2654435761 * self->_status;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_from, "hash");
  v16 = -[NSMutableArray hash](self->_tos, "hash");
  v15 = -[NSMutableArray hash](self->_ccs, "hash");
  v14 = -[NSData hash](self->_dateSent, "hash");
  v13 = -[NSData hash](self->_dateReceived, "hash");
  v3 = -[NSString hash](self->_messageIdHeader, "hash");
  v4 = -[NSMutableArray hash](self->_bccs, "hash");
  v5 = -[NSString hash](self->_remoteId, "hash");
  v6 = -[NSString hash](self->_notificationMessageId, "hash");
  v7 = -[NSString hash](self->_mailboxId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v8 = 2654435761 * self->_isThreadSpecific;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_6:
      v9 = 2654435761 * self->_isSpecialMailboxSpecific;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = -[NSString hash](self->_publisherBulletinId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_statusVersion;
  else
    v11 = 0;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char v20;
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
  if (*((_QWORD *)v4 + 10))
    -[NNMKProtoMessage setMessageId:](self, "setMessageId:");
  if (*((_QWORD *)v4 + 1))
    -[NNMKProtoMessage setAccountId:](self, "setAccountId:");
  if (*((_QWORD *)v4 + 4))
    -[NNMKProtoMessage setConversationId:](self, "setConversationId:");
  if (*((_QWORD *)v4 + 16))
    -[NNMKProtoMessage setSubject:](self, "setSubject:");
  if ((*((_BYTE *)v4 + 148) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
    -[NNMKProtoMessage setFrom:](self, "setFrom:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = *((id *)v4 + 17);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[NNMKProtoMessage addTo:](self, "addTo:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        -[NNMKProtoMessage addCc:](self, "addCc:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 6))
    -[NNMKProtoMessage setDateSent:](self, "setDateSent:");
  if (*((_QWORD *)v4 + 5))
    -[NNMKProtoMessage setDateReceived:](self, "setDateReceived:");
  if (*((_QWORD *)v4 + 11))
    -[NNMKProtoMessage setMessageIdHeader:](self, "setMessageIdHeader:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = *((id *)v4 + 2);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[NNMKProtoMessage addBcc:](self, "addBcc:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v4 + 14))
    -[NNMKProtoMessage setRemoteId:](self, "setRemoteId:");
  if (*((_QWORD *)v4 + 12))
    -[NNMKProtoMessage setNotificationMessageId:](self, "setNotificationMessageId:");
  if (*((_QWORD *)v4 + 9))
    -[NNMKProtoMessage setMailboxId:](self, "setMailboxId:");
  v20 = *((_BYTE *)v4 + 148);
  if ((v20 & 8) != 0)
  {
    self->_isThreadSpecific = *((_BYTE *)v4 + 144);
    *(_BYTE *)&self->_has |= 8u;
    v20 = *((_BYTE *)v4 + 148);
  }
  if ((v20 & 1) != 0)
  {
    self->_isSpecialMailboxSpecific = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 13))
    -[NNMKProtoMessage setPublisherBulletinId:](self, "setPublisherBulletinId:");
  if ((*((_BYTE *)v4 + 148) & 4) != 0)
  {
    self->_statusVersion = *((_DWORD *)v4 + 31);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (unsigned)status
{
  return self->_status;
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (NSMutableArray)tos
{
  return self->_tos;
}

- (void)setTos:(id)a3
{
  objc_storeStrong((id *)&self->_tos, a3);
}

- (NSMutableArray)ccs
{
  return self->_ccs;
}

- (void)setCcs:(id)a3
{
  objc_storeStrong((id *)&self->_ccs, a3);
}

- (NSData)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_storeStrong((id *)&self->_dateSent, a3);
}

- (NSData)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
  objc_storeStrong((id *)&self->_dateReceived, a3);
}

- (NSString)messageIdHeader
{
  return self->_messageIdHeader;
}

- (void)setMessageIdHeader:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdHeader, a3);
}

- (NSMutableArray)bccs
{
  return self->_bccs;
}

- (void)setBccs:(id)a3
{
  objc_storeStrong((id *)&self->_bccs, a3);
}

- (NSString)remoteId
{
  return self->_remoteId;
}

- (void)setRemoteId:(id)a3
{
  objc_storeStrong((id *)&self->_remoteId, a3);
}

- (NSString)notificationMessageId
{
  return self->_notificationMessageId;
}

- (void)setNotificationMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationMessageId, a3);
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxId, a3);
}

- (BOOL)isThreadSpecific
{
  return self->_isThreadSpecific;
}

- (unsigned)isSpecialMailboxSpecific
{
  return self->_isSpecialMailboxSpecific;
}

- (NSString)publisherBulletinId
{
  return self->_publisherBulletinId;
}

- (void)setPublisherBulletinId:(id)a3
{
  objc_storeStrong((id *)&self->_publisherBulletinId, a3);
}

- (unsigned)statusVersion
{
  return self->_statusVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tos, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_remoteId, 0);
  objc_storeStrong((id *)&self->_publisherBulletinId, 0);
  objc_storeStrong((id *)&self->_notificationMessageId, 0);
  objc_storeStrong((id *)&self->_messageIdHeader, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_ccs, 0);
  objc_storeStrong((id *)&self->_bccs, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

+ (id)protoMessageFromMessage:(id)a3 organizedByThread:(BOOL)a4 sanitizeMessageId:(BOOL)a5 supportsStandaloneMode:(BOOL)a6
{
  _BOOL4 v7;
  id v9;
  NNMKProtoMessage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v7 = a5;
  v62 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = objc_alloc_init(NNMKProtoMessage);
  objc_msgSend(v9, "messageId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v11, "nnmk_sanitizedFileNameString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoMessage setMessageId:](v10, "setMessageId:", v13);

  }
  else
  {
    -[NNMKProtoMessage setMessageId:](v10, "setMessageId:", v11);
  }

  objc_msgSend(v9, "accountId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage setAccountId:](v10, "setAccountId:", v14);

  if (a4)
  {
    objc_msgSend(v9, "conversationId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoMessage setConversationId:](v10, "setConversationId:", v15);
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "conversationId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@|%@"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoMessage setConversationId:](v10, "setConversationId:", v18);

  }
  objc_msgSend(v9, "subject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage setSubject:](v10, "setSubject:", v19);

  -[NNMKProtoMessage setStatus:](v10, "setStatus:", objc_msgSend(v9, "status"));
  -[NNMKProtoMessage setStatusVersion:](v10, "setStatusVersion:", objc_msgSend(v9, "statusVersion"));
  objc_msgSend(v9, "from");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage setFrom:](v10, "setFrom:", v20);

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v9, "to");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v21);
        -[NNMKProtoMessage addTo:](v10, "addTo:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v23);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v9, "cc");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v52 != v29)
          objc_enumerationMutation(v26);
        -[NNMKProtoMessage addCc:](v10, "addCc:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v28);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v9, "bcc");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(v31);
        -[NNMKProtoMessage addBcc:](v10, "addBcc:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v33);
  }

  v36 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(v9, "dateSent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "archivedDataWithRootObject:requiringSecureCoding:error:", v37, 1, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage setDateSent:](v10, "setDateSent:", v38);

  v39 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(v9, "dateReceived");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "archivedDataWithRootObject:requiringSecureCoding:error:", v40, 1, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage setDateReceived:](v10, "setDateReceived:", v41);

  objc_msgSend(v9, "messageIdHeader");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage setMessageIdHeader:](v10, "setMessageIdHeader:", v42);

  objc_msgSend(v9, "mailboxId");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessage setMailboxId:](v10, "setMailboxId:", v43);

  -[NNMKProtoMessage setIsThreadSpecific:](v10, "setIsThreadSpecific:", objc_msgSend(v9, "isThreadSpecific"));
  -[NNMKProtoMessage setIsSpecialMailboxSpecific:](v10, "setIsSpecialMailboxSpecific:", objc_msgSend(v9, "isSpecialMailboxSpecific"));
  if (a6)
  {
    objc_msgSend(v9, "notificationMessageId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoMessage setNotificationMessageId:](v10, "setNotificationMessageId:", v44);

    objc_msgSend(v9, "publisherBulletinId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoMessage setPublisherBulletinId:](v10, "setPublisherBulletinId:", v45);
  }
  else
  {
    objc_msgSend(v9, "publisherBulletinId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoMessage setNotificationMessageId:](v10, "setNotificationMessageId:", v45);
  }

  return v10;
}

@end
