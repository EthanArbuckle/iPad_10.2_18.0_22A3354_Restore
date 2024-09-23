@implementation MFLibraryStore

- (id)copyOfAllMessagesWithOptions:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[MFLibraryStore mf_lock](self, "mf_lock");
  v5 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", 0, 0x7FFFFFFFFFFFFFFFLL, v3);
  if (objc_msgSend(v5, "count") && self->_state <= 1)
  {
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
    -[MFLibraryStore messagesWereAdded:](self, "messagesWereAdded:", v5);
    -[MFLibraryStore addCountsForMessages:shouldUpdateUnreadCount:](self, "addCountsForMessages:shouldUpdateUnreadCount:", v5, 0);
  }
  else
  {
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
  }
  return v5;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4 generation:(unint64_t *)a5
{
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  MFMailMessageLibrary *library;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = *(_QWORD *)&a4;
  length = a3.length;
  location = a3.location;
  v32 = *MEMORY[0x1E0C80C00];
  -[MFLibraryStore mf_lock](self, "mf_lock");
  if (a5)
    *a5 = self->_generationNumber;
  if ((_DWORD)v6 == 6297663)
  {
    library = self->_library;
    -[MFLibraryStore URLString](self, "URLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary messagesWithSummariesForMailbox:range:](library, "messagesWithSummariesForMailbox:range:", v12, location, length);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v6 & 0x1800) != 0)
    {
      v14 = (void *)MEMORY[0x1E0C99DE8];
      -[MFLibraryStore criterion](self, "criterion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayWithObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v6 & 0x800) != 0)
      {
        +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

      }
      if ((v6 & 0x1000) != 0)
      {
        +[MFMessageCriterion messageIsServerSearchResultCriterion:](MFMessageCriterion, "messageIsServerSearchResultCriterion:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

      }
      +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MFLibraryStore criterion](self, "criterion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MFMailMessageLibrary messagesMatchingCriterion:options:range:](self->_library, "messagesMatchingCriterion:options:range:", v12, v6, location, length);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v13;

  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v24, "setMessageStore:", self, (_QWORD)v27);
        if (!objc_msgSend(v24, "generationNumber"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LibraryStore.m"), 300, CFSTR("messages shouldn't have a zero generation number."));

        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v21);
  }

  return v20;
}

- (id)criterion
{
  void *v2;
  void *v3;

  -[MFLibraryStore mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "criterion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4
{
  return -[MFLibraryStore copyOfMessagesInRange:options:generation:](self, "copyOfMessagesInRange:options:generation:", a3.location, a3.length, *(_QWORD *)&a4, 0);
}

- (id)newObjectCache
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460D0]), "initWithCapacity:", 32);
  v3 = objc_opt_class();
  objc_msgSend(v2, "setKeyGenerator:", &__block_literal_global_95);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MFLibraryStore_newObjectCache__block_invoke_2;
  v5[3] = &__block_descriptor_40_e11_q24__0_8_16lu32l8;
  v5[4] = v3;
  objc_msgSend(v2, "setComparator:", v5);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MFLibraryStore setLibrary:](self, "setLibrary:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFLibraryStore;
  -[MFLibraryStore dealloc](&v3, sel_dealloc);
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (MFLibraryStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  MFLibraryStore *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "criterion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MFLibraryStore initWithCriterion:mailbox:readOnly:](self, "initWithCriterion:mailbox:readOnly:", v7, v6, v4);

  return v8;
}

- (MFLibraryStore)initWithCriterion:(id)a3 mailbox:(id)a4 readOnly:(BOOL)a5
{
  id v8;
  id v9;
  MFLibraryStore *v10;
  MFLibraryStore *v11;
  uint64_t v12;
  MailAccount *account;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFLibraryStore;
  v10 = -[MFLibraryStore init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_criterion, a3);
    objc_storeStrong((id *)&v11->_mailbox, a4);
    objc_msgSend(v9, "account");
    v12 = objc_claimAutoreleasedReturnValue();
    account = v11->_account;
    v11->_account = (MailAccount *)v12;

    *(_DWORD *)&v11->_flags |= 0x100u;
  }

  return v11;
}

- (void)willFetchMessages
{
  void *v3;
  void *v4;
  id v5;

  -[MFLibraryStore library](self, "library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore URLString](self, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateOfOldestNonSearchResultMessageInMailbox:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore setEarliestReceivedDate:](self, "setEarliestReceivedDate:", v4);

}

- (void)setEarliestReceivedDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestReceivedDate, a3);
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

- (unint64_t)fetchWindowCap
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("FetchWithoutLimits"));

  if (v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 10000;
}

- (unint64_t)allNonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  MFMailMessageLibrary *library;
  void *v7;
  unint64_t v8;

  v4 = a4;
  v5 = a3;
  library = self->_library;
  -[MFLibraryStore URLString](self, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MFMailMessageLibrary allNonDeleteCountForMailbox:includeServerSearchResults:includeThreadSearchResults:](library, "allNonDeleteCountForMailbox:includeServerSearchResults:includeThreadSearchResults:", v7, v5, v4);

  return v8;
}

- (NSString)URLString
{
  void *v2;
  void *v3;

  -[MFLibraryStore mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)_fetchWindowMultiple
{
  void *v2;
  unint64_t v3;

  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFatPipe") & 1) != 0)
  {
    v3 = 250;
  }
  else if (objc_msgSend(v2, "is4GConnection"))
  {
    v3 = 250;
  }
  else
  {
    v3 = 100;
  }

  return v3;
}

- (unint64_t)_fetchWindowMinimum
{
  void *v2;
  unint64_t v3;

  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFatPipe") & 1) != 0 || (objc_msgSend(v2, "is4GConnection") & 1) != 0)
  {
    v3 = 3000;
  }
  else if (objc_msgSend(v2, "is3GConnection"))
  {
    v3 = 100;
  }
  else
  {
    v3 = 50;
  }

  return v3;
}

- (int64_t)fetchMobileSynchronously:(unint64_t)lastFetchCount preservingUID:(id)a4 options:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int64_t v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v36;
  void (**v37)(void);
  __CFString *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v41 = a4;
  kdebug_trace();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMailbox:", v8);

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addReason:", CFSTR("MonitoredActivityReasonFetching"));

  -[MFLibraryStore mailbox](self, "mailbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLString");
  v11 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@|%lu|%@|%d"), v42, lastFetchCount, v41, (a5 >> 1) & 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore account](self, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v12;
  v14 = objc_msgSend(v13, "willPerformActionForChokePoint:coalescePoint:result:", v42, v43, &v45);
  v15 = v45;

  if (v15)
    v16 = 0;
  else
    v16 = v14;
  if (v16 == 1)
  {
    do
    {
      -[MFLibraryStore account](self, "account");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      LOBYTE(v14) = objc_msgSend(v17, "willPerformActionForChokePoint:coalescePoint:result:", v42, v43, &v44);
      v15 = v44;

      if (v15)
        v18 = 0;
      else
        v18 = v14;
    }
    while ((v18 & 1) != 0);
  }
  if ((v14 & 1) != 0)
  {
    v19 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v39);
    v20 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v20;
    MFAutoFetchLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v20;
      _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "Issuing fetch for mailbox: %@", buf, 0xCu);
    }

    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startedFetch");
    v37 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    if (v37)
      v37[2]();
    -[MFLibraryStore account](self, "account");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "powerAssertionIdentifierWithPrefix:");
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = CFSTR("com.apple.message.fetchMobileSynchronously");
    }
    +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "retainAssertionWithIdentifier:withAccount:", v38, v24);

    -[MFLibraryStore mf_lock](self, "mf_lock");
    if (lastFetchCount)
      self->_lastFetchCount = lastFetchCount;
    else
      lastFetchCount = self->_lastFetchCount;
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
    v26 = -2;
    do
    {
      v27 = -[MFLibraryStore fetchNumMessages:preservingUID:options:](self, "fetchNumMessages:preservingUID:options:", lastFetchCount, v41, a5);
      if ((v27 & 0x8000000000000000) == 0)
        break;
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "error");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v24, "shouldFetchAgainWithError:foregroundRequest:", v29, (a5 >> 4) & 1);

      v31 = v26++ ? v30 : 0;
    }
    while ((v31 & 1) != 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFLibraryStore account](self, "account");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "didFinishActionForChokePoint:coalescePoint:withResult:", v42, v43, v19);

    +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "releaseAssertionWithIdentifier:", v38);

  }
  kdebug_trace();
  v34 = objc_msgSend(v19, "integerValue");

  return v34;
}

- (MailAccount)account
{
  return self->_account;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setLibrary:(id)a3
{
  MFMailMessageLibrary *v5;
  MFMailMessageLibrary **p_library;
  void *v7;
  void *v8;
  MFMailMessageLibrary *v9;

  v5 = (MFMailMessageLibrary *)a3;
  p_library = &self->_library;
  if (self->_library != v5)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*p_library)
      objc_msgSend(v7, "removeObserver:name:object:", self, 0);
    objc_storeStrong((id *)&self->_library, a3);
    if (v9)
    {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__queueMessagesAdded_, CFSTR("MailMessageStoreMessagesAdded"), *p_library);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__queueMessageFlagsChanged_, CFSTR("MailMessageStoreMessageFlagsChanged"), *p_library);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__queueMessagesWillBeCompacted_, CFSTR("MailMessageStoreMessagesWillBeCompacted"), *p_library);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__queueMessagesWereCompacted_, CFSTR("MailMessageStoreMessagesRemoved"), *p_library);
    }
    -[MFLibraryStore invalidateFetchWindow](self, "invalidateFetchWindow");

    v5 = v9;
  }

}

- (void)invalidateFetchWindow
{
  -[MFLibraryStore mf_lock](self, "mf_lock");
  self->_fetchWindow = 0;
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
}

- (void)openSynchronously
{
  -[MFLibraryStore mf_lock](self, "mf_lock");
  if (self->_state > 2)
  {
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
  }
  else
  {
    self->_state = 2;
    -[MFLibraryStore mf_unlock](self, "mf_unlock");
    self->_state = 3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_earliestReceivedDate, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
}

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

+ (unsigned)defaultLoadOptions
{
  return 3;
}

+ (id)attachmentInfoCalculationScheduler
{
  if (attachmentInfoCalculationScheduler_onceToken != -1)
    dispatch_once(&attachmentInfoCalculationScheduler_onceToken, &__block_literal_global_12);
  return (id)attachmentInfoCalculationScheduler_sInstance;
}

void __52__MFLibraryStore_attachmentInfoCalculationScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.message.library.MFLibraryStore.attachmentInfoCalculationScheduler"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attachmentInfoCalculationScheduler_sInstance;
  attachmentInfoCalculationScheduler_sInstance = v0;

}

- (MFLibraryStore)initWithMailbox:(id)a3
{
  return -[MFLibraryStore initWithMailbox:readOnly:](self, "initWithMailbox:readOnly:", a3, 0);
}

+ (id)storeWithMailbox:(id)a3
{
  id v3;
  MFLibraryStore *v4;

  v3 = a3;
  v4 = -[MFLibraryStore initWithMailbox:]([MFLibraryStore alloc], "initWithMailbox:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MFLibraryStore mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p (uid=%@)>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (Class)headersClass
{
  return (Class)objc_opt_class();
}

- (void)_flushAllMessageData
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  -[MFLibraryStore mf_lock](self, "mf_lock");
  self->_deletedMessageCount = 0;
  self->_deletedMessagesSize = 0;
  _MFLockGlobalLock();
  v3 = (int)*MEMORY[0x1E0D461D8];
  v4 = *(Class *)((char *)&self->super.super.isa + v3);
  *(Class *)((char *)&self->super.super.isa + v3) = 0;

  _MFUnlockGlobalLock();
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryStore;
  -[MFLibraryStore _flushAllMessageData](&v5, sel__flushAllMessageData);
}

- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFLibraryStore;
  -[MFLibraryStore _setOrGetBody:forMessage:updateFlags:](&v13, sel__setOrGetBody_forMessage_updateFlags_, v8, v9, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v8 && v5)
    -[MFLibraryStore _calcAttachmentInfoForMessage:body:](self, "_calcAttachmentInfoForMessage:body:", v9, v8);

  return v10;
}

+ (id)sharedInstance
{
  pthread_once(&sSharedInstanceInitializer, initializeSharedInstance);
  return (id)objc_msgSend(a1, "sharedInstanceIfExists");
}

+ (id)sharedInstanceIfExists
{
  return (id)sSharedInstance;
}

- (MFMailboxUid)mailboxUid
{
  return self->_mailbox;
}

- (void)addCountsForMessages:(id)a3 shouldUpdateUnreadCount:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(v10, "count");
  -[MFLibraryStore mf_lock](self, "mf_lock");
  if (v5)
  {
    v6 = v5 - 1;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "messageFlags");
      v9 = objc_msgSend(v7, "messageSize");
      if ((v8 & 2) != 0)
      {
        ++self->_deletedMessageCount;
        self->_deletedMessagesSize += v9;
      }

      --v6;
    }
    while (v6 != -1);
  }
  -[MFLibraryStore mf_unlock](self, "mf_unlock");

}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)_addInvocationToQueue:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v5 = v3;
  if (_addInvocationToQueue__onceToken == -1)
  {
    v4 = v3;
  }
  else
  {
    dispatch_once(&_addInvocationToQueue__onceToken, &__block_literal_global_39);
    v4 = v5;
  }
  objc_msgSend((id)_addInvocationToQueue__sInvocationQueue, "addInvocation:", v4);

}

uint64_t __40__MFLibraryStore__addInvocationToQueue___block_invoke()
{
  MFInvocationQueue *v0;
  void *v1;

  v0 = objc_alloc_init(MFInvocationQueue);
  v1 = (void *)_addInvocationToQueue__sInvocationQueue;
  _addInvocationToQueue__sInvocationQueue = (uint64_t)v0;

  return objc_msgSend((id)_addInvocationToQueue__sInvocationQueue, "setThreadRecycleTimeout:", 60.0);
}

- (BOOL)isOpened
{
  return self->_state == 3;
}

- (unint64_t)totalCount
{
  MFMailMessageLibrary *library;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  library = self->_library;
  -[MFLibraryStore criterion](self, "criterion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary groupedMessagesCountForCriterion:groupBy:](library, "groupedMessagesCountForCriterion:groupBy:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", &stru_1E4F1C8F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (unint64_t)serverMessageCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)copyOfAllMessages
{
  return -[MFLibraryStore copyOfAllMessagesWithOptions:](self, "copyOfAllMessagesWithOptions:", 3);
}

- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MFLibraryStore criterion](self, "criterion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v6, 0);

  if ((a4 & 0x800) != 0)
  {
    +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore library](self, "library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messagesMatchingCriterion:options:", v11, a4 | 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  return v13;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a5;
  -[MFLibraryStore library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copyMessagesWithRemoteIDs:options:inRemoteMailbox:", v8, a4 | 3, v11);

  objc_msgSend(v12, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  return v12;
}

- (id)searchResultsWithRemoteIDs:(id)a3 inMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[MFLibraryStore library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchResultsWithRemoteIDs:inRemoteMailbox:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  return v10;
}

- (id)serverSearchResults
{
  void *v3;
  void *v4;
  void *v5;

  -[MFLibraryStore library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore URLString](self, "URLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverSearchResultMessagesForMailbox:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  return v5;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessage
{
  void *v3;
  void *v4;
  void *v5;

  -[MFLibraryStore mf_lock](self, "mf_lock");
  -[MFLibraryStore library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore URLString](self, "URLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateOfOldestNonIndexedNonSearchResultMessageInMailbox:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  return v5;
}

- (BOOL)hasMoreFetchableMessages
{
  unint64_t v3;

  v3 = -[MFLibraryStore serverMessageCount](self, "serverMessageCount");
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && v3 > -[MFLibraryStore allNonDeletedCountIncludingServerSearch:andThreadSearch:](self, "allNonDeletedCountIncludingServerSearch:andThreadSearch:", 0, 0);
}

- (BOOL)shouldGrowFetchWindow
{
  unint64_t v3;
  _BOOL4 v4;
  unint64_t v5;

  v3 = -[MFLibraryStore fetchWindow](self, "fetchWindow");
  if (v3 >= -[MFLibraryStore fetchWindowCap](self, "fetchWindowCap"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = -[MFLibraryStore hasMoreFetchableMessages](self, "hasMoreFetchableMessages");
    if (v4)
    {
      v5 = -[MFLibraryStore serverMessageCount](self, "serverMessageCount");
      LOBYTE(v4) = v5 > -[MFLibraryStore fetchWindow](self, "fetchWindow");
    }
  }
  return v4;
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

- (int64_t)fetchMobileSynchronously:(unint64_t)a3
{
  return -[MFLibraryStore fetchMobileSynchronously:preservingUID:options:](self, "fetchMobileSynchronously:preservingUID:options:", a3, 0, 35);
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  void *v5;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  return 0;
}

- (BOOL)canFetchSearchResults
{
  return 0;
}

- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7
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

- (id)messageIdRollCall:(id)a3
{
  return 0;
}

- (id)messageForRemoteID:(id)a3
{
  id v4;
  MFMailMessageLibrary *library;
  void *v6;
  void *v7;

  v4 = a3;
  library = self->_library;
  -[MFLibraryStore URLString](self, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary messageWithMessageID:options:inMailbox:](library, "messageWithMessageID:options:inMailbox:", v4, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMessageStore:", self);
  return v7;
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

- (id)filterMessagesByMembership:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  MFMailboxUid *mailbox;
  void *v10;
  MFMailboxUid *v11;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        mailbox = self->_mailbox;
        if (mailbox)
        {
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "mailbox", (_QWORD)v14);
          v11 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue();
          v12 = mailbox == v11;

          if (v12)
          {
            if (!v5)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v5, "addObject:", v10);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v5;
}

- (void)handleMessagesAdded:(id)a3 earliestReceivedDate:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("messages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("mailboxes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v8, "indexOfObject:", v9) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v7;
    v13 = 0;
  }
  else
  {
    -[MFLibraryStore criterion](self, "criterion");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = 0;
    if (v9 || !v10)
    {
      v13 = (void *)v10;
    }
    else
    {
      -[MFMailMessageLibrary filterContiguousMessages:forCriterion:options:](self->_library, "filterContiguousMessages:forCriterion:options:", v7, v10, 3);
      v13 = v11;
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (objc_msgSend(v12, "count"))
  {
    -[MFLibraryStore addCountsForMessages:shouldUpdateUnreadCount:](self, "addCountsForMessages:shouldUpdateUnreadCount:", v12, 0);
    -[MFLibraryStore messagesWereAdded:earliestReceivedDate:](self, "messagesWereAdded:earliestReceivedDate:", v12, v14);
  }

}

- (void)messagesWereAdded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore messagesWereAdded:earliestReceivedDate:](self, "messagesWereAdded:earliestReceivedDate:", v5, v4);

}

- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4
{
  unint64_t generationNumber;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "makeObjectsPerformSelector:withObject:", sel_setMessageStore_, self);
  generationNumber = self->_generationNumber;
  if (generationNumber == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 1;
  else
    v6 = generationNumber + 1;
  self->_generationNumber = v6;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, CFSTR("messages"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessagesAdded"), self, v7);

  }
}

- (void)messagesWillBeCompacted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("messages");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessagesWillBeCompacted"), self, v6);

  }
}

- (void)messagesWereCompacted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("messages");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessagesRemoved"), self, v6);

  }
}

- (void)messageFlagsDidChange:(id)a3 flags:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("messages"), v6, CFSTR("flags"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessageFlagsChanged"), self, v8);

}

- (void)allMessageFlagsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = CFSTR("flags");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessageFlagsChanged"), self, v5);

}

- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t deletedMessageCount;
  unint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MFLibraryStore mf_lock](self, "mf_lock", v8);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "intValue");

        if (v9)
          v17 = MFMessageFlagsByApplyingDictionary(v16, v9);
        else
          v17 = objc_msgSend(v14, "messageFlags");
        if ((((unint64_t)v16 >> 1) & 1) != ((v17 >> 1) & 1))
        {
          v18 = objc_msgSend(v14, "messageSize");
          deletedMessageCount = self->_deletedMessageCount;
          if ((v16 & 2) != 0)
          {
            self->_deletedMessageCount = deletedMessageCount - 1;
            v20 = self->_deletedMessagesSize - v18;
          }
          else
          {
            self->_deletedMessageCount = deletedMessageCount + 1;
            v20 = self->_deletedMessagesSize + v18;
          }
          self->_deletedMessagesSize = v20;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[MFLibraryStore mf_unlock](self, "mf_unlock");
}

- (void)handleMessageFlagsChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("mailboxes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("messages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore filterMessagesByMembership:](self, "filterMessagesByMembership:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("flags"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("oldFlagsByMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[MFLibraryStore _handleFlagsChangedForMessages:flags:oldFlagsByMessage:](self, "_handleFlagsChangedForMessages:flags:oldFlagsByMessage:", v6, v7, v8);
    -[MFLibraryStore messageFlagsDidChange:flags:](self, "messageFlagsDidChange:flags:", v6, v7);

    goto LABEL_5;
  }
  if (self->_mailbox && objc_msgSend(v4, "containsObject:"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("flags"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLibraryStore allMessageFlagsDidChange:](self, "allMessageFlagsDidChange:", v7);
LABEL_5:

  }
}

- (id)_memberMessagesWithCompactionNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  MFMailboxUid *mailbox;
  MFMailboxUid *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(v16, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(v17, "objectForKey:", CFSTR("mailboxes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") && self->_mailbox && objc_msgSend(v5, "indexOfObject:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v4;
    v6 = 0;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          mailbox = self->_mailbox;
          objc_msgSend(v13, "mailbox");
          v15 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue();
          LODWORD(mailbox) = mailbox == v15;

          if ((_DWORD)mailbox)
          {
            if (!v6)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v6, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)handleMessagesCompacted:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFLibraryStore mf_lock](self, "mf_lock");
  -[MFLibraryStore _memberMessagesWithCompactionNotification:](self, "_memberMessagesWithCompactionNotification:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    self->_deletedMessagesSize = 0;
    self->_deletedMessageCount = 0;
  }
  -[MFLibraryStore mf_unlock](self, "mf_unlock");
  -[MFLibraryStore messagesWereCompacted:](self, "messagesWereCompacted:", v4);

}

- (void)handleMessagesWillBeCompacted:(id)a3
{
  id v4;

  -[MFLibraryStore _memberMessagesWithCompactionNotification:](self, "_memberMessagesWithCompactionNotification:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore messagesWillBeCompacted:](self, "messagesWillBeCompacted:");

}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 0;
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  objc_msgSend(v3, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(v3, "isMessageContentsLocallyAvailable") ^ 1;

  return v5;
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordTransportType:", 1);

  -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[MFLibraryStore _fetchHeaderDataForMessage:downloadIfNecessary:](self, "_fetchHeaderDataForMessage:downloadIfNecessary:", v6, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", v6, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  -[MFMailMessageLibrary headerDataForMessage:](self->_library, "headerDataForMessage:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordTransportType:", 1);

  -[MFMailMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:](self->_library, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    *a6 = 1;

  return v11;
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
  id v13;
  id v14;
  void *v15;
  void *v16;

  v8 = a6;
  length = a4.length;
  location = a4.location;
  v13 = a3;
  v14 = objc_alloc_init(MEMORY[0x1E0D46068]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46120]), "initWithConsumer:", v14);
  LODWORD(v8) = -[MFLibraryStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", v13, location, length, a5, v15, v8, a7);
  objc_msgSend(v15, "done");
  if (v8)
  {
    objc_msgSend(v14, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  int *v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  char *v30;
  NSObject *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  __CFString *v37;
  void *v38;
  void *v40;
  int v41;
  NSObject *v42;
  __CFString *v43;
  void *v44;
  _BOOL4 v45;
  _BOOL4 v46;
  NSObject *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  __CFString *v53;
  void *v54;
  char *v55;
  _BOOL4 v56;
  id v58;
  uint8_t buf[4];
  const __CFString *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v56 = a7;
  length = a4.length;
  location = a4.location;
  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v58 = a6;
  objc_msgSend(v12, "mimeBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  MFLogGeneral();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "messageID");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "partNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v16;
    v61 = 2114;
    v62 = v17;
    _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_INFO, "#CacheLoads requesting data for MIME part %{public}@:%{public}@", buf, 0x16u);

  }
  if (!v14)
  {
    MFLogGeneral();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[MFLibraryStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:].cold.1(v23);

    goto LABEL_17;
  }
  objc_msgSend(v12, "parentPart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = 0;
  else
    v19 = length == 0x7FFFFFFFFFFFFFFFLL;
  v20 = v19;

  if (!v20)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recordTransportType:", 1);

    -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v14, 0);
    v55 = (char *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      v25 = (int *)MEMORY[0x1E0D46188];
      if (*(_QWORD *)&v55[*MEMORY[0x1E0D46188]])
      {
        MFLogGeneral();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "messageID");
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "partNumber");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v27;
          v61 = 2114;
          v62 = v28;
          _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_INFO, "#CacheLoads found full cached data for %{public}@:%{public}@", buf, 0x16u);

        }
        partDataFromFullBodyDataWithUnixLineEndings(*(void **)&v55[*v25], v14, v12, a5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = v55;
          objc_msgSend(v58, "appendData:", v29);
LABEL_33:

          goto LABEL_34;
        }
      }
    }
    if (!location)
    {
      -[MFLibraryStore library](self, "library");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "dataForMimePart:isComplete:", v12, a5);
      v35 = objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        MFLogGeneral();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "messageID");
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "partNumber");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v37;
          v61 = 2114;
          v62 = v38;
          _os_log_impl(&dword_1A4F90000, v36, OS_LOG_TYPE_INFO, "#CacheLoads found part data in database %{public}@:%{public}@", buf, 0x16u);

        }
        v30 = v55;
        objc_msgSend(v58, "appendData:", v35);
        v29 = (void *)v35;
        goto LABEL_33;
      }
    }
    partDataFromFullBodyData(self, v14, v12, a5, 0, (uint64_t)a8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      MFLogGeneral();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "messageID");
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "partNumber");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v32;
        v61 = 2114;
        v62 = v33;
        _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_INFO, "#CacheLoads extracted part data from full body data in database %{public}@:%{public}@", buf, 0x16u);

      }
      v30 = v55;
      objc_msgSend(v58, "appendData:", v29);
      goto LABEL_33;
    }
    objc_msgSend(v12, "type");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("multipart"));

    if ((v56 & ~v41) != 0)
    {
      MFLogGeneral();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "messageID");
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "partNumber");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v43;
        v61 = 2114;
        v62 = v44;
        _os_log_impl(&dword_1A4F90000, v42, OS_LOG_TYPE_INFO, "#CacheLoads downloading part data from server %{public}@:%{public}@", buf, 0x16u);

      }
      v45 = -[MFLibraryStore _fetchDataForMimePart:range:isComplete:consumer:](self, "_fetchDataForMimePart:range:isComplete:consumer:", v12, location, length, a5, v58);
      v46 = v45;
      if (a8)
        *a8 = v45;
      MFLogGeneral();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        if (v46)
          v48 = CFSTR("SUCCESS");
        else
          v48 = CFSTR("FAILED");
        objc_msgSend(v14, "messageID", v55);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "partNumber");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v60 = v48;
        v61 = 2114;
        v62 = v49;
        v63 = 2114;
        v64 = v50;
        _os_log_impl(&dword_1A4F90000, v47, OS_LOG_TYPE_INFO, "#CacheLoads %@ downloading part data from server %{public}@:%{public}@", buf, 0x20u);

      }
    }
    else
    {
      v46 = 0;
    }
    if (!v46 && v56)
    {
      partDataFromFullBodyData(self, v14, v12, a5, 1, (uint64_t)a8);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        MFLogGeneral();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "messageID");
          v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "partNumber");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v53;
          v61 = 2114;
          v62 = v54;
          _os_log_impl(&dword_1A4F90000, v52, OS_LOG_TYPE_INFO, "#CacheLoads extracted part data from full body data via download %{public}@:%{public}@", buf, 0x16u);

        }
        objc_msgSend(v58, "appendData:", v51);

        goto LABEL_34;
      }
    }

    if (v46)
    {
LABEL_34:
      v22 = 1;
      goto LABEL_35;
    }
LABEL_17:
    v22 = 0;
    goto LABEL_35;
  }
  -[MFLibraryStore fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:](self, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:", v14, 0, 0, v56, 0, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v58, "appendData:", v21);
  v22 = v21 != 0;

LABEL_35:
  return v22;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id obj;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  _BOOL4 v55;
  uint64_t v56;

  v5 = a5;
  v56 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = a4;
  objc_msgSend(v40, "mimeBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v8;
  if (!objc_msgSend(v8, "isLibraryMessage"))
  {
    v37 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(v40, "isHTML"))
  {
    -[MFLibraryStore library](self, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storeRemoteContentLinksFromData:forMessage:mimePart:", v39, v8, v40);
  }
  else
  {
    if ((_os_feature_enabled_impl() & 1) == 0 && !_os_feature_enabled_impl())
      goto LABEL_9;
    -[MFLibraryStore library](self, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detectDataFromPlainTextMessage:forMessage:mimePart:", v39, v8, v40);
  }

LABEL_9:
  MFPersistenceLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v11;
    v52 = 2114;
    v53 = v40;
    v54 = 1026;
    v55 = v5;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Storing data for MIME part: %{public}@ of message: %{public}@ complete: %{public}d", buf, 0x1Cu);

  }
  -[MFLibraryStore library](self, "library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "partNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataConsumerForMessage:part:incomplete:", v41, v13, !v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "appendData:", v39);
  objc_msgSend(v38, "done");
  objc_msgSend(v38, "data");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "updateSubjectFromEncryptedContent"))
  {
    -[MFLibraryStore library](self, "library");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subjectWithoutPrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateUnprefixedSubjectTo:forMessage:", v16, v41);

  }
  objc_msgSend(v41, "signatureInfoIfDecodingIsComplete:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v17 = objc_alloc(MEMORY[0x1E0D1E0D0]);
    objc_msgSend(v36, "smimeCapabilities");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "signingDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v20 = v18;
    else
      v20 = (void *)MEMORY[0x1E0C9AA60];
    v43 = (void *)objc_msgSend(v17, "initWithCapabilities:date:", v20, v19);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v36, "addresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v21;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[MFLibraryStore library](self, "library");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "persistence");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "messagePersistence");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v25;
          objc_msgSend(v29, "emailAddressValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "simpleAddress");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            v33 = v31;
          }
          else
          {
            objc_msgSend(v29, "stringValue");
            v33 = (id)objc_claimAutoreleasedReturnValue();
          }
          v34 = v33;

          objc_msgSend(v28, "setMetadata:forAddress:", v43, v34);
        }
        v21 = obj;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v22);
    }

  }
LABEL_29:

  return v37;
}

- (id)_copyDataFromMimePart:(id)a3 threshold:(unsigned int)a4 downloadIfNecessary:(BOOL)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  __CFDictionary *Mutable;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  MFMessageWriter *v31;
  id v32;
  unint64_t v34;
  _BOOL4 v35;
  id v36;

  v35 = a5;
  v36 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  if (a4 != -1)
  {
    objc_msgSend(v6, "addObject:", v36);
    LOBYTE(v8) = 0;
    while (!((objc_msgSend(v7, "count") == 0) | v8 & 1))
    {
      objc_msgSend(v7, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstChildPart");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        do
        {
          objc_msgSend(v7, "addObject:", v8);
          objc_msgSend((id)v8, "nextSiblingPart");
          v10 = objc_claimAutoreleasedReturnValue();

          v8 = v10;
        }
        while (v10);
      }
      else if (objc_msgSend(v9, "isAttachment"))
      {
        objc_msgSend(v9, "range");
        LOBYTE(v8) = v11 >= a4;
      }
      else
      {
        LOBYTE(v8) = 0;
      }
      objc_msgSend(v7, "removeObjectAtIndex:", 0);

    }
    if ((v8 & 1) == 0)
    {
      v32 = 0;
      goto LABEL_43;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v36, "mimeBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeAllObjects");
  objc_msgSend(v7, "addObject:", v36);
  if (!Mutable)
  {
LABEL_39:
    v31 = 0;
    v32 = 0;
    goto LABEL_42;
  }
  v34 = a4;
  while (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstChildPart");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      do
      {
        objc_msgSend(v7, "addObject:", v16);
        objc_msgSend(v16, "nextSiblingPart");
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
      }
      while (v17);
      objc_msgSend(v15, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("multipart"));

      if ((v19 & 1) == 0)
      {
LABEL_21:
        objc_msgSend(v15, "range");
        if (v21)
        {
          objc_msgSend(v14, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v15, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v35, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "decodedDataForData:", v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v23;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v15, "firstChildPart");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v26;
        if (v26)
        {
          objc_msgSend(v26, "firstChildPart");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27 || !objc_msgSend(v25, "isAttachment"))
          {
            v29 = v24;
          }
          else
          {
            if (!objc_msgSend(v24, "length"))
              goto LABEL_30;
            objc_msgSend(v25, "range");
            if (v28 < v34)
              goto LABEL_30;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-Apple-Content-Length: %lu\n"), v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "dataUsingEncoding:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = (void *)objc_msgSend(v27, "mutableCopy");
            objc_msgSend(v29, "appendData:", v24);

          }
          if (v29)
          {
LABEL_34:
            CFDictionarySetValue(Mutable, v15, v29);
            goto LABEL_35;
          }
        }
        else
        {
LABEL_30:
          v29 = v24;
          if (v24)
            goto LABEL_34;
        }
        CFRelease(Mutable);
        Mutable = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      if (!objc_msgSend(v15, "isAttachment"))
        goto LABEL_21;
      objc_msgSend(v15, "range");
      if (v20 < v34)
        goto LABEL_21;
    }
    v25 = 0;
LABEL_36:
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

    if (!Mutable)
      goto LABEL_39;
  }
  v32 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v31 = objc_alloc_init(MFMessageWriter);
  -[MFMessageWriter appendDataForMimePart:toData:withPartData:](v31, "appendDataForMimePart:toData:withPartData:", v36, v32, Mutable);
  CFRelease(Mutable);
LABEL_42:

LABEL_43:
  return v32;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 usePartDatas:(BOOL)a7 didDownload:(BOOL *)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  MFMailMessageLibrary *library;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  void *v32;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v8 = a7;
  v9 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (_BYTE *)v14;
  if (v14 && !*(_BYTE *)(v14 + (int)*MEMORY[0x1E0D46198]) && (a5 || !*(_BYTE *)(v14 + (int)*MEMORY[0x1E0D46190])))
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordTransportType:", 1);

    v17 = *(id *)&v15[*MEMORY[0x1E0D46188]];
    if (a5)
      *a5 = v15[*MEMORY[0x1E0D46190]] ^ 1;
    MFLogGeneral();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v13;
      _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_INFO, "#CacheLoads returning cached full body data for %@", buf, 0xCu);
    }

    if (v17)
    {
      v19 = 0;
      v20 = v17;
      goto LABEL_36;
    }
  }
  if (objc_msgSend(v13, "isLibraryMessage"))
  {
    library = self->_library;
    v35 = 0;
    -[MFMailMessageLibrary fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:](library, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:", v13, &v35);
    v22 = objc_claimAutoreleasedReturnValue();
    v19 = v35;
    if (v22)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v22, 1, 0);
      v24 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v13, v23);
      goto LABEL_32;
    }
  }
  else
  {
    v19 = 0;
  }
  if (v8)
  {
    if (v9)
      objc_msgSend(v13, "messageBodyUpdatingFlags:", 0);
    else
      objc_msgSend(v13, "messageBodyIfAvailableUpdatingFlags:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v31 = v26;
      objc_msgSend(v31, "topLevelPart");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[MFLibraryStore _copyDataFromMimePart:threshold:downloadIfNecessary:](self, "_copyDataFromMimePart:threshold:downloadIfNecessary:");
      if (v25)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v25, 0, 0);
        v28 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v13, v27);
        if (a8)
          *a8 = 1;

      }
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }
  if (v25 || !v9)
  {
    v20 = v25;
    if (!v19)
      goto LABEL_36;
    goto LABEL_35;
  }
  v34 = v19;
  -[MFLibraryStore _fetchFullBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:didDownload:](self, "_fetchFullBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:didDownload:", v13, &v34, 1, a8);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v19;
  v19 = v34;
LABEL_32:
  v20 = (void *)v22;

  if (v19)
LABEL_35:
    v29 = -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", v13, v19);
LABEL_36:
  if (a4)
    *a4 = objc_retainAutorelease(v19);
  if (a5)
    *a5 = v20 != 0;

  return v20;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  -[MFLibraryStore fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:](self, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:", a3, a4, a5, a6, 1, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  id v9;
  uint64_t v10;
  _BYTE *v11;
  int *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  MFMailMessageLibrary *library;
  id v18;
  void *v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  _BOOL4 v37;
  id v38;
  id v39;
  unsigned __int8 v40;
  uint8_t buf[4];
  _DWORD v42[7];

  v37 = a6;
  *(_QWORD *)&v42[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (_BYTE *)v10;
  if (!v10)
    goto LABEL_11;
  v12 = (int *)MEMORY[0x1E0D46190];
  if (!a4)
  {
    if (*(_BYTE *)(v10 + (int)*MEMORY[0x1E0D46190]))
      goto LABEL_11;
  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordTransportType:", 1);

  v14 = *(id *)&v11[*MEMORY[0x1E0D46188]];
  if (a4)
    *a4 = v11[*v12] ^ 1;
  if (a5)
    *a5 = v11[*MEMORY[0x1E0D46198]];
  MFLogGeneral();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "ef_publicDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v42 = v16;
    _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_INFO, "#CacheLoads returning cached body data for %{public}@", buf, 0xCu);

  }
  if (!v14)
  {
LABEL_11:
    v40 = 0;
    library = self->_library;
    v39 = 0;
    -[MFMailMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:isPartial:](library, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:isPartial:", v9, &v39, a4, &v40);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v39;
    if (v14)
    {
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recordTransportType:", 1);

      if (a5)
        *a5 = v40;
      if (a4)
        v20 = !*a4;
      else
        v20 = 0;
      v21 = objc_alloc(MEMORY[0x1E0D460B8]);
      v22 = (void *)objc_msgSend(v21, "initWithData:partial:incomplete:", v14, v40, v20);
      v23 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v9, v22);
      MFLogGeneral();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "ef_publicDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v42 = v25;
        _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_INFO, "#CacheLoads returning body data from Library for %{public}@", buf, 0xCu);

      }
    }
    if (v18)
      v26 = -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", v9, v18);

    if (!v14)
    {
      v40 = -86;
      MFLogGeneral();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "ef_publicDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v42[0] = v37;
        LOWORD(v42[1]) = 2114;
        *(_QWORD *)((char *)&v42[1] + 2) = v28;
        _os_log_impl(&dword_1A4F90000, v27, OS_LOG_TYPE_INFO, "#CacheLoads fetching body data from network (download=%d) for %{public}@", buf, 0x12u);

      }
      v38 = 0;
      -[MFLibraryStore _fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:](self, "_fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:", v9, &v38, v37, &v40);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v38;
      if (v14)
      {
        if (a4)
          *a4 = 1;
        if (a5)
          *a5 = v40;
        v30 = objc_alloc(MEMORY[0x1E0D460B8]);
        v31 = (void *)objc_msgSend(v30, "initWithData:partial:incomplete:", v14, v40, 0);
        -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v9, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (v32)
        {
          v34 = *(id *)(v32 + (int)*MEMORY[0x1E0D46188]);

          v14 = v34;
        }
        if (v29)
          v35 = -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", v9, v29);

      }
    }
  }

  return v14;
}

- (void)setData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
  -[MFLibraryStore setData:summary:forMessage:isPartial:](self, "setData:summary:forMessage:isPartial:", a3, 0, a4, a5);
}

- (void)setData:(id)a3 summary:(id)a4 forMessage:(id)a5 isPartial:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a6;
  v13 = a3;
  v10 = a4;
  v11 = a5;
  -[MFLibraryStore library](self, "library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setData:forMessage:isPartial:", v13, v11, v6);

  if (v10)
  {
    objc_msgSend(v11, "setSummary:", v10);
    -[MFLibraryStore _calcAttachmentInfoForMessage:body:](self, "_calcAttachmentInfoForMessage:body:", v11, 0);
  }

}

- (void)_calcAttachmentInfoForMessage:(id)a3 body:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "messageFlags") & 2) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "attachmentInfoCalculationScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__MFLibraryStore__calcAttachmentInfoForMessage_body___block_invoke;
    v8[3] = &unk_1E4E88EE8;
    v9 = v5;
    v10 = v6;
    objc_msgSend(v7, "performBlock:", v8);

  }
}

uint64_t __53__MFLibraryStore__calcAttachmentInfoForMessage_body___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "calculateAttachmentInfoFromBody:", *(_QWORD *)(a1 + 40));
}

- (void)addMessageDataToCaches:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  MFLibraryStore *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  MFPersistenceLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MFLibraryStore description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_publicDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v11;
    v23 = 2048;
    v24 = self;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "%@ (%p) caching headers for %{public}@", (uint8_t *)&v21, 0x20u);

  }
  v13 = objc_msgSend(v8, "mf_rangeOfRFC822HeaderData");
  v15 = v14;
  if (v14 <= objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "mf_subdataWithRange:", v13 + v15, objc_msgSend(v8, "length") - (v13 + v15));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v16, v5, 0);
    v18 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v9, v17);

  }
  objc_msgSend(v8, "mf_subdataWithRange:", v13, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", v9, v19);

}

- (BOOL)shouldDeleteInPlace
{
  void *v3;
  void *v4;
  char v5;

  -[MFLibraryStore account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "deleteInPlaceForMailbox:", v4);

  return v5;
}

- (BOOL)shouldArchive
{
  void *v3;
  void *v4;
  char v5;

  -[MFLibraryStore account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldArchiveByDefault"))
  {
    -[MFLibraryStore mailbox](self, "mailbox");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "canArchiveForMailbox:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)archiveDestination
{
  void *v3;
  void *v4;
  int64_t v5;

  -[MFLibraryStore account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "archiveDestinationForMailbox:", v4);

  return v5;
}

- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4
{
  _BOOL4 v4;
  double Current;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  MFLibraryStore *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  _BYTE v44[128];
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (v4)
  {
    v28 = self;
    v30 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = v29;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v11, "account");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mailbox");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "mailboxUidOfType:createIfNeeded:", 3, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v13 == v14;

            if (!v15)
            {
              objc_msgSend(v12, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if (v17)
              {
                objc_msgSend(v17, "addObject:", v11);
              }
              else
              {
                v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v18, v16);
              }

            }
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v30, "count"))
    {
      -[MFMailMessageLibrary persistence](v28->_library, "persistence");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "messageChangeManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __45__MFLibraryStore_deleteMessages_moveToTrash___block_invoke;
      v31[3] = &unk_1E4E896D8;
      v32 = v20;
      v33 = v7;
      v21 = v20;
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v31);

    }
  }
  else
  {
    -[MFMailMessageLibrary persistence](self->_library, "persistence");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "messageChangeManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deleteMessages:", v29);

  }
  v24 = CFAbsoluteTimeGetCurrent();
  MFLogGeneral();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = objc_msgSend(v29, "count");
    v27 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 134218496;
    v39 = v26;
    v40 = 2048;
    v41 = v24 - Current;
    v42 = 2048;
    v43 = (v24 - Current) / (double)v27;
    _os_log_debug_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Deleting %lu messages took %4.5f seconds (%4.5f s/msg)", buf, 0x20u);
  }

}

void __45__MFLibraryStore_deleteMessages_moveToTrash___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  +[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxUidOfType:createIfNeeded:", 3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "moveMessages:destinationMailboxURL:userInitiated:", v11, v9, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deleteMessages:", *(_QWORD *)(a1 + 40));
  }

}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  double Current;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[MFLibraryStore mailbox](self, "mailbox", *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  Current = CFAbsoluteTimeGetCurrent();
  -[MFMailMessageLibrary messagesForMailbox:olderThanNumberOfDays:](self->_library, "messagesForMailbox:olderThanNumberOfDays:", v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
    -[MFMailMessageLibrary compactMessages:](self->_library, "compactMessages:", v9);
  MFLogGeneral();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218498;
    v13 = v10;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = CFAbsoluteTimeGetCurrent() - Current;
    _os_log_debug_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Searching for and deleting %lu messages in %@ took: %fs", (uint8_t *)&v12, 0x20u);
  }

}

- (void)setFlag:(id)a3 state:(BOOL)a4 forMessages:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v6 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MFLibraryStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", v11, v9);

}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  MFFlagChangeObjectForFlagChangeDictionary(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MFFlagChangeDictionaryStrippingServerFlags(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasChanges"))
  {
    -[MFLibraryStore library](self, "library");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageChangeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "applyFlagChange:toMessages:", v8, v7);

  }
  if (objc_msgSend(v9, "count"))
  {
    -[MFLibraryStore setFlagsLocallyFromDictionary:forMessages:](self, "setFlagsLocallyFromDictionary:forMessages:", v9, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4
{
  -[MFMailMessageLibrary setFlagsFromDictionary:forMessages:](self->_library, "setFlagsFromDictionary:forMessages:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
  -[MFMailMessageLibrary setNumberOfAttachments:isSigned:isEncrypted:forMessage:](self->_library, "setNumberOfAttachments:isSigned:isEncrypted:forMessage:", *(_QWORD *)&a3, a4, a5, a6);
}

- (BOOL)allowsAppend
{
  void *v2;
  BOOL v3;

  -[MFLibraryStore URLString](self, "URLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canCompact
{
  $835FD4CD3CFECF79DE90309A635A882F flags;

  flags = self->_flags;
  return (*(_BYTE *)&flags & 1) == 0
      && (*(_BYTE *)&flags & 8) == 0
      && self->_deletedMessageCount
      && -[MFLibraryStore isOpened](self, "isOpened");
}

- (void)doCompact
{
  void *v3;
  void *v4;

  if (-[MFLibraryStore canCompact](self, "canCompact"))
  {
    -[MFLibraryStore URLString](self, "URLString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && self->_deletedMessageCount)
    {
      v4 = v3;
      -[MFMailMessageLibrary compactMailbox:](self->_library, "compactMailbox:", v3);
      v3 = v4;
    }
  }
  else
  {
    v3 = 0;
  }

}

- (void)compactMessages:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    -[MFMailMessageLibrary compactMessages:](self->_library, "compactMessages:", v4);

}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  -[MFMailMessageLibrary dataPathForMessage:part:](self->_library, "dataPathForMessage:part:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  void *v2;
  unint64_t v3;

  -[MFLibraryStore mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serverUnreadOnlyOnServerCount");

  return v3;
}

- (unint64_t)unreadCount
{
  void *v2;
  unint64_t v3;

  -[MFLibraryStore mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unreadCount");

  return v3;
}

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = objc_alloc(MEMORY[0x1E0D1F088]);
  objc_msgSend(v4, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v8 = a3 | (4 * objc_msgSend(v7, "hash"));
  return v8;
}

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  BOOL v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v7 = v5;
    v8 = (int)*MEMORY[0x1E0D46190];
    v9 = v6[v8];
    if (v6[v8] && !v7[v8] || (v10 = (int)*MEMORY[0x1E0D46198], v6[v10]) && !v7[v10])
    {
      v14 = -1;
    }
    else
    {
      v11 = v7[v8];
      if (v9)
        v12 = 1;
      else
        v12 = v11 == 0;
      if (v12)
      {
        if (v6[v10])
          v13 = 1;
        else
          v13 = v7[v10] == 0;
        v14 = !v13;
      }
      else
      {
        v14 = 1;
      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  return a4;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isLibraryMessage"))
  {
    v11.receiver = self;
    v11.super_class = (Class)MFLibraryStore;
    -[MFLibraryStore _cachedHeadersForMessage:valueIfNotPresent:](&v11, sel__cachedHeadersForMessage_valueIfNotPresent_, v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isLibraryMessage"))
  {
    v11.receiver = self;
    v11.super_class = (Class)MFLibraryStore;
    -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](&v11, sel__cachedHeaderDataForMessage_valueIfNotPresent_, v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isLibraryMessage"))
  {
    v11.receiver = self;
    v11.super_class = (Class)MFLibraryStore;
    -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](&v11, sel__cachedBodyDataContainerForMessage_valueIfNotPresent_, v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

- (void)purgeMessages:(id)a3
{
  -[MFMailMessageLibrary compactMessages:](self->_library, "compactMessages:", a3);
}

- (void)purgeMessagesBeyondLimit:(unint64_t)a3
{
  MFMailMessageLibrary *library;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;

  library = self->_library;
  -[MFLibraryStore mailbox](self, "mailbox");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFMailMessageLibrary nonDeletedCountForMailbox:](library, "nonDeletedCountForMailbox:", v6);

  if (v7 > a3)
  {
    v9 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", a3, v7 - a3, 2048);
    if (objc_msgSend(v9, "count"))
      -[MFLibraryStore purgeMessages:](self, "purgeMessages:", v9);

  }
}

- (BOOL)hasMessageForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MFMailMessageLibrary *library;
  id v8;
  id v9;
  uint64_t v10;
  MFMailMessageLibrary *i;
  id v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  library = self->_library;
  -[MFLibraryStore mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(library) = -[MFMailMessageLibrary nonDeletedCountForMailbox:](library, "nonDeletedCountForMailbox:", v6);

  if ((_DWORD)library)
  {
    -[MFLibraryStore account](self, "account");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      LOBYTE(library) = 1;
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = -[MFLibraryStore copyOfAllMessagesWithOptions:](self, "copyOfAllMessagesWithOptions:", 2048);
      library = (MFMailMessageLibrary *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (library)
      {
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != library; i = (MFMailMessageLibrary *)((char *)i + 1))
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v9);
            +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            v13 = v12 == v4;

            if (v13)
            {
              LOBYTE(library) = 1;
              goto LABEL_13;
            }
          }
          library = (MFMailMessageLibrary *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (library)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

  return (char)library;
}

- (void)_queueMessagesAdded:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = 0;
  -[MFLibraryStore pep_getInvocation:](self, "pep_getInvocation:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleMessagesAdded:earliestReceivedDate:", v4, self->_earliestReceivedDate);

  objc_msgSend(v6, "retainArguments");
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:", v6);

}

- (void)_queueMessageFlagsChanged:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_handleMessageFlagsChanged_, self, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:");

}

- (void)_queueMessagesWillBeCompacted:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_handleMessagesWillBeCompacted_, self, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:");

}

- (void)_queueMessagesWereCompacted:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_handleMessagesCompacted_, self, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:");

}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryStore;
  v5 = -[MFLibraryStore hasCompleteDataForMimePart:](&v7, sel_hasCompleteDataForMimePart_, v4)
    || -[MFMailMessageLibrary hasCompleteDataForMimePart:](self->_library, "hasCompleteDataForMimePart:", v4);

  return v5;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  return 0;
}

- (NSDate)earliestReceivedDate
{
  return self->_earliestReceivedDate;
}

- (void)dataForMimePart:(os_log_t)log inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "#CacheLoads requesting data for MIME part without a message", v1, 2u);
}

@end
