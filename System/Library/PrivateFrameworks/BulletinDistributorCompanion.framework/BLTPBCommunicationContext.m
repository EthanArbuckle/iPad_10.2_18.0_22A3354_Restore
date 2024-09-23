@implementation BLTPBCommunicationContext

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAssociatedObjectUriData
{
  return self->_associatedObjectUriData != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (void)clearRecipients
{
  -[NSMutableArray removeAllObjects](self->_recipients, "removeAllObjects");
}

- (void)addRecipients:(id)a3
{
  id v4;
  NSMutableArray *recipients;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recipients = self->_recipients;
  v8 = v4;
  if (!recipients)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_recipients;
    self->_recipients = v6;

    v4 = v8;
    recipients = self->_recipients;
  }
  -[NSMutableArray addObject:](recipients, "addObject:", v4);

}

- (unint64_t)recipientsCount
{
  return -[NSMutableArray count](self->_recipients, "count");
}

- (id)recipientsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recipients, "objectAtIndex:", a3);
}

+ (Class)recipientsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContentURLData
{
  return self->_contentURLData != 0;
}

- (void)setMentionsCurrentUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mentionsCurrentUser = a3;
}

- (void)setHasMentionsCurrentUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMentionsCurrentUser
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNotifyRecipientAnyway:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_notifyRecipientAnyway = a3;
}

- (void)setHasNotifyRecipientAnyway:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNotifyRecipientAnyway
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setReplyToCurrentUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_replyToCurrentUser = a3;
}

- (void)setHasReplyToCurrentUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReplyToCurrentUser
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRecipientCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_recipientCount = a3;
}

- (void)setHasRecipientCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecipientCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasImageName
{
  return self->_imageName != 0;
}

- (void)setSystemImage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_systemImage = a3;
}

- (void)setHasSystemImage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSystemImage
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCapability:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_capability = a3;
}

- (void)setHasCapability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCapability
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCapabilities:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
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
  v8.super_class = (Class)BLTPBCommunicationContext;
  -[BLTPBCommunicationContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBCommunicationContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *bundleIdentifier;
  NSString *associatedObjectUriData;
  NSString *displayName;
  BLTPBContact *sender;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSData *contentURLData;
  char has;
  void *v20;
  NSString *imageName;
  char v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  associatedObjectUriData = self->_associatedObjectUriData;
  if (associatedObjectUriData)
    objc_msgSend(v4, "setObject:forKey:", associatedObjectUriData, CFSTR("associatedObjectUriData"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  sender = self->_sender;
  if (sender)
  {
    -[BLTPBContact dictionaryRepresentation](sender, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("sender"));

  }
  if (-[NSMutableArray count](self->_recipients, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_recipients, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = self->_recipients;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v30);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("recipients"));
  }
  contentURLData = self->_contentURLData;
  if (contentURLData)
    objc_msgSend(v4, "setObject:forKey:", contentURLData, CFSTR("contentURLData"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_mentionsCurrentUser);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("mentionsCurrentUser"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_24:
      if ((has & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_notifyRecipientAnyway, (_QWORD)v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("notifyRecipientAnyway"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_25:
    if ((has & 4) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_replyToCurrentUser, (_QWORD)v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("replyToCurrentUser"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_recipientCount, (_QWORD)v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("recipientCount"));

  }
LABEL_27:
  imageName = self->_imageName;
  if (imageName)
    objc_msgSend(v4, "setObject:forKey:", imageName, CFSTR("imageName"));
  v22 = (char)self->_has;
  if ((v22 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_31;
LABEL_39:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_capability, (_QWORD)v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("capability"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v4;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_systemImage);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("systemImage"));

  v22 = (char)self->_has;
  if ((v22 & 2) != 0)
    goto LABEL_39;
LABEL_31:
  if ((v22 & 1) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_capabilities, (_QWORD)v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("capabilities"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBCommunicationContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (!self->_bundleIdentifier)
    -[BLTPBCommunicationContext writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (self->_associatedObjectUriData)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_sender)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_recipients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (self->_contentURLData)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_21:
      if ((has & 0x20) == 0)
        goto LABEL_22;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 4) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_23:
    PBDataWriterWriteInt32Field();
LABEL_24:
  if (self->_imageName)
    PBDataWriterWriteStringField();
  v11 = (char)self->_has;
  if ((v11 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_28;
LABEL_36:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  v11 = (char)self->_has;
  if ((v11 & 2) != 0)
    goto LABEL_36;
LABEL_28:
  if ((v11 & 1) != 0)
LABEL_29:
    PBDataWriterWriteInt32Field();
LABEL_30:

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  _DWORD *v10;
  char v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v12;
  }
  objc_msgSend(v4, "setBundleIdentifier:", self->_bundleIdentifier);
  if (self->_associatedObjectUriData)
    objc_msgSend(v12, "setAssociatedObjectUriData:");
  if (self->_displayName)
    objc_msgSend(v12, "setDisplayName:");
  if (self->_sender)
    objc_msgSend(v12, "setSender:");
  if (-[BLTPBCommunicationContext recipientsCount](self, "recipientsCount"))
  {
    objc_msgSend(v12, "clearRecipients");
    v5 = -[BLTPBCommunicationContext recipientsCount](self, "recipientsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BLTPBCommunicationContext recipientsAtIndex:](self, "recipientsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addRecipients:", v8);

      }
    }
  }
  if (self->_contentURLData)
    objc_msgSend(v12, "setContentURLData:");
  has = (char)self->_has;
  v10 = v12;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v12 + 88) = self->_mentionsCurrentUser;
    *((_BYTE *)v12 + 92) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_17:
      if ((has & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_17;
  }
  *((_BYTE *)v12 + 89) = self->_notifyRecipientAnyway;
  *((_BYTE *)v12 + 92) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_18:
    if ((has & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_29:
  *((_BYTE *)v12 + 90) = self->_replyToCurrentUser;
  *((_BYTE *)v12 + 92) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_19:
    *((_DWORD *)v12 + 16) = self->_recipientCount;
    *((_BYTE *)v12 + 92) |= 4u;
  }
LABEL_20:
  if (self->_imageName)
  {
    objc_msgSend(v12, "setImageName:");
    v10 = v12;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_24;
LABEL_32:
    v10[7] = self->_capability;
    *((_BYTE *)v10 + 92) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
  *((_BYTE *)v10 + 91) = self->_systemImage;
  *((_BYTE *)v10 + 92) |= 0x40u;
  v11 = (char)self->_has;
  if ((v11 & 2) != 0)
    goto LABEL_32;
LABEL_24:
  if ((v11 & 1) != 0)
  {
LABEL_25:
    v10[6] = self->_capabilities;
    *((_BYTE *)v10 + 92) |= 1u;
  }
LABEL_26:

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
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  char has;
  uint64_t v25;
  void *v26;
  char v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_associatedObjectUriData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[BLTPBContact copyWithZone:](self->_sender, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = self->_recipients;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend((id)v5, "addRecipients:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v18);
  }

  v22 = -[NSData copyWithZone:](self->_contentURLData, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_mentionsCurrentUser;
    *(_BYTE *)(v5 + 92) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 89) = self->_notifyRecipientAnyway;
  *(_BYTE *)(v5 + 92) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  *(_BYTE *)(v5 + 90) = self->_replyToCurrentUser;
  *(_BYTE *)(v5 + 92) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 64) = self->_recipientCount;
    *(_BYTE *)(v5 + 92) |= 4u;
  }
LABEL_13:
  v25 = -[NSString copyWithZone:](self->_imageName, "copyWithZone:", a3, (_QWORD)v29);
  v26 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v25;

  v27 = (char)self->_has;
  if ((v27 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
LABEL_23:
    *(_DWORD *)(v5 + 28) = self->_capability;
    *(_BYTE *)(v5 + 92) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_16;
  }
  *(_BYTE *)(v5 + 91) = self->_systemImage;
  *(_BYTE *)(v5 + 92) |= 0x40u;
  v27 = (char)self->_has;
  if ((v27 & 2) != 0)
    goto LABEL_23;
LABEL_15:
  if ((v27 & 1) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 24) = self->_capabilities;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *bundleIdentifier;
  NSString *associatedObjectUriData;
  NSString *displayName;
  BLTPBContact *sender;
  NSMutableArray *recipients;
  NSData *contentURLData;
  char has;
  NSString *imageName;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_66;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_66;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_66;
  }
  associatedObjectUriData = self->_associatedObjectUriData;
  if ((unint64_t)associatedObjectUriData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](associatedObjectUriData, "isEqual:"))
      goto LABEL_66;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_66;
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((_QWORD *)v4 + 10))
  {
    if (!-[BLTPBContact isEqual:](sender, "isEqual:"))
      goto LABEL_66;
  }
  recipients = self->_recipients;
  if ((unint64_t)recipients | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](recipients, "isEqual:"))
      goto LABEL_66;
  }
  contentURLData = self->_contentURLData;
  if ((unint64_t)contentURLData | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](contentURLData, "isEqual:"))
      goto LABEL_66;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0)
      goto LABEL_66;
    if (self->_mentionsCurrentUser)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_66;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x10) == 0)
      goto LABEL_66;
    if (self->_notifyRecipientAnyway)
    {
      if (!*((_BYTE *)v4 + 89))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 89))
    {
      goto LABEL_66;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x20) == 0)
      goto LABEL_66;
    if (self->_replyToCurrentUser)
    {
      if (!*((_BYTE *)v4 + 90))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 90))
    {
      goto LABEL_66;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 0x20) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_recipientCount != *((_DWORD *)v4 + 16))
      goto LABEL_66;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_66;
  }
  imageName = self->_imageName;
  if ((unint64_t)imageName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](imageName, "isEqual:"))
      goto LABEL_66;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x40) != 0)
    {
      if (self->_systemImage)
      {
        if (!*((_BYTE *)v4 + 91))
          goto LABEL_66;
        goto LABEL_56;
      }
      if (!*((_BYTE *)v4 + 91))
        goto LABEL_56;
    }
LABEL_66:
    v14 = 0;
    goto LABEL_67;
  }
  if ((*((_BYTE *)v4 + 92) & 0x40) != 0)
    goto LABEL_66;
LABEL_56:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_capability != *((_DWORD *)v4 + 7))
      goto LABEL_66;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_capabilities != *((_DWORD *)v4 + 6))
      goto LABEL_66;
    v14 = 1;
  }
  else
  {
    v14 = (*((_BYTE *)v4 + 92) & 1) == 0;
  }
LABEL_67:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;

  v18 = -[NSString hash](self->_identifier, "hash");
  v17 = -[NSString hash](self->_bundleIdentifier, "hash");
  v16 = -[NSString hash](self->_associatedObjectUriData, "hash");
  v15 = -[NSString hash](self->_displayName, "hash");
  v3 = -[BLTPBContact hash](self->_sender, "hash");
  v4 = -[NSMutableArray hash](self->_recipients, "hash");
  v5 = -[NSData hash](self->_contentURLData, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = 2654435761 * self->_mentionsCurrentUser;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_notifyRecipientAnyway;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761 * self->_replyToCurrentUser;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v9 = 2654435761 * self->_recipientCount;
    goto LABEL_10;
  }
LABEL_9:
  v9 = 0;
LABEL_10:
  v10 = -[NSString hash](self->_imageName, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_12;
LABEL_15:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_13;
LABEL_16:
    v13 = 0;
    return v17 ^ v18 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v11 = 2654435761 * self->_systemImage;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_12:
  v12 = 2654435761 * self->_capability;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_16;
LABEL_13:
  v13 = 2654435761 * self->_capabilities;
  return v17 ^ v18 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BLTPBContact *sender;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[BLTPBCommunicationContext setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v4 + 2))
    -[BLTPBCommunicationContext setBundleIdentifier:](self, "setBundleIdentifier:");
  if (*((_QWORD *)v4 + 1))
    -[BLTPBCommunicationContext setAssociatedObjectUriData:](self, "setAssociatedObjectUriData:");
  if (*((_QWORD *)v4 + 5))
    -[BLTPBCommunicationContext setDisplayName:](self, "setDisplayName:");
  sender = self->_sender;
  v6 = *((_QWORD *)v4 + 10);
  if (sender)
  {
    if (v6)
      -[BLTPBContact mergeFrom:](sender, "mergeFrom:");
  }
  else if (v6)
  {
    -[BLTPBCommunicationContext setSender:](self, "setSender:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 9);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[BLTPBCommunicationContext addRecipients:](self, "addRecipients:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 4))
    -[BLTPBCommunicationContext setContentURLData:](self, "setContentURLData:");
  v12 = *((_BYTE *)v4 + 92);
  if ((v12 & 8) != 0)
  {
    self->_mentionsCurrentUser = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 8u;
    v12 = *((_BYTE *)v4 + 92);
    if ((v12 & 0x10) == 0)
    {
LABEL_25:
      if ((v12 & 0x20) == 0)
        goto LABEL_26;
      goto LABEL_37;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 0x10) == 0)
  {
    goto LABEL_25;
  }
  self->_notifyRecipientAnyway = *((_BYTE *)v4 + 89);
  *(_BYTE *)&self->_has |= 0x10u;
  v12 = *((_BYTE *)v4 + 92);
  if ((v12 & 0x20) == 0)
  {
LABEL_26:
    if ((v12 & 4) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_37:
  self->_replyToCurrentUser = *((_BYTE *)v4 + 90);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
LABEL_27:
    self->_recipientCount = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_28:
  if (*((_QWORD *)v4 + 7))
    -[BLTPBCommunicationContext setImageName:](self, "setImageName:");
  v13 = *((_BYTE *)v4 + 92);
  if ((v13 & 0x40) == 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0)
      goto LABEL_32;
LABEL_40:
    self->_capability = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 92) & 1) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
  self->_systemImage = *((_BYTE *)v4 + 91);
  *(_BYTE *)&self->_has |= 0x40u;
  v13 = *((_BYTE *)v4 + 92);
  if ((v13 & 2) != 0)
    goto LABEL_40;
LABEL_32:
  if ((v13 & 1) != 0)
  {
LABEL_33:
    self->_capabilities = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_34:

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)associatedObjectUriData
{
  return self->_associatedObjectUriData;
}

- (void)setAssociatedObjectUriData:(id)a3
{
  objc_storeStrong((id *)&self->_associatedObjectUriData, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BLTPBContact)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSMutableArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSData)contentURLData
{
  return self->_contentURLData;
}

- (void)setContentURLData:(id)a3
{
  objc_storeStrong((id *)&self->_contentURLData, a3);
}

- (BOOL)mentionsCurrentUser
{
  return self->_mentionsCurrentUser;
}

- (BOOL)notifyRecipientAnyway
{
  return self->_notifyRecipientAnyway;
}

- (BOOL)replyToCurrentUser
{
  return self->_replyToCurrentUser;
}

- (int)recipientCount
{
  return self->_recipientCount;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (BOOL)systemImage
{
  return self->_systemImage;
}

- (int)capability
{
  return self->_capability;
}

- (int)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentURLData, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedObjectUriData, 0);
}

- (NSURL)contentURLLocalFileLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[BLTPBCommunicationContext contentURLData](self, "contentURLData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blt_sha256String");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blt_filenameSafe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blt_contactImagesDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSURL *)v7;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBCommunicationContext writeTo:]", "BLTPBCommunicationContext.m", 403, "nil != self->_bundleIdentifier");
}

@end
