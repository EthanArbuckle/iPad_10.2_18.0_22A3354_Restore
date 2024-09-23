@implementation NNMKMessage

- (NSString)mailboxId
{
  __CFString *mailboxId;

  mailboxId = (__CFString *)self->_mailboxId;
  if (!mailboxId)
    mailboxId = CFSTR("-1");
  return (NSString *)mailboxId;
}

- (BOOL)checkState:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "checkStatus:stateToCheck:", -[NNMKMessage status](self, "status"), a3);
}

+ (BOOL)checkStatus:(unint64_t)a3 stateToCheck:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

+ (id)stringFromMailboxItemState:(unint64_t)a3
{
  void *v4;
  uint64_t i;
  const __CFString *v6;

  v4 = (void *)objc_opt_new();
  for (i = 0; i != 2048; ++i)
  {
    if (!+[NNMKMessage checkStatus:stateToCheck:](NNMKMessage, "checkStatus:stateToCheck:", a3, i))
      continue;
    if ((int)i > 31)
    {
      if ((int)i > 255)
      {
        switch((_DWORD)i)
        {
          case 0x400:
            v6 = CFSTR("archived");
            break;
          case 0x200:
            v6 = CFSTR("deleted");
            break;
          case 0x100:
            v6 = CFSTR("junk");
            break;
          default:
            continue;
        }
      }
      else
      {
        switch((_DWORD)i)
        {
          case 0x20:
            v6 = CFSTR("includesMe");
            break;
          case 0x40:
            v6 = CFSTR("vipSender");
            break;
          case 0x80:
            v6 = CFSTR("notify");
            break;
          default:
            continue;
        }
      }
    }
    else
    {
      v6 = CFSTR("none");
      switch((int)i)
      {
        case 0:
          break;
        case 1:
          v6 = CFSTR("unread");
          break;
        case 2:
          v6 = CFSTR("replied");
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          continue;
        case 4:
          v6 = CFSTR("forwarded");
          break;
        case 8:
          v6 = CFSTR("flagged");
          break;
        default:
          if ((_DWORD)i != 16)
            continue;
          v6 = CFSTR("hasAttachments");
          break;
      }
    }
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), v6);
    else
      objc_msgSend(v4, "appendString:", v6);
  }
  return v4;
}

- (void)addState:(unint64_t)a3
{
  -[NNMKMessage setStatus:](self, "setStatus:", -[NNMKMessage status](self, "status") | a3);
}

- (void)removeState:(unint64_t)a3
{
  if (-[NNMKMessage checkState:](self, "checkState:"))
    -[NNMKMessage setStatus:](self, "setStatus:", -[NNMKMessage status](self, "status") ^ a3);
}

+ (unint64_t)removeState:(unint64_t)a3 fromStatus:(unint64_t)a4
{
  unint64_t v6;

  if (objc_msgSend(a1, "checkStatus:stateToCheck:", a4, a3))
    v6 = a3;
  else
    v6 = 0;
  return v6 ^ a4;
}

+ (unint64_t)addState:(unint64_t)a3 toStatus:(unint64_t)a4
{
  return a4 | a3;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
  self->_visibleStatus = a3;
}

+ (BOOL)messageHasMultipleRecipients:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "to");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v3, "cc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = (unint64_t)(objc_msgSend(v6, "count") + v5) > 1;
  return (char)v3;
}

+ (BOOL)isMessageURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("x-apple-mail")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("x-apple-mail-message-attachment"));

  }
  return v5;
}

+ (id)URLForMessageId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("x-apple-mail"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)URLForMessageId:(id)a3 attachmentID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BDD1808];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setScheme:", CFSTR("x-apple-mail-message-attachment"));
  objc_msgSend(v8, "setHost:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("/%@"), v6);
  objc_msgSend(v8, "setPath:", v9);

  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)messageIdForURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("x-apple-mail"));

  if (v5)
  {
    objc_msgSend(v3, "resourceSpecifier");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("x-apple-mail-message-attachment"));

    if (!v8)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "host");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
LABEL_7:

  return v9;
}

+ (id)attachmentIdForURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("x-apple-mail-message-attachment"));

  if (v5)
  {
    objc_msgSend(v3, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)generateMessageHashForMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  unint64_t v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  const char *v26;
  CC_LONG v27;
  id v28;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "to");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "to");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v3, "to");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("#"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = &stru_24F9F9D80;
    }

  }
  else
  {
    v7 = &stru_24F9F9D80;
  }

  objc_msgSend(v3, "cc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v3, "cc");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v3, "cc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("#"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = &stru_24F9F9D80;
    }

  }
  else
  {
    v11 = &stru_24F9F9D80;
  }

  objc_msgSend(v3, "bcc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v3, "bcc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v3, "bcc");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("#"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = &stru_24F9F9D80;
    }

  }
  else
  {
    v15 = &stru_24F9F9D80;
  }

  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "mailboxId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "from");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateSent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v21 = (unint64_t)v20;
  objc_msgSend(v3, "dateReceived");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@#%@#%@#%@#%@#%lu#%lu"), v17, v18, v7, v11, v15, v21, (unint64_t)v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_retainAutorelease(v24);
  v26 = (const char *)objc_msgSend(v25, "UTF8String");
  v27 = strlen(v26);
  CC_SHA256(v26, v27, md);
  v28 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  for (i = 0; i != 32; ++i)
    objc_msgSend(v28, "appendFormat:", CFSTR("%02x"), md[i]);

  return v28;
}

+ (id)generateNotificationIdWithFolderId:(id)a3 remoteId:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@;%@"), a3, a4);
}

+ (id)generateConversationIdWithAccountId:(id)a3 conversationId:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKMessage)initWithCoder:(id)a3
{
  id v4;
  NNMKMessage *v5;
  uint64_t v6;
  NSString *subject;
  uint64_t v8;
  NSDate *dateReceived;
  uint64_t v10;
  NSString *preview;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *mailboxId;
  uint64_t v17;
  NSString *messageId;
  uint64_t v19;
  NSString *serverId;
  uint64_t v21;
  NSString *accountId;
  uint64_t v23;
  NSString *conversationId;
  uint64_t v25;
  NSString *from;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *to;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *cc;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *bcc;
  uint64_t v42;
  NSDate *dateSent;
  uint64_t v44;
  NSString *messageIdHeader;
  uint64_t v46;
  NSString *notificationMessageId;
  uint64_t v48;
  NSString *publisherBulletinId;
  void *v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)NNMKMessage;
  v5 = -[NNMKMessage init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySubject"));
    v6 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyDateReceived"));
    v8 = objc_claimAutoreleasedReturnValue();
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyPreview"));
    v10 = objc_claimAutoreleasedReturnValue();
    preview = v5->_preview;
    v5->_preview = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyStatusVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_statusVersion = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_source = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMailboxId"));
    v15 = objc_claimAutoreleasedReturnValue();
    mailboxId = v5->_mailboxId;
    v5->_mailboxId = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMessageId"));
    v17 = objc_claimAutoreleasedReturnValue();
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyServerId"));
    v19 = objc_claimAutoreleasedReturnValue();
    serverId = v5->_serverId;
    v5->_serverId = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyAccountId"));
    v21 = objc_claimAutoreleasedReturnValue();
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyConversationId"));
    v23 = objc_claimAutoreleasedReturnValue();
    conversationId = v5->_conversationId;
    v5->_conversationId = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFrom"));
    v25 = objc_claimAutoreleasedReturnValue();
    from = v5->_from;
    v5->_from = (NSString *)v25;

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("kNSCodingKeyTo"));
    v30 = objc_claimAutoreleasedReturnValue();
    to = v5->_to;
    v5->_to = (NSArray *)v30;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("kNSCodingKeyCC"));
    v35 = objc_claimAutoreleasedReturnValue();
    cc = v5->_cc;
    v5->_cc = (NSArray *)v35;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("kNSCodingKeyBCC"));
    v40 = objc_claimAutoreleasedReturnValue();
    bcc = v5->_bcc;
    v5->_bcc = (NSArray *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyDateSent"));
    v42 = objc_claimAutoreleasedReturnValue();
    dateSent = v5->_dateSent;
    v5->_dateSent = (NSDate *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMessageIdHeader"));
    v44 = objc_claimAutoreleasedReturnValue();
    messageIdHeader = v5->_messageIdHeader;
    v5->_messageIdHeader = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyNotificationMessageId"));
    v46 = objc_claimAutoreleasedReturnValue();
    notificationMessageId = v5->_notificationMessageId;
    v5->_notificationMessageId = (NSString *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyPublishedBulletinId"));
    v48 = objc_claimAutoreleasedReturnValue();
    publisherBulletinId = v5->_publisherBulletinId;
    v5->_publisherBulletinId = (NSString *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyReplaceStandaloneNotification"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_replaceStandaloneNotification = objc_msgSend(v50, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subject;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  subject = self->_subject;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subject, CFSTR("kNSCodingKeySubject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateReceived, CFSTR("kNSCodingKeyDateReceived"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preview, CFSTR("kNSCodingKeyPreview"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_status);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeyStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_statusVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("kNSCodingKeyStatusVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_source);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("kNSCodingKeySource"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_messageId, CFSTR("kNSCodingKeyMessageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverId, CFSTR("kNSCodingKeyServerId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mailboxId, CFSTR("kNSCodingKeyMailboxId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountId, CFSTR("kNSCodingKeyAccountId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationId, CFSTR("kNSCodingKeyConversationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_from, CFSTR("kNSCodingKeyFrom"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_to, CFSTR("kNSCodingKeyTo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cc, CFSTR("kNSCodingKeyCC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bcc, CFSTR("kNSCodingKeyBCC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateSent, CFSTR("kNSCodingKeyDateSent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageIdHeader, CFSTR("kNSCodingKeyMessageIdHeader"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationMessageId, CFSTR("kNSCodingKeyNotificationMessageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publisherBulletinId, CFSTR("kNSCodingKeyPublishedBulletinId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_replaceStandaloneNotification);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("kNSCodingKeyReplaceStandaloneNotification"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NNMKMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = objc_alloc_init(NNMKMessage);
  -[NNMKMessage subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[NNMKMessage setSubject:](v4, "setSubject:", v6);

  -[NNMKMessage dateReceived](self, "dateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[NNMKMessage setDateReceived:](v4, "setDateReceived:", v8);

  -[NNMKMessage preview](self, "preview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[NNMKMessage setPreview:](v4, "setPreview:", v10);

  -[NNMKMessage setStatus:](v4, "setStatus:", -[NNMKMessage status](self, "status"));
  -[NNMKMessage setStatusVersion:](v4, "setStatusVersion:", -[NNMKMessage statusVersion](self, "statusVersion"));
  -[NNMKMessage messageId](self, "messageId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[NNMKMessage setMessageId:](v4, "setMessageId:", v12);

  -[NNMKMessage serverId](self, "serverId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[NNMKMessage setServerId:](v4, "setServerId:", v14);

  -[NNMKMessage mailboxId](self, "mailboxId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[NNMKMessage setMailboxId:](v4, "setMailboxId:", v16);

  -[NNMKMessage accountId](self, "accountId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[NNMKMessage setAccountId:](v4, "setAccountId:", v18);

  -[NNMKMessage conversationId](self, "conversationId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[NNMKMessage setConversationId:](v4, "setConversationId:", v20);

  -[NNMKMessage from](self, "from");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[NNMKMessage setFrom:](v4, "setFrom:", v22);

  -[NNMKMessage to](self, "to");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[NNMKMessage setTo:](v4, "setTo:", v24);

  -[NNMKMessage cc](self, "cc");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  -[NNMKMessage setCc:](v4, "setCc:", v26);

  -[NNMKMessage bcc](self, "bcc");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  -[NNMKMessage setBcc:](v4, "setBcc:", v28);

  -[NNMKMessage dateSent](self, "dateSent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  -[NNMKMessage setDateSent:](v4, "setDateSent:", v30);

  -[NNMKMessage messageIdHeader](self, "messageIdHeader");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[NNMKMessage setMessageIdHeader:](v4, "setMessageIdHeader:", v32);

  -[NNMKMessage notificationMessageId](self, "notificationMessageId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  -[NNMKMessage setNotificationMessageId:](v4, "setNotificationMessageId:", v34);

  -[NNMKMessage setIsSpecialMailboxSpecific:](v4, "setIsSpecialMailboxSpecific:", -[NNMKMessage isSpecialMailboxSpecific](self, "isSpecialMailboxSpecific"));
  -[NNMKMessage setIsThreadSpecific:](v4, "setIsThreadSpecific:", -[NNMKMessage isThreadSpecific](self, "isThreadSpecific"));
  -[NNMKMessage setSource:](v4, "setSource:", -[NNMKMessage source](self, "source"));
  -[NNMKMessage publisherBulletinId](self, "publisherBulletinId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMessage setPublisherBulletinId:](v4, "setPublisherBulletinId:", v35);

  -[NNMKMessage setReplaceStandaloneNotification:](v4, "setReplaceStandaloneNotification:", -[NNMKMessage replaceStandaloneNotification](self, "replaceStandaloneNotification"));
  return v4;
}

- (NSString)description
{
  void *v3;
  NSString *conversationId;
  NSString *from;
  NSString *subject;
  NSDate *dateReceived;
  NSString *messageId;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  conversationId = self->_conversationId;
  from = self->_from;
  subject = self->_subject;
  dateReceived = self->_dateReceived;
  messageId = self->_messageId;
  +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", self->_status);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Message Id: %@\nConversation Id: %@\nFrom: %@\nSubject: %@\nDate Received: %@\nStatus: %@\n, status version: %lu\n, mailbox id: %@"), messageId, conversationId, from, subject, dateReceived, v9, self->_statusVersion, self->_mailboxId);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (id)messageIdsFromMessages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "messageId", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)serverIdsFromMessages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "serverId", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "serverId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)serverId
{
  return self->_serverId;
}

- (void)setServerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setMailboxId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)messageIdHeader
{
  return self->_messageIdHeader;
}

- (void)setMessageIdHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)notificationMessageId
{
  return self->_notificationMessageId;
}

- (void)setNotificationMessageId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)publisherBulletinId
{
  return self->_publisherBulletinId;
}

- (void)setPublisherBulletinId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(unint64_t)a3
{
  self->_statusVersion = a3;
}

- (BOOL)isThreadSpecific
{
  return self->_isThreadSpecific;
}

- (void)setIsThreadSpecific:(BOOL)a3
{
  self->_isThreadSpecific = a3;
}

- (unint64_t)isSpecialMailboxSpecific
{
  return self->_isSpecialMailboxSpecific;
}

- (void)setIsSpecialMailboxSpecific:(unint64_t)a3
{
  self->_isSpecialMailboxSpecific = a3;
}

- (unint64_t)visibleStatus
{
  return self->_visibleStatus;
}

- (void)setVisibleStatus:(unint64_t)a3
{
  self->_visibleStatus = a3;
}

- (BOOL)replaceStandaloneNotification
{
  return self->_replaceStandaloneNotification;
}

- (void)setReplaceStandaloneNotification:(BOOL)a3
{
  self->_replaceStandaloneNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherBulletinId, 0);
  objc_storeStrong((id *)&self->_notificationMessageId, 0);
  objc_storeStrong((id *)&self->_messageIdHeader, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_serverId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

@end
