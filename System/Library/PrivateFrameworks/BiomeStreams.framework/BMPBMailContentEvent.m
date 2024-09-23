@implementation BMPBMailContentEvent

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

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (BOOL)hasMessageIdentifier
{
  return self->_messageIdentifier != 0;
}

- (BOOL)hasFrom
{
  return self->_from != 0;
}

- (BOOL)hasTo
{
  return self->_to != 0;
}

- (BOOL)hasCc
{
  return self->_cc != 0;
}

- (BOOL)hasBcc
{
  return self->_bcc != 0;
}

- (void)clearHeaders
{
  -[NSMutableArray removeAllObjects](self->_headers, "removeAllObjects");
}

- (void)addHeaders:(id)a3
{
  id v4;
  NSMutableArray *headers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  headers = self->_headers;
  v8 = v4;
  if (!headers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_headers;
    self->_headers = v6;

    v4 = v8;
    headers = self->_headers;
  }
  -[NSMutableArray addObject:](headers, "addObject:", v4);

}

- (unint64_t)headersCount
{
  return -[NSMutableArray count](self->_headers, "count");
}

- (id)headersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_headers, "objectAtIndex:", a3);
}

+ (Class)headersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (BOOL)hasHtmlContentData
{
  return self->_htmlContentData != 0;
}

- (void)setIsFullyDownloaded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isFullyDownloaded = a3;
}

- (void)setHasIsFullyDownloaded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsFullyDownloaded
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasHtmlContent
{
  return self->_htmlContent != 0;
}

- (BOOL)hasTextContent
{
  return self->_textContent != 0;
}

- (BOOL)hasSecurityMethod
{
  return self->_securityMethod != 0;
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

- (BOOL)hasReplyTo
{
  return self->_replyTo != 0;
}

- (void)clearMailboxIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_mailboxIdentifiers, "removeAllObjects");
}

- (void)addMailboxIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *mailboxIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mailboxIdentifiers = self->_mailboxIdentifiers;
  v8 = v4;
  if (!mailboxIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_mailboxIdentifiers;
    self->_mailboxIdentifiers = v6;

    v4 = v8;
    mailboxIdentifiers = self->_mailboxIdentifiers;
  }
  -[NSMutableArray addObject:](mailboxIdentifiers, "addObject:", v4);

}

- (unint64_t)mailboxIdentifiersCount
{
  return -[NSMutableArray count](self->_mailboxIdentifiers, "count");
}

- (id)mailboxIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mailboxIdentifiers, "objectAtIndex:", a3);
}

+ (Class)mailboxIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasListId
{
  return self->_listId != 0;
}

- (BOOL)hasAccountType
{
  return self->_accountType != 0;
}

- (void)clearAttachments
{
  -[NSMutableArray removeAllObjects](self->_attachments, "removeAllObjects");
}

- (void)addAttachments:(id)a3
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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
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

- (id)attachmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attachments, "objectAtIndex:", a3);
}

+ (Class)attachmentsType
{
  return (Class)objc_opt_class();
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

- (void)clearCcHandles
{
  -[NSMutableArray removeAllObjects](self->_ccHandles, "removeAllObjects");
}

- (void)addCcHandles:(id)a3
{
  id v4;
  NSMutableArray *ccHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ccHandles = self->_ccHandles;
  v8 = v4;
  if (!ccHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ccHandles;
    self->_ccHandles = v6;

    v4 = v8;
    ccHandles = self->_ccHandles;
  }
  -[NSMutableArray addObject:](ccHandles, "addObject:", v4);

}

- (unint64_t)ccHandlesCount
{
  return -[NSMutableArray count](self->_ccHandles, "count");
}

- (id)ccHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ccHandles, "objectAtIndex:", a3);
}

+ (Class)ccHandlesType
{
  return (Class)objc_opt_class();
}

- (void)clearBccHandles
{
  -[NSMutableArray removeAllObjects](self->_bccHandles, "removeAllObjects");
}

- (void)addBccHandles:(id)a3
{
  id v4;
  NSMutableArray *bccHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bccHandles = self->_bccHandles;
  v8 = v4;
  if (!bccHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_bccHandles;
    self->_bccHandles = v6;

    v4 = v8;
    bccHandles = self->_bccHandles;
  }
  -[NSMutableArray addObject:](bccHandles, "addObject:", v4);

}

- (unint64_t)bccHandlesCount
{
  return -[NSMutableArray count](self->_bccHandles, "count");
}

- (id)bccHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bccHandles, "objectAtIndex:", a3);
}

+ (Class)bccHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (void)setDateReceived:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dateReceived = a3;
}

- (void)setHasDateReceived:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDateReceived
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMailCategories:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_mailCategories = a3;
}

- (void)setHasMailCategories:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMailCategories
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsNew:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isNew = a3;
}

- (void)setHasIsNew:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsNew
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsTwoFactorCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isTwoFactorCode = a3;
}

- (void)setHasIsTwoFactorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsTwoFactorCode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
  *(_WORD *)&self->_has |= 0x100u;
  self->_isRead = a3;
}

- (void)setHasIsRead:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsRead
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsVIP:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isVIP = a3;
}

- (void)setHasIsVIP:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsVIP
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsFlagged:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isFlagged = a3;
}

- (void)setHasIsFlagged:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsFlagged
{
  return (*(_WORD *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)BMPBMailContentEvent;
  -[BMPBMailContentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBMailContentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *accountIdentifier;
  NSString *messageIdentifier;
  NSString *from;
  NSString *to;
  NSString *cc;
  NSString *bcc;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSString *subject;
  NSString *htmlContentData;
  void *v23;
  NSData *htmlContent;
  NSString *textContent;
  NSString *securityMethod;
  NSMutableArray *accountHandles;
  BMPBNamedHandle *replyTo;
  void *v29;
  NSMutableArray *mailboxIdentifiers;
  BMPBNamedHandle *listId;
  void *v32;
  NSString *accountType;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  BMPBNamedHandle *fromHandle;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  void *v63;
  NSString *contentProtection;
  NSString *personaId;
  NSString *conversationId;
  __int16 has;
  void *v68;
  id v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
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
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  messageIdentifier = self->_messageIdentifier;
  if (messageIdentifier)
    objc_msgSend(v4, "setObject:forKey:", messageIdentifier, CFSTR("messageIdentifier"));
  from = self->_from;
  if (from)
    objc_msgSend(v4, "setObject:forKey:", from, CFSTR("from"));
  to = self->_to;
  if (to)
    objc_msgSend(v4, "setObject:forKey:", to, CFSTR("to"));
  cc = self->_cc;
  if (cc)
    objc_msgSend(v4, "setObject:forKey:", cc, CFSTR("cc"));
  bcc = self->_bcc;
  if (bcc)
    objc_msgSend(v4, "setObject:forKey:", bcc, CFSTR("bcc"));
  if (-[NSMutableArray count](self->_headers, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_headers, "count"));
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v15 = self->_headers;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v96 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("headers"));
  }
  subject = self->_subject;
  if (subject)
    objc_msgSend(v4, "setObject:forKey:", subject, CFSTR("subject"));
  htmlContentData = self->_htmlContentData;
  if (htmlContentData)
    objc_msgSend(v4, "setObject:forKey:", htmlContentData, CFSTR("htmlContentData"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFullyDownloaded);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("isFullyDownloaded"));

  }
  htmlContent = self->_htmlContent;
  if (htmlContent)
    objc_msgSend(v4, "setObject:forKey:", htmlContent, CFSTR("htmlContent"));
  textContent = self->_textContent;
  if (textContent)
    objc_msgSend(v4, "setObject:forKey:", textContent, CFSTR("textContent"));
  securityMethod = self->_securityMethod;
  if (securityMethod)
    objc_msgSend(v4, "setObject:forKey:", securityMethod, CFSTR("securityMethod"));
  accountHandles = self->_accountHandles;
  if (accountHandles)
    objc_msgSend(v4, "setObject:forKey:", accountHandles, CFSTR("accountHandles"));
  replyTo = self->_replyTo;
  if (replyTo)
  {
    -[BMPBNamedHandle dictionaryRepresentation](replyTo, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("replyTo"));

  }
  mailboxIdentifiers = self->_mailboxIdentifiers;
  if (mailboxIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", mailboxIdentifiers, CFSTR("mailboxIdentifiers"));
  listId = self->_listId;
  if (listId)
  {
    -[BMPBNamedHandle dictionaryRepresentation](listId, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("listId"));

  }
  accountType = self->_accountType;
  if (accountType)
    objc_msgSend(v4, "setObject:forKey:", accountType, CFSTR("accountType"));
  if (-[NSMutableArray count](self->_attachments, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_attachments, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v35 = self->_attachments;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v92;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v92 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * j), "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("attachments"));
  }
  fromHandle = self->_fromHandle;
  if (fromHandle)
  {
    -[BMPBNamedHandle dictionaryRepresentation](fromHandle, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("fromHandle"));

  }
  if (-[NSMutableArray count](self->_toHandles, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_toHandles, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v44 = self->_toHandles;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v88;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v88 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * k), "dictionaryRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
      }
      while (v46);
    }

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("toHandles"));
  }
  if (-[NSMutableArray count](self->_ccHandles, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_ccHandles, "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v51 = self->_ccHandles;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v84;
      do
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v84 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * m), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
      }
      while (v53);
    }

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("ccHandles"));
  }
  if (-[NSMutableArray count](self->_bccHandles, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_bccHandles, "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v58 = self->_bccHandles;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v80;
      do
      {
        for (n = 0; n != v60; ++n)
        {
          if (*(_QWORD *)v80 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v79);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
      }
      while (v60);
    }

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("bccHandles"));
  }
  contentProtection = self->_contentProtection;
  if (contentProtection)
    objc_msgSend(v4, "setObject:forKey:", contentProtection, CFSTR("contentProtection"));
  personaId = self->_personaId;
  if (personaId)
    objc_msgSend(v4, "setObject:forKey:", personaId, CFSTR("personaId"));
  conversationId = self->_conversationId;
  if (conversationId)
    objc_msgSend(v4, "setObject:forKey:", conversationId, CFSTR("conversationId"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateReceived);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("dateReceived"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_96:
      if ((has & 0x80) == 0)
        goto LABEL_97;
      goto LABEL_107;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mailCategories, (_QWORD)v79);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("mailCategories"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_97:
    if ((has & 0x200) == 0)
      goto LABEL_98;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isNew, (_QWORD)v79);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("isNew"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_98:
    if ((has & 0x10) == 0)
      goto LABEL_99;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTwoFactorCode, (_QWORD)v79);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("isTwoFactorCode"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_99:
    if ((has & 0x40) == 0)
      goto LABEL_100;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFromMe, (_QWORD)v79);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("isFromMe"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_100:
    if ((has & 0x100) == 0)
      goto LABEL_101;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isJunk, (_QWORD)v79);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("isJunk"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_101:
    if ((has & 0x400) == 0)
      goto LABEL_102;
LABEL_112:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVIP, (_QWORD)v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("isVIP"));

    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_104;
    goto LABEL_103;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRead, (_QWORD)v79);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("isRead"));

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_112;
LABEL_102:
  if ((has & 8) != 0)
  {
LABEL_103:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFlagged, (_QWORD)v79);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("isFlagged"));

  }
LABEL_104:
  v69 = v4;

  return v69;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMailContentEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t jj;
  __int16 has;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
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
  __int128 v59;
  __int128 v60;
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
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueId)
    PBDataWriterWriteStringField();
  if (self->_domainId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_accountIdentifier)
    PBDataWriterWriteStringField();
  if (self->_messageIdentifier)
    PBDataWriterWriteStringField();
  if (self->_from)
    PBDataWriterWriteStringField();
  if (self->_to)
    PBDataWriterWriteStringField();
  if (self->_cc)
    PBDataWriterWriteStringField();
  if (self->_bcc)
    PBDataWriterWriteStringField();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v5 = self->_headers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v66 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v7);
  }

  if (self->_subject)
    PBDataWriterWriteStringField();
  if (self->_htmlContentData)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_htmlContent)
    PBDataWriterWriteDataField();
  if (self->_textContent)
    PBDataWriterWriteStringField();
  if (self->_securityMethod)
    PBDataWriterWriteStringField();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v10 = self->_accountHandles;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v12);
  }

  if (self->_replyTo)
    PBDataWriterWriteSubmessage();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v15 = self->_mailboxIdentifiers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v17);
  }

  if (self->_listId)
    PBDataWriterWriteSubmessage();
  if (self->_accountType)
    PBDataWriterWriteStringField();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = self->_attachments;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v54;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v54 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    }
    while (v22);
  }

  if (self->_fromHandle)
    PBDataWriterWriteSubmessage();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v25 = self->_toHandles;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v50;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v50 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
    }
    while (v27);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v30 = self->_ccHandles;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v46;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
    }
    while (v32);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v35 = self->_bccHandles;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v42;
    do
    {
      for (jj = 0; jj != v37; ++jj)
      {
        if (*(_QWORD *)v42 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
    }
    while (v37);
  }

  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_96:
      if ((has & 0x80) == 0)
        goto LABEL_97;
      goto LABEL_107;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_96;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_97:
    if ((has & 0x200) == 0)
      goto LABEL_98;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_98:
    if ((has & 0x10) == 0)
      goto LABEL_99;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_99:
    if ((has & 0x40) == 0)
      goto LABEL_100;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_100:
    if ((has & 0x100) == 0)
      goto LABEL_101;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_101:
    if ((has & 0x400) == 0)
      goto LABEL_102;
LABEL_112:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_104;
    goto LABEL_103;
  }
LABEL_111:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_112;
LABEL_102:
  if ((has & 8) != 0)
LABEL_103:
    PBDataWriterWriteBOOLField();
LABEL_104:

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t ii;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t jj;
  void *v33;
  _QWORD *v34;
  __int16 has;
  id v36;

  v4 = a3;
  v36 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    v4 = v36;
  }
  if (self->_domainId)
  {
    objc_msgSend(v36, "setDomainId:");
    v4 = v36;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_WORD *)v4 + 128) |= 1u;
  }
  if (self->_accountIdentifier)
    objc_msgSend(v36, "setAccountIdentifier:");
  if (self->_messageIdentifier)
    objc_msgSend(v36, "setMessageIdentifier:");
  if (self->_from)
    objc_msgSend(v36, "setFrom:");
  if (self->_to)
    objc_msgSend(v36, "setTo:");
  if (self->_cc)
    objc_msgSend(v36, "setCc:");
  if (self->_bcc)
    objc_msgSend(v36, "setBcc:");
  if (-[BMPBMailContentEvent headersCount](self, "headersCount"))
  {
    objc_msgSend(v36, "clearHeaders");
    v5 = -[BMPBMailContentEvent headersCount](self, "headersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BMPBMailContentEvent headersAtIndex:](self, "headersAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addHeaders:", v8);

      }
    }
  }
  if (self->_subject)
    objc_msgSend(v36, "setSubject:");
  v9 = v36;
  if (self->_htmlContentData)
  {
    objc_msgSend(v36, "setHtmlContentData:");
    v9 = v36;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v9[250] = self->_isFullyDownloaded;
    *((_WORD *)v9 + 128) |= 0x20u;
  }
  if (self->_htmlContent)
    objc_msgSend(v36, "setHtmlContent:");
  if (self->_textContent)
    objc_msgSend(v36, "setTextContent:");
  if (self->_securityMethod)
    objc_msgSend(v36, "setSecurityMethod:");
  if (-[BMPBMailContentEvent accountHandlesCount](self, "accountHandlesCount"))
  {
    objc_msgSend(v36, "clearAccountHandles");
    v10 = -[BMPBMailContentEvent accountHandlesCount](self, "accountHandlesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[BMPBMailContentEvent accountHandlesAtIndex:](self, "accountHandlesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addAccountHandles:", v13);

      }
    }
  }
  if (self->_replyTo)
    objc_msgSend(v36, "setReplyTo:");
  if (-[BMPBMailContentEvent mailboxIdentifiersCount](self, "mailboxIdentifiersCount"))
  {
    objc_msgSend(v36, "clearMailboxIdentifiers");
    v14 = -[BMPBMailContentEvent mailboxIdentifiersCount](self, "mailboxIdentifiersCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[BMPBMailContentEvent mailboxIdentifiersAtIndex:](self, "mailboxIdentifiersAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addMailboxIdentifiers:", v17);

      }
    }
  }
  if (self->_listId)
    objc_msgSend(v36, "setListId:");
  if (self->_accountType)
    objc_msgSend(v36, "setAccountType:");
  if (-[BMPBMailContentEvent attachmentsCount](self, "attachmentsCount"))
  {
    objc_msgSend(v36, "clearAttachments");
    v18 = -[BMPBMailContentEvent attachmentsCount](self, "attachmentsCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[BMPBMailContentEvent attachmentsAtIndex:](self, "attachmentsAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addAttachments:", v21);

      }
    }
  }
  if (self->_fromHandle)
    objc_msgSend(v36, "setFromHandle:");
  if (-[BMPBMailContentEvent toHandlesCount](self, "toHandlesCount"))
  {
    objc_msgSend(v36, "clearToHandles");
    v22 = -[BMPBMailContentEvent toHandlesCount](self, "toHandlesCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        -[BMPBMailContentEvent toHandlesAtIndex:](self, "toHandlesAtIndex:", n);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addToHandles:", v25);

      }
    }
  }
  if (-[BMPBMailContentEvent ccHandlesCount](self, "ccHandlesCount"))
  {
    objc_msgSend(v36, "clearCcHandles");
    v26 = -[BMPBMailContentEvent ccHandlesCount](self, "ccHandlesCount");
    if (v26)
    {
      v27 = v26;
      for (ii = 0; ii != v27; ++ii)
      {
        -[BMPBMailContentEvent ccHandlesAtIndex:](self, "ccHandlesAtIndex:", ii);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addCcHandles:", v29);

      }
    }
  }
  if (-[BMPBMailContentEvent bccHandlesCount](self, "bccHandlesCount"))
  {
    objc_msgSend(v36, "clearBccHandles");
    v30 = -[BMPBMailContentEvent bccHandlesCount](self, "bccHandlesCount");
    if (v30)
    {
      v31 = v30;
      for (jj = 0; jj != v31; ++jj)
      {
        -[BMPBMailContentEvent bccHandlesAtIndex:](self, "bccHandlesAtIndex:", jj);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addBccHandles:", v33);

      }
    }
  }
  if (self->_contentProtection)
    objc_msgSend(v36, "setContentProtection:");
  v34 = v36;
  if (self->_personaId)
  {
    objc_msgSend(v36, "setPersonaId:");
    v34 = v36;
  }
  if (self->_conversationId)
  {
    objc_msgSend(v36, "setConversationId:");
    v34 = v36;
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v34[2] = *(_QWORD *)&self->_dateReceived;
    *((_WORD *)v34 + 128) |= 2u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_75:
      if ((has & 0x80) == 0)
        goto LABEL_76;
      goto LABEL_86;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_75;
  }
  *((_DWORD *)v34 + 40) = self->_mailCategories;
  *((_WORD *)v34 + 128) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_76:
    if ((has & 0x200) == 0)
      goto LABEL_77;
    goto LABEL_87;
  }
LABEL_86:
  *((_BYTE *)v34 + 252) = self->_isNew;
  *((_WORD *)v34 + 128) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_77:
    if ((has & 0x10) == 0)
      goto LABEL_78;
    goto LABEL_88;
  }
LABEL_87:
  *((_BYTE *)v34 + 254) = self->_isTwoFactorCode;
  *((_WORD *)v34 + 128) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_78:
    if ((has & 0x40) == 0)
      goto LABEL_79;
    goto LABEL_89;
  }
LABEL_88:
  *((_BYTE *)v34 + 249) = self->_isFromMe;
  *((_WORD *)v34 + 128) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_79:
    if ((has & 0x100) == 0)
      goto LABEL_80;
    goto LABEL_90;
  }
LABEL_89:
  *((_BYTE *)v34 + 251) = self->_isJunk;
  *((_WORD *)v34 + 128) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_80:
    if ((has & 0x400) == 0)
      goto LABEL_81;
LABEL_91:
    *((_BYTE *)v34 + 255) = self->_isVIP;
    *((_WORD *)v34 + 128) |= 0x400u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_83;
    goto LABEL_82;
  }
LABEL_90:
  *((_BYTE *)v34 + 253) = self->_isRead;
  *((_WORD *)v34 + 128) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_91;
LABEL_81:
  if ((has & 8) != 0)
  {
LABEL_82:
    *((_BYTE *)v34 + 248) = self->_isFlagged;
    *((_WORD *)v34 + 128) |= 8u;
  }
LABEL_83:

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
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  id v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  id v62;
  void *v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  void *v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t ii;
  void *v75;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t jj;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  __int16 has;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v6;

  v8 = -[NSString copyWithZone:](self->_domainId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v8;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_WORD *)(v5 + 256) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_messageIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v12;

  v14 = -[NSString copyWithZone:](self->_from, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v14;

  v16 = -[NSString copyWithZone:](self->_to, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v16;

  v18 = -[NSString copyWithZone:](self->_cc, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v20 = -[NSString copyWithZone:](self->_bcc, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v22 = self->_headers;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v115 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addHeaders:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
    }
    while (v24);
  }

  v28 = -[NSString copyWithZone:](self->_subject, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v28;

  v30 = -[NSString copyWithZone:](self->_htmlContentData, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v30;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 250) = self->_isFullyDownloaded;
    *(_WORD *)(v5 + 256) |= 0x20u;
  }
  v32 = -[NSData copyWithZone:](self->_htmlContent, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v32;

  v34 = -[NSString copyWithZone:](self->_textContent, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v34;

  v36 = -[NSString copyWithZone:](self->_securityMethod, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v36;

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v38 = self->_accountHandles;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v111;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v111 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAccountHandles:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
    }
    while (v40);
  }

  v44 = -[BMPBNamedHandle copyWithZone:](self->_replyTo, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v44;

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v46 = self->_mailboxIdentifiers;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v107;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v107 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMailboxIdentifiers:", v51);

      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
    }
    while (v48);
  }

  v52 = -[BMPBNamedHandle copyWithZone:](self->_listId, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v52;

  v54 = -[NSString copyWithZone:](self->_accountType, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v54;

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v56 = self->_attachments;
  v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v103;
    do
    {
      for (m = 0; m != v58; ++m)
      {
        if (*(_QWORD *)v103 != v59)
          objc_enumerationMutation(v56);
        v61 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAttachments:", v61);

      }
      v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
    }
    while (v58);
  }

  v62 = -[BMPBNamedHandle copyWithZone:](self->_fromHandle, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v62;

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v64 = self->_toHandles;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v99;
    do
    {
      for (n = 0; n != v66; ++n)
      {
        if (*(_QWORD *)v99 != v67)
          objc_enumerationMutation(v64);
        v69 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addToHandles:", v69);

      }
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
    }
    while (v66);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v70 = self->_ccHandles;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v95;
    do
    {
      for (ii = 0; ii != v72; ++ii)
      {
        if (*(_QWORD *)v95 != v73)
          objc_enumerationMutation(v70);
        v75 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCcHandles:", v75);

      }
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
    }
    while (v72);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v76 = self->_bccHandles;
  v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v91;
    do
    {
      for (jj = 0; jj != v78; ++jj)
      {
        if (*(_QWORD *)v91 != v79)
          objc_enumerationMutation(v76);
        v81 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * jj), "copyWithZone:", a3, (_QWORD)v90);
        objc_msgSend((id)v5, "addBccHandles:", v81);

      }
      v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
    }
    while (v78);
  }

  v82 = -[NSString copyWithZone:](self->_contentProtection, "copyWithZone:", a3);
  v83 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v82;

  v84 = -[NSString copyWithZone:](self->_personaId, "copyWithZone:", a3);
  v85 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v84;

  v86 = -[NSString copyWithZone:](self->_conversationId, "copyWithZone:", a3);
  v87 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v86;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_dateReceived;
    *(_WORD *)(v5 + 256) |= 2u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_56:
      if ((has & 0x80) == 0)
        goto LABEL_57;
      goto LABEL_67;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_56;
  }
  *(_DWORD *)(v5 + 160) = self->_mailCategories;
  *(_WORD *)(v5 + 256) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_57:
    if ((has & 0x200) == 0)
      goto LABEL_58;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v5 + 252) = self->_isNew;
  *(_WORD *)(v5 + 256) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_58:
    if ((has & 0x10) == 0)
      goto LABEL_59;
    goto LABEL_69;
  }
LABEL_68:
  *(_BYTE *)(v5 + 254) = self->_isTwoFactorCode;
  *(_WORD *)(v5 + 256) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_59:
    if ((has & 0x40) == 0)
      goto LABEL_60;
    goto LABEL_70;
  }
LABEL_69:
  *(_BYTE *)(v5 + 249) = self->_isFromMe;
  *(_WORD *)(v5 + 256) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_60:
    if ((has & 0x100) == 0)
      goto LABEL_61;
    goto LABEL_71;
  }
LABEL_70:
  *(_BYTE *)(v5 + 251) = self->_isJunk;
  *(_WORD *)(v5 + 256) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_61:
    if ((has & 0x400) == 0)
      goto LABEL_62;
LABEL_72:
    *(_BYTE *)(v5 + 255) = self->_isVIP;
    *(_WORD *)(v5 + 256) |= 0x400u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      return (id)v5;
    goto LABEL_63;
  }
LABEL_71:
  *(_BYTE *)(v5 + 253) = self->_isRead;
  *(_WORD *)(v5 + 256) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_72;
LABEL_62:
  if ((has & 8) != 0)
  {
LABEL_63:
    *(_BYTE *)(v5 + 248) = self->_isFlagged;
    *(_WORD *)(v5 + 256) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueId;
  NSString *domainId;
  __int16 v7;
  NSString *accountIdentifier;
  NSString *messageIdentifier;
  NSString *from;
  NSString *to;
  NSString *cc;
  NSString *bcc;
  NSMutableArray *headers;
  NSString *subject;
  NSString *htmlContentData;
  __int16 v17;
  NSData *htmlContent;
  NSString *textContent;
  NSString *securityMethod;
  NSMutableArray *accountHandles;
  BMPBNamedHandle *replyTo;
  NSMutableArray *mailboxIdentifiers;
  BMPBNamedHandle *listId;
  NSString *accountType;
  NSMutableArray *attachments;
  BMPBNamedHandle *fromHandle;
  NSMutableArray *toHandles;
  NSMutableArray *ccHandles;
  NSMutableArray *bccHandles;
  NSString *contentProtection;
  NSString *personaId;
  NSString *conversationId;
  __int16 has;
  __int16 v35;
  BOOL v36;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_130;
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_130;
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:"))
      goto LABEL_130;
  }
  v7 = *((_WORD *)v4 + 128);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_130;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_130;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](accountIdentifier, "isEqual:"))
  {
    goto LABEL_130;
  }
  messageIdentifier = self->_messageIdentifier;
  if ((unint64_t)messageIdentifier | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](messageIdentifier, "isEqual:"))
      goto LABEL_130;
  }
  from = self->_from;
  if ((unint64_t)from | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](from, "isEqual:"))
      goto LABEL_130;
  }
  to = self->_to;
  if ((unint64_t)to | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](to, "isEqual:"))
      goto LABEL_130;
  }
  cc = self->_cc;
  if ((unint64_t)cc | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](cc, "isEqual:"))
      goto LABEL_130;
  }
  bcc = self->_bcc;
  if ((unint64_t)bcc | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](bcc, "isEqual:"))
      goto LABEL_130;
  }
  headers = self->_headers;
  if ((unint64_t)headers | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](headers, "isEqual:"))
      goto LABEL_130;
  }
  subject = self->_subject;
  if ((unint64_t)subject | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](subject, "isEqual:"))
      goto LABEL_130;
  }
  htmlContentData = self->_htmlContentData;
  if ((unint64_t)htmlContentData | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](htmlContentData, "isEqual:"))
      goto LABEL_130;
  }
  v17 = *((_WORD *)v4 + 128);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0)
      goto LABEL_130;
    if (self->_isFullyDownloaded)
    {
      if (!*((_BYTE *)v4 + 250))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 250))
    {
      goto LABEL_130;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_130;
  }
  htmlContent = self->_htmlContent;
  if ((unint64_t)htmlContent | *((_QWORD *)v4 + 17)
    && !-[NSData isEqual:](htmlContent, "isEqual:"))
  {
    goto LABEL_130;
  }
  textContent = self->_textContent;
  if ((unint64_t)textContent | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](textContent, "isEqual:"))
      goto LABEL_130;
  }
  securityMethod = self->_securityMethod;
  if ((unint64_t)securityMethod | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](securityMethod, "isEqual:"))
      goto LABEL_130;
  }
  accountHandles = self->_accountHandles;
  if ((unint64_t)accountHandles | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](accountHandles, "isEqual:"))
      goto LABEL_130;
  }
  replyTo = self->_replyTo;
  if ((unint64_t)replyTo | *((_QWORD *)v4 + 24))
  {
    if (!-[BMPBNamedHandle isEqual:](replyTo, "isEqual:"))
      goto LABEL_130;
  }
  mailboxIdentifiers = self->_mailboxIdentifiers;
  if ((unint64_t)mailboxIdentifiers | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](mailboxIdentifiers, "isEqual:"))
      goto LABEL_130;
  }
  listId = self->_listId;
  if ((unint64_t)listId | *((_QWORD *)v4 + 19))
  {
    if (!-[BMPBNamedHandle isEqual:](listId, "isEqual:"))
      goto LABEL_130;
  }
  accountType = self->_accountType;
  if ((unint64_t)accountType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](accountType, "isEqual:"))
      goto LABEL_130;
  }
  attachments = self->_attachments;
  if ((unint64_t)attachments | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](attachments, "isEqual:"))
      goto LABEL_130;
  }
  fromHandle = self->_fromHandle;
  if ((unint64_t)fromHandle | *((_QWORD *)v4 + 15))
  {
    if (!-[BMPBNamedHandle isEqual:](fromHandle, "isEqual:"))
      goto LABEL_130;
  }
  toHandles = self->_toHandles;
  if ((unint64_t)toHandles | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](toHandles, "isEqual:"))
      goto LABEL_130;
  }
  ccHandles = self->_ccHandles;
  if ((unint64_t)ccHandles | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](ccHandles, "isEqual:"))
      goto LABEL_130;
  }
  bccHandles = self->_bccHandles;
  if ((unint64_t)bccHandles | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](bccHandles, "isEqual:"))
      goto LABEL_130;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:"))
      goto LABEL_130;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](personaId, "isEqual:"))
      goto LABEL_130;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:"))
      goto LABEL_130;
  }
  has = (__int16)self->_has;
  v35 = *((_WORD *)v4 + 128);
  if ((has & 2) != 0)
  {
    if ((v35 & 2) == 0 || self->_dateReceived != *((double *)v4 + 2))
      goto LABEL_130;
  }
  else if ((v35 & 2) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 4) != 0)
  {
    if ((v35 & 4) == 0 || self->_mailCategories != *((_DWORD *)v4 + 40))
      goto LABEL_130;
  }
  else if ((v35 & 4) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x80) != 0)
  {
    if ((v35 & 0x80) == 0)
      goto LABEL_130;
    if (self->_isNew)
    {
      if (!*((_BYTE *)v4 + 252))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 252))
    {
      goto LABEL_130;
    }
  }
  else if ((v35 & 0x80) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x200) == 0)
      goto LABEL_130;
    if (self->_isTwoFactorCode)
    {
      if (!*((_BYTE *)v4 + 254))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 254))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x200) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x10) != 0)
  {
    if ((v35 & 0x10) == 0)
      goto LABEL_130;
    if (self->_isFromMe)
    {
      if (!*((_BYTE *)v4 + 249))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 249))
    {
      goto LABEL_130;
    }
  }
  else if ((v35 & 0x10) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x40) != 0)
  {
    if ((v35 & 0x40) == 0)
      goto LABEL_130;
    if (self->_isJunk)
    {
      if (!*((_BYTE *)v4 + 251))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 251))
    {
      goto LABEL_130;
    }
  }
  else if ((v35 & 0x40) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x100) == 0)
      goto LABEL_130;
    if (self->_isRead)
    {
      if (!*((_BYTE *)v4 + 253))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 253))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x100) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x400) == 0)
      goto LABEL_130;
    if (self->_isVIP)
    {
      if (!*((_BYTE *)v4 + 255))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 255))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x400) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 8) != 0)
  {
    if ((v35 & 8) != 0)
    {
      if (self->_isFlagged)
      {
        if (!*((_BYTE *)v4 + 248))
          goto LABEL_130;
      }
      else if (*((_BYTE *)v4 + 248))
      {
        goto LABEL_130;
      }
      v36 = 1;
      goto LABEL_131;
    }
LABEL_130:
    v36 = 0;
    goto LABEL_131;
  }
  v36 = (v35 & 8) == 0;
LABEL_131:

  return v36;
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
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  __int16 has;
  unint64_t v20;
  double dateReceived;
  double v22;
  long double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  uint64_t v41;
  uint64_t v42;
  NSUInteger v43;
  NSUInteger v44;
  uint64_t v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  unint64_t v52;
  NSUInteger v53;
  NSUInteger v54;

  v54 = -[NSString hash](self->_uniqueId, "hash");
  v53 = -[NSString hash](self->_domainId, "hash");
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
    v52 = v10;
  }
  else
  {
    v52 = 0;
  }
  v51 = -[NSString hash](self->_accountIdentifier, "hash");
  v50 = -[NSString hash](self->_messageIdentifier, "hash");
  v49 = -[NSString hash](self->_from, "hash");
  v48 = -[NSString hash](self->_to, "hash");
  v47 = -[NSString hash](self->_cc, "hash");
  v46 = -[NSString hash](self->_bcc, "hash");
  v45 = -[NSMutableArray hash](self->_headers, "hash");
  v44 = -[NSString hash](self->_subject, "hash");
  v43 = -[NSString hash](self->_htmlContentData, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v42 = 2654435761 * self->_isFullyDownloaded;
  else
    v42 = 0;
  v41 = -[NSData hash](self->_htmlContent, "hash");
  v40 = -[NSString hash](self->_textContent, "hash");
  v39 = -[NSString hash](self->_securityMethod, "hash");
  v38 = -[NSMutableArray hash](self->_accountHandles, "hash");
  v37 = -[BMPBNamedHandle hash](self->_replyTo, "hash");
  v36 = -[NSMutableArray hash](self->_mailboxIdentifiers, "hash");
  v35 = -[BMPBNamedHandle hash](self->_listId, "hash");
  v34 = -[NSString hash](self->_accountType, "hash");
  v11 = -[NSMutableArray hash](self->_attachments, "hash");
  v12 = -[BMPBNamedHandle hash](self->_fromHandle, "hash");
  v13 = -[NSMutableArray hash](self->_toHandles, "hash");
  v14 = -[NSMutableArray hash](self->_ccHandles, "hash");
  v15 = -[NSMutableArray hash](self->_bccHandles, "hash");
  v16 = -[NSString hash](self->_contentProtection, "hash");
  v17 = -[NSString hash](self->_personaId, "hash");
  v18 = -[NSString hash](self->_conversationId, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    dateReceived = self->_dateReceived;
    v22 = -dateReceived;
    if (dateReceived >= 0.0)
      v22 = self->_dateReceived;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((has & 4) != 0)
  {
    v25 = 2654435761 * self->_mailCategories;
    if ((has & 0x80) != 0)
    {
LABEL_23:
      v26 = 2654435761 * self->_isNew;
      if ((has & 0x200) != 0)
        goto LABEL_24;
      goto LABEL_32;
    }
  }
  else
  {
    v25 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_23;
  }
  v26 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_24:
    v27 = 2654435761 * self->_isTwoFactorCode;
    if ((has & 0x10) != 0)
      goto LABEL_25;
    goto LABEL_33;
  }
LABEL_32:
  v27 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_25:
    v28 = 2654435761 * self->_isFromMe;
    if ((has & 0x40) != 0)
      goto LABEL_26;
    goto LABEL_34;
  }
LABEL_33:
  v28 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_26:
    v29 = 2654435761 * self->_isJunk;
    if ((has & 0x100) != 0)
      goto LABEL_27;
    goto LABEL_35;
  }
LABEL_34:
  v29 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_27:
    v30 = 2654435761 * self->_isRead;
    if ((has & 0x400) != 0)
      goto LABEL_28;
LABEL_36:
    v31 = 0;
    if ((has & 8) != 0)
      goto LABEL_29;
LABEL_37:
    v32 = 0;
    return v53 ^ v54 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32;
  }
LABEL_35:
  v30 = 0;
  if ((has & 0x400) == 0)
    goto LABEL_36;
LABEL_28:
  v31 = 2654435761 * self->_isVIP;
  if ((has & 8) == 0)
    goto LABEL_37;
LABEL_29:
  v32 = 2654435761 * self->_isFlagged;
  return v53 ^ v54 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32;
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
  BMPBNamedHandle *replyTo;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  BMPBNamedHandle *listId;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  BMPBNamedHandle *fromHandle;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ii;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t jj;
  __int16 v46;
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
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 30))
    -[BMPBMailContentEvent setUniqueId:](self, "setUniqueId:");
  if (*((_QWORD *)v4 + 13))
    -[BMPBMailContentEvent setDomainId:](self, "setDomainId:");
  if ((*((_WORD *)v4 + 128) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[BMPBMailContentEvent setAccountIdentifier:](self, "setAccountIdentifier:");
  if (*((_QWORD *)v4 + 22))
    -[BMPBMailContentEvent setMessageIdentifier:](self, "setMessageIdentifier:");
  if (*((_QWORD *)v4 + 14))
    -[BMPBMailContentEvent setFrom:](self, "setFrom:");
  if (*((_QWORD *)v4 + 28))
    -[BMPBMailContentEvent setTo:](self, "setTo:");
  if (*((_QWORD *)v4 + 9))
    -[BMPBMailContentEvent setCc:](self, "setCc:");
  if (*((_QWORD *)v4 + 7))
    -[BMPBMailContentEvent setBcc:](self, "setBcc:");
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v5 = *((id *)v4 + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v72 != v8)
          objc_enumerationMutation(v5);
        -[BMPBMailContentEvent addHeaders:](self, "addHeaders:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 26))
    -[BMPBMailContentEvent setSubject:](self, "setSubject:");
  if (*((_QWORD *)v4 + 18))
    -[BMPBMailContentEvent setHtmlContentData:](self, "setHtmlContentData:");
  if ((*((_WORD *)v4 + 128) & 0x20) != 0)
  {
    self->_isFullyDownloaded = *((_BYTE *)v4 + 250);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 17))
    -[BMPBMailContentEvent setHtmlContent:](self, "setHtmlContent:");
  if (*((_QWORD *)v4 + 27))
    -[BMPBMailContentEvent setTextContent:](self, "setTextContent:");
  if (*((_QWORD *)v4 + 25))
    -[BMPBMailContentEvent setSecurityMethod:](self, "setSecurityMethod:");
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(v10);
        -[BMPBMailContentEvent addAccountHandles:](self, "addAccountHandles:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    }
    while (v12);
  }

  replyTo = self->_replyTo;
  v16 = *((_QWORD *)v4 + 24);
  if (replyTo)
  {
    if (v16)
      -[BMPBNamedHandle mergeFrom:](replyTo, "mergeFrom:");
  }
  else if (v16)
  {
    -[BMPBMailContentEvent setReplyTo:](self, "setReplyTo:");
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v17 = *((id *)v4 + 21);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v64 != v20)
          objc_enumerationMutation(v17);
        -[BMPBMailContentEvent addMailboxIdentifiers:](self, "addMailboxIdentifiers:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    }
    while (v19);
  }

  listId = self->_listId;
  v23 = *((_QWORD *)v4 + 19);
  if (listId)
  {
    if (v23)
      -[BMPBNamedHandle mergeFrom:](listId, "mergeFrom:");
  }
  else if (v23)
  {
    -[BMPBMailContentEvent setListId:](self, "setListId:");
  }
  if (*((_QWORD *)v4 + 5))
    -[BMPBMailContentEvent setAccountType:](self, "setAccountType:");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v24 = *((id *)v4 + 6);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v60 != v27)
          objc_enumerationMutation(v24);
        -[BMPBMailContentEvent addAttachments:](self, "addAttachments:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
    }
    while (v26);
  }

  fromHandle = self->_fromHandle;
  v30 = *((_QWORD *)v4 + 15);
  if (fromHandle)
  {
    if (v30)
      -[BMPBNamedHandle mergeFrom:](fromHandle, "mergeFrom:");
  }
  else if (v30)
  {
    -[BMPBMailContentEvent setFromHandle:](self, "setFromHandle:");
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v31 = *((id *)v4 + 29);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v56;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v56 != v34)
          objc_enumerationMutation(v31);
        -[BMPBMailContentEvent addToHandles:](self, "addToHandles:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * n));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
    }
    while (v33);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v36 = *((id *)v4 + 10);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v52;
    do
    {
      for (ii = 0; ii != v38; ++ii)
      {
        if (*(_QWORD *)v52 != v39)
          objc_enumerationMutation(v36);
        -[BMPBMailContentEvent addCcHandles:](self, "addCcHandles:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * ii));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
    }
    while (v38);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v41 = *((id *)v4 + 8);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v48;
    do
    {
      for (jj = 0; jj != v43; ++jj)
      {
        if (*(_QWORD *)v48 != v44)
          objc_enumerationMutation(v41);
        -[BMPBMailContentEvent addBccHandles:](self, "addBccHandles:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * jj), (_QWORD)v47);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
    }
    while (v43);
  }

  if (*((_QWORD *)v4 + 11))
    -[BMPBMailContentEvent setContentProtection:](self, "setContentProtection:");
  if (*((_QWORD *)v4 + 23))
    -[BMPBMailContentEvent setPersonaId:](self, "setPersonaId:");
  if (*((_QWORD *)v4 + 12))
    -[BMPBMailContentEvent setConversationId:](self, "setConversationId:");
  v46 = *((_WORD *)v4 + 128);
  if ((v46 & 2) != 0)
  {
    self->_dateReceived = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    v46 = *((_WORD *)v4 + 128);
    if ((v46 & 4) == 0)
    {
LABEL_105:
      if ((v46 & 0x80) == 0)
        goto LABEL_106;
      goto LABEL_116;
    }
  }
  else if ((v46 & 4) == 0)
  {
    goto LABEL_105;
  }
  self->_mailCategories = *((_DWORD *)v4 + 40);
  *(_WORD *)&self->_has |= 4u;
  v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x80) == 0)
  {
LABEL_106:
    if ((v46 & 0x200) == 0)
      goto LABEL_107;
    goto LABEL_117;
  }
LABEL_116:
  self->_isNew = *((_BYTE *)v4 + 252);
  *(_WORD *)&self->_has |= 0x80u;
  v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x200) == 0)
  {
LABEL_107:
    if ((v46 & 0x10) == 0)
      goto LABEL_108;
    goto LABEL_118;
  }
LABEL_117:
  self->_isTwoFactorCode = *((_BYTE *)v4 + 254);
  *(_WORD *)&self->_has |= 0x200u;
  v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x10) == 0)
  {
LABEL_108:
    if ((v46 & 0x40) == 0)
      goto LABEL_109;
    goto LABEL_119;
  }
LABEL_118:
  self->_isFromMe = *((_BYTE *)v4 + 249);
  *(_WORD *)&self->_has |= 0x10u;
  v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x40) == 0)
  {
LABEL_109:
    if ((v46 & 0x100) == 0)
      goto LABEL_110;
    goto LABEL_120;
  }
LABEL_119:
  self->_isJunk = *((_BYTE *)v4 + 251);
  *(_WORD *)&self->_has |= 0x40u;
  v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x100) == 0)
  {
LABEL_110:
    if ((v46 & 0x400) == 0)
      goto LABEL_111;
LABEL_121:
    self->_isVIP = *((_BYTE *)v4 + 255);
    *(_WORD *)&self->_has |= 0x400u;
    if ((*((_WORD *)v4 + 128) & 8) == 0)
      goto LABEL_113;
    goto LABEL_112;
  }
LABEL_120:
  self->_isRead = *((_BYTE *)v4 + 253);
  *(_WORD *)&self->_has |= 0x100u;
  v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x400) != 0)
    goto LABEL_121;
LABEL_111:
  if ((v46 & 8) != 0)
  {
LABEL_112:
    self->_isFlagged = *((_BYTE *)v4 + 248);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_113:

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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdentifier, a3);
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (NSString)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_storeStrong((id *)&self->_to, a3);
}

- (NSString)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
  objc_storeStrong((id *)&self->_cc, a3);
}

- (NSString)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
  objc_storeStrong((id *)&self->_bcc, a3);
}

- (NSMutableArray)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSString)htmlContentData
{
  return self->_htmlContentData;
}

- (void)setHtmlContentData:(id)a3
{
  objc_storeStrong((id *)&self->_htmlContentData, a3);
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (NSData)htmlContent
{
  return self->_htmlContent;
}

- (void)setHtmlContent:(id)a3
{
  objc_storeStrong((id *)&self->_htmlContent, a3);
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
  objc_storeStrong((id *)&self->_textContent, a3);
}

- (NSString)securityMethod
{
  return self->_securityMethod;
}

- (void)setSecurityMethod:(id)a3
{
  objc_storeStrong((id *)&self->_securityMethod, a3);
}

- (NSMutableArray)accountHandles
{
  return self->_accountHandles;
}

- (void)setAccountHandles:(id)a3
{
  objc_storeStrong((id *)&self->_accountHandles, a3);
}

- (BMPBNamedHandle)replyTo
{
  return self->_replyTo;
}

- (void)setReplyTo:(id)a3
{
  objc_storeStrong((id *)&self->_replyTo, a3);
}

- (NSMutableArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (void)setMailboxIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxIdentifiers, a3);
}

- (BMPBNamedHandle)listId
{
  return self->_listId;
}

- (void)setListId:(id)a3
{
  objc_storeStrong((id *)&self->_listId, a3);
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
  objc_storeStrong((id *)&self->_accountType, a3);
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
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

- (NSMutableArray)ccHandles
{
  return self->_ccHandles;
}

- (void)setCcHandles:(id)a3
{
  objc_storeStrong((id *)&self->_ccHandles, a3);
}

- (NSMutableArray)bccHandles
{
  return self->_bccHandles;
}

- (void)setBccHandles:(id)a3
{
  objc_storeStrong((id *)&self->_bccHandles, a3);
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

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (double)dateReceived
{
  return self->_dateReceived;
}

- (int)mailCategories
{
  return self->_mailCategories;
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

- (BOOL)isJunk
{
  return self->_isJunk;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_securityMethod, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_listId, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_ccHandles, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_bccHandles, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
}

@end
