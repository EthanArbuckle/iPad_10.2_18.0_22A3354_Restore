@implementation NNMKProtoAccountAdditionOrUpdate

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setShouldArchive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldArchive = a3;
}

- (void)setHasShouldArchive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldArchive
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearEmails
{
  -[NSMutableArray removeAllObjects](self->_emails, "removeAllObjects");
}

- (void)addEmail:(id)a3
{
  id v4;
  NSMutableArray *emails;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  emails = self->_emails;
  v8 = v4;
  if (!emails)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_emails;
    self->_emails = v6;

    v4 = v8;
    emails = self->_emails;
  }
  -[NSMutableArray addObject:](emails, "addObject:", v4);

}

- (unint64_t)emailsCount
{
  return -[NSMutableArray count](self->_emails, "count");
}

- (id)emailAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_emails, "objectAtIndex:", a3);
}

+ (Class)emailType
{
  return (Class)objc_opt_class();
}

- (void)clearMailboxes
{
  -[NSMutableArray removeAllObjects](self->_mailboxes, "removeAllObjects");
}

- (void)addMailboxes:(id)a3
{
  id v4;
  NSMutableArray *mailboxes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mailboxes = self->_mailboxes;
  v8 = v4;
  if (!mailboxes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_mailboxes;
    self->_mailboxes = v6;

    v4 = v8;
    mailboxes = self->_mailboxes;
  }
  -[NSMutableArray addObject:](mailboxes, "addObject:", v4);

}

- (unint64_t)mailboxesCount
{
  return -[NSMutableArray count](self->_mailboxes, "count");
}

- (id)mailboxesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mailboxes, "objectAtIndex:", a3);
}

+ (Class)mailboxesType
{
  return (Class)objc_opt_class();
}

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

- (BOOL)hasDefaultEmail
{
  return self->_defaultEmail != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasLocalId
{
  return self->_localId != 0;
}

- (BOOL)hasParentId
{
  return self->_parentId != 0;
}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

- (BOOL)hasEmailAddressToken
{
  return self->_emailAddressToken != 0;
}

- (BOOL)hasPccEmailAddress
{
  return self->_pccEmailAddress != 0;
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
  v8.super_class = (Class)NNMKProtoAccountAdditionOrUpdate;
  -[NNMKProtoAccountAdditionOrUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoAccountAdditionOrUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *displayName;
  void *v7;
  NSMutableArray *emails;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSString *defaultEmail;
  NSString *username;
  NSString *localId;
  NSString *parentId;
  NSString *typeIdentifier;
  NSString *emailAddressToken;
  NSString *pccEmailAddress;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountId = self->_accountId;
  if (accountId)
    objc_msgSend(v3, "setObject:forKey:", accountId, CFSTR("accountId"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldArchive);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("shouldArchive"));

  }
  emails = self->_emails;
  if (emails)
    objc_msgSend(v4, "setObject:forKey:", emails, CFSTR("email"));
  if (-[NSMutableArray count](self->_mailboxes, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_mailboxes, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = self->_mailboxes;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("mailboxes"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("fullSyncVersion"));

  }
  defaultEmail = self->_defaultEmail;
  if (defaultEmail)
    objc_msgSend(v4, "setObject:forKey:", defaultEmail, CFSTR("defaultEmail"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("username"));
  localId = self->_localId;
  if (localId)
    objc_msgSend(v4, "setObject:forKey:", localId, CFSTR("localId"));
  parentId = self->_parentId;
  if (parentId)
    objc_msgSend(v4, "setObject:forKey:", parentId, CFSTR("parentId"));
  typeIdentifier = self->_typeIdentifier;
  if (typeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", typeIdentifier, CFSTR("typeIdentifier"));
  emailAddressToken = self->_emailAddressToken;
  if (emailAddressToken)
    objc_msgSend(v4, "setObject:forKey:", emailAddressToken, CFSTR("emailAddressToken"));
  pccEmailAddress = self->_pccEmailAddress;
  if (pccEmailAddress)
    objc_msgSend(v4, "setObject:forKey:", pccEmailAddress, CFSTR("pccEmailAddress"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAccountAdditionOrUpdateReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_accountId)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_emails;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_mailboxes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_defaultEmail)
    PBDataWriterWriteStringField();
  if (self->_username)
    PBDataWriterWriteStringField();
  if (self->_localId)
    PBDataWriterWriteStringField();
  if (self->_parentId)
    PBDataWriterWriteStringField();
  if (self->_typeIdentifier)
    PBDataWriterWriteStringField();
  if (self->_emailAddressToken)
    PBDataWriterWriteStringField();
  if (self->_pccEmailAddress)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  _BYTE *v14;

  v4 = a3;
  v14 = v4;
  if (self->_accountId)
  {
    objc_msgSend(v4, "setAccountId:");
    v4 = v14;
  }
  if (self->_displayName)
  {
    objc_msgSend(v14, "setDisplayName:");
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[104] = self->_shouldArchive;
    v4[108] |= 2u;
  }
  if (-[NNMKProtoAccountAdditionOrUpdate emailsCount](self, "emailsCount"))
  {
    objc_msgSend(v14, "clearEmails");
    v5 = -[NNMKProtoAccountAdditionOrUpdate emailsCount](self, "emailsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoAccountAdditionOrUpdate emailAtIndex:](self, "emailAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addEmail:", v8);

      }
    }
  }
  if (-[NNMKProtoAccountAdditionOrUpdate mailboxesCount](self, "mailboxesCount"))
  {
    objc_msgSend(v14, "clearMailboxes");
    v9 = -[NNMKProtoAccountAdditionOrUpdate mailboxesCount](self, "mailboxesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[NNMKProtoAccountAdditionOrUpdate mailboxesAtIndex:](self, "mailboxesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addMailboxes:", v12);

      }
    }
  }
  v13 = v14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v14 + 12) = self->_fullSyncVersion;
    v14[108] |= 1u;
  }
  if (self->_defaultEmail)
  {
    objc_msgSend(v14, "setDefaultEmail:");
    v13 = v14;
  }
  if (self->_username)
  {
    objc_msgSend(v14, "setUsername:");
    v13 = v14;
  }
  if (self->_localId)
  {
    objc_msgSend(v14, "setLocalId:");
    v13 = v14;
  }
  if (self->_parentId)
  {
    objc_msgSend(v14, "setParentId:");
    v13 = v14;
  }
  if (self->_typeIdentifier)
  {
    objc_msgSend(v14, "setTypeIdentifier:");
    v13 = v14;
  }
  if (self->_emailAddressToken)
  {
    objc_msgSend(v14, "setEmailAddressToken:");
    v13 = v14;
  }
  if (self->_pccEmailAddress)
  {
    objc_msgSend(v14, "setPccEmailAddress:");
    v13 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 104) = self->_shouldArchive;
    *(_BYTE *)(v5 + 108) |= 2u;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = self->_emails;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEmail:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v12);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = self->_mailboxes;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v37);
        objc_msgSend((id)v5, "addMailboxes:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 108) |= 1u;
  }
  v22 = -[NSString copyWithZone:](self->_defaultEmail, "copyWithZone:", a3, (_QWORD)v37);
  v23 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;

  v24 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v24;

  v26 = -[NSString copyWithZone:](self->_localId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v26;

  v28 = -[NSString copyWithZone:](self->_parentId, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v28;

  v30 = -[NSString copyWithZone:](self->_typeIdentifier, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v30;

  v32 = -[NSString copyWithZone:](self->_emailAddressToken, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v32;

  v34 = -[NSString copyWithZone:](self->_pccEmailAddress, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v34;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accountId;
  NSString *displayName;
  NSMutableArray *emails;
  NSMutableArray *mailboxes;
  NSString *defaultEmail;
  NSString *username;
  NSString *localId;
  NSString *parentId;
  NSString *typeIdentifier;
  NSString *emailAddressToken;
  NSString *pccEmailAddress;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:"))
      goto LABEL_37;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) != 0)
    {
      if (self->_shouldArchive)
      {
        if (!*((_BYTE *)v4 + 104))
          goto LABEL_37;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_14;
    }
LABEL_37:
    v16 = 0;
    goto LABEL_38;
  }
  if ((*((_BYTE *)v4 + 108) & 2) != 0)
    goto LABEL_37;
LABEL_14:
  emails = self->_emails;
  if ((unint64_t)emails | *((_QWORD *)v4 + 5) && !-[NSMutableArray isEqual:](emails, "isEqual:"))
    goto LABEL_37;
  mailboxes = self->_mailboxes;
  if ((unint64_t)mailboxes | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](mailboxes, "isEqual:"))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 12))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_37;
  }
  defaultEmail = self->_defaultEmail;
  if ((unint64_t)defaultEmail | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](defaultEmail, "isEqual:"))
  {
    goto LABEL_37;
  }
  username = self->_username;
  if ((unint64_t)username | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](username, "isEqual:"))
      goto LABEL_37;
  }
  localId = self->_localId;
  if ((unint64_t)localId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](localId, "isEqual:"))
      goto LABEL_37;
  }
  parentId = self->_parentId;
  if ((unint64_t)parentId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](parentId, "isEqual:"))
      goto LABEL_37;
  }
  typeIdentifier = self->_typeIdentifier;
  if ((unint64_t)typeIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](typeIdentifier, "isEqual:"))
      goto LABEL_37;
  }
  emailAddressToken = self->_emailAddressToken;
  if ((unint64_t)emailAddressToken | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](emailAddressToken, "isEqual:"))
      goto LABEL_37;
  }
  pccEmailAddress = self->_pccEmailAddress;
  if ((unint64_t)pccEmailAddress | *((_QWORD *)v4 + 10))
    v16 = -[NSString isEqual:](pccEmailAddress, "isEqual:");
  else
    v16 = 1;
LABEL_38:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;

  v3 = -[NSString hash](self->_accountId, "hash");
  v4 = -[NSString hash](self->_displayName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_shouldArchive;
  else
    v5 = 0;
  v6 = -[NSMutableArray hash](self->_emails, "hash");
  v7 = -[NSMutableArray hash](self->_mailboxes, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_fullSyncVersion;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_defaultEmail, "hash");
  v10 = -[NSString hash](self->_username, "hash");
  v11 = v10 ^ -[NSString hash](self->_localId, "hash");
  v12 = v11 ^ -[NSString hash](self->_parentId, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_typeIdentifier, "hash");
  v14 = -[NSString hash](self->_emailAddressToken, "hash");
  return v13 ^ v14 ^ -[NSString hash](self->_pccEmailAddress, "hash");
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[NNMKProtoAccountAdditionOrUpdate setAccountId:](self, "setAccountId:");
  if (*((_QWORD *)v4 + 3))
    -[NNMKProtoAccountAdditionOrUpdate setDisplayName:](self, "setDisplayName:");
  if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    self->_shouldArchive = *((_BYTE *)v4 + 104);
    *(_BYTE *)&self->_has |= 2u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NNMKProtoAccountAdditionOrUpdate addEmail:](self, "addEmail:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 8);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NNMKProtoAccountAdditionOrUpdate addMailboxes:](self, "addMailboxes:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NNMKProtoAccountAdditionOrUpdate setDefaultEmail:](self, "setDefaultEmail:");
  if (*((_QWORD *)v4 + 12))
    -[NNMKProtoAccountAdditionOrUpdate setUsername:](self, "setUsername:");
  if (*((_QWORD *)v4 + 7))
    -[NNMKProtoAccountAdditionOrUpdate setLocalId:](self, "setLocalId:");
  if (*((_QWORD *)v4 + 9))
    -[NNMKProtoAccountAdditionOrUpdate setParentId:](self, "setParentId:");
  if (*((_QWORD *)v4 + 11))
    -[NNMKProtoAccountAdditionOrUpdate setTypeIdentifier:](self, "setTypeIdentifier:");
  if (*((_QWORD *)v4 + 4))
    -[NNMKProtoAccountAdditionOrUpdate setEmailAddressToken:](self, "setEmailAddressToken:");
  if (*((_QWORD *)v4 + 10))
    -[NNMKProtoAccountAdditionOrUpdate setPccEmailAddress:](self, "setPccEmailAddress:");

}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)shouldArchive
{
  return self->_shouldArchive;
}

- (NSMutableArray)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
  objc_storeStrong((id *)&self->_emails, a3);
}

- (NSMutableArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxes, a3);
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSString)defaultEmail
{
  return self->_defaultEmail;
}

- (void)setDefaultEmail:(id)a3
{
  objc_storeStrong((id *)&self->_defaultEmail, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)localId
{
  return self->_localId;
}

- (void)setLocalId:(id)a3
{
  objc_storeStrong((id *)&self->_localId, a3);
}

- (NSString)parentId
{
  return self->_parentId;
}

- (void)setParentId:(id)a3
{
  objc_storeStrong((id *)&self->_parentId, a3);
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_typeIdentifier, a3);
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (void)setEmailAddressToken:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddressToken, a3);
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (void)setPccEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_pccEmailAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_localId, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_defaultEmail, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end
