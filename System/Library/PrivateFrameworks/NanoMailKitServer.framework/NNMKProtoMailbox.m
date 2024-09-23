@implementation NNMKProtoMailbox

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (BOOL)hasCustomName
{
  return self->_customName != 0;
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

- (void)setSyncEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_syncEnabled = a3;
}

- (void)setHasSyncEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSyncRequested:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_syncRequested = a3;
}

- (void)setHasSyncRequested:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSyncRequested
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
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
  v8.super_class = (Class)NNMKProtoMailbox;
  -[NNMKProtoMailbox description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMailbox dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *accountId;
  NSString *mailboxId;
  NSString *customName;
  char has;
  void *v9;
  NSString *url;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountId = self->_accountId;
  if (accountId)
    objc_msgSend(v3, "setObject:forKey:", accountId, CFSTR("accountId"));
  mailboxId = self->_mailboxId;
  if (mailboxId)
    objc_msgSend(v4, "setObject:forKey:", mailboxId, CFSTR("mailboxId"));
  customName = self->_customName;
  if (customName)
    objc_msgSend(v4, "setObject:forKey:", customName, CFSTR("customName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_filterType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("filterType"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("syncEnabled"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_type);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("type"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncRequested);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("syncRequested"));

  }
LABEL_12:
  url = self->_url;
  if (url)
    objc_msgSend(v4, "setObject:forKey:", url, CFSTR("url"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMailboxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_accountId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_mailboxId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_customName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_12:
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_accountId)
  {
    objc_msgSend(v4, "setAccountId:");
    v4 = v6;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v6, "setMailboxId:");
    v4 = v6;
  }
  if (self->_customName)
  {
    objc_msgSend(v6, "setCustomName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_filterType;
    *((_BYTE *)v4 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 56) = self->_syncEnabled;
  *((_BYTE *)v4 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  *((_DWORD *)v4 + 10) = self->_type;
  *((_BYTE *)v4 + 60) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 57) = self->_syncRequested;
    *((_BYTE *)v4 + 60) |= 8u;
  }
LABEL_12:
  if (self->_url)
  {
    objc_msgSend(v6, "setUrl:");
    v4 = v6;
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
  char has;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_customName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_filterType;
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 40) = self->_type;
      *(_BYTE *)(v5 + 60) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 56) = self->_syncEnabled;
  *(_BYTE *)(v5 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 57) = self->_syncRequested;
    *(_BYTE *)(v5 + 60) |= 8u;
  }
LABEL_6:
  v13 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accountId;
  NSString *mailboxId;
  NSString *customName;
  char v8;
  NSString *url;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:"))
      goto LABEL_30;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:"))
      goto LABEL_30;
  }
  customName = self->_customName;
  if ((unint64_t)customName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](customName, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 6))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0)
      goto LABEL_30;
    if (self->_syncEnabled)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0)
      goto LABEL_36;
LABEL_30:
    v8 = 0;
    goto LABEL_31;
  }
  if ((*((_BYTE *)v4 + 60) & 8) == 0)
    goto LABEL_30;
  if (!self->_syncRequested)
  {
    if (!*((_BYTE *)v4 + 57))
      goto LABEL_36;
    goto LABEL_30;
  }
  if (!*((_BYTE *)v4 + 57))
    goto LABEL_30;
LABEL_36:
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 6))
    v8 = -[NSString isEqual:](url, "isEqual:");
  else
    v8 = 1;
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_accountId, "hash");
  v4 = -[NSString hash](self->_mailboxId, "hash");
  v5 = -[NSString hash](self->_customName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_filterType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_syncEnabled;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_url, "hash");
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v9 = 2654435761 * self->_syncRequested;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_url, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoMailbox setAccountId:](self, "setAccountId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NNMKProtoMailbox setMailboxId:](self, "setMailboxId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NNMKProtoMailbox setCustomName:](self, "setCustomName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 1) != 0)
  {
    self->_filterType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_syncEnabled = *((_BYTE *)v4 + 56);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  self->_type = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
LABEL_11:
    self->_syncRequested = *((_BYTE *)v4 + 57);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 6))
  {
    -[NNMKProtoMailbox setUrl:](self, "setUrl:");
    v4 = v6;
  }

}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxId, a3);
}

- (NSString)customName
{
  return self->_customName;
}

- (void)setCustomName:(id)a3
{
  objc_storeStrong((id *)&self->_customName, a3);
}

- (unsigned)filterType
{
  return self->_filterType;
}

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)syncRequested
{
  return self->_syncRequested;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

- (id)mailbox
{
  NNMKMailbox *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(NNMKMailbox);
  -[NNMKProtoMailbox accountId](self, "accountId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setAccountId:](v3, "setAccountId:", v4);

  -[NNMKProtoMailbox mailboxId](self, "mailboxId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setMailboxId:](v3, "setMailboxId:", v5);

  -[NNMKMailbox setType:](v3, "setType:", -[NNMKProtoMailbox type](self, "type"));
  -[NNMKMailbox setFilterType:](v3, "setFilterType:", -[NNMKProtoMailbox filterType](self, "filterType"));
  -[NNMKProtoMailbox customName](self, "customName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setCustomName:](v3, "setCustomName:", v6);

  -[NNMKMailbox setSyncEnabled:](v3, "setSyncEnabled:", -[NNMKProtoMailbox syncEnabled](self, "syncEnabled"));
  -[NNMKMailbox setSyncRequested:](v3, "setSyncRequested:", -[NNMKProtoMailbox syncRequested](self, "syncRequested"));
  v7 = (void *)MEMORY[0x24BDBCF48];
  -[NNMKProtoMailbox url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setUrl:](v3, "setUrl:", v9);

  return v3;
}

+ (id)protoMailboxFromMailbox:(id)a3
{
  id v3;
  NNMKProtoMailbox *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(NNMKProtoMailbox);
  objc_msgSend(v3, "accountId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMailbox setAccountId:](v4, "setAccountId:", v5);

  objc_msgSend(v3, "mailboxId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMailbox setMailboxId:](v4, "setMailboxId:", v6);

  -[NNMKProtoMailbox setType:](v4, "setType:", objc_msgSend(v3, "type"));
  -[NNMKProtoMailbox setFilterType:](v4, "setFilterType:", objc_msgSend(v3, "filterType"));
  objc_msgSend(v3, "customName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMailbox setCustomName:](v4, "setCustomName:", v7);

  -[NNMKProtoMailbox setSyncEnabled:](v4, "setSyncEnabled:", objc_msgSend(v3, "syncEnabled"));
  -[NNMKProtoMailbox setSyncRequested:](v4, "setSyncRequested:", objc_msgSend(v3, "syncRequested"));
  objc_msgSend(v3, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMailbox setUrl:](v4, "setUrl:", v9);

  return v4;
}

@end
