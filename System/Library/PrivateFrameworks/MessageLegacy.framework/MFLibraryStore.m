@implementation MFLibraryStore

+ (unsigned)defaultLoadOptions
{
  return 3;
}

- (MFLibraryStore)initWithCriterion:(id)a3 mailbox:(id)a4 readOnly:(BOOL)a5
{
  MFLibraryStore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFLibraryStore;
  v7 = -[MFLibraryStore init](&v9, sel_init, a3, a4, a5);
  if (v7)
  {
    v7->_criterion = (MFMessageCriterion *)a3;
    v7->super._mailboxUid = (MFMailboxUid *)a4;
    v7->super._account = (MailAccount *)(id)objc_msgSend(a4, "account");
    *(_DWORD *)&v7->super._flags |= 0x100u;
  }
  return v7;
}

- (MFLibraryStore)initWithCriterion:(id)a3
{
  return -[MFLibraryStore initWithCriterion:mailbox:readOnly:](self, "initWithCriterion:mailbox:readOnly:", a3, 0, 1);
}

- (MFLibraryStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4
{
  return -[MFLibraryStore initWithCriterion:mailbox:readOnly:](self, "initWithCriterion:mailbox:readOnly:", objc_msgSend(a3, "criterion"), a3, a4);
}

- (MFLibraryStore)initWithMailbox:(id)a3
{
  return -[MFLibraryStore initWithMailboxUid:readOnly:](self, "initWithMailboxUid:readOnly:", a3, 0);
}

+ (id)storeWithCriterion:(id)a3
{
  return -[MFLibraryStore initWithCriterion:]([MFLibraryStore alloc], "initWithCriterion:", a3);
}

+ (id)storeWithMailbox:(id)a3
{
  return -[MFLibraryStore initWithMailbox:]([MFLibraryStore alloc], "initWithMailbox:", a3);
}

- (void)setLibrary:(id)a3
{
  void *v5;
  void *v6;
  MFMessageLibrary *library;
  MFMessageLibrary *v8;

  if (self->_library != a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = v5;
    if (self->_library)
    {
      objc_msgSend(v5, "removeObserver:name:object:", self, 0);
      library = self->_library;
    }
    else
    {
      library = 0;
    }

    v8 = (MFMessageLibrary *)a3;
    self->_library = v8;
    if (a3)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__queueMessagesAdded_, CFSTR("MailMessageStoreMessagesAdded"), v8);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__queueMessageFlagsChanged_, CFSTR("MailMessageStoreMessageFlagsChanged"), self->_library);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__queueMessagesWillBeCompacted_, CFSTR("MailMessageStoreMessagesWillBeCompacted"), self->_library);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__queueMessagesWereCompacted_, CFSTR("MailMessageStoreMessagesRemoved"), self->_library);
    }
    -[MFLibraryStore invalidateFetchWindow](self, "invalidateFetchWindow");
  }
}

- (id)library
{
  return self->_library;
}

+ (id)sharedInstance
{
  pthread_once(&sharedInstanceInitializer, (void (*)(void))initializeSharedInstance);
  return (id)objc_msgSend(a1, "sharedInstanceIfExists");
}

+ (id)sharedInstanceIfExists
{
  return (id)_sharedInstance;
}

- (id)mailbox
{
  return self->super._mailboxUid;
}

- (void)addCountsForMessages:(id)a3 shouldUpdateUnreadCount:(BOOL)a4
{
  int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t i;
  void *v10;
  char v11;
  uint64_t v12;
  int *v13;

  v6 = objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid", a3, a4), "type");
  v7 = objc_msgSend(a3, "count");
  -[MFLibraryStore mf_lock](self, "mf_lock");
  if (v7)
  {
    v8 = v6 - 5;
    for (i = v7 - 1; i != -1; --i)
    {
      v10 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      v11 = objc_msgSend(v10, "messageFlags");
      v12 = objc_msgSend(v10, "messageSize");
      if ((v11 & 2) != 0)
      {
        ++self->super._deletedMessageCount;
        v13 = &OBJC_IVAR___MFMailMessageStore__deletedMessagesSize;
      }
      else
      {
        v13 = &OBJC_IVAR___MFMailMessageStore__unreadMessageCount;
        v12 = 1;
        if (v8 >= 2 && (v11 & 1) != 0)
          continue;
      }
      *(Class *)((char *)&self->super.super.super.isa + *v13) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                 + *v13)
                                                                      + v12);
    }
  }
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)_addInvocationToQueue:(id)a3
{
  if (_addInvocationToQueue__onceToken != -1)
    dispatch_once(&_addInvocationToQueue__onceToken, &__block_literal_global_4);
  objc_msgSend((id)_addInvocationToQueue__sInvocationQueue, "addInvocation:", a3);
}

uint64_t __40__MFLibraryStore__addInvocationToQueue___block_invoke()
{
  _addInvocationToQueue__sInvocationQueue = objc_alloc_init(MFInvocationQueue);
  return objc_msgSend((id)_addInvocationToQueue__sInvocationQueue, "setThreadRecycleTimeout:", 60.0);
}

- (void)openSynchronously
{
  -[MFLibraryStore mf_lock](self, "mf_lock");
  if (self->super._state > 2)
  {
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
  }
  else
  {
    self->super._state = 2;
    self->super._unreadMessageCount = 0;
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
    self->super._state = 3;
    -[MFMailMessageStore didOpen](self, "didOpen");
  }
}

- (unint64_t)totalCount
{
  return -[MFMessageLibrary totalCountForMailbox:](self->_library, "totalCountForMailbox:", -[MFLibraryStore URLString](self, "URLString"));
}

- (unint64_t)nonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  return -[MFMessageLibrary nonDeletedCountForMailbox:includeServerSearchResults:includeThreadSearchResults:](self->_library, "nonDeletedCountForMailbox:includeServerSearchResults:includeThreadSearchResults:", -[MFLibraryStore URLString](self, "URLString"), a3, a4);
}

- (unint64_t)allNonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  return -[MFMessageLibrary allNonDeleteCountForMailbox:includeServerSearchResults:includeThreadSearchResults:](self->_library, "allNonDeleteCountForMailbox:includeServerSearchResults:includeThreadSearchResults:", -[MFLibraryStore URLString](self, "URLString"), a3, a4);
}

- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4
{
  id v5;

  v5 = -[MFMessageLibrary messageWithLibraryID:options:inMailbox:](self->_library, "messageWithLibraryID:options:inMailbox:", *(_QWORD *)&a3, *(_QWORD *)&a4, -[MFLibraryStore URLString](self, "URLString"));
  objc_msgSend(v5, "setMessageStore:", self);
  return v5;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4 generation:(unint64_t *)a5
{
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = *(_QWORD *)&a4;
  length = a3.length;
  location = a3.location;
  v26 = *MEMORY[0x1E0C80C00];
  -[MFLibraryStore mf_lock](self, "mf_lock");
  if (a5)
    *a5 = self->super._generationNumber;
  if ((_DWORD)v6 == 399)
  {
    v11 = -[MFMessageLibrary messagesWithSummariesForMailbox:range:](self->_library, "messagesWithSummariesForMailbox:range:", -[MFLibraryStore URLString](self, "URLString"), location, length);
  }
  else
  {
    if ((v6 & 0x180) != 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", -[MFLibraryStore criterion](self, "criterion"));
      if ((v6 & 0x80) != 0)
        objc_msgSend(v12, "addObject:", +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0));
      if ((v6 & 0x100) != 0)
        objc_msgSend(v12, "addObject:", +[MFMessageCriterion messageIsServerSearchResultCriterion:](MFMessageCriterion, "messageIsServerSearchResultCriterion:", 0));
      v13 = +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v12);
    }
    else
    {
      v13 = -[MFLibraryStore criterion](self, "criterion");
    }
    v11 = -[MFMessageLibrary messagesMatchingCriterion:options:range:](self->_library, "messagesMatchingCriterion:options:range:", v13, v6, location, length);
  }
  v14 = v11;
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v19, "setMessageStore:", self);
        if (!objc_msgSend(v19, "generationNumber"))
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LibraryStore.m"), 251, CFSTR("messages shouldn't have a zero generation number."));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }
  return v14;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4
{
  return -[MFLibraryStore copyOfMessagesInRange:options:generation:](self, "copyOfMessagesInRange:options:generation:", a3.location, a3.length, *(_QWORD *)&a4, 0);
}

- (id)copyOfAllMessagesWithOptions:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[MFLibraryStore mf_lock](self, "mf_lock");
  v5 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", 0, 0x7FFFFFFFFFFFFFFFLL, v3);
  if (objc_msgSend(v5, "count") && self->super._state <= 1)
  {
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
    -[MFMailMessageStore messagesWereAdded:](self, "messagesWereAdded:", v5);
    -[MFLibraryStore addCountsForMessages:shouldUpdateUnreadCount:](self, "addCountsForMessages:shouldUpdateUnreadCount:", v5, 0);
  }
  else
  {
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
  }
  return v5;
}

- (id)copyOfAllMessages
{
  return -[MFLibraryStore copyOfAllMessagesWithOptions:](self, "copyOfAllMessagesWithOptions:", 3);
}

- (id)copyOfAllMessagesForBodyLoadingFromRowID:(unsigned int)a3 limit:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = -[MFMessageLibrary messagesWithoutSummariesForMailbox:fromRowID:limit:](self->_library, "messagesWithoutSummariesForMailbox:fromRowID:limit:", -[MFLibraryStore URLString](self, "URLString"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "setMessageStore:", self);
        if (!objc_msgSend(v11, "generationNumber"))
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LibraryStore.m"), 285, CFSTR("messages shouldn't have a zero generation number."));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v6;
}

- (id)mutableCopyOfAllMessages
{
  return (id)objc_msgSend(-[MFLibraryStore copyOfAllMessages](self, "copyOfAllMessages"), "mutableCopy");
}

- (id)copyMessagesMatchingText:(id)a3 options:(unsigned int)a4
{
  MFMessageCriterion *v7;
  MFMessageCriterion *v8;
  MFMessageCriterion *v9;
  id v10;
  _QWORD v12[2];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v7 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 34, 0, a3);
  v8 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 9, 0, a3);
  v9 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 1, 0, a3);
  -[MFMessageCriterion setCriterionIdentifier:](v9, "setCriterionIdentifier:", *MEMORY[0x1E0D1E5F8]);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v10 = +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3));

  v12[0] = -[MFLibraryStore criterion](self, "criterion");
  v12[1] = v10;
  return (id)objc_msgSend(-[MFLibraryStore library](self, "library"), "messagesMatchingCriterion:options:", +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2)), a4 | 3);
}

- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  void *v6;
  id v7;
  id v9;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", -[MFLibraryStore criterion](self, "criterion"), a3, 0);
  if ((a4 & 0x80) != 0)
    objc_msgSend(v6, "addObject:", +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0));
  v7 = +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v6);

  v9 = (id)objc_msgSend(-[MFLibraryStore library](self, "library"), "messagesMatchingCriterion:options:", v7, a4 | 3);
  objc_msgSend(v9, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  return v9;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4
{
  return -[MFLibraryStore copyMessagesWithRemoteIDs:options:inMailbox:](self, "copyMessagesWithRemoteIDs:options:inMailbox:", a3, *(_QWORD *)&a4, -[MFMailMessageStore mailboxUid](self, "mailboxUid"));
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  void *v6;

  v6 = (void *)objc_msgSend(-[MFLibraryStore library](self, "library"), "copyMessagesWithRemoteIDs:options:inRemoteMailbox:", a3, a4 | 3, objc_msgSend(a5, "URLString"));
  objc_msgSend(v6, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  return v6;
}

- (id)serverSearchResults
{
  void *v3;

  v3 = (void *)objc_msgSend(-[MFLibraryStore library](self, "library"), "serverSearchResultMessagesForMailbox:", -[MFLibraryStore URLString](self, "URLString"));
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  return v3;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessage
{
  void *v3;

  -[MFLibraryStore mf_lock](self, "mf_lock");
  v3 = (void *)objc_msgSend(-[MFLibraryStore library](self, "library"), "dateOfOldestNonIndexedNonSearchResultMessageInMailbox:", -[MFLibraryStore URLString](self, "URLString"));
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  return v3;
}

- (id)dateOfNewestNonSearchResultMessage
{
  void *v3;

  -[MFLibraryStore mf_lock](self, "mf_lock");
  v3 = (void *)objc_msgSend(-[MFLibraryStore library](self, "library"), "dateOfNewestNonSearchResultMessageInMailbox:", -[MFLibraryStore URLString](self, "URLString"));
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)willFetchMessages
{
  -[MFLibraryStore setEarliestReceivedDate:](self, "setEarliestReceivedDate:", objc_msgSend(-[MFLibraryStore library](self, "library"), "dateOfOldestNonSearchResultMessageInMailbox:", -[MFLibraryStore URLString](self, "URLString")));
}

- (unint64_t)_fetchWindowMultiple
{
  MFNetworkController *v2;

  v2 = +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  if (-[MFNetworkController isFatPipe](v2, "isFatPipe"))
    return 250;
  if (-[MFNetworkController is4GConnection](v2, "is4GConnection"))
    return 250;
  return 100;
}

- (unint64_t)_fetchWindowMinimum
{
  MFNetworkController *v2;

  v2 = +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  if (-[MFNetworkController isFatPipe](v2, "isFatPipe") || -[MFNetworkController is4GConnection](v2, "is4GConnection"))
    return 150;
  if (-[MFNetworkController is3GConnection](v2, "is3GConnection"))
    return 100;
  return 50;
}

- (unint64_t)_calculateFetchWindowWithAdditionalMultiple:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t result;

  v3 = a3;
  v5 = -[MFLibraryStore _fetchWindowMultiple](self, "_fetchWindowMultiple");
  v6 = -[MFLibraryStore _fetchWindowMinimum](self, "_fetchWindowMinimum");
  v7 = (double)-[MFLibraryStore allNonDeletedCountIncludingServerSearch:andThreadSearch:](self, "allNonDeletedCountIncludingServerSearch:andThreadSearch:", 0, 0)/ (double)v5;
  v8 = ceilf(v7) * (float)v5;
  if (v3)
    v9 = v5;
  else
    v9 = 0;
  if (v6 <= v9 + (unint64_t)v8)
    v10 = v9 + (unint64_t)v8;
  else
    v10 = v6;
  result = -[MFLibraryStore fetchWindowCap](self, "fetchWindowCap");
  if (result >= v10)
    return v10;
  return result;
}

- (void)invalidateFetchWindow
{
  -[MFLibraryStore mf_lock](self, "mf_lock");
  self->_fetchWindow = 0;
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
}

- (BOOL)shouldGrowFetchWindow
{
  unint64_t v3;
  objc_super v5;

  v3 = -[MFLibraryStore fetchWindow](self, "fetchWindow");
  if (v3 >= -[MFLibraryStore fetchWindowCap](self, "fetchWindowCap"))
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryStore;
  return -[MFMailMessageStore shouldGrowFetchWindow](&v5, sel_shouldGrowFetchWindow);
}

- (unint64_t)growFetchWindow
{
  unint64_t v3;

  -[MFLibraryStore mf_lock](self, "mf_lock");
  v3 = -[MFLibraryStore _calculateFetchWindowWithAdditionalMultiple:](self, "_calculateFetchWindowWithAdditionalMultiple:", 1);
  self->_fetchWindow = v3;
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  return v3;
}

- (unint64_t)fetchWindow
{
  unint64_t fetchWindow;

  -[MFLibraryStore mf_lock](self, "mf_lock");
  fetchWindow = self->_fetchWindow;
  if (!fetchWindow)
  {
    fetchWindow = -[MFLibraryStore _calculateFetchWindowWithAdditionalMultiple:](self, "_calculateFetchWindowWithAdditionalMultiple:", 0);
    self->_fetchWindow = fetchWindow;
  }
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  return fetchWindow;
}

- (unint64_t)fetchWindowCap
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("FetchWithoutLimits")))return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 10000;
}

- (id)filterMessagesByMembership:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  MFMailboxUid *mailboxUid;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(a3);
      mailboxUid = self->super._mailboxUid;
      if (mailboxUid)
      {
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (mailboxUid == (MFMailboxUid *)objc_msgSend(v11, "mailbox"))
        {
          if (!v7)
            v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          objc_msgSend(v7, "addObject:", v11);
        }
      }
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v6);
  return v7;
}

- (void)handleMessagesAdded:(id)a3 earliestReceivedDate:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v6 = (void *)objc_msgSend(a3, "userInfo");
  v7 = (id)objc_msgSend(v6, "objectForKey:", CFSTR("messages"));
  v8 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("mailboxes"));
  v9 = -[MFMailMessageStore mailboxUid](self, "mailboxUid");
  if (v9)
  {
    if (objc_msgSend(v8, "indexOfObject:", v9) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
    -[MFLibraryStore criterion](self, "criterion");
  }
  else
  {
    v10 = -[MFLibraryStore criterion](self, "criterion");
    if (v10)
    {
      v7 = -[MFMessageLibrary filterContiguousMessages:forCriterion:options:](self->_library, "filterContiguousMessages:forCriterion:options:", v7, v10, 3);
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_7:
  if (objc_msgSend(v7, "count"))
  {
    -[MFLibraryStore addCountsForMessages:shouldUpdateUnreadCount:](self, "addCountsForMessages:shouldUpdateUnreadCount:", v7, 0);
    -[MFLibraryStore messagesWereAdded:earliestReceivedDate:](self, "messagesWereAdded:earliestReceivedDate:", v7, a4);
  }
}

- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4
{
  objc_super v7;

  objc_msgSend(a3, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryStore;
  -[MFMailMessageStore messagesWereAdded:earliestReceivedDate:](&v7, sel_messagesWereAdded_earliestReceivedDate_, a3, a4);
}

- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  unint64_t deletedMessageCount;
  uint64_t v21;
  objc_class *v22;
  uint64_t v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = -[MFMailboxUid type](self->super._mailboxUid, "type");
  -[MFLibraryStore mf_lock](self, "mf_lock");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    v24 = v9 - 5;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(a3);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", v14), "intValue");
        v16 = v15;
        if (a4)
          v17 = MFMessageFlagsByApplyingDictionary(v15, a4);
        else
          v17 = objc_msgSend(v14, "messageFlags");
        v18 = v17;
        if (((v16 >> 1) & 1) != ((v17 >> 1) & 1))
        {
          v19 = objc_msgSend(v14, "messageSize");
          deletedMessageCount = self->super._deletedMessageCount;
          if ((v16 & 2) != 0)
          {
            self->super._deletedMessageCount = deletedMessageCount - 1;
            v21 = 56;
            v22 = (objc_class *)(self->super._deletedMessagesSize - v19);
          }
          else
          {
            self->super._deletedMessageCount = deletedMessageCount + 1;
            self->super._deletedMessagesSize += v19;
            if (v24 > 1)
              goto LABEL_15;
            v21 = 72;
            v22 = (objc_class *)(self->super._unreadMessageCount - 1);
          }
          *(Class *)((char *)&self->super.super.super.isa + v21) = v22;
        }
LABEL_15:
        if ((v16 & 1) != (v18 & 1))
        {
          v23 = -1;
          if ((v18 & 1) == 0)
            v23 = 1;
          goto LABEL_22;
        }
        if ((v18 & 2) != 0 && !((v18 | v16) & 1 | v16 & 2))
        {
          v23 = -1;
LABEL_22:
          self->super._unreadMessageCount += v23;
          continue;
        }
      }
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
}

- (void)handleMessageFlagsChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("mailboxes"));
  v6 = -[MFLibraryStore filterMessagesByMembership:](self, "filterMessagesByMembership:", objc_msgSend(v4, "objectForKey:", CFSTR("messages")));
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v4, "objectForKey:", CFSTR("flags"));
    v8 = objc_msgSend(v4, "objectForKey:", CFSTR("oldFlagsByMessage"));
    if (v8)
      -[MFLibraryStore _handleFlagsChangedForMessages:flags:oldFlagsByMessage:](self, "_handleFlagsChangedForMessages:flags:oldFlagsByMessage:", v6, v7, v8);
    -[MFMailMessageStore messageFlagsDidChange:flags:](self, "messageFlagsDidChange:flags:", v6, v7);
  }
  else if (self->super._mailboxUid && objc_msgSend(v5, "containsObject:"))
  {
    -[MFMailMessageStore allMessageFlagsDidChange:](self, "allMessageFlagsDidChange:", objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flags")));
  }
}

- (id)_memberMessagesWithCompactionNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  MFMailboxUid *mailboxUid;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("messages"));
  v6 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("mailboxes"));
  if (!objc_msgSend(v5, "count"))
    return 0;
  if (!self->super._mailboxUid)
    return 0;
  if (objc_msgSend(v6, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      mailboxUid = self->super._mailboxUid;
      if (mailboxUid == (MFMailboxUid *)objc_msgSend(v12, "mailbox"))
      {
        if (!v9)
          v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        objc_msgSend(v9, "addObject:", v12);
      }
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v8);
  return v9;
}

- (void)handleMessagesCompacted:(id)a3
{
  id v5;

  -[MFLibraryStore mf_lock](self, "mf_lock");
  v5 = -[MFLibraryStore _memberMessagesWithCompactionNotification:](self, "_memberMessagesWithCompactionNotification:", a3);
  if (objc_msgSend(v5, "count"))
  {
    self->super._deletedMessagesSize = 0;
    self->super._deletedMessageCount = 0;
  }
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  -[MFMailMessageStore messagesWereCompacted:](self, "messagesWereCompacted:", v5);
}

- (void)handleMessagesWillBeCompacted:(id)a3
{
  -[MFMailMessageStore messagesWillBeCompacted:](self, "messagesWillBeCompacted:", -[MFLibraryStore _memberMessagesWithCompactionNotification:](self, "_memberMessagesWithCompactionNotification:", a3));
}

- (void)dealloc
{
  objc_super v3;

  -[MFLibraryStore setLibrary:](self, "setLibrary:", 0);

  v3.receiver = self;
  v3.super_class = (Class)MFLibraryStore;
  -[MFMailMessageStore dealloc](&v3, sel_dealloc);
}

- (id)messageForMessageID:(id)a3 options:(unsigned int)a4
{
  id v5;

  v5 = -[MFMessageLibrary messageWithMessageID:options:inMailbox:](self->_library, "messageWithMessageID:options:inMailbox:", a3, *(_QWORD *)&a4, -[MFLibraryStore URLString](self, "URLString"));
  objc_msgSend(v5, "setMessageStore:", self);
  return v5;
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 0;
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  return -[MFMessageLibrary headerDataForMessage:](self->_library, "headerDataForMessage:", a3, a4);
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  id result;

  result = -[MFMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:](self->_library, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:", a3, a4, a5);
  if (a6)
    *a6 = 1;
  return result;
}

- (id)_fetchFullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 didDownload:(BOOL *)a6
{
  return 0;
}

- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  return 0;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  _BOOL8 v8;
  NSUInteger length;
  NSUInteger location;
  id v14;
  void *v15;
  void *v16;

  v8 = a6;
  length = a4.length;
  location = a4.location;
  v14 = objc_alloc_init(MEMORY[0x1E0D46068]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46120]), "initWithConsumer:", v14);
  LODWORD(a7) = -[MFLibraryStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", a3, location, length, a5, v15, v8, a7);
  objc_msgSend(v15, "done");
  if ((_DWORD)a7)
    v16 = (void *)objc_msgSend(v14, "data");
  else
    v16 = 0;

  return v16;
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8
{
  _BOOL8 v8;
  NSUInteger length;
  NSUInteger location;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  NSObject *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v8 = a7;
  length = a4.length;
  location = a4.location;
  v58 = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "mimeBody"), "message");
  v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v53 = objc_msgSend(v14, "messageID");
    v54 = 2114;
    v55 = objc_msgSend(a3, "partNumber");
    _os_log_impl(&dword_1C8839000, v15, OS_LOG_TYPE_INFO, "#CacheLoads requesting data for MIME part %{public}@:%{public}@", buf, 0x16u);
  }
  if (!objc_msgSend(a3, "parentPart") && length == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = -[MFLibraryStore fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:](self, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:", v14, 0, 0, v8, 0, a8);
    if (v16)
      objc_msgSend(a6, "appendData:", v16);
    LOBYTE(v17) = v16 != 0;
    return v17;
  }
  v18 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v14, 0);
  if (v18 && (v19 = v18, *(_QWORD *)&v18[*MEMORY[0x1E0D46188]]) && !v18[*MEMORY[0x1E0D46198]])
  {
    v31 = MFLogGeneral();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v49 = objc_msgSend(v14, "messageID");
      v32 = objc_msgSend(a3, "partNumber");
      *(_DWORD *)buf = 138543618;
      v53 = v49;
      v54 = 2114;
      v55 = v32;
      _os_log_impl(&dword_1C8839000, v31, OS_LOG_TYPE_INFO, "#CacheLoads found full cached data for %{public}@:%{public}@", buf, 0x16u);
    }
    v50 = objc_msgSend(*(id *)&v19[*MEMORY[0x1E0D46188]], "length");
    v33 = objc_msgSend(a3, "range");
    v20 = 0;
    if (v33 != 0x7FFFFFFFFFFFFFFFLL && v33 + v34 <= v50)
    {
      v20 = *(void **)&v19[*MEMORY[0x1E0D46188]];
      objc_msgSend(a6, "appendData:", objc_msgSend(v20, "mf_subdataWithRange:", v33, v34));
      if (a5)
        *a5 = 1;
    }
  }
  else
  {
    v20 = 0;
  }
  if (v20 || location)
  {
    if (v20)
    {
LABEL_24:
      LOBYTE(v17) = 1;
      return v17;
    }
  }
  else
  {
    v21 = objc_msgSend(-[MFLibraryStore library](self, "library"), "dataForMimePart:isComplete:", a3, a5);
    if (v21)
    {
      v17 = v21;
      v22 = MFLogGeneral();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(v14, "messageID");
        v24 = objc_msgSend(a3, "partNumber");
        *(_DWORD *)buf = 138543618;
        v53 = v23;
        v54 = 2114;
        v55 = v24;
        v25 = "#CacheLoads found part data in database %{public}@:%{public}@";
LABEL_21:
        _os_log_impl(&dword_1C8839000, v22, OS_LOG_TYPE_INFO, v25, buf, 0x16u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  v17 = partDataFromFullBodyData(self, (uint64_t)v14, a3, a5, 0, (uint64_t)a8);
  if (v17)
  {
    v22 = MFLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v14, "messageID");
      v27 = objc_msgSend(a3, "partNumber");
      *(_DWORD *)buf = 138543618;
      v53 = v26;
      v54 = 2114;
      v55 = v27;
      v25 = "#CacheLoads extracted part data from full body data in database %{public}@:%{public}@";
      goto LABEL_21;
    }
LABEL_22:
    v28 = a6;
    v29 = v17;
LABEL_23:
    objc_msgSend(v28, "appendData:", v29);
    goto LABEL_24;
  }
  v35 = !v8;
  if ((objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", CFSTR("multipart")) & 1) == 0 && !v35)
  {
    v36 = MFLogGeneral();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = objc_msgSend(v14, "messageID");
      v38 = objc_msgSend(a3, "partNumber");
      *(_DWORD *)buf = 138543618;
      v53 = v37;
      v54 = 2114;
      v55 = v38;
      _os_log_impl(&dword_1C8839000, v36, OS_LOG_TYPE_INFO, "#CacheLoads downloading part data from server %{public}@:%{public}@", buf, 0x16u);
    }
    v39 = -[MFLibraryStore _fetchDataForMimePart:range:isComplete:consumer:](self, "_fetchDataForMimePart:range:isComplete:consumer:", a3, location, length, a5, a6);
    LODWORD(v17) = v39;
    if (a8)
      *a8 = v39;
    v40 = MFLogGeneral();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      if ((_DWORD)v17)
        v41 = CFSTR("SUCCESS");
      else
        v41 = CFSTR("FAILED");
      v42 = objc_msgSend(v14, "messageID");
      v43 = objc_msgSend(a3, "partNumber");
      *(_DWORD *)buf = 138412802;
      v53 = (uint64_t)v41;
      v54 = 2114;
      v55 = v42;
      v56 = 2114;
      v57 = v43;
      _os_log_impl(&dword_1C8839000, v40, OS_LOG_TYPE_INFO, "#CacheLoads %@ downloading part data from server %{public}@:%{public}@", buf, 0x20u);
    }
  }
  if (((v17 | v35) & 1) == 0)
  {
    v44 = partDataFromFullBodyData(self, (uint64_t)v14, a3, a5, 1, (uint64_t)a8);
    if (v44)
    {
      v45 = v44;
      v46 = MFLogGeneral();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = objc_msgSend(v14, "messageID");
        v48 = objc_msgSend(a3, "partNumber");
        *(_DWORD *)buf = 138543618;
        v53 = v47;
        v54 = 2114;
        v55 = v48;
        _os_log_impl(&dword_1C8839000, v46, OS_LOG_TYPE_INFO, "#CacheLoads extracted part data from full body data via download %{public}@:%{public}@", buf, 0x16u);
      }
      v28 = a6;
      v29 = v45;
      goto LABEL_23;
    }
  }
  return v17;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;

  v5 = a5;
  v9 = (void *)objc_msgSend((id)objc_msgSend(a4, "mimeBody"), "message");
  if (!objc_msgSend(v9, "isLibraryMessage"))
    return 0;
  v10 = (void *)objc_msgSend(-[MFLibraryStore library](self, "library"), "dataConsumerForMessage:part:incomplete:", v9, objc_msgSend(a4, "partNumber"), !v5);
  objc_msgSend(v10, "appendData:", a3);
  objc_msgSend(v10, "done");
  return (id)objc_msgSend(v10, "data");
}

- (id)_copyDataFromMimePart:(id)a3 threshold:(unsigned int)a4 downloadIfNecessary:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  _BOOL4 v14;
  CFMutableDictionaryRef Mutable;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  id v28;
  MFMessageWriter *v29;

  v5 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;
  if (a4 != -1)
  {
    objc_msgSend(v8, "addObject:", a3);
    if (!objc_msgSend(v9, "count"))
      goto LABEL_36;
    while (1)
    {
      v10 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
      v11 = objc_msgSend(v10, "firstChildPart");
      if (v11)
      {
        v12 = (void *)v11;
        do
        {
          objc_msgSend(v9, "addObject:", v12);
          v12 = (void *)objc_msgSend(v12, "nextSiblingPart");
        }
        while (v12);
      }
      else if (objc_msgSend(v10, "isAttachment"))
      {
        objc_msgSend(v10, "range");
        v14 = v13 >= a4;
        goto LABEL_10;
      }
      v14 = 0;
LABEL_10:
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
      if (!objc_msgSend(v9, "count") || v14)
      {
        if (!v14)
          goto LABEL_36;
        break;
      }
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  v16 = (void *)objc_msgSend((id)objc_msgSend(a3, "mimeBody"), "message");
  objc_msgSend(v9, "removeAllObjects");
  objc_msgSend(v9, "addObject:", a3);
  if (!Mutable)
    goto LABEL_36;
  if (!objc_msgSend(v9, "count"))
  {
LABEL_34:
    v28 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v29 = objc_alloc_init(MFMessageWriter);
    -[MFMessageWriter appendDataForMimePart:toData:withPartData:](v29, "appendDataForMimePart:toData:withPartData:", a3, v28, Mutable);

    goto LABEL_37;
  }
  while (1)
  {
    v17 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
    v18 = objc_msgSend(v17, "firstChildPart");
    if (v18)
    {
      v19 = (void *)v18;
      do
      {
        objc_msgSend(v9, "addObject:", v19);
        v19 = (void *)objc_msgSend(v19, "nextSiblingPart");
      }
      while (v19);
      if ((objc_msgSend((id)objc_msgSend(v17, "type"), "isEqualToString:", CFSTR("multipart")) & 1) != 0)
        goto LABEL_33;
    }
    else if (objc_msgSend(v17, "isAttachment"))
    {
      objc_msgSend(v17, "range");
      if (v20 >= a4)
        goto LABEL_33;
    }
    objc_msgSend(v17, "range");
    v22 = v21
        ? objc_msgSend(v17, "decodedDataForData:", objc_msgSend(v16, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v17, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v5, 0)): objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v23 = (void *)v22;
    v24 = (void *)objc_msgSend(v17, "firstChildPart");
    if (v24)
    {
      v25 = v24;
      if (!objc_msgSend(v24, "firstChildPart"))
      {
        if (objc_msgSend(v25, "isAttachment"))
        {
          if (objc_msgSend(v23, "length"))
          {
            objc_msgSend(v25, "range");
            if (v26 >= a4)
            {
              v27 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-Apple-Content-Length: %lu\n"), v26), "dataUsingEncoding:", 1), "mutableCopy");
              objc_msgSend(v27, "appendData:", v23);
              v23 = v27;
            }
          }
        }
      }
    }
    if (!v23)
      break;
    CFDictionarySetValue(Mutable, v17, v23);
LABEL_33:
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    if (!objc_msgSend(v9, "count"))
      goto LABEL_34;
  }

  objc_msgSend(v9, "removeObjectAtIndex:", 0);
LABEL_36:
  v28 = 0;
LABEL_37:

  return v28;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 usePartDatas:(BOOL)a7 didDownload:(BOOL *)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id *v14;
  _BYTE *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v9 = a7;
  v10 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  if (a4)
  {
    v14 = a4;
    *a4 = 0;
  }
  else
  {
    v14 = (id *)&v25;
  }
  v15 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", a3, 0);
  if (!v15 || v15[*MEMORY[0x1E0D46198]] || !a5 && v15[*MEMORY[0x1E0D46190]])
    goto LABEL_35;
  v16 = *(id *)&v15[*MEMORY[0x1E0D46188]];
  if (a5)
    *a5 = v15[*MEMORY[0x1E0D46190]] ^ 1;
  v17 = MFLogGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = a3;
    _os_log_impl(&dword_1C8839000, v17, OS_LOG_TYPE_INFO, "#CacheLoads returning cached full body data for %@", buf, 0xCu);
  }
  if (!v16)
  {
LABEL_35:
    if (objc_msgSend(a3, "isLibraryMessage")
      && (v18 = -[MFMessageLibrary fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:](self->_library, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:", a3, v14)) != 0)
    {
      v16 = v18;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v18, 1, 0);
      -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", a3, v19);

    }
    else if (v9
           && (!v10
             ? (v20 = objc_msgSend(a3, "messageBodyIfAvailableUpdatingFlags:", 0))
             : (v20 = objc_msgSend(a3, "messageBodyUpdatingFlags:", 0)),
               (v21 = (void *)v20) != 0
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (v22 = -[MFLibraryStore _copyDataFromMimePart:threshold:downloadIfNecessary:](self, "_copyDataFromMimePart:threshold:downloadIfNecessary:", objc_msgSend(v21, "topLevelPart"), 0xFFFFFFFFLL, v10)) != 0))
    {
      v16 = v22;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v22, 0, 0);
      -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", a3, v23);

      if (a8)
        *a8 = 1;
    }
    else if (v10)
    {
      v16 = -[MFLibraryStore _fetchFullBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:didDownload:](self, "_fetchFullBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:didDownload:", a3, v14, 1, a8);
    }
    else
    {
      v16 = 0;
    }
  }
  if (*v14)
    -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3);
  if (a5)
    *a5 = v16 != 0;
  return v16;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  return -[MFLibraryStore fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:](self, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:", a3, a4, a5, a6, 1, a7);
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  _BOOL8 v6;
  _BYTE *v11;
  _BYTE *v12;
  int *v13;
  id v14;
  NSObject *v15;
  _BOOL8 v16;
  void *v17;
  NSObject *v18;
  NSObject *v20;
  id v21;
  void *v22;
  char *v23;
  BOOL v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v6 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", a3, 0);
  if (!v11)
    goto LABEL_11;
  v12 = v11;
  v13 = (int *)MEMORY[0x1E0D46190];
  if (!a4)
  {
    if (v11[*MEMORY[0x1E0D46190]])
      goto LABEL_11;
  }
  v14 = *(id *)&v11[*MEMORY[0x1E0D46188]];
  if (a4)
    *a4 = v12[*v13] ^ 1;
  if (a5)
    *a5 = v12[*MEMORY[0x1E0D46198]];
  v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = a3;
    _os_log_impl(&dword_1C8839000, v15, OS_LOG_TYPE_INFO, "#CacheLoads returning cached body data for %@", buf, 0xCu);
  }
  if (!v14)
  {
LABEL_11:
    v25 = 0;
    v14 = -[MFMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:](self->_library, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:", a3, &v25, a4);
    if (!v14)
    {
LABEL_17:
      if (v25)
        -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3);
      if (!v14)
      {
        v25 = 0;
        v24 = 0;
        v20 = MFLogGeneral();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = a3;
          _os_log_impl(&dword_1C8839000, v20, OS_LOG_TYPE_INFO, "#CacheLoads fetching body data from network for %@", buf, 0xCu);
        }
        v14 = -[MFLibraryStore _fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:](self, "_fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:", a3, &v25, v6, &v24);
        if (v14)
        {
          if (a4)
            *a4 = 1;
          if (a5)
            *a5 = v24;
          v21 = objc_alloc(MEMORY[0x1E0D460B8]);
          v22 = (void *)objc_msgSend(v21, "initWithData:partial:incomplete:", v14, v24, 0);
          v23 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", a3, v22);
          if (v23)
            v14 = *(id *)&v23[*MEMORY[0x1E0D46188]];

          if (v25)
            -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3);
        }
      }
      return v14;
    }
    if (a4)
    {
      v16 = !*a4;
      if (!a5)
        goto LABEL_15;
    }
    else
    {
      v16 = 0;
      if (!a5)
      {
LABEL_15:
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v14, 1, v16);
        -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", a3, v17);

        v18 = MFLogGeneral();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = a3;
          _os_log_impl(&dword_1C8839000, v18, OS_LOG_TYPE_INFO, "#CacheLoads returning body data from Library for %@", buf, 0xCu);
        }
        goto LABEL_17;
      }
    }
    *a5 = 1;
    goto LABEL_15;
  }
  return v14;
}

- (void)deleteBodyDataForMessage:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MFMessageLibrary deleteDataForMessage:](self->_library, "deleteDataForMessage:", a3);
}

- (unint64_t)indexOfMessage:(id)a3
{
  return objc_msgSend(a3, "libraryID");
}

- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double Current;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  MFLibraryStore *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  MailAccount *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  double v36;
  NSObject *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  const __CFString *v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v4 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  Current = CFAbsoluteTimeGetCurrent();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(v12, "account");
        v14 = objc_msgSend(v12, "mailbox");
        if (v4)
        {
          v15 = v14;
          v16 = objc_msgSend(v13, "path");
          if (v15 != objc_msgSend(v13, "mailboxUidOfType:createIfNeeded:", 3, 0))
          {
            if (!objc_msgSend(v6, "objectForKey:", v16))
              objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v16);
            objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v16), "addObject:", v12);
          }
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    }
    while (v9);
  }
  v17 = objc_msgSend(v6, "count");
  v18 = MEMORY[0x1E0C9AAB0];
  v19 = 0x1E0C99000uLL;
  if (v17)
  {
    v59 = CFSTR("MessageIsRead");
    v60 = MEMORY[0x1E0C9AAB0];
    v20 = self;
    -[MFLibraryStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1), a3);
    v21 = (void *)objc_msgSend(v6, "keyEnumerator");
    v22 = objc_msgSend(v21, "nextObject");
    v23 = (void *)v41;
    if (v22)
    {
      v24 = v22;
      do
      {
        v25 = +[MailAccount accountWithPath:](MailAccount, "accountWithPath:", v24);
        v26 = -[MailAccount storeForMailboxUid:](v25, "storeForMailboxUid:", -[MailAccount mailboxUidOfType:createIfNeeded:](v25, "mailboxUidOfType:createIfNeeded:", 3, 1));
        if (v26)
        {
          v27 = (void *)v26;
          v28 = objc_msgSend(v6, "objectForKey:", v24);
          v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v27, "mf_lock");
          objc_msgSend(v27, "appendMessages:unsuccessfulOnes:", v28, v29);
          objc_msgSend(v27, "mf_unlock");

          v23 = (void *)v41;
        }
        v24 = objc_msgSend(v21, "nextObject");
      }
      while (v24);
    }
    if (objc_msgSend(v23, "count"))
    {
      v30 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v31 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v43 != v33)
              objc_enumerationMutation(a3);
            v35 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
            if (objc_msgSend(v23, "indexOfObject:", v35) == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v30, "addObject:", v35);
          }
          v32 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        }
        while (v32);
      }
      v20 = self;
      -[MFMailMessageStore setFlag:state:forMessages:](self, "setFlag:state:forMessages:", CFSTR("MessageIsDeleted"), 0, v23);
      v19 = 0x1E0C99000;
    }
    else
    {
      v30 = a3;
      v19 = 0x1E0C99000uLL;
    }
  }
  else
  {
    v30 = a3;
    v20 = self;
  }
  v56[0] = CFSTR("MessageIsRead");
  v56[1] = CFSTR("MessageIsDeleted");
  v57[0] = v18;
  v57[1] = v18;
  -[MFLibraryStore setFlagsFromDictionary:forMessages:](v20, "setFlagsFromDictionary:forMessages:", objc_msgSend(*(id *)(v19 + 3456), "dictionaryWithObjects:forKeys:count:", v57, v56, 2), v30);
  v36 = CFAbsoluteTimeGetCurrent();
  v37 = MFLogGeneral();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v38 = objc_msgSend(v30, "count");
    v39 = objc_msgSend(v30, "count");
    *(_DWORD *)buf = 134218496;
    v51 = v38;
    v52 = 2048;
    v53 = v36 - Current;
    v54 = 2048;
    v55 = (v36 - Current) / (double)v39;
    _os_log_debug_impl(&dword_1C8839000, v37, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Deleting %lu messages took %4.5f seconds (%4.5f s/msg)", buf, 0x20u);
  }
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  uint64_t v4;
  uint64_t v6;
  double Current;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid", *(_QWORD *)&a3, a4), "URLString");
  Current = CFAbsoluteTimeGetCurrent();
  v8 = -[MFMessageLibrary messagesForMailbox:olderThanNumberOfDays:](self->_library, "messagesForMailbox:olderThanNumberOfDays:", v6, v4);
  v9 = objc_msgSend(v8, "count");
  if (v9)
    -[MFMessageLibrary compactMessages:](self->_library, "compactMessages:", v8);
  v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134218498;
    v12 = v9;
    v13 = 2112;
    v14 = v6;
    v15 = 2048;
    v16 = CFAbsoluteTimeGetCurrent() - Current;
    _os_log_debug_impl(&dword_1C8839000, v10, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Searching for and deleting %lu messages in %@ took: %fs", (uint8_t *)&v11, 0x20u);
  }
}

- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4
{
  return -[MFMessageLibrary setFlagsFromDictionary:forMessages:](self->_library, "setFlagsFromDictionary:forMessages:", a3, a4);
}

- (void)setFlagsForAllMessagesFromDictionary:(id)a3
{
  -[MFMessageLibrary setFlagsFromDictionary:forMessagesInMailboxURLString:](self->_library, "setFlagsFromDictionary:forMessagesInMailboxURLString:", a3, -[MFLibraryStore URLString](self, "URLString"));
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
  -[MFMessageLibrary setNumberOfAttachments:isSigned:isEncrypted:forMessage:](self->_library, "setNumberOfAttachments:isSigned:isEncrypted:forMessage:", *(_QWORD *)&a3, a4, a5, a6);
}

- (BOOL)allowsAppend
{
  return -[MFLibraryStore URLString](self, "URLString") != 0;
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6 flagsToSet:(id)a7
{
  id v13;
  uint64_t v14;
  uint64_t v16;

  if (-[MFLibraryStore allowsAppend](self, "allowsAppend"))
  {
    LOWORD(v16) = 1;
    v13 = -[MFMessageLibrary addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:](self->_library, "addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:", a3, -[MFMailMessageStore mailboxUid](self, "mailboxUid"), 1, 0, 0, 0, 0, a7, v16, 0);
    v14 = objc_msgSend(v13, "count");
    if (v14)
    {
      objc_msgSend(a5, "addObjectsFromArray:", objc_msgSend(v13, "arrayByApplyingSelector:", sel_messageID));
      objc_msgSend(a6, "addObjectsFromArray:", v13);
      -[MFMailMessageStore updateMessages:updateNumberOfAttachments:](self, "updateMessages:updateNumberOfAttachments:", v13, 0);
    }
    if (v14 == objc_msgSend(a3, "count"))
      return 1;
  }
  objc_msgSend(a4, "addObjectsFromArray:", a3);
  return 0;
}

- (BOOL)canCompact
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFLibraryStore;
  v3 = -[MFMailMessageStore canCompact](&v5, sel_canCompact);
  if (v3)
    LOBYTE(v3) = -[MFMailMessageStore isOpened](self, "isOpened");
  return v3;
}

- (void)doCompact
{
  id v3;

  if (-[MFLibraryStore canCompact](self, "canCompact"))
  {
    v3 = -[MFLibraryStore URLString](self, "URLString");
    if (v3)
    {
      if (self->super._deletedMessageCount)
        -[MFMessageLibrary compactMailbox:](self->_library, "compactMailbox:", v3);
    }
  }
}

- (void)compactMessages:(id)a3
{
  if (objc_msgSend(a3, "count"))
    -[MFMessageLibrary compactMessages:](self->_library, "compactMessages:", a3);
}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  return -[MFMessageLibrary dataPathForMessage:part:](self->_library, "dataPathForMessage:part:", a3, a4);
}

- (id)criterion
{
  return (id)objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "criterion");
}

- (id)URLString
{
  return (id)objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "URLString");
}

+ (BOOL)createEmptyStoreForPath:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "hasPrefix:", CFSTR("/"));
  if (v4)
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "mf_makeCompletePath:mode:", a3, 448);
  return v4;
}

+ (BOOL)storeAtPathIsWritable:(id)a3
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "mf_canWriteToDirectoryAtPath:", a3);
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  return objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "serverUnreadOnlyOnServerCount");
}

- (unint64_t)unreadCount
{
  return objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "unreadCount");
}

- (unint64_t)unreadCountMatchingCriterion:(id)a3
{
  return objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "unreadCountMatchingCriterion:", a3);
}

- (id)newObjectCache
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460D0]), "initWithCapacity:", 32);
  v3 = objc_opt_class();
  objc_msgSend(v2, "setKeyGenerator:", &__block_literal_global_63);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MFLibraryStore_newObjectCache__block_invoke_2;
  v5[3] = &unk_1E81CA1D0;
  v5[4] = v3;
  objc_msgSend(v2, "setComparator:", v5);
  return v2;
}

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return a3 | (4 * objc_msgSend(a2, "libraryID"));
}

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  BOOL v9;

  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (int)*MEMORY[0x1E0D46190];
  v6 = *(unsigned __int8 *)(a2 + v5);
  if (!*(_BYTE *)(a2 + v5) || *(_BYTE *)(a3 + v5))
  {
    v7 = (int)*MEMORY[0x1E0D46198];
    if (!*(_BYTE *)(a2 + v7) || *(_BYTE *)(a3 + v7))
    {
      v8 = *(unsigned __int8 *)(a3 + v5);
      if (v6)
        v9 = 1;
      else
        v9 = v8 == 0;
      if (!v9)
        return 1;
      return !*(_BYTE *)(a2 + v7) && *(_BYTE *)(a3 + v7) != 0;
    }
  }
  return -1;
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  return a4;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  objc_super v8;

  if (objc_msgSend(a3, "isLibraryMessage"))
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryStore;
    return -[MFLibraryStore _cachedHeadersForMessage:valueIfNotPresent:](&v8, sel__cachedHeadersForMessage_valueIfNotPresent_, a3, a4);
  }
  return a4;
}

- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  objc_super v8;

  if (objc_msgSend(a3, "isLibraryMessage"))
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryStore;
    return -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](&v8, sel__cachedHeaderDataForMessage_valueIfNotPresent_, a3, a4);
  }
  return a4;
}

- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  objc_super v8;

  if (objc_msgSend(a3, "isLibraryMessage"))
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryStore;
    return -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](&v8, sel__cachedBodyDataContainerForMessage_valueIfNotPresent_, a3, a4);
  }
  return a4;
}

- (void)purgeMessages:(id)a3
{
  -[MFMessageLibrary compactMessages:](self->_library, "compactMessages:", a3);
}

- (void)purgeMessagesBeyondLimit:(unint64_t)a3 keepingMessage:(id)a4
{
  unsigned int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v7 = -[MFMessageLibrary nonDeletedCountForMailbox:](self->_library, "nonDeletedCountForMailbox:", objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "URLString"));
  if (v7 > a3)
  {
    if (a4)
      v8 = 144;
    else
      v8 = 128;
    v9 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", a3, v7 - a3, v8);
    if (a4)
    {
      v12 = v9;
      v10 = objc_msgSend(v9, "indexOfObject:", a4);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v12;
      }
      else
      {
        v11 = (id)objc_msgSend(v12, "subarrayWithRange:", v10 + 1, objc_msgSend(v12, "count") - (v10 + 1));

        v9 = v11;
      }
    }
    v13 = v9;
    if (objc_msgSend(v9, "count"))
      -[MFLibraryStore purgeMessages:](self, "purgeMessages:", v13);

  }
}

- (BOOL)hasMessageForAccount:(id)a3
{
  unsigned int v5;
  objc_super v7;

  v5 = -[MFMessageLibrary nonDeletedCountForMailbox:](self->_library, "nonDeletedCountForMailbox:", objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "URLString"));
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)MFLibraryStore;
    LOBYTE(v5) = -[MFMailMessageStore hasMessageForAccount:](&v7, sel_hasMessageForAccount_, a3);
  }
  return v5;
}

- (void)_queueMessagesAdded:(id)a3
{
  id v4;

  v4 = 0;
  objc_msgSend((id)-[MFLibraryStore pep_getInvocation:](self, "pep_getInvocation:", &v4), "handleMessagesAdded:earliestReceivedDate:", a3, self->_earliestReceivedDate);
  objc_msgSend(v4, "retainArguments");
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:", v4);
}

- (void)_queueMessageFlagsChanged:(id)a3
{
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:", objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_handleMessageFlagsChanged_, self, a3));
}

- (void)_queueMessagesWillBeCompacted:(id)a3
{
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:", objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_handleMessagesWillBeCompacted_, self, a3));
}

- (void)_queueMessagesWereCompacted:(id)a3
{
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:", objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_handleMessagesCompacted_, self, a3));
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFLibraryStore;
  return -[MFLibraryStore hasCompleteDataForMimePart:](&v6, sel_hasCompleteDataForMimePart_)
      || -[MFMessageLibrary hasCompleteDataForMimePart:](self->_library, "hasCompleteDataForMimePart:", a3);
}

- (NSDate)earliestReceivedDate
{
  return self->_earliestReceivedDate;
}

- (void)setEarliestReceivedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
