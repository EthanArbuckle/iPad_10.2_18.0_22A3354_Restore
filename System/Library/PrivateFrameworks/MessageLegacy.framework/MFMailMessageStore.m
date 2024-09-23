@implementation MFMailMessageStore

+ (BOOL)createEmptyStoreIfNeededForPath:(id)a3
{
  char v6;

  v6 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v6) & 1) != 0)
    return v6 != 0;
  else
    return objc_msgSend(a1, "createEmptyStoreForPath:", a3);
}

+ (BOOL)createEmptyStoreForPath:(id)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[MFMailMessageStore createEmptyStoreForPath:]", "MailMessageStore.m", 168, "0");
}

+ (BOOL)storeAtPathIsWritable:(id)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[MFMailMessageStore storeAtPathIsWritable:]", "MailMessageStore.m", 176, "0");
}

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

- (MFMailMessageStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4
{
  MFMailMessageStore *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFMailMessageStore;
  v6 = -[MFMailMessageStore init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a3, "fullPath");
    v8 = (void *)objc_msgSend(a3, "account");
    if (objc_msgSend((id)objc_opt_class(), "createEmptyStoreIfNeededForPath:", v7))
    {
      if (a4)
        v9 = 1;
      else
        v9 = objc_msgSend((id)objc_opt_class(), "storeAtPathIsWritable:", v7) ^ 1;
      v6->_flags = ($835FD4CD3CFECF79DE90309A635A882F)(*(_DWORD *)&v6->_flags & 0xFFFFFFFE | v9);
      v6->_account = (MailAccount *)v8;
      v6->_mailboxUid = (MFMailboxUid *)a3;
      *(_DWORD *)&v6->_flags |= 0x100u;
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 100);
      *(Class *)((char *)&v6->super.super.isa + (int)*MEMORY[0x1E0D461D8]) = (Class)v10;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  MFActivityMonitor *v3;
  objc_super v4;

  v3 = self->_openMonitor;
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageStore;
  -[MFMailMessageStore dealloc](&v4, sel_dealloc);
}

- (void)openAsynchronously
{
  MFMonitoredInvocation *v3;

  _MFLockGlobalLock();
  if ((self->_state | 4) == 4)
  {
    self->_state = 1;
    if (!openAsynchronously__openMailboxesQueue)
    {
      openAsynchronously__openMailboxesQueue = objc_alloc_init(MFInvocationQueue);
      objc_msgSend((id)openAsynchronously__openMailboxesQueue, "setMaxThreadCount:", 3);
    }
    _MFUnlockGlobalLock();
    v3 = +[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", sel_openSynchronously, self, 0, 10, 1);
    objc_msgSend((id)openAsynchronously__openMailboxesQueue, "addInvocation:", v3);
    -[MFMailMessageStore mf_lock](self, "mf_lock");

    self->_openMonitor = -[MFMonitoredInvocation monitor](v3, "monitor");
    -[MFMailMessageStore mf_unlock](self, "mf_unlock");
  }
  else
  {
    _MFUnlockGlobalLock();
  }
}

- (void)openSynchronously
{
  -[MFMailMessageStore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMailMessageStore openSynchronously]", "MailMessageStore.m", 263, "0");
}

- (void)didOpen
{
  -[MFMailMessageStore mf_lock](self, "mf_lock");

  self->_openMonitor = 0;
  -[MFMailMessageStore mf_unlock](self, "mf_unlock");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreDidOpen"), self, 0);
}

- (void)cancelOpen
{
  -[MFMailMessageStore mf_lock](self, "mf_lock");
  -[MFActivityMonitor cancel](self->_openMonitor, "cancel");
  -[MFMailMessageStore mf_unlock](self, "mf_unlock");
}

- (void)writeUpdatedMessageDataToDisk
{
  -[MFMailMessageStore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMailMessageStore writeUpdatedMessageDataToDisk]", "MailMessageStore.m", 289, "0");
}

- (id)account
{
  return self->_account;
}

- (id)mailboxUid
{
  return self->_mailboxUid;
}

- (BOOL)isOpened
{
  return self->_state == 3;
}

- (id)storePathRelativeToAccount
{
  return -[MFMailboxUid accountRelativePath](self->_mailboxUid, "accountRelativePath");
}

- (id)displayName
{
  id v3;
  void *v4;
  id v5;

  v3 = -[MFMailMessageStore account](self, "account");
  v4 = (void *)objc_msgSend(v3, "displayName");
  v5 = -[MFMailboxUid accountRelativePath](self->_mailboxUid, "accountRelativePath");
  if ((v4 && !objc_msgSend(v4, "isEqualToString:", &stru_1E81CBE50)
     || (v4 = (void *)objc_msgSend(v3, "hostname")) != 0)
    && (objc_msgSend(v4, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
  {
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("MAILBOX_DISPLAY_FORMAT"), (uint64_t)CFSTR("%@ --- %@"), 0), v5, v4);
  }
  else
  {
    return v5;
  }
}

- (BOOL)isReadOnly
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p (uid=%@)>"), objc_opt_class(), self, self->_mailboxUid);
}

- (BOOL)isDrafts
{
  return -[MFMailboxUid type](self->_mailboxUid, "type") == 5;
}

- (void)messageFlagsDidChange:(id)a3 flags:(id)a4
{
  uint64_t v5;

  if (a3)
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("messages"), a4, CFSTR("flags"), 0);
  else
    v5 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessageFlagsChanged"), self, v5);
}

- (void)allMessageFlagsDidChange:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("flags");
  v6[0] = a3;
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessageFlagsChanged"), self, v4);
}

- (void)structureDidChange
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("MailMessageStoreStructureChanged"), self);
}

- (void)messagesWereAdded:(id)a3
{
  -[MFMailMessageStore messagesWereAdded:earliestReceivedDate:](self, "messagesWereAdded:earliestReceivedDate:", a3, objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"));
}

- (void)messagesWereCompacted:(id)a3
{
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = CFSTR("messages");
    v7[0] = a3;
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessagesRemoved"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  }
}

- (void)messagesWillBeCompacted:(id)a3
{
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = CFSTR("messages");
    v7[0] = a3;
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessagesWillBeCompacted"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  }
}

- (void)deletedCount:(unint64_t *)a3 andSize:(unint64_t *)a4
{
  *a3 = self->_deletedMessageCount;
  *a4 = self->_deletedMessagesSize;
}

- (unint64_t)totalCount
{
  return 0;
}

- (unint64_t)nonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  return -[MFMailMessageStore totalCount](self, "totalCount", a3, a4) - self->_deletedMessageCount;
}

- (unint64_t)serverMessageCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  return 0;
}

- (unint64_t)serverUnreadCount
{
  unint64_t v3;

  v3 = -[MFMailMessageStore serverUnreadOnlyOnServerCount](self, "serverUnreadOnlyOnServerCount");
  return -[MFMailMessageStore unreadCount](self, "unreadCount") + v3;
}

- (unint64_t)serverNonDeletedCount
{
  unint64_t v3;

  v3 = -[MFMailMessageStore serverUnreadOnlyOnServerCount](self, "serverUnreadOnlyOnServerCount");
  return -[MFMailMessageStore nonDeletedCountIncludingServerSearch:andThreadSearch:](self, "nonDeletedCountIncludingServerSearch:andThreadSearch:", 0, 0)+ v3;
}

- (BOOL)hasMoreFetchableMessages
{
  unint64_t v3;

  v3 = -[MFMailMessageStore serverMessageCount](self, "serverMessageCount");
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && v3 > -[MFMailMessageStore allNonDeletedCountIncludingServerSearch:andThreadSearch:](self, "allNonDeletedCountIncludingServerSearch:andThreadSearch:", 0, 0);
}

- (BOOL)shouldGrowFetchWindow
{
  _BOOL4 v3;
  unint64_t v4;

  v3 = -[MFMailMessageStore hasMoreFetchableMessages](self, "hasMoreFetchableMessages");
  if (v3)
  {
    v4 = -[MFMailMessageStore serverMessageCount](self, "serverMessageCount");
    LOBYTE(v3) = v4 > -[MFMailMessageStore fetchWindow](self, "fetchWindow");
  }
  return v3;
}

- (unint64_t)growFetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)fetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)fetchWindowCap
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)unreadCount
{
  return self->_unreadMessageCount;
}

- (unint64_t)unreadCountMatchingCriterion:(id)a3
{
  return 0;
}

- (BOOL)hasMessageForAccount:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[MFMailMessageStore account](self, "account") == a3)
    return 1;
  v5 = -[MFMailMessageStore copyOfAllMessagesWithOptions:](self, "copyOfAllMessagesWithOptions:", 128);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (+[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)) == a3)
        {
          v10 = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)indexOfMessage:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)copyOfAllMessages
{
  return 0;
}

- (id)copyOfMessagesInRange:(_NSRange)a3
{
  return 0;
}

- (id)mutableCopyOfAllMessages
{
  return 0;
}

- (id)copyMessagesMatchingText:(id)a3
{
  return -[MFMailMessageStore copyMessagesMatchingText:options:](self, "copyMessagesMatchingText:options:", a3, 0);
}

- (id)copyMessagesMatchingText:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  return 0;
}

- (BOOL)canFetchSearchResults
{
  return 0;
}

- (int64_t)fetchMessagesMatchingCriterion:(id)a3 limit:(unsigned int)a4
{
  return -1;
}

- (id)storeSearchResultMatchingCriterion:(id)a3 limit:(unsigned int)a4 offset:(id)a5 error:(id *)a6
{
  if (a6)
    *a6 = 0;
  return 0;
}

- (id)storeSearchResultMatchingSearchText:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 error:(id *)a7
{
  if (a4)
    return -[MFMailMessageStore storeSearchResultMatchingCriterion:limit:offset:error:](self, "storeSearchResultMatchingCriterion:limit:offset:error:", a4, *(_QWORD *)&a5, a6, a7);
  else
    return 0;
}

- (id)remoteIDsFromUniqueRemoteIDs:(id)a3
{
  return 0;
}

- (BOOL)canFetchMessageIDs
{
  return 0;
}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  return -1;
}

- (int64_t)fetchMessagesWithRemoteIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  return -1;
}

- (id)_defaultRouterDestination
{
  return self->_mailboxUid;
}

- (id)finishRoutingMessages:(id)a3 routed:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7 - 1;
    do
    {
      if ((objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v8), "messageFlags") & 2) != 0)
        objc_msgSend(v6, "removeObjectAtIndex:", v8);
      --v8;
    }
    while (v8 != -1);
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = -[MFMailMessageStore _defaultRouterDestination](self, "_defaultRouterDestination");
    if (v9)
    {
      v10 = v9;
      if ((objc_msgSend(v9, "isEqual:", -[MFMailMessageStore mailboxUid](self, "mailboxUid")) & 1) == 0)
      {
        v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "account"), "storeForMailboxUid:", v10);
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v11)
        {
          objc_msgSend(v11, "appendMessages:unsuccessfulOnes:", v6, v12);
          v13 = objc_msgSend(v6, "count");
          if (a4)
            v14 = (id)objc_msgSend(a4, "mutableCopy");
          else
            v14 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          a4 = v14;
          if (v13)
          {
            v15 = v13 - 1;
            do
            {
              v16 = objc_msgSend(v6, "objectAtIndex:", v15);
              if (objc_msgSend(v12, "indexOfObjectIdenticalTo:", v16) == 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(a4, "addObject:", v16);
              --v15;
            }
            while (v15 != -1);
          }
          -[MFMailMessageStore deleteMessages:moveToTrash:](self, "deleteMessages:moveToTrash:", v6, 0);
        }

      }
    }
  }

  return a4;
}

- (BOOL)canCompact
{
  return (*(_DWORD *)&self->_flags & 1) == 0 && self->_deletedMessageCount && (*(_DWORD *)&self->_flags & 8) == 0;
}

- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[4];

  v4 = a4;
  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C9AAB0];
  v25[0] = CFSTR("MessageIsDeleted");
  v25[1] = CFSTR("MessageIsRead");
  v26[0] = MEMORY[0x1E0C9AAB0];
  v26[1] = MEMORY[0x1E0C9AAB0];
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  if (v4)
  {
    v9 = -[MailAccount storeForMailboxUid:](self->_account, "storeForMailboxUid:", -[MailAccount mailboxUidOfType:createIfNeeded:](self->_account, "mailboxUidOfType:createIfNeeded:", 3, 1));
    if (v9)
    {
      v10 = v9;
      v23 = CFSTR("MessageIsRead");
      v24 = v7;
      -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1), a3);
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v10, "mf_lock");
      objc_msgSend(v10, "appendMessages:unsuccessfulOnes:", a3, v11);
      objc_msgSend(v10, "mf_unlock");
      if (objc_msgSend(v11, "count"))
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v19 != v15)
                objc_enumerationMutation(a3);
              v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              if (objc_msgSend(v11, "indexOfObjectIdenticalTo:", v17) == 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v12, "addObject:", v17);
            }
            v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v14);
        }
        -[MFMailMessageStore setFlag:state:forMessages:](self, "setFlag:state:forMessages:", CFSTR("MessageIsDeleted"), 0, v11);
        a3 = v12;
      }

    }
  }
  -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", v8, a3);
}

- (void)undeleteMessages:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = CFSTR("MessageIsDeleted");
    v4[0] = MEMORY[0x1E0C9AAA0];
    -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1), a3);
  }
}

- (BOOL)allowsAppend
{
  return 0;
}

+ (id)copyMessages:(id)a3 toMailbox:(id)a4 markAsRead:(BOOL)a5 deleteOriginals:(BOOL)a6 isDeletion:(BOOL)a7
{
  id v14;
  id v15;
  double Current;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  NSObject *v24;
  MFMessageTransferResult *v25;
  _QWORD v27[9];
  BOOL v28;
  BOOL v29;
  BOOL v30;
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MailMessageStore.m"), 705, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messages"));
    if (a4)
      goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MailMessageStore.m"), 706, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationMailbox"));
LABEL_3:
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  Current = CFAbsoluteTimeGetCurrent();
  v37[0] = CFSTR("MessageIsDeleted");
  v37[1] = CFSTR("MessageIsRead");
  v38[0] = MEMORY[0x1E0C9AAB0];
  v38[1] = MEMORY[0x1E0C9AAB0];
  v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v18 = objc_msgSend(a4, "store");
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = v19;
  if (v18)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __83__MFMailMessageStore_copyMessages_toMailbox_markAsRead_deleteOriginals_isDeletion___block_invoke;
    v27[3] = &unk_1E81CA600;
    v28 = a6;
    v29 = a5;
    v27[4] = a4;
    v27[5] = v15;
    v27[6] = v18;
    v27[7] = v17;
    v30 = a7;
    v27[8] = v19;
    objc_msgSend(a3, "mf_enumerateByStoreUsingBlock:", v27);
  }
  else
  {
    objc_msgSend(v19, "addObjectsFromArray:", a3);
  }
  v21 = objc_msgSend(v20, "count");
  objc_msgSend(v14, "addObjectsFromArray:", v20);

  v22 = CFAbsoluteTimeGetCurrent();
  v23 = objc_msgSend(a3, "count");
  v24 = MFLogGeneral();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v32 = v23;
    v33 = 2048;
    v34 = v22 - Current;
    v35 = 2048;
    v36 = (v22 - Current) / (double)v23;
    _os_log_debug_impl(&dword_1C8839000, v24, OS_LOG_TYPE_DEBUG, "[LogMessageTransferTimes] Transferring %lu messages took %4.5f seconds (%4.5f s/msg).", buf, 0x20u);
  }
  v25 = -[MFMessageTransferResult initWithResultCode:failedMessages:transferedMessage:]([MFMessageTransferResult alloc], "initWithResultCode:failedMessages:transferedMessage:", v21 == 0, v14, v15);

  return v25;
}

void __83__MFMailMessageStore_copyMessages_toMailbox_markAsRead_deleteOriginals_isDeletion___block_invoke(uint64_t a1, void *a2, id a3)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  uint64_t v23;
  _BYTE v24[128];
  const __CFString *v25;
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "mailboxUid"), "representedAccount");
  if (!v7)
    v7 = (void *)objc_msgSend(a2, "account");
  if (+[MailAccount canMoveMessagesFromAccount:toAccount:](MailAccount, "canMoveMessagesFromAccount:toAccount:", v7, objc_msgSend(*(id *)(a1 + 32), "representedAccount")))
  {
    if (!*(_BYTE *)(a1 + 72)
      || (v8 = (void *)objc_msgSend(v7, "moveMessages:fromMailbox:toMailbox:markAsRead:", a3, objc_msgSend(a2, "mailboxUid"), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 73)), v9 = objc_msgSend(v8, "resultCode"), objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", objc_msgSend(v8, "transferedMessages")), objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v8, "failedMessages")), v9 != 1))
    {
      if (!objc_msgSend(v6, "count"))
      {
        if (*(_BYTE *)(a1 + 73) && objc_msgSend(a3, "count"))
        {
          v25 = CFSTR("MessageIsRead");
          v26[0] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(a2, "setFlagsFromDictionary:forMessages:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1), a3);
        }
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(a3);
              v16 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "messageFlags");
              objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16 & 0xFFFFFFFFFFFFFFFDLL));
            }
            v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          }
          while (v13);
        }
        if (objc_msgSend(*(id *)(a1 + 48), "appendMessages:unsuccessfulOnes:newMessageIDs:newMessages:flagsToSet:", a3, v6, v11, *(_QWORD *)(a1 + 40), v10) != 1)
        {
          a3 = (id)objc_msgSend(a3, "mutableCopy");
          objc_msgSend(a3, "removeObjectsInArray:", v6);
        }
        if (objc_msgSend(a3, "count") && *(_BYTE *)(a1 + 72))
          objc_msgSend(a2, "setFlagsFromDictionary:forMessages:", *(_QWORD *)(a1 + 56), a3);
        if (objc_msgSend(v6, "count"))
        {
          if (*(_BYTE *)(a1 + 74)
            && (objc_msgSend((id)objc_msgSend(a2, "mailboxUid"), "shouldRestoreMessagesAfterFailedDelete") & 1) == 0)
          {
            v17 = *(_QWORD *)(a1 + 56);
          }
          else
          {
            v22 = CFSTR("MessageIsDeleted");
            v23 = MEMORY[0x1E0C9AAA0];
            v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          }
          objc_msgSend(a2, "setFlagsFromDictionary:forMessages:", v17, v6);
        }
      }
    }
  }
  else
  {
    objc_msgSend(v6, "addObjectsFromArray:", a3);
  }
  objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v6);

}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6 flagsToSet:(id)a7
{
  objc_msgSend(a4, "replaceObjectsInRange:withObjectsFromArray:", 0, objc_msgSend(a4, "count"), a3);
  return 0;
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6
{
  return -[MFMailMessageStore appendMessages:unsuccessfulOnes:newMessageIDs:newMessages:flagsToSet:](self, "appendMessages:unsuccessfulOnes:newMessageIDs:newMessages:flagsToSet:", a3, a4, a5, a6, 0);
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5
{
  return -[MFMailMessageStore appendMessages:unsuccessfulOnes:newMessageIDs:newMessages:](self, "appendMessages:unsuccessfulOnes:newMessageIDs:newMessages:", a3, a4, a5, 0);
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4
{
  return -[MFMailMessageStore appendMessages:unsuccessfulOnes:newMessageIDs:](self, "appendMessages:unsuccessfulOnes:newMessageIDs:", a3, a4, 0);
}

- (id)messageForMessageID:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)messageForRemoteID:(id)a3
{
  return -[MFMailMessageStore messageForMessageID:options:](self, "messageForMessageID:options:", a3, 0);
}

- (id)messageForRemoteID:(id)a3 inMailbox:(id)a4
{
  return -[MFMailMessageStore messageForMessageID:options:](self, "messageForMessageID:options:", a3, 0);
}

- (id)lastViewedMessageWithOptions:(unsigned int)a3
{
  return -[MFMailMessageStore messageForMessageID:options:](self, "messageForMessageID:options:", objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "lastViewedMessageID"), *(_QWORD *)&a3);
}

- (id)lastViewedMessageDate
{
  return (id)objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "lastViewedMessageDate");
}

- (id)uniqueRemoteIDsForMessages:(id)a3
{
  return 0;
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  id result;

  v4 = a4;
  result = (id)-[MFMailMessageStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3, 0);
  if (!result)
  {
    result = -[MFMailMessageStore _fetchHeaderDataForMessage:downloadIfNecessary:](self, "_fetchHeaderDataForMessage:downloadIfNecessary:", a3, v4);
    if (result)
      return (id)-[MFMailMessageStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3, result);
  }
  return result;
}

- (BOOL)hasCachedDataForMimePart:(id)a3
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "mimeBody"), "message"), "isMessageContentsLocallyAvailable");
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a4;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  v10 = objc_msgSend(a3, "allKeys");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 0;
  v11 = (void *)v10;
  if (v7)
  {
    for (i = 0; i != v7; ++i)
      v8[i] = objc_msgSend(a3, "mf_BOOLForKey:", objc_msgSend(v11, "objectAtIndex:", i));
  }
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  v22 = 0u;
  v13 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v21);
        if (v7)
        {
          v17 = 0;
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
          do
          {
            if (-[MFMailMessageStore _updateFlagForMessage:key:value:](self, "_updateFlagForMessage:key:value:", v18, objc_msgSend(v11, "objectAtIndex:", v17), v8[v17]))
            {
              objc_msgSend(v9, "ef_addObjectIfAbsent:", v18);
            }
            ++v17;
          }
          while (v7 != v17);
        }
      }
      v14 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }
  return v9;
}

- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4
{
  return 0;
}

- (void)setFlag:(id)a3 state:(BOOL)a4 forMessages:(id)a5
{
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a5);
}

- (void)setFlagForAllMessages:(id)a3 state:(BOOL)a4
{
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6[0] = NSStringFromBOOL();
  -[MFMailMessageStore setFlagsForAllMessagesFromDictionary:](self, "setFlagsForAllMessagesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (void)setFlagsForAllMessagesFromDictionary:(id)a3
{
  id v5;

  v5 = -[MFMailMessageStore copyOfAllMessagesWithOptions:](self, "copyOfAllMessagesWithOptions:", 128);
  -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", a3, v5);

}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v10;
  unint64_t v11;
  objc_super v12;

  v7 = a5;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMailMessageStore;
  -[MFMailMessageStore setNumberOfAttachments:isSigned:isEncrypted:forMessage:](&v12, sel_setNumberOfAttachments_isSigned_isEncrypted_forMessage_);
  v10 = objc_msgSend(a6, "messageFlags");
  v11 = _MFFlagsBySettingNumberOfAttachments(v10, a3, v8, v7);
  if (v11 != v10)
    objc_msgSend(a6, "setMessageFlags:", v11);
}

- (id)status
{
  return 0;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor", a3, a4, a5), "reset");
  return 0;
}

- (int64_t)fetchMobileSynchronously:(unint64_t)lastFetchCount preservingUID:(id)a4 options:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *i;
  id v13;
  void *v14;
  const __CFString *v15;
  int v16;
  int64_t v17;
  id v18;
  const __CFString *v20;
  uint64_t v21;

  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setMailbox:", -[MFMailMessageStore mailboxUid](self, "mailboxUid"));
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "addReason:", CFSTR("MonitoredActivityReasonFetching"));
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "URLString"));
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@|%lu|%@|%d"), v9, lastFetchCount, a4, (a5 >> 1) & 1);
  v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
  v11 = objc_msgSend(-[MFMailMessageStore account](self, "account"), "willPerformActionForChokePoint:coalescePoint:result:", v9, v10, &v21);
  for (i = (void *)v21; v11 && !v21; i = (void *)v21)
    v11 = objc_msgSend(-[MFMailMessageStore account](self, "account"), "willPerformActionForChokePoint:coalescePoint:result:", v9, v10, &v21);
  if ((v11 & 1) == 0)
  {
    v13 = -[MFMailMessageStore account](self, "account");
    v14 = v13;
    if (v13)
      v15 = (const __CFString *)objc_msgSend(v13, "powerAssertionIdentifierWithPrefix:", CFSTR("com.apple.message.fetchMobileSynchronously"));
    else
      v15 = CFSTR("com.apple.message.fetchMobileSynchronously");
    v20 = v15;
    -[MFPowerController retainAssertionWithIdentifier:withAccount:](+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"), "retainAssertionWithIdentifier:withAccount:", v15, v14);
    -[MFMailMessageStore mf_lock](self, "mf_lock");
    if (lastFetchCount)
      self->_lastFetchCount = lastFetchCount;
    else
      lastFetchCount = self->_lastFetchCount;
    -[MFMailMessageStore mf_unlock](self, "mf_unlock");
    v16 = -2;
    do
    {
      v17 = -[MFMailMessageStore fetchNumMessages:preservingUID:options:](self, "fetchNumMessages:preservingUID:options:", lastFetchCount, a4, a5);
      if (v17 < 0
        && !objc_msgSend(v14, "shouldFetchAgainWithError:foregroundRequest:", objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error"), (a5 >> 4) & 1))
      {
        break;
      }
      v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
      if (!v16)
        break;
      ++v16;
    }
    while (v17 < 0);
    v18 = -[MFMailMessageStore account](self, "account");
    objc_msgSend(v18, "didFinishActionForChokePoint:coalescePoint:withResult:", v9, v10, v21);
    -[MFPowerController releaseAssertionWithIdentifier:](+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"), "releaseAssertionWithIdentifier:", v20);
    i = (void *)v21;
  }
  return objc_msgSend(i, "integerValue");
}

- (int64_t)fetchMobileSynchronously:(unint64_t)a3
{
  return -[MFMailMessageStore fetchMobileSynchronously:preservingUID:options:](self, "fetchMobileSynchronously:preservingUID:options:", a3, 0, 35);
}

- (BOOL)setPreferredEncoding:(unsigned int)a3 forMessage:(id)a4
{
  uint64_t v5;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];

  v5 = *(_QWORD *)&a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "preferredEncoding");
  if (v7 != (_DWORD)v5)
  {
    objc_msgSend(a4, "setPreferredEncoding:", v5);
    v8 = (void *)objc_msgSend(a4, "headers");
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "setPreferredEncoding:", v5);
      v10 = objc_msgSend(v9, "firstHeaderForKey:", *MEMORY[0x1E0D1E5F8]);
      objc_msgSend(a4, "setSubject:", objc_msgSend(MEMORY[0x1E0D1E7A0], "subjectWithString:", v10));
    }
    v12[0] = a4;
    -[MFMailMessageStore messageFlagsDidChange:flags:](self, "messageFlagsDidChange:flags:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), 0);
  }
  return v7 != (_DWORD)v5;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  return 0;
}

- (void)_flushAllMessageData
{
  uint64_t v3;
  objc_super v4;

  -[MFMailMessageStore mf_lock](self, "mf_lock");
  self->_deletedMessageCount = 0;
  self->_deletedMessagesSize = 0;
  self->_unreadMessageCount = 0;
  _MFLockGlobalLock();
  v3 = (int)*MEMORY[0x1E0D461D8];

  *(Class *)((char *)&self->super.super.isa + v3) = 0;
  _MFUnlockGlobalLock();
  -[MFMailMessageStore mf_unlock](self, "mf_unlock");
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageStore;
  -[MFMailMessageStore _flushAllMessageData](&v4, sel__flushAllMessageData);
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  if (objc_msgSend(a3, "summary"))
    return 0;
  else
    return objc_msgSend(a3, "isMessageContentsLocallyAvailable") ^ 1;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingDataForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  return 0;
}

- (BOOL)shouldSetSummaryForMessage:(id)a3
{
  return objc_msgSend(a3, "summary") == 0;
}

- (BOOL)shouldDeleteInPlace
{
  return objc_msgSend(-[MFMailMessageStore account](self, "account"), "deleteInPlaceForMailbox:", -[MFMailMessageStore mailboxUid](self, "mailboxUid"));
}

- (BOOL)supportsArchiving
{
  id v3;
  int v4;

  v3 = -[MFMailMessageStore account](self, "account");
  v4 = objc_msgSend(v3, "supportsArchiving");
  if (v4)
    LOBYTE(v4) = objc_msgSend(v3, "preventArchiveForMailbox:", -[MFMailMessageStore mailboxUid](self, "mailboxUid")) ^ 1;
  return v4;
}

- (BOOL)shouldArchive
{
  id v3;
  int v4;

  v3 = -[MFMailMessageStore account](self, "account");
  v4 = objc_msgSend(v3, "shouldArchiveByDefault");
  if (v4)
    LOBYTE(v4) = objc_msgSend(v3, "canArchiveForMailbox:", -[MFMailMessageStore mailboxUid](self, "mailboxUid"));
  return v4;
}

- (int)archiveDestination
{
  return objc_msgSend(-[MFMailMessageStore account](self, "account"), "archiveDestinationForMailbox:", -[MFMailMessageStore mailboxUid](self, "mailboxUid"));
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  -[MFMailMessageStore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  __assert_rtn("-[MFMailMessageStore _fetchHeaderDataForMessage:downloadIfNecessary:]", "MailMessageStore.m", 1133, "0");
}

- (void)_rebuildTableOfContentsSynchronously
{
  -[MFMailMessageStore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMailMessageStore _rebuildTableOfContentsSynchronously]", "MailMessageStore.m", 1136, "0");
}

- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  BOOL v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MFMailMessageStore;
  v8 = -[MFMailMessageStore _setOrGetBody:forMessage:updateFlags:](&v11, sel__setOrGetBody_forMessage_updateFlags_);
  v9 = v8 != a3 || !v5;
  if (!v9 && (objc_msgSend(a4, "messageFlags") & 2) == 0)
    objc_msgSend(a4, "calculateAttachmentInfoFromBody:", a3);
  return v8;
}

- (void)_setFlagsForMessages:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (void *)objc_msgSend(a3, "keyEnumerator");
  v5 = objc_msgSend(v4, "nextObject");
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = (void *)objc_msgSend(a3, "objectForKey:", v6);
      v8 = objc_msgSend(v7, "objectForKey:", CFSTR("messageFlags"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("messageFlagsMask"));
        if (!v10)
        {
          v12 = objc_msgSend(v9, "unsignedIntValue");
          v13 = 0x1BFDDF7FFFFLL;
          goto LABEL_8;
        }
        v11 = objc_msgSend(v10, "unsignedIntValue");
        v12 = objc_msgSend(v9, "unsignedIntValue");
        if (v11)
        {
          v13 = v11;
LABEL_8:
          v14 = v12;
          v15 = objc_msgSend(v6, "messageFlags");
          if (v13 == 0x1BFDDF7FFFFLL)
            v16 = v14;
          else
            v16 = v15 & ~v13 | v13 & v14;
          if (v16 != v15)
            objc_msgSend(v6, "setMessageFlags:");
        }
      }
      v6 = (void *)objc_msgSend(v4, "nextObject");
    }
    while (v6);
  }
}

- (void)updateMessages:(id)a3 updateNumberOfAttachments:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  id v11;

  if (a4)
  {
    v5 = a3;
    if (!v5)
      v5 = -[MFMailMessageStore copyOfAllMessages](self, "copyOfAllMessages");
    v11 = v5;
    v6 = objc_msgSend(v5, "count");
    if (v6)
    {
      v7 = v6 - 1;
      do
      {
        v8 = v7;
        v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v8), "calculateAttachmentInfoFromBody:", 0);
        v10 = objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "shouldCancel");
        objc_msgSend(v9, "drain");
        if ((v10 & 1) != 0)
          break;
        v7 = v8 - 1;
      }
      while (v8);
    }

  }
}

- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4
{
  unint64_t generationNumber;
  unint64_t v8;
  uint64_t v9;

  generationNumber = self->_generationNumber;
  if (generationNumber == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 1;
  else
    v8 = generationNumber + 1;
  self->_generationNumber = v8;
  if (objc_msgSend(a3, "count"))
  {
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("messages"), a4, CFSTR("previous earliest received date"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessagesAdded"), self, v9);
  }
}

- (BOOL)_updateFlagForMessage:(id)a3 key:(id)a4 value:(BOOL)a5
{
  unsigned int v5;
  unint64_t v9;
  unint64_t unreadMessageCount;
  unint64_t v11;
  NSObject *v12;
  BOOL v13;
  unint64_t deletedMessageCount;
  unint64_t v15;
  unint64_t v16;
  uint8_t v18[16];

  v5 = a5;
  v9 = objc_msgSend(a3, "messageFlags");
  if (objc_msgSend(a4, "isEqual:", CFSTR("MessageIsRead")))
  {
    if ((v9 & 1) != v5)
    {
      unreadMessageCount = self->_unreadMessageCount;
      v11 = v5 ? unreadMessageCount - 1 : unreadMessageCount + 1;
      self->_unreadMessageCount = v11;
      if (v11 >> 31)
      {
        self->_unreadMessageCount = 0;
        v12 = MFLogGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_1C8839000, v12, OS_LOG_TYPE_INFO, "#UnreadCount _unreadMessageCount went negative", v18, 2u);
        }
      }
    }
  }
  else
  {
    if (objc_msgSend(a4, "isEqual:", CFSTR("MessageIsDeleted")))
      v13 = ((v9 >> 1) & 1) == v5;
    else
      v13 = 1;
    if (!v13)
    {
      deletedMessageCount = self->_deletedMessageCount;
      if (v5)
      {
        self->_deletedMessageCount = deletedMessageCount + 1;
        v15 = self->_deletedMessagesSize + objc_msgSend(a3, "messageSize");
      }
      else
      {
        self->_deletedMessageCount = deletedMessageCount - 1;
        v15 = self->_deletedMessagesSize - objc_msgSend(a3, "messageSize");
      }
      self->_deletedMessagesSize = v15;
    }
  }
  v16 = _MFFlagsBySettingValueForKey(v9, a4, v5);
  if (v16 != v9
    && -[MFMailMessageStore _shouldChangeComponentMessageFlagsForMessage:](self, "_shouldChangeComponentMessageFlagsForMessage:", a3))
  {
    objc_msgSend(a3, "setMessageFlags:", v16);
  }
  return v16 != v9;
}

- (BOOL)_shouldChangeComponentMessageFlags
{
  return 1;
}

+ (Class)headersClass
{
  return (Class)objc_opt_class();
}

- (id)messageIdRollCall:(id)a3
{
  return 0;
}

@end
