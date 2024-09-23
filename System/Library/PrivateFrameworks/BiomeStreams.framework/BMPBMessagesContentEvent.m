@implementation BMPBMessagesContentEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (BOOL)hasAuthor
{
  return self->_author != 0;
}

- (BOOL)hasSuggestedNickname
{
  return self->_suggestedNickname != 0;
}

- (BOOL)hasSuggestedPhotoPath
{
  return self->_suggestedPhotoPath != 0;
}

- (BOOL)hasRecipients
{
  return self->_recipients != 0;
}

- (BOOL)hasAttachmentURL
{
  return self->_attachmentURL != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (BOOL)hasFromHandle
{
  return self->_fromHandle != 0;
}

- (void)clearToHandles
{
  -[NSMutableArray removeAllObjects](self->_toHandles, "removeAllObjects");
}

- (void)addToHandles:(id)a3
{
  id v4;
  NSMutableArray *toHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  toHandles = self->_toHandles;
  v8 = v4;
  if (!toHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_toHandles;
    self->_toHandles = v6;

    v4 = v8;
    toHandles = self->_toHandles;
  }
  -[NSMutableArray addObject:](toHandles, "addObject:", v4);

}

- (unint64_t)toHandlesCount
{
  return -[NSMutableArray count](self->_toHandles, "count");
}

- (id)toHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_toHandles, "objectAtIndex:", a3);
}

+ (Class)toHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (BOOL)hasAccountType
{
  return self->_accountType != 0;
}

- (void)clearAccountHandles
{
  -[NSMutableArray removeAllObjects](self->_accountHandles, "removeAllObjects");
}

- (void)addAccountHandles:(id)a3
{
  id v4;
  NSMutableArray *accountHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  accountHandles = self->_accountHandles;
  v8 = v4;
  if (!accountHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_accountHandles;
    self->_accountHandles = v6;

    v4 = v8;
    accountHandles = self->_accountHandles;
  }
  -[NSMutableArray addObject:](accountHandles, "addObject:", v4);

}

- (unint64_t)accountHandlesCount
{
  return -[NSMutableArray count](self->_accountHandles, "count");
}

- (id)accountHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_accountHandles, "objectAtIndex:", a3);
}

+ (Class)accountHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAttachment
{
  return self->_attachment != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (void)setIsNew:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isNew = a3;
}

- (void)setHasIsNew:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsNew
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsTwoFactorCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isTwoFactorCode = a3;
}

- (void)setHasIsTwoFactorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsTwoFactorCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsFromMe:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isFromMe = a3;
}

- (void)setHasIsFromMe:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsFromMe
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsGroupThread:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isGroupThread = a3;
}

- (void)setHasIsGroupThread:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsGroupThread
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsJunk:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isJunk = a3;
}

- (void)setHasIsJunk:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsJunk
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsRead:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isRead = a3;
}

- (void)setHasIsRead:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsRead
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsPinned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isPinned = a3;
}

- (void)setHasIsPinned:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsPinned
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsBusinessChat:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isBusinessChat = a3;
}

- (void)setHasIsBusinessChat:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsBusinessChat
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasTapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID != 0;
}

- (void)setTapbackType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_tapbackType = a3;
}

- (void)setHasTapbackType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTapbackType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasMessageType
{
  return self->_messageType != 0;
}

- (BOOL)hasMessagesService
{
  return self->_messagesService != 0;
}

- (void)setMessageEffect:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_messageEffect = a3;
}

- (void)setHasMessageEffect:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMessageEffect
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsKnownSender:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isKnownSender = a3;
}

- (void)setHasIsKnownSender:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsKnownSender
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasConversationUUID
{
  return self->_conversationUUID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBMessagesContentEvent;
  -[BMPBMessagesContentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBMessagesContentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueId;
  NSString *domainId;
  void *v7;
  NSString *conversationId;
  NSString *author;
  NSString *suggestedNickname;
  NSString *suggestedPhotoPath;
  NSString *recipients;
  NSString *attachmentURL;
  NSString *content;
  BMPBNamedHandle *fromHandle;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSString *accountIdentifier;
  NSString *accountType;
  NSMutableArray *accountHandles;
  BMPBContentAttachment *attachment;
  void *v28;
  NSString *url;
  NSString *contentProtection;
  NSString *personaId;
  __int16 has;
  void *v33;
  NSString *tapbackAssociatedMessageID;
  void *v35;
  NSString *messageType;
  NSString *messagesService;
  __int16 v38;
  void *v39;
  void *v40;
  NSString *conversationUUID;
  id v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId)
    objc_msgSend(v3, "setObject:forKey:", uniqueId, CFSTR("uniqueId"));
  domainId = self->_domainId;
  if (domainId)
    objc_msgSend(v4, "setObject:forKey:", domainId, CFSTR("domainId"));
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("absoluteTimestamp"));

  }
  conversationId = self->_conversationId;
  if (conversationId)
    objc_msgSend(v4, "setObject:forKey:", conversationId, CFSTR("conversationId"));
  author = self->_author;
  if (author)
    objc_msgSend(v4, "setObject:forKey:", author, CFSTR("author"));
  suggestedNickname = self->_suggestedNickname;
  if (suggestedNickname)
    objc_msgSend(v4, "setObject:forKey:", suggestedNickname, CFSTR("suggestedNickname"));
  suggestedPhotoPath = self->_suggestedPhotoPath;
  if (suggestedPhotoPath)
    objc_msgSend(v4, "setObject:forKey:", suggestedPhotoPath, CFSTR("suggestedPhotoPath"));
  recipients = self->_recipients;
  if (recipients)
    objc_msgSend(v4, "setObject:forKey:", recipients, CFSTR("recipients"));
  attachmentURL = self->_attachmentURL;
  if (attachmentURL)
    objc_msgSend(v4, "setObject:forKey:", attachmentURL, CFSTR("attachmentURL"));
  content = self->_content;
  if (content)
    objc_msgSend(v4, "setObject:forKey:", content, CFSTR("content"));
  fromHandle = self->_fromHandle;
  if (fromHandle)
  {
    -[BMPBNamedHandle dictionaryRepresentation](fromHandle, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("fromHandle"));

  }
  if (-[NSMutableArray count](self->_toHandles, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_toHandles, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v18 = self->_toHandles;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v52 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v51);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("toHandles"));
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  accountType = self->_accountType;
  if (accountType)
    objc_msgSend(v4, "setObject:forKey:", accountType, CFSTR("accountType"));
  accountHandles = self->_accountHandles;
  if (accountHandles)
    objc_msgSend(v4, "setObject:forKey:", accountHandles, CFSTR("accountHandles"));
  attachment = self->_attachment;
  if (attachment)
  {
    -[BMPBContentAttachment dictionaryRepresentation](attachment, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("attachment"));

  }
  url = self->_url;
  if (url)
    objc_msgSend(v4, "setObject:forKey:", url, CFSTR("url"));
  contentProtection = self->_contentProtection;
  if (contentProtection)
    objc_msgSend(v4, "setObject:forKey:", contentProtection, CFSTR("contentProtection"));
  personaId = self->_personaId;
  if (personaId)
    objc_msgSend(v4, "setObject:forKey:", personaId, CFSTR("personaId"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isNew);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("isNew"));

    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_48:
      if ((has & 0x10) == 0)
        goto LABEL_49;
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTwoFactorCode, (_QWORD)v51);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("isTwoFactorCode"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_49:
    if ((has & 0x20) == 0)
      goto LABEL_50;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFromMe, (_QWORD)v51);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("isFromMe"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_50:
    if ((has & 0x40) == 0)
      goto LABEL_51;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGroupThread, (_QWORD)v51);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("isGroupThread"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_51:
    if ((has & 0x400) == 0)
      goto LABEL_52;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isJunk, (_QWORD)v51);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("isJunk"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_52:
    if ((has & 0x200) == 0)
      goto LABEL_53;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRead, (_QWORD)v51);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("isRead"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_53:
    if ((has & 8) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPinned, (_QWORD)v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("isPinned"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_54:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBusinessChat, (_QWORD)v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("isBusinessChat"));

  }
LABEL_55:
  tapbackAssociatedMessageID = self->_tapbackAssociatedMessageID;
  if (tapbackAssociatedMessageID)
    objc_msgSend(v4, "setObject:forKey:", tapbackAssociatedMessageID, CFSTR("tapbackAssociatedMessageID"));
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_tapbackType);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("tapbackType"));

  }
  messageType = self->_messageType;
  if (messageType)
    objc_msgSend(v4, "setObject:forKey:", messageType, CFSTR("messageType"));
  messagesService = self->_messagesService;
  if (messagesService)
    objc_msgSend(v4, "setObject:forKey:", messagesService, CFSTR("messagesService"));
  v38 = (__int16)self->_has;
  if ((v38 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_messageEffect);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("messageEffect"));

    v38 = (__int16)self->_has;
  }
  if ((v38 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isKnownSender);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("isKnownSender"));

  }
  conversationUUID = self->_conversationUUID;
  if (conversationUUID)
    objc_msgSend(v4, "setObject:forKey:", conversationUUID, CFSTR("conversationUUID"));
  v42 = v4;

  return v42;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMessagesContentEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int16 has;
  __int16 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueId)
    PBDataWriterWriteStringField();
  if (self->_domainId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  if (self->_author)
    PBDataWriterWriteStringField();
  if (self->_suggestedNickname)
    PBDataWriterWriteStringField();
  if (self->_suggestedPhotoPath)
    PBDataWriterWriteStringField();
  if (self->_recipients)
    PBDataWriterWriteStringField();
  if (self->_attachmentURL)
    PBDataWriterWriteStringField();
  if (self->_content)
    PBDataWriterWriteStringField();
  if (self->_fromHandle)
    PBDataWriterWriteSubmessage();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_toHandles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  if (self->_accountIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accountType)
    PBDataWriterWriteStringField();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_accountHandles;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  if (self->_attachment)
    PBDataWriterWriteSubmessage();
  if (self->_url)
    PBDataWriterWriteStringField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_51:
      if ((has & 0x10) == 0)
        goto LABEL_52;
      goto LABEL_75;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_51;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_52:
    if ((has & 0x20) == 0)
      goto LABEL_53;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_53:
    if ((has & 0x40) == 0)
      goto LABEL_54;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_54:
    if ((has & 0x400) == 0)
      goto LABEL_55;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_55:
    if ((has & 0x200) == 0)
      goto LABEL_56;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_56:
    if ((has & 8) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_57:
    PBDataWriterWriteBOOLField();
LABEL_58:
  if (self->_tapbackAssociatedMessageID)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_messageType)
    PBDataWriterWriteStringField();
  if (self->_messagesService)
    PBDataWriterWriteStringField();
  v16 = (__int16)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v16 = (__int16)self->_has;
  }
  if ((v16 & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_conversationUUID)
    PBDataWriterWriteStringField();

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
  _BYTE *v13;
  __int16 has;
  __int16 v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    v4 = v16;
  }
  if (self->_domainId)
  {
    objc_msgSend(v16, "setDomainId:");
    v4 = v16;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_WORD *)v4 + 110) |= 1u;
  }
  if (self->_conversationId)
    objc_msgSend(v16, "setConversationId:");
  if (self->_author)
    objc_msgSend(v16, "setAuthor:");
  if (self->_suggestedNickname)
    objc_msgSend(v16, "setSuggestedNickname:");
  if (self->_suggestedPhotoPath)
    objc_msgSend(v16, "setSuggestedPhotoPath:");
  if (self->_recipients)
    objc_msgSend(v16, "setRecipients:");
  if (self->_attachmentURL)
    objc_msgSend(v16, "setAttachmentURL:");
  if (self->_content)
    objc_msgSend(v16, "setContent:");
  if (self->_fromHandle)
    objc_msgSend(v16, "setFromHandle:");
  if (-[BMPBMessagesContentEvent toHandlesCount](self, "toHandlesCount"))
  {
    objc_msgSend(v16, "clearToHandles");
    v5 = -[BMPBMessagesContentEvent toHandlesCount](self, "toHandlesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BMPBMessagesContentEvent toHandlesAtIndex:](self, "toHandlesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addToHandles:", v8);

      }
    }
  }
  if (self->_accountIdentifier)
    objc_msgSend(v16, "setAccountIdentifier:");
  if (self->_accountType)
    objc_msgSend(v16, "setAccountType:");
  if (-[BMPBMessagesContentEvent accountHandlesCount](self, "accountHandlesCount"))
  {
    objc_msgSend(v16, "clearAccountHandles");
    v9 = -[BMPBMessagesContentEvent accountHandlesCount](self, "accountHandlesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[BMPBMessagesContentEvent accountHandlesAtIndex:](self, "accountHandlesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAccountHandles:", v12);

      }
    }
  }
  if (self->_attachment)
    objc_msgSend(v16, "setAttachment:");
  v13 = v16;
  if (self->_url)
  {
    objc_msgSend(v16, "setUrl:");
    v13 = v16;
  }
  if (self->_contentProtection)
  {
    objc_msgSend(v16, "setContentProtection:");
    v13 = v16;
  }
  if (self->_personaId)
  {
    objc_msgSend(v16, "setPersonaId:");
    v13 = v16;
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v13[213] = self->_isNew;
    *((_WORD *)v13 + 110) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_45:
      if ((has & 0x10) == 0)
        goto LABEL_46;
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_45;
  }
  v13[216] = self->_isTwoFactorCode;
  *((_WORD *)v13 + 110) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_70;
  }
LABEL_69:
  v13[209] = self->_isFromMe;
  *((_WORD *)v13 + 110) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x40) == 0)
      goto LABEL_48;
    goto LABEL_71;
  }
LABEL_70:
  v13[210] = self->_isGroupThread;
  *((_WORD *)v13 + 110) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_48:
    if ((has & 0x400) == 0)
      goto LABEL_49;
    goto LABEL_72;
  }
LABEL_71:
  v13[211] = self->_isJunk;
  *((_WORD *)v13 + 110) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_49:
    if ((has & 0x200) == 0)
      goto LABEL_50;
    goto LABEL_73;
  }
LABEL_72:
  v13[215] = self->_isRead;
  *((_WORD *)v13 + 110) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_50:
    if ((has & 8) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_73:
  v13[214] = self->_isPinned;
  *((_WORD *)v13 + 110) |= 0x200u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_51:
    v13[208] = self->_isBusinessChat;
    *((_WORD *)v13 + 110) |= 8u;
  }
LABEL_52:
  if (self->_tapbackAssociatedMessageID)
  {
    objc_msgSend(v16, "setTapbackAssociatedMessageID:");
    v13 = v16;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v13 + 2) = self->_tapbackType;
    *((_WORD *)v13 + 110) |= 2u;
  }
  if (self->_messageType)
  {
    objc_msgSend(v16, "setMessageType:");
    v13 = v16;
  }
  if (self->_messagesService)
  {
    objc_msgSend(v16, "setMessagesService:");
    v13 = v16;
  }
  v15 = (__int16)self->_has;
  if ((v15 & 4) != 0)
  {
    *((_DWORD *)v13 + 30) = self->_messageEffect;
    *((_WORD *)v13 + 110) |= 4u;
    v15 = (__int16)self->_has;
  }
  if ((v15 & 0x80) != 0)
  {
    v13[212] = self->_isKnownSender;
    *((_WORD *)v13 + 110) |= 0x80u;
  }
  if (self->_conversationUUID)
  {
    objc_msgSend(v16, "setConversationUUID:");
    v13 = v16;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  __int16 has;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v6;

  v8 = -[NSString copyWithZone:](self->_domainId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v8;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_WORD *)(v5 + 220) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_conversationId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v10;

  v12 = -[NSString copyWithZone:](self->_author, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_suggestedNickname, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v14;

  v16 = -[NSString copyWithZone:](self->_suggestedPhotoPath, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v16;

  v18 = -[NSString copyWithZone:](self->_recipients, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v18;

  v20 = -[NSString copyWithZone:](self->_attachmentURL, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v22 = -[NSString copyWithZone:](self->_content, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  v24 = -[BMPBNamedHandle copyWithZone:](self->_fromHandle, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v24;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v26 = self->_toHandles;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v66 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addToHandles:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v28);
  }

  v32 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v32;

  v34 = -[NSString copyWithZone:](self->_accountType, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v34;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v36 = self->_accountHandles;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v62 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v61);
        objc_msgSend((id)v5, "addAccountHandles:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v38);
  }

  v42 = -[BMPBContentAttachment copyWithZone:](self->_attachment, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v42;

  v44 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v44;

  v46 = -[NSString copyWithZone:](self->_contentProtection, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v46;

  v48 = -[NSString copyWithZone:](self->_personaId, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v48;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 213) = self->_isNew;
    *(_WORD *)(v5 + 220) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_19:
      if ((has & 0x10) == 0)
        goto LABEL_20;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_19;
  }
  *(_BYTE *)(v5 + 216) = self->_isTwoFactorCode;
  *(_WORD *)(v5 + 220) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_36;
  }
LABEL_35:
  *(_BYTE *)(v5 + 209) = self->_isFromMe;
  *(_WORD *)(v5 + 220) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_21:
    if ((has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_37;
  }
LABEL_36:
  *(_BYTE *)(v5 + 210) = self->_isGroupThread;
  *(_WORD *)(v5 + 220) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_22:
    if ((has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_38;
  }
LABEL_37:
  *(_BYTE *)(v5 + 211) = self->_isJunk;
  *(_WORD *)(v5 + 220) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_39;
  }
LABEL_38:
  *(_BYTE *)(v5 + 215) = self->_isRead;
  *(_WORD *)(v5 + 220) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((has & 8) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_39:
  *(_BYTE *)(v5 + 214) = self->_isPinned;
  *(_WORD *)(v5 + 220) |= 0x200u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_25:
    *(_BYTE *)(v5 + 208) = self->_isBusinessChat;
    *(_WORD *)(v5 + 220) |= 8u;
  }
LABEL_26:
  v51 = -[NSString copyWithZone:](self->_tapbackAssociatedMessageID, "copyWithZone:", a3, (_QWORD)v61);
  v52 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v51;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_tapbackType;
    *(_WORD *)(v5 + 220) |= 2u;
  }
  v53 = -[NSString copyWithZone:](self->_messageType, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v53;

  v55 = -[NSString copyWithZone:](self->_messagesService, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v55;

  v57 = (__int16)self->_has;
  if ((v57 & 4) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_messageEffect;
    *(_WORD *)(v5 + 220) |= 4u;
    v57 = (__int16)self->_has;
  }
  if ((v57 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 212) = self->_isKnownSender;
    *(_WORD *)(v5 + 220) |= 0x80u;
  }
  v58 = -[NSString copyWithZone:](self->_conversationUUID, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v58;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueId;
  NSString *domainId;
  __int16 v7;
  NSString *conversationId;
  NSString *author;
  NSString *suggestedNickname;
  NSString *suggestedPhotoPath;
  NSString *recipients;
  NSString *attachmentURL;
  NSString *content;
  BMPBNamedHandle *fromHandle;
  NSMutableArray *toHandles;
  NSString *accountIdentifier;
  NSString *accountType;
  NSMutableArray *accountHandles;
  BMPBContentAttachment *attachment;
  NSString *url;
  NSString *contentProtection;
  NSString *personaId;
  __int16 has;
  __int16 v25;
  NSString *tapbackAssociatedMessageID;
  __int16 v27;
  NSString *messageType;
  NSString *messagesService;
  __int16 v30;
  __int16 v31;
  char v32;
  NSString *conversationUUID;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_128;
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_128;
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:"))
      goto LABEL_128;
  }
  v7 = *((_WORD *)v4 + 110);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_128;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_128;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](conversationId, "isEqual:"))
  {
    goto LABEL_128;
  }
  author = self->_author;
  if ((unint64_t)author | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](author, "isEqual:"))
      goto LABEL_128;
  }
  suggestedNickname = self->_suggestedNickname;
  if ((unint64_t)suggestedNickname | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](suggestedNickname, "isEqual:"))
      goto LABEL_128;
  }
  suggestedPhotoPath = self->_suggestedPhotoPath;
  if ((unint64_t)suggestedPhotoPath | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](suggestedPhotoPath, "isEqual:"))
      goto LABEL_128;
  }
  recipients = self->_recipients;
  if ((unint64_t)recipients | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](recipients, "isEqual:"))
      goto LABEL_128;
  }
  attachmentURL = self->_attachmentURL;
  if ((unint64_t)attachmentURL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](attachmentURL, "isEqual:"))
      goto LABEL_128;
  }
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](content, "isEqual:"))
      goto LABEL_128;
  }
  fromHandle = self->_fromHandle;
  if ((unint64_t)fromHandle | *((_QWORD *)v4 + 14))
  {
    if (!-[BMPBNamedHandle isEqual:](fromHandle, "isEqual:"))
      goto LABEL_128;
  }
  toHandles = self->_toHandles;
  if ((unint64_t)toHandles | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](toHandles, "isEqual:"))
      goto LABEL_128;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](accountIdentifier, "isEqual:"))
      goto LABEL_128;
  }
  accountType = self->_accountType;
  if ((unint64_t)accountType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](accountType, "isEqual:"))
      goto LABEL_128;
  }
  accountHandles = self->_accountHandles;
  if ((unint64_t)accountHandles | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](accountHandles, "isEqual:"))
      goto LABEL_128;
  }
  attachment = self->_attachment;
  if ((unint64_t)attachment | *((_QWORD *)v4 + 6))
  {
    if (!-[BMPBContentAttachment isEqual:](attachment, "isEqual:"))
      goto LABEL_128;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_128;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:"))
      goto LABEL_128;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](personaId, "isEqual:"))
      goto LABEL_128;
  }
  has = (__int16)self->_has;
  v25 = *((_WORD *)v4 + 110);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x100) == 0)
      goto LABEL_128;
    if (self->_isNew)
    {
      if (!*((_BYTE *)v4 + 213))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 213))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x100) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x800) == 0)
      goto LABEL_128;
    if (self->_isTwoFactorCode)
    {
      if (!*((_BYTE *)v4 + 216))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 216))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x800) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x10) != 0)
  {
    if ((v25 & 0x10) == 0)
      goto LABEL_128;
    if (self->_isFromMe)
    {
      if (!*((_BYTE *)v4 + 209))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 209))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 0x10) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0)
      goto LABEL_128;
    if (self->_isGroupThread)
    {
      if (!*((_BYTE *)v4 + 210))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 210))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 0x20) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x40) != 0)
  {
    if ((v25 & 0x40) == 0)
      goto LABEL_128;
    if (self->_isJunk)
    {
      if (!*((_BYTE *)v4 + 211))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 211))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 0x40) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x400) == 0)
      goto LABEL_128;
    if (self->_isRead)
    {
      if (!*((_BYTE *)v4 + 215))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 215))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x400) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x200) == 0)
      goto LABEL_128;
    if (self->_isPinned)
    {
      if (!*((_BYTE *)v4 + 214))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 214))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x200) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 8) != 0)
  {
    if ((v25 & 8) == 0)
      goto LABEL_128;
    if (self->_isBusinessChat)
    {
      if (!*((_BYTE *)v4 + 208))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 208))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 8) != 0)
  {
    goto LABEL_128;
  }
  tapbackAssociatedMessageID = self->_tapbackAssociatedMessageID;
  if ((unint64_t)tapbackAssociatedMessageID | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](tapbackAssociatedMessageID, "isEqual:"))
      goto LABEL_128;
    has = (__int16)self->_has;
  }
  v27 = *((_WORD *)v4 + 110);
  if ((has & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_tapbackType != *((_QWORD *)v4 + 2))
      goto LABEL_128;
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_128;
  }
  messageType = self->_messageType;
  if ((unint64_t)messageType | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](messageType, "isEqual:"))
  {
    goto LABEL_128;
  }
  messagesService = self->_messagesService;
  if ((unint64_t)messagesService | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](messagesService, "isEqual:"))
      goto LABEL_128;
  }
  v30 = (__int16)self->_has;
  v31 = *((_WORD *)v4 + 110);
  if ((v30 & 4) != 0)
  {
    if ((v31 & 4) == 0 || self->_messageEffect != *((_DWORD *)v4 + 30))
      goto LABEL_128;
  }
  else if ((v31 & 4) != 0)
  {
    goto LABEL_128;
  }
  if ((v30 & 0x80) == 0)
  {
    if ((v31 & 0x80) == 0)
      goto LABEL_134;
LABEL_128:
    v32 = 0;
    goto LABEL_129;
  }
  if ((v31 & 0x80) == 0)
    goto LABEL_128;
  if (!self->_isKnownSender)
  {
    if (!*((_BYTE *)v4 + 212))
      goto LABEL_134;
    goto LABEL_128;
  }
  if (!*((_BYTE *)v4 + 212))
    goto LABEL_128;
LABEL_134:
  conversationUUID = self->_conversationUUID;
  if ((unint64_t)conversationUUID | *((_QWORD *)v4 + 12))
    v32 = -[NSString isEqual:](conversationUUID, "isEqual:");
  else
    v32 = 1;
LABEL_129:

  return v32;
}

- (unint64_t)hash
{
  double absoluteTimestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int16 has;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  unint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  unint64_t v37;
  NSUInteger v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  unint64_t v45;
  NSUInteger v46;
  NSUInteger v47;

  v47 = -[NSString hash](self->_uniqueId, "hash");
  v46 = -[NSString hash](self->_domainId, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v4 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v4 = self->_absoluteTimestamp;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v45 = v10;
  }
  else
  {
    v45 = 0;
  }
  v44 = -[NSString hash](self->_conversationId, "hash");
  v43 = -[NSString hash](self->_author, "hash");
  v42 = -[NSString hash](self->_suggestedNickname, "hash");
  v41 = -[NSString hash](self->_suggestedPhotoPath, "hash");
  v40 = -[NSString hash](self->_recipients, "hash");
  v39 = -[NSString hash](self->_attachmentURL, "hash");
  v38 = -[NSString hash](self->_content, "hash");
  v37 = -[BMPBNamedHandle hash](self->_fromHandle, "hash");
  v36 = -[NSMutableArray hash](self->_toHandles, "hash");
  v35 = -[NSString hash](self->_accountIdentifier, "hash");
  v34 = -[NSString hash](self->_accountType, "hash");
  v33 = -[NSMutableArray hash](self->_accountHandles, "hash");
  v32 = -[BMPBContentAttachment hash](self->_attachment, "hash");
  v31 = -[NSString hash](self->_url, "hash");
  v30 = -[NSString hash](self->_contentProtection, "hash");
  v29 = -[NSString hash](self->_personaId, "hash");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v28 = 2654435761 * self->_isNew;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_12:
      v27 = 2654435761 * self->_isTwoFactorCode;
      if ((has & 0x10) != 0)
        goto LABEL_13;
      goto LABEL_21;
    }
  }
  else
  {
    v28 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_12;
  }
  v27 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    v26 = 2654435761 * self->_isFromMe;
    if ((has & 0x20) != 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  v26 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_14:
    v24 = 2654435761 * self->_isGroupThread;
    if ((has & 0x40) != 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  v24 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_15:
    v12 = 2654435761 * self->_isJunk;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    v13 = 2654435761 * self->_isRead;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_17;
LABEL_25:
    v14 = 0;
    if ((has & 8) != 0)
      goto LABEL_18;
    goto LABEL_26;
  }
LABEL_24:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_25;
LABEL_17:
  v14 = 2654435761 * self->_isPinned;
  if ((has & 8) != 0)
  {
LABEL_18:
    v15 = 2654435761 * self->_isBusinessChat;
    goto LABEL_27;
  }
LABEL_26:
  v15 = 0;
LABEL_27:
  v16 = -[NSString hash](self->_tapbackAssociatedMessageID, "hash", v24);
  if ((*(_WORD *)&self->_has & 2) != 0)
    v17 = 2654435761 * self->_tapbackType;
  else
    v17 = 0;
  v18 = -[NSString hash](self->_messageType, "hash");
  v19 = -[NSString hash](self->_messagesService, "hash");
  v20 = (__int16)self->_has;
  if ((v20 & 4) != 0)
  {
    v21 = 2654435761 * self->_messageEffect;
    if ((v20 & 0x80) != 0)
      goto LABEL_32;
LABEL_34:
    v22 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v22 ^ -[NSString hash](self->_conversationUUID, "hash");
  }
  v21 = 0;
  if ((v20 & 0x80) == 0)
    goto LABEL_34;
LABEL_32:
  v22 = 2654435761 * self->_isKnownSender;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v22 ^ -[NSString hash](self->_conversationUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BMPBNamedHandle *fromHandle;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  BMPBContentAttachment *attachment;
  uint64_t v18;
  __int16 v19;
  __int16 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 24))
    -[BMPBMessagesContentEvent setUniqueId:](self, "setUniqueId:");
  if (*((_QWORD *)v4 + 13))
    -[BMPBMessagesContentEvent setDomainId:](self, "setDomainId:");
  if ((*((_WORD *)v4 + 110) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 11))
    -[BMPBMessagesContentEvent setConversationId:](self, "setConversationId:");
  if (*((_QWORD *)v4 + 8))
    -[BMPBMessagesContentEvent setAuthor:](self, "setAuthor:");
  if (*((_QWORD *)v4 + 20))
    -[BMPBMessagesContentEvent setSuggestedNickname:](self, "setSuggestedNickname:");
  if (*((_QWORD *)v4 + 21))
    -[BMPBMessagesContentEvent setSuggestedPhotoPath:](self, "setSuggestedPhotoPath:");
  if (*((_QWORD *)v4 + 19))
    -[BMPBMessagesContentEvent setRecipients:](self, "setRecipients:");
  if (*((_QWORD *)v4 + 7))
    -[BMPBMessagesContentEvent setAttachmentURL:](self, "setAttachmentURL:");
  if (*((_QWORD *)v4 + 9))
    -[BMPBMessagesContentEvent setContent:](self, "setContent:");
  fromHandle = self->_fromHandle;
  v6 = *((_QWORD *)v4 + 14);
  if (fromHandle)
  {
    if (v6)
      -[BMPBNamedHandle mergeFrom:](fromHandle, "mergeFrom:");
  }
  else if (v6)
  {
    -[BMPBMessagesContentEvent setFromHandle:](self, "setFromHandle:");
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = *((id *)v4 + 23);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        -[BMPBMessagesContentEvent addToHandles:](self, "addToHandles:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 4))
    -[BMPBMessagesContentEvent setAccountIdentifier:](self, "setAccountIdentifier:");
  if (*((_QWORD *)v4 + 5))
    -[BMPBMessagesContentEvent setAccountType:](self, "setAccountType:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = *((id *)v4 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        -[BMPBMessagesContentEvent addAccountHandles:](self, "addAccountHandles:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  attachment = self->_attachment;
  v18 = *((_QWORD *)v4 + 6);
  if (attachment)
  {
    if (v18)
      -[BMPBContentAttachment mergeFrom:](attachment, "mergeFrom:");
  }
  else if (v18)
  {
    -[BMPBMessagesContentEvent setAttachment:](self, "setAttachment:");
  }
  if (*((_QWORD *)v4 + 25))
    -[BMPBMessagesContentEvent setUrl:](self, "setUrl:");
  if (*((_QWORD *)v4 + 10))
    -[BMPBMessagesContentEvent setContentProtection:](self, "setContentProtection:");
  if (*((_QWORD *)v4 + 18))
    -[BMPBMessagesContentEvent setPersonaId:](self, "setPersonaId:");
  v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x100) != 0)
  {
    self->_isNew = *((_BYTE *)v4 + 213);
    *(_WORD *)&self->_has |= 0x100u;
    v19 = *((_WORD *)v4 + 110);
    if ((v19 & 0x800) == 0)
    {
LABEL_57:
      if ((v19 & 0x10) == 0)
        goto LABEL_58;
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x800) == 0)
  {
    goto LABEL_57;
  }
  self->_isTwoFactorCode = *((_BYTE *)v4 + 216);
  *(_WORD *)&self->_has |= 0x800u;
  v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x10) == 0)
  {
LABEL_58:
    if ((v19 & 0x20) == 0)
      goto LABEL_59;
    goto LABEL_82;
  }
LABEL_81:
  self->_isFromMe = *((_BYTE *)v4 + 209);
  *(_WORD *)&self->_has |= 0x10u;
  v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x20) == 0)
  {
LABEL_59:
    if ((v19 & 0x40) == 0)
      goto LABEL_60;
    goto LABEL_83;
  }
LABEL_82:
  self->_isGroupThread = *((_BYTE *)v4 + 210);
  *(_WORD *)&self->_has |= 0x20u;
  v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x40) == 0)
  {
LABEL_60:
    if ((v19 & 0x400) == 0)
      goto LABEL_61;
    goto LABEL_84;
  }
LABEL_83:
  self->_isJunk = *((_BYTE *)v4 + 211);
  *(_WORD *)&self->_has |= 0x40u;
  v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x400) == 0)
  {
LABEL_61:
    if ((v19 & 0x200) == 0)
      goto LABEL_62;
    goto LABEL_85;
  }
LABEL_84:
  self->_isRead = *((_BYTE *)v4 + 215);
  *(_WORD *)&self->_has |= 0x400u;
  v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x200) == 0)
  {
LABEL_62:
    if ((v19 & 8) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
LABEL_85:
  self->_isPinned = *((_BYTE *)v4 + 214);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 110) & 8) != 0)
  {
LABEL_63:
    self->_isBusinessChat = *((_BYTE *)v4 + 208);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_64:
  if (*((_QWORD *)v4 + 22))
    -[BMPBMessagesContentEvent setTapbackAssociatedMessageID:](self, "setTapbackAssociatedMessageID:");
  if ((*((_WORD *)v4 + 110) & 2) != 0)
  {
    self->_tapbackType = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 16))
    -[BMPBMessagesContentEvent setMessageType:](self, "setMessageType:");
  if (*((_QWORD *)v4 + 17))
    -[BMPBMessagesContentEvent setMessagesService:](self, "setMessagesService:");
  v20 = *((_WORD *)v4 + 110);
  if ((v20 & 4) != 0)
  {
    self->_messageEffect = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 4u;
    v20 = *((_WORD *)v4 + 110);
  }
  if ((v20 & 0x80) != 0)
  {
    self->_isKnownSender = *((_BYTE *)v4 + 212);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 12))
    -[BMPBMessagesContentEvent setConversationUUID:](self, "setConversationUUID:");

}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
  objc_storeStrong((id *)&self->_domainId, a3);
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)suggestedNickname
{
  return self->_suggestedNickname;
}

- (void)setSuggestedNickname:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedNickname, a3);
}

- (NSString)suggestedPhotoPath
{
  return self->_suggestedPhotoPath;
}

- (void)setSuggestedPhotoPath:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedPhotoPath, a3);
}

- (NSString)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSString)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURL, a3);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BMPBNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (void)setFromHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fromHandle, a3);
}

- (NSMutableArray)toHandles
{
  return self->_toHandles;
}

- (void)setToHandles:(id)a3
{
  objc_storeStrong((id *)&self->_toHandles, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
  objc_storeStrong((id *)&self->_accountType, a3);
}

- (NSMutableArray)accountHandles
{
  return self->_accountHandles;
}

- (void)setAccountHandles:(id)a3
{
  objc_storeStrong((id *)&self->_accountHandles, a3);
}

- (BMPBContentAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
  objc_storeStrong((id *)&self->_contentProtection, a3);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
  objc_storeStrong((id *)&self->_personaId, a3);
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (BOOL)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (BOOL)isGroupThread
{
  return self->_isGroupThread;
}

- (BOOL)isJunk
{
  return self->_isJunk;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

- (NSString)tapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID;
}

- (void)setTapbackAssociatedMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackAssociatedMessageID, a3);
}

- (int64_t)tapbackType
{
  return self->_tapbackType;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
  objc_storeStrong((id *)&self->_messageType, a3);
}

- (NSString)messagesService
{
  return self->_messagesService;
}

- (void)setMessagesService:(id)a3
{
  objc_storeStrong((id *)&self->_messagesService, a3);
}

- (int)messageEffect
{
  return self->_messageEffect;
}

- (BOOL)isKnownSender
{
  return self->_isKnownSender;
}

- (NSString)conversationUUID
{
  return self->_conversationUUID;
}

- (void)setConversationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_tapbackAssociatedMessageID, 0);
  objc_storeStrong((id *)&self->_suggestedPhotoPath, 0);
  objc_storeStrong((id *)&self->_suggestedNickname, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_messagesService, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_conversationUUID, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
}

@end
