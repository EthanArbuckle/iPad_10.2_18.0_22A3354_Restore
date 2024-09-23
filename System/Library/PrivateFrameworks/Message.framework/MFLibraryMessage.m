@implementation MFLibraryMessage

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MFLibraryMessage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (id)log_log_3;
}

void __23__MFLibraryMessage_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

- (MFLibraryMessage)initWithLibraryID:(int64_t)a3
{
  MFLibraryMessage *v4;
  uint64_t v5;
  EDPersistedMessageID *persistedMessageID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFLibraryMessage;
  v4 = -[MFLibraryMessage init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EB60]), "initWithDatabaseID:", a3);
    persistedMessageID = v4->_persistedMessageID;
    v4->_persistedMessageID = (EDPersistedMessageID *)v5;

    v4->_originalMailboxID = -1;
    v4->_mailboxID = -1;
    atomic_store(0, &v4->_conversationFlags);
    atomic_store(0, (unint64_t *)&v4->_senderBucket);
    atomic_store(0, (unsigned __int8 *)&v4->_isJournaled);
    atomic_store(0, (unint64_t *)&v4->_unsubscribeType);
  }
  return v4;
}

+ (id)messageWithLibraryID:(int64_t)a3
{
  return -[MFLibraryMessage initWithLibraryID:]([MFLibraryMessage alloc], "initWithLibraryID:", a3);
}

- (id)library
{
  void *v2;
  void *v3;

  -[MFLibraryMessage messageStore](self, "messageStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageID
{
  void *v2;
  void *v3;

  -[MFLibraryMessage persistedMessageID](self, "persistedMessageID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)persistentID
{
  void *v2;
  void *v3;

  -[MFLibraryMessage persistedMessageID](self, "persistedMessageID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)libraryID
{
  void *v2;
  int64_t v3;

  -[MFLibraryMessage persistedMessageID](self, "persistedMessageID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "databaseID");

  return v3;
}

- (EDPersistedMessageID)persistedMessageID
{
  return self->_persistedMessageID;
}

- (EMSearchableMessageID)searchableMessageID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D1EC18];
  -[MFLibraryMessage persistedMessageID](self, "persistedMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableMessageIDForPersistedMessageID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMSearchableMessageID *)v4;
}

- (NSString)notificationID
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), -[MFLibraryMessage globalMessageID](self, "globalMessageID"));
}

- (EMMessageObjectID)objectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D1E1E0];
  -[MFLibraryMessage mailbox](self, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailboxScopeForMailboxObjectIDs:forExclusion:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E258]), "initWithGlobalMessageID:mailboxScope:", -[MFLibraryMessage globalMessageID](self, "globalMessageID"), v7);
  return (EMMessageObjectID *)v8;
}

- (int64_t)mailboxID
{
  int64_t mailboxID;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  mailboxID = self->_mailboxID;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return mailboxID;
}

- (void)setMailboxID:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->_mailboxID = a3;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  if (a3 == -1)
  {
    +[MFLibraryMessage log](MFLibraryMessage, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[MFLibraryMessage ef_publicDescription](self, "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFLibraryMessage setMailboxID:].cold.1(v6, (uint64_t)v7, v5);
    }

  }
}

- (int64_t)originalMailboxID
{
  int64_t originalMailboxID;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  originalMailboxID = self->_originalMailboxID;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return originalMailboxID;
}

- (void)setOriginalMailboxID:(int64_t)a3
{
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->_originalMailboxID = a3;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
}

- (id)originalMailboxURL
{
  void *v3;
  void *v4;

  -[MFLibraryMessage library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlForMailboxID:", -[MFLibraryMessage originalMailboxID](self, "originalMailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSURL)basePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[MFLibraryMessage library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryMessage account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageBasePathForAccount:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (unint64_t)messageSize
{
  unint64_t size;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  size = self->_size;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return size;
}

- (void)setMessageSize:(unint64_t)a3
{
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->_size = a3;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
}

- (MFLibraryStore)messageStore
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFLibraryMessage;
  -[MFMailMessage messageStore](&v7, sel_messageStore);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[MFLibraryStore sharedInstance](MFLibraryStore, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (MFLibraryStore *)v5;
}

- (MFMailboxUid)mailbox
{
  void *v3;
  void *v4;

  -[MFLibraryMessage library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailboxUidForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFMailboxUid *)v4;
}

- (void)_updateUID
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = -[NSString intValue](self->_remoteID, "intValue");
  self->_uid = v3;
  if (!v3)
  {
    v4 = -[NSString rangeOfString:options:](self->_remoteID, "rangeOfString:options:", CFSTR("temp-"), 8);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSString substringWithRange:](self->_remoteID, "substringWithRange:", v4 + v5, -[NSString length](self->_remoteID, "length") - (v4 + v5));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      self->_uid = objc_msgSend(v6, "intValue");

    }
  }
}

- (void)setRemoteID:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  _MFLockGlobalLock();
  if (self->_remoteID != v5)
  {
    objc_storeStrong((id *)&self->_remoteID, a3);
    -[MFLibraryMessage _updateUID](self, "_updateUID");
  }
  _MFUnlockGlobalLock();

}

- (NSString)remoteID
{
  return self->_remoteID;
}

- (BOOL)isEqual:(id)a3
{
  MFLibraryMessage *v4;
  int64_t v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = (MFLibraryMessage *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[MFLibraryMessage libraryID](self, "libraryID");
    v6 = v5 == -[MFLibraryMessage libraryID](v4, "libraryID");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryMessage;
    v6 = -[MFLibraryMessage isEqual:](&v8, sel_isEqual_, v4);
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MFLibraryMessage persistedMessageID](self, "persistedMessageID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  void *v4;
  void *v5;

  if (self->_uid != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLibraryMessage setRemoteID:](self, "setRemoteID:", v5);

    -[MFLibraryMessage commit](self, "commit");
  }
}

- (unint64_t)uniqueRemoteId
{
  return self->_uniqueRemoteId;
}

- (void)setUniqueRemoteId:(unint64_t)a3
{
  _MFLockGlobalLock();
  if (self->_uniqueRemoteId != a3)
    self->_uniqueRemoteId = a3;
  _MFUnlockGlobalLock();
}

- (BOOL)isPartial
{
  unint64_t v3;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = (self->super._messageFlags >> 34) & 1;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setIsPartial:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[MFLibraryMessage library](self, "library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:isPartial:", self, v3);

}

- (BOOL)isMessageContentsLocallyAvailable
{
  MFLibraryMessage *v2;
  void *v3;

  v2 = self;
  -[MFLibraryMessage library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "areMessageContentsLocallyAvailable:fullContentsAvailble:", v2, 0);

  return (char)v2;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  v5 = a3 != -1;
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)v5 << 35);
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  v6.receiver = self;
  v6.super_class = (Class)MFLibraryMessage;
  -[MFLibraryMessage setPreferredEncoding:](&v6, sel_setPreferredEncoding_, v3);
}

- (BOOL)hasTemporaryUid
{
  unint64_t v3;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = HIDWORD(self->super._messageFlags) & 1;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setHasTemporaryUid:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v5 = 0x100000000;
  if (!v3)
    v5 = 0;
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFFEFFFFFFFFLL | v5;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
}

- (id)mailboxName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MFLibraryMessage library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailboxUidForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameForMailboxUid:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)compareByUidWithMessage:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  unsigned int uid;
  BOOL v9;
  _BOOL8 v10;
  int64_t v11;

  v4 = a3;
  v5 = -[MFLibraryMessage hasTemporaryUid](self, "hasTemporaryUid");
  v6 = objc_msgSend(v4, "hasTemporaryUid");
  v7 = v5 - v6;
  if (v5 == v6)
  {
    uid = self->_uid;
    v7 = uid - objc_msgSend(v4, "uid");
  }
  v9 = v7 < 0;
  v10 = v7 != 0;
  if (v9)
    v11 = -1;
  else
    v11 = v10;

  return v11;
}

- (void)setMessageFlagsWithoutCommitting:(unint64_t)a3
{
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->super._messageFlags = a3;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
}

- (void)setMessageFlags:(unint64_t)a3
{
  id v5;

  if (-[MFMailMessage messageFlags](self, "messageFlags") != a3)
  {
    -[MFLibraryMessage library](self, "library");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFlags:forMessage:", a3, self);

  }
}

- (void)setFlags:(unint64_t)a3
{
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->super._messageFlags = a3;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
}

- (void)setSummary:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFLibraryMessage;
  -[MFLibraryMessage summary](&v9, sel_summary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryMessage;
    -[MFMailMessage setSummary:](&v8, sel_setSummary_, v4);
    -[MFLibraryMessage library](self, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSummary:forMessage:", v4, self);

  }
}

- (void)commit
{
  id v3;

  -[MFLibraryMessage library](self, "library");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlags:forMessage:", -[MFMailMessage messageFlags](self, "messageFlags"), self);

}

- (void)setMutableInfoFromMessage:(id)a3
{
  id v4;

  v4 = a3;
  -[MFLibraryMessage setMessageFlagsWithoutCommitting:](self, "setMessageFlagsWithoutCommitting:", objc_msgSend(v4, "messageFlags"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryMessage;
  -[MFLibraryMessage description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ globalMessageID:%lld"), v4, -[MFLibraryMessage globalMessageID](self, "globalMessageID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_privacySafeDescription
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFLibraryMessage;
  -[MFLibraryMessage _privacySafeDescription](&v8, sel__privacySafeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFLibraryMessage libraryID](self, "libraryID");
  -[MFLibraryMessage remoteID](self, "remoteID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" libraryID:%lld remoteID:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)path
{
  void *v3;
  void *v4;

  -[MFLibraryMessage library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataPathForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dataPathForMimePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFLibraryMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataPathForMessage:part:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MailAccount)account
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MFLibraryMessage messageStore](self, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFLibraryStore sharedInstanceIfExists](MFLibraryStore, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    -[MFLibraryMessage library](self, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountForMessage:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (MailAccount *)v5;
}

- (void)markAsViewed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  MFLibraryMessage *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 1) == 0)
  {
    -[MFLibraryMessage messageStore](self, "messageStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("MessageIsRead");
    v9[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, v5);

  }
}

- (void)markAsNotViewed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  MFLibraryMessage *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 1) != 0)
  {
    -[MFLibraryMessage messageStore](self, "messageStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("MessageIsRead");
    v9[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, v5);

  }
}

- (void)markAsFlagged
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  MFLibraryMessage *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x10) == 0)
  {
    -[MFLibraryMessage messageStore](self, "messageStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("MessageIsFlagged");
    v9[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, v5);

  }
}

- (void)markAsNotFlagged
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  MFLibraryMessage *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x10) != 0)
  {
    -[MFLibraryMessage messageStore](self, "messageStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("MessageIsFlagged");
    v9[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, v5);

  }
}

- (void)markAsReplied
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  MFLibraryMessage *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 4) == 0)
  {
    -[MFLibraryMessage messageStore](self, "messageStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = CFSTR("MessageWasRepliedTo");
    v8[1] = CFSTR("MessageChangeReason");
    v9[0] = MEMORY[0x1E0C9AAB0];
    v9[1] = &unk_1E4F69AA8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, v5);

  }
}

- (void)markAsForwarded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  MFLibraryMessage *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x100) == 0)
  {
    -[MFLibraryMessage messageStore](self, "messageStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = CFSTR("MessageWasForwarded");
    v8[1] = CFSTR("MessageChangeReason");
    v9[0] = MEMORY[0x1E0C9AAB0];
    v9[1] = &unk_1E4F69AA8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, v5);

  }
}

- (id)preferredAccountToUseForReplying
{
  void *v2;
  void *v3;
  void *v4;

  -[MFLibraryMessage originalMailboxURL](self, "originalMailboxURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConversationFlags:(unint64_t)a3
{
  atomic_store(a3, &self->_conversationFlags);
}

- (unint64_t)conversationFlags
{
  return atomic_load(&self->_conversationFlags);
}

- (NSArray)senders
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[MFLibraryMessage sendersIfCached](self, "sendersIfCached");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MFLibraryMessage library](self, "library");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senderForMessageWithLibraryID:", -[MFLibraryMessage libraryID](self, "libraryID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringValue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v9[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFLibraryMessage setSender:](self, "setSender:", v3);
    }
    else
    {
      v3 = 0;
    }

  }
  return (NSArray *)v3;
}

- (void)setSenderBucket:(int64_t)a3
{
  atomic_store(a3, (unint64_t *)&self->_senderBucket);
}

- (int64_t)senderBucket
{
  return atomic_load((unint64_t *)&self->_senderBucket);
}

- (void)setIsJournaled:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_isJournaled);
}

- (BOOL)isJournaled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isJournaled);
  return v2 & 1;
}

- (void)setBrandIndicatorLocation:(id)a3 andData:(id)a4
{
  id v7;
  NSData *v8;
  NSData *brandIndicator;
  id v10;

  v10 = a3;
  v7 = a4;
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_brandIndicatorLocation, a3);
  v8 = (NSData *)objc_msgSend(v7, "copy");
  brandIndicator = self->_brandIndicator;
  self->_brandIndicator = v8;

  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
}

- (NSURL)brandIndicatorLocation
{
  NSURL *v3;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = self->_brandIndicatorLocation;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return v3;
}

- (NSData)brandIndicator
{
  NSData *v3;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = self->_brandIndicator;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setRemoteID:(id)a3 flags:(unint64_t)a4 size:(unsigned int)a5 mailboxID:(int64_t)a6 originalMailboxID:(int64_t)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (v12)
    -[MFLibraryMessage setRemoteID:](self, "setRemoteID:", v12);
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->super._messageFlags = a4;
  self->_size = a5;
  self->_mailboxID = a6;
  self->_originalMailboxID = a7;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  if (a6 == -1)
  {
    +[MFLibraryMessage log](MFLibraryMessage, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MFLibraryMessage ef_publicDescription](self, "ef_publicDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFLibraryMessage setMailboxID:].cold.1(v14, (uint64_t)v15, v13);
    }

  }
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4
{
  -[MFLibraryMessage setMessageData:isPartial:summary:](self, "setMessageData:isPartial:summary:", a3, a4, 0);
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4 summary:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  -[MFLibraryMessage messageStore](self, "messageStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setData:summary:forMessage:isPartial:", v10, v8, self, v6);

}

- (id)downloadedMessageData
{
  void *v3;
  void *v4;

  -[MFLibraryMessage library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadedMessageDataForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dataConsumerForMimePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFLibraryMessage library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataConsumerForMessage:part:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isLibraryMessage
{
  return 1;
}

- (id)storageLocationForAttachment:(id)a3
{
  id v4;
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
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;

  v4 = a3;
  -[MFLibraryMessage library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentPersistenceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attachmentMigrator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "migrateAttachmentsForMessageIfNecessary:", self);

  -[MFLibraryMessage account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageBasePathForAccount:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mimePartNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v4, "part");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "partNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v4, "mailDropMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = -[MFLibraryMessage globalMessageID](self, "globalMessageID");
        objc_msgSend(v4, "mailDropMetadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "directUrl");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "attachmentURLForGlobalMessageID:remoteURL:basePath:", v18, v20, v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
LABEL_9:
          v12 = 0;
          goto LABEL_4;
        }
        objc_msgSend(v4, "mailDropMetadata");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[MFMessageAttachmentMigrator migrateMaildropFileForMessage:mailDropMetadata:](MFMessageAttachmentMigrator, "migrateMaildropFileForMessage:mailDropMetadata:", self, v22);

        if (v23)
        {
          v24 = -[MFLibraryMessage globalMessageID](self, "globalMessageID");
          objc_msgSend(v4, "mailDropMetadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "directUrl");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "attachmentURLForGlobalMessageID:remoteURL:basePath:", v24, v26, v11);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
      }
      else
      {
        EDAttachmentsLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[MFLibraryMessage storageLocationForAttachment:].cold.1((uint64_t)v4, v28, v29);

      }
      v12 = 0;
      v15 = 0;
      goto LABEL_4;
    }
  }
  objc_msgSend(v7, "attachmentURLForGlobalMessageID:mimePartNumber:basePath:", -[MFLibraryMessage globalMessageID](self, "globalMessageID"), v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  return v15;
}

- (void)_forceLoadOfMessageSummaryFromProtectedStore
{
  void *v4;
  MFLibraryMessage *v5;
  MFLibraryMessage *v6;
  void *v7;
  id v8;

  -[MFLibraryMessage library](self, "library");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "urlForMailboxID:", -[MFLibraryMessage mailboxID](self, "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageWithLibraryID:options:inMailbox:", -[MFLibraryMessage libraryID](self, "libraryID"), 32783, v4);
  v5 = (MFLibraryMessage *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && v5 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LibraryMessage.m"), 562, CFSTR("Expected message %@ to be self %@"), v6, self);

  }
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MFLibraryMessage _forceLoadOfMessageSummaryFromProtectedStore](self, "_forceLoadOfMessageSummaryFromProtectedStore");
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  -[MFMailMessage loadCachedHeaderValuesFromHeaders:](&v5, sel_loadCachedHeaderValuesFromHeaders_, v4);

}

- (unint64_t)fileSize
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[MFLibraryMessage library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileAttributesForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileSize");

  return v5;
}

- (void)setUnsubscribeType:(int64_t)a3
{
  atomic_store(a3, (unint64_t *)&self->_unsubscribeType);
}

- (int64_t)unsubscribeType
{
  return atomic_load((unint64_t *)&self->_unsubscribeType);
}

- (NSArray)references
{
  NSArray *v3;
  objc_super v5;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = self->_references;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MFLibraryMessage;
    -[MFMailMessage references](&v5, sel_references);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setReferences:(id)a3
{
  id v5;

  v5 = a3;
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_references, a3);
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");

}

- (EMReadLater)readLater
{
  EMReadLater *v3;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = self->_readLater;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setReadLaterDate:(id)a3
{
  id v5;

  v5 = a3;
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_readLater, a3);
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");

}

- (EDAccount)accountForSender
{
  void *v2;
  void *v3;

  -[MFLibraryMessage firstSender](self, "firstSender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDAccount *)v3;
}

- (NSDate)sendLaterDate
{
  NSDate *v3;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = self->_sendLaterDate;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setSendLaterDate:(id)a3
{
  id v5;

  v5 = a3;
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_sendLaterDate, a3);
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");

}

- (EMFollowUp)followUp
{
  EMFollowUp *v3;

  -[MFLibraryMessage mf_lock](self, "mf_lock");
  v3 = self->_followUp;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setFollowUp:(id)a3
{
  id v5;

  v5 = a3;
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_followUp, a3);
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");

}

- (NSDictionary)dataDetectionAttributes
{
  NSDictionary *v3;

  if (_os_feature_enabled_impl())
  {
    if (!self->_dataDetectionAttributes)
      -[MFLibraryMessage setDataDetectionAttributes](self, "setDataDetectionAttributes");
    -[MFLibraryMessage mf_lock](self, "mf_lock");
    v3 = self->_dataDetectionAttributes;
    -[MFLibraryMessage mf_unlock](self, "mf_unlock");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setDataDetectionAttributes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (_os_feature_enabled_impl())
  {
    -[MFLibraryMessage library](self, "library");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataDetectionPersistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "getDataDetectionResultsForGlobalMessageID:", -[MFLibraryMessage globalMessageID](self, "globalMessageID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLibraryMessage mf_lock](self, "mf_lock");
    if (!self->_dataDetectionAttributes)
      objc_storeStrong((id *)&self->_dataDetectionAttributes, v5);
    -[MFLibraryMessage mf_unlock](self, "mf_unlock");

  }
}

- (ECSignatureInfo)signatureInfo
{
  return (ECSignatureInfo *)-[MFLibraryMessage signatureInfoIfDecodingIsComplete:](self, "signatureInfoIfDecodingIsComplete:", 0);
}

- (id)signatureInfoIfDecodingIsComplete:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    -[MFLibraryMessage messageBodyIfAvailableUpdatingFlags:](self, "messageBodyIfAvailableUpdatingFlags:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "topLevelPart");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isSecurePart") & 1) != 0
        && (!v3 || objc_msgSend(v6, "isDecodingComplete"))
        && (objc_msgSend(v6, "decodeIfNecessary"), objc_msgSend(v6, "isSigned")))
      {
        objc_msgSend(v6, "signatureInfo");
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

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)globalMessageID
{
  return self->_globalMessageID;
}

- (void)setGlobalMessageID:(int64_t)a3
{
  self->_globalMessageID = a3;
}

- (NSArray)remoteContentLinks
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (void)setRemoteContentLinks:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (void)setReadLater:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (void)setBrandIndicatorLocation:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorLocation, a3);
}

- (EMGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (EMCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(int64_t)a3
{
  self->_businessID = a3;
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_brandIndicator, 0);
  objc_storeStrong((id *)&self->_brandIndicatorLocation, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_dataDetectionAttributes, 0);
  objc_storeStrong((id *)&self->_remoteContentLinks, 0);
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_persistedMessageID, 0);
  objc_storeStrong((id *)&self->_remoteID, 0);
}

- (void)setMailboxID:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "No mailboxID found for %{public}@", (uint8_t *)a2);

}

- (void)storageLocationForAttachment:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "Missing either a MIME part number or Mail Drop remote URL for attachment %@", (uint8_t *)&v3);
}

@end
