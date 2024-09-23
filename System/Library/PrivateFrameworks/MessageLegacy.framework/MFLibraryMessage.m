@implementation MFLibraryMessage

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  -[MFMailMessage dealloc](&v3, sel_dealloc);
}

- (MFLibraryMessage)initWithLibraryID:(unsigned int)a3
{
  MFLibraryMessage *v4;
  MFLibraryMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFLibraryMessage;
  v4 = -[MFLibraryMessage init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_libraryID = a3;
    v4->_originalMailboxID = -1;
    v4->_mailboxID = -1;
    v4->_metadataLock = (MFLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("Metadata Lock"), 0);
  }
  return v5;
}

+ (id)messageWithLibraryID:(unsigned int)a3
{
  return -[MFLibraryMessage initWithLibraryID:]([MFLibraryMessage alloc], "initWithLibraryID:", *(_QWORD *)&a3);
}

- (id)library
{
  return (id)objc_msgSend(-[MFLibraryMessage messageStore](self, "messageStore"), "library");
}

- (id)messageID
{
  NSString **p_messageID;
  id v4;

  p_messageID = &self->_messageID;
  if (!atomic_load((unint64_t *)&self->_messageID))
  {
    v4 = (id)EFStringWithInt();
    while (!__ldaxr((unint64_t *)p_messageID))
    {
      if (!__stlxr((unint64_t)v4, (unint64_t *)p_messageID))
        return *p_messageID;
    }
    __clrex();

  }
  return *p_messageID;
}

- (unsigned)libraryID
{
  return self->_libraryID;
}

- (unsigned)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(unsigned int)a3
{
  self->_mailboxID = a3;
}

- (unsigned)originalMailboxID
{
  return self->_originalMailboxID;
}

- (void)setOriginalMailboxID:(unsigned int)a3
{
  self->_originalMailboxID = a3;
}

- (id)originalMailboxURL
{
  return (id)objc_msgSend(-[MFLibraryMessage library](self, "library"), "urlForMailboxID:", self->_originalMailboxID);
}

- (unint64_t)messageSize
{
  return self->_size;
}

- (void)setMessageSize:(unint64_t)a3
{
  self->_size = a3;
}

- (id)messageStore
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  result = -[MFMailMessage messageStore](&v3, sel_messageStore);
  if (!result)
    return +[MFLibraryStore sharedInstance](MFLibraryStore, "sharedInstance");
  return result;
}

- (id)mailbox
{
  return (id)objc_msgSend(-[MFLibraryMessage library](self, "library"), "mailboxUidForMessage:", self);
}

- (void)_updateUID
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString intValue](self->_remoteID, "intValue");
  self->_uid = v3;
  if (!v3)
  {
    v4 = -[NSString rangeOfString:options:](self->_remoteID, "rangeOfString:options:", CFSTR("temp-"), 8);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      self->_uid = -[NSString intValue](-[NSString substringWithRange:](self->_remoteID, "substringWithRange:", v4 + v5, -[NSString length](self->_remoteID, "length") - (v4 + v5)), "intValue");
  }
}

- (void)setRemoteID:(id)a3
{
  NSString *remoteID;

  _MFLockGlobalLock();
  remoteID = self->_remoteID;
  if (remoteID != a3)
  {

    self->_remoteID = (NSString *)a3;
    -[MFLibraryMessage _updateUID](self, "_updateUID");
  }
  _MFUnlockGlobalLock();
}

- (id)remoteID
{
  return self->_remoteID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int libraryID;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 == self)
    return 1;
  v10 = v3;
  v11 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    libraryID = self->_libraryID;
    return libraryID == objc_msgSend(a3, "libraryID");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MFLibraryMessage;
    return -[MFLibraryMessage isEqual:](&v9, sel_isEqual_, a3);
  }
}

- (unint64_t)hash
{
  return (0x4F1BBCD880000000 * (unint64_t)self->_libraryID) >> 32;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  if (self->_uid != a3)
  {
    -[MFLibraryMessage setRemoteID:](self, "setRemoteID:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), "stringValue"));
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
  return (BYTE4(self->super._messageFlags) >> 2) & 1;
}

- (void)setIsPartial:(BOOL)a3
{
  objc_msgSend(-[MFLibraryMessage library](self, "library"), "setMessage:isPartial:", self, a3);
}

- (BOOL)isMessageContentsLocallyAvailable
{
  return objc_msgSend(-[MFLibraryMessage library](self, "library"), "isMessageContentsLocallyAvailable:", self);
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  objc_super v3;

  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a3 != -1) << 35);
  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  -[MFLibraryMessage setPreferredEncoding:](&v3, sel_setPreferredEncoding_);
}

- (BOOL)hasTemporaryUid
{
  return BYTE4(self->super._messageFlags) & 1;
}

- (void)setHasTemporaryUid:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (id)mailboxName
{
  void *v2;

  v2 = (void *)objc_msgSend(-[MFLibraryMessage library](self, "library"), "mailboxUidForMessage:", self);
  return (id)objc_msgSend((id)objc_msgSend(v2, "account"), "nameForMailboxUid:", v2);
}

- (int64_t)compareByUidWithMessage:(id)a3
{
  int v5;
  int v6;
  int v7;
  unsigned int uid;
  BOOL v9;
  int64_t v10;

  v5 = HIDWORD(self->super._messageFlags) & 1;
  v6 = objc_msgSend(a3, "hasTemporaryUid");
  v7 = v5 - v6;
  if (v5 == v6)
  {
    uid = self->_uid;
    v7 = uid - objc_msgSend(a3, "uid");
  }
  v9 = v7 < 0;
  v10 = v7 != 0;
  if (v9)
    return -1;
  else
    return v10;
}

- (void)setMessageFlagsWithoutCommitting:(unint64_t)a3
{
  -[MFLibraryMessage mf_lock](self, "mf_lock");
  self->super._messageFlags = a3;
  -[MFLibraryMessage mf_unlock](self, "mf_unlock");
}

- (void)setMessageFlags:(unint64_t)a3
{
  if (-[MFMailMessage messageFlags](self, "messageFlags") != a3)
    objc_msgSend(-[MFLibraryMessage library](self, "library"), "setFlags:forMessage:", a3, self);
}

- (void)setFlags:(unint64_t)a3
{
  self->super._messageFlags = a3;
}

- (void)setSummary:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  -[MFMailMessage setSummary:](&v5, sel_setSummary_);
  objc_msgSend(-[MFLibraryMessage library](self, "library"), "setSummary:forMessage:", a3, self);
}

- (void)commit
{
  objc_msgSend(-[MFLibraryMessage library](self, "library"), "setFlags:forMessage:", -[MFMailMessage messageFlags](self, "messageFlags"), self);
}

- (void)setMutableInfoFromMessage:(id)a3
{
  -[MFLibraryMessage setMessageFlagsWithoutCommitting:](self, "setMessageFlagsWithoutCommitting:", objc_msgSend(a3, "messageFlags"));
}

- (id)_privacySafeDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  return (id)objc_msgSend(-[MFMailMessage _privacySafeDescription](&v3, sel__privacySafeDescription), "stringByAppendingFormat:", CFSTR(" libraryID=%u remoteID=%@"), -[MFLibraryMessage libraryID](self, "libraryID"), -[MFLibraryMessage remoteID](self, "remoteID"));
}

- (id)path
{
  return (id)objc_msgSend(-[MFLibraryMessage library](self, "library"), "dataPathForMessage:", self);
}

- (id)dataPathForMimePart:(id)a3
{
  return (id)objc_msgSend(-[MFLibraryMessage messageStore](self, "messageStore"), "dataPathForMessage:part:", self, a3);
}

- (id)account
{
  id v3;

  v3 = -[MFLibraryMessage messageStore](self, "messageStore");
  if (+[MFLibraryStore sharedInstanceIfExists](MFLibraryStore, "sharedInstanceIfExists") == v3)
    return (id)objc_msgSend(-[MFLibraryMessage library](self, "library"), "accountForMessage:", self);
  else
    return (id)objc_msgSend(v3, "account");
}

- (void)markAsViewed
{
  id v3;
  uint64_t v4;
  MFLibraryMessage *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 1) == 0)
  {
    v3 = -[MFLibraryMessage messageStore](self, "messageStore");
    v6 = CFSTR("MessageIsRead");
    v7[0] = MEMORY[0x1E0C9AAB0];
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsNotViewed
{
  id v3;
  uint64_t v4;
  MFLibraryMessage *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 1) != 0)
  {
    v3 = -[MFLibraryMessage messageStore](self, "messageStore");
    v6 = CFSTR("MessageIsRead");
    v7[0] = MEMORY[0x1E0C9AAA0];
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsFlagged
{
  id v3;
  uint64_t v4;
  MFLibraryMessage *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x10) == 0)
  {
    v3 = -[MFLibraryMessage messageStore](self, "messageStore");
    v6 = CFSTR("MessageIsFlagged");
    v7[0] = MEMORY[0x1E0C9AAB0];
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsNotFlagged
{
  id v3;
  uint64_t v4;
  MFLibraryMessage *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x10) != 0)
  {
    v3 = -[MFLibraryMessage messageStore](self, "messageStore");
    v6 = CFSTR("MessageIsFlagged");
    v7[0] = MEMORY[0x1E0C9AAA0];
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsReplied
{
  id v3;
  uint64_t v4;
  MFLibraryMessage *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 4) == 0)
  {
    v3 = -[MFLibraryMessage messageStore](self, "messageStore");
    v6 = CFSTR("MessageWasRepliedTo");
    v7[0] = MEMORY[0x1E0C9AAB0];
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsForwarded
{
  id v3;
  uint64_t v4;
  MFLibraryMessage *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x100) == 0)
  {
    v3 = -[MFLibraryMessage messageStore](self, "messageStore");
    v6 = CFSTR("MessageWasForwarded");
    v7[0] = MEMORY[0x1E0C9AAB0];
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1));
  }
}

- (id)preferredEmailAddressToReplyWith
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(+[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", objc_msgSend(-[MFLibraryMessage library](self, "library"), "urlForMailboxID:", -[MFLibraryMessage originalMailboxID](self, "originalMailboxID"))), "account");
  v4 = +[MailAccount addressesThatReceivedMessage:](MailAccount, "addressesThatReceivedMessage:", self);
  v5 = objc_msgSend(v3, "firstEmailAddress");
  if (!v5)
    goto LABEL_30;
  v6 = (void *)v5;
  if (objc_msgSend(v4, "count") && (objc_msgSend(v4, "containsObject:", v6) & 1) == 0)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "emailAddressesAndAliasesList"), "mf_uncommentedAddressList"), "mutableCopy");
    objc_msgSend(v7, "removeObject:", v6);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v8)
    {

      goto LABEL_24;
    }
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v12))
        {
          v6 = v12;
          if ((objc_msgSend(v7, "containsObject:", v12) & 1) == 0)
            v6 = (void *)objc_msgSend(v3, "defaultEmailAddress");
          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
LABEL_15:

    if (!v6)
    {
LABEL_30:
      if (objc_msgSend(-[MFLibraryMessage mailbox](self, "mailbox"), "isOutgoingMailboxUid"))
      {
        v13 = (void *)-[MFLibraryMessage senders](self, "senders");
        if (objc_msgSend(v13, "count"))
        {
          v14 = v13;
LABEL_21:
          v6 = (void *)objc_msgSend(v14, "objectAtIndex:", 0);
          goto LABEL_24;
        }
      }
      else if (objc_msgSend(v4, "count"))
      {
        v14 = v4;
        goto LABEL_21;
      }
      v6 = 0;
    }
  }
LABEL_24:
  if (objc_msgSend(v6, "isEqualToString:", objc_msgSend(v6, "mf_addressComment")))
  {
    v15 = objc_msgSend(+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v6), "fullUserName");
    if (v15)
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "mf_formattedAddressWithName:email:useQuotes:", v15, v6, 1);
  }
  return v6;
}

- (void)setConversationFlags:(unint64_t)a3
{
  self->_conversationFlags = a3;
}

- (unint64_t)conversationFlags
{
  return self->_conversationFlags;
}

- (void)setRemoteID:(const char *)a3 flags:(unint64_t)a4 size:(unsigned int)a5 mailboxID:(unsigned int)a6 originalMailboxID:(unsigned int)a7
{
  if (a3)
  {

    self->_remoteID = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
    -[MFLibraryMessage _updateUID](self, "_updateUID");
  }
  self->super._messageFlags = a4;
  self->_size = a5;
  self->_mailboxID = a6;
  self->_originalMailboxID = a7;
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4
{
  objc_msgSend(-[MFLibraryMessage library](self, "library"), "setData:forMessage:isPartial:", a3, self, a4);
}

- (id)dataConsumerForMimePart:(id)a3
{
  return (id)objc_msgSend(-[MFLibraryMessage library](self, "library"), "dataConsumerForMessage:part:", self, a3);
}

- (BOOL)isLibraryMessage
{
  return 1;
}

- (id)copyMessageInfo
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  v3 = -[MFMailMessage copyMessageInfo](&v5, sel_copyMessageInfo);
  objc_msgSend(v3, "setUid:", -[MFLibraryMessage libraryID](self, "libraryID"));
  objc_msgSend(v3, "setMailboxID:", self->_mailboxID);
  objc_msgSend(v3, "setUidIsLibraryID:", 1);
  return v3;
}

- (void)_initializeMetadata
{
  if (!self->_metadata)
  {
    self->_metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_metadataChangedKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *metadata;
  uint64_t v8;
  id v9;
  _QWORD v10[5];

  -[MFLock lock](self->_metadataLock, "lock");
  metadata = self->_metadata;
  if (!metadata)
  {
    -[MFLibraryMessage _initializeMetadata](self, "_initializeMetadata");
    metadata = self->_metadata;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](metadata, "setObject:forKeyedSubscript:", a3, a4);
  v8 = -[NSMutableSet count](self->_metadataChangedKeys, "count");
  -[NSMutableSet addObject:](self->_metadataChangedKeys, "addObject:", a4);
  -[MFLock unlock](self->_metadataLock, "unlock");
  if (!v8)
  {
    v9 = -[MFLibraryMessage library](self, "library");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__MFLibraryMessage_setMetadataValue_forKey___block_invoke;
    v10[3] = &unk_1E81CA140;
    v10[4] = self;
    objc_msgSend(v9, "updateMessage:withMetadata:", self, v10);
  }
}

void *__44__MFLibraryMessage_setMetadataValue_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "lock");
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "unlock");
  return v2;
}

- (id)metadataValueOfClass:(Class)a3 forKey:(id)a4
{
  NSMutableDictionary *metadata;
  void *v8;
  uint64_t v9;
  BOOL v10;

  -[MFLock lock](self->_metadataLock, "lock");
  metadata = self->_metadata;
  if (!metadata)
  {
    -[MFLibraryMessage _initializeMetadata](self, "_initializeMetadata");
    metadata = self->_metadata;
  }
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](metadata, "objectForKeyedSubscript:", a4);
  if (!v8)
  {
    -[MFLock unlock](self->_metadataLock, "unlock");
    v9 = objc_msgSend(-[MFLibraryMessage library](self, "library"), "metadataForMessage:ofClass:key:", self, a3, a4);
    -[MFLock lock](self->_metadataLock, "lock");
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", a4);
    if (v8)
      v10 = 1;
    else
      v10 = v9 == 0;
    if (!v10)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v9, a4);
      v8 = (void *)v9;
    }
  }
  -[MFLock unlock](self->_metadataLock, "unlock");
  return v8;
}

- (id)_attachmentStorageLocation
{
  void *v3;

  if (!objc_msgSend((id)MFUserAgent(), "isMobileMail"))
    return 0;
  v3 = (void *)objc_msgSend((id)objc_msgSend(+[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", objc_msgSend(-[MFLibraryMessage library](self, "library"), "urlForMailboxID:", -[MFLibraryMessage mailboxID](self, "mailboxID"))), "fullPath"), "stringByAppendingPathComponent:", CFSTR("Attachments"));
  -[MFLibraryMessage libraryID](self, "libraryID");
  return (id)objc_msgSend(v3, "stringByAppendingPathComponent:", EFStringWithInt());
}

- (void)_forceLoadOfMessageSummaryFromProtectedStore
{
  id v4;
  MFLibraryMessage *v5;

  v4 = -[MFLibraryMessage library](self, "library");
  v5 = (MFLibraryMessage *)objc_msgSend(v4, "messageWithLibraryID:options:inMailbox:", -[MFLibraryMessage libraryID](self, "libraryID"), 4111, objc_msgSend(v4, "urlForMailboxID:", -[MFLibraryMessage mailboxID](self, "mailboxID")));
  if (v5)
  {
    if (v5 != self)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LibraryMessage.m"), 532, CFSTR("Expected message %@ to be self %@"), v5, self);
  }
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  objc_super v5;

  -[MFLibraryMessage _forceLoadOfMessageSummaryFromProtectedStore](self, "_forceLoadOfMessageSummaryFromProtectedStore");
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  -[MFMailMessage loadCachedHeaderValuesFromHeaders:](&v5, sel_loadCachedHeaderValuesFromHeaders_, a3);
}

@end
