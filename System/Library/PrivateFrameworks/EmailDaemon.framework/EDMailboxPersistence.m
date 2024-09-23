@implementation EDMailboxPersistence

- (void)fetchMailboxLists
{
  id v2;

  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchMailboxes");

}

- (id)allMailboxes
{
  void *v2;
  void *v3;

  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allMailboxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addChangeObserver:(id)a3 withIdentifier:(id)a4
{
  id v6;
  os_unfair_lock_s *p_changeObserversByIdentifierLock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_changeObserversByIdentifierLock = &self->_changeObserversByIdentifierLock;
  os_unfair_lock_lock(&self->_changeObserversByIdentifierLock);
  -[EDMailboxPersistence changeObserversByIdentifier](self, "changeObserversByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMailboxPersistence setChangeObserversByIdentifier:](self, "setChangeObserversByIdentifier:", v9);

  }
  -[EDMailboxPersistence changeObserversByIdentifier](self, "changeObserversByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v6);

  os_unfair_lock_unlock(p_changeObserversByIdentifierLock);
}

- (NSMutableDictionary)changeObserversByIdentifier
{
  return self->_changeObserversByIdentifier;
}

- (EDMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void)setChangeObserversByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_changeObserversByIdentifier, a3);
}

- (void)removeChangeObserverWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_changeObserversByIdentifierLock;
  void *v5;
  id v6;

  v6 = a3;
  p_changeObserversByIdentifierLock = &self->_changeObserversByIdentifierLock;
  os_unfair_lock_lock(&self->_changeObserversByIdentifierLock);
  -[EDMailboxPersistence changeObserversByIdentifier](self, "changeObserversByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  os_unfair_lock_unlock(p_changeObserversByIdentifierLock);
}

- (void)allMailboxesWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDMailboxPersistence allMailboxes](self, "allMailboxes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDMailboxPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_40 != -1)
    dispatch_once(&log_onceToken_40, block);
  return (id)log_log_40;
}

void __27__EDMailboxPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_40;
  log_log_40 = (uint64_t)v1;

}

- (EDMailboxPersistence)initWithMailboxProvider:(id)a3 database:(id)a4 hookRegistry:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDMailboxPersistence *v12;
  EDMailboxPersistence *v13;
  EMCoreAnalyticsCollector *v14;
  EMCoreAnalyticsCollector *analyticsCollector;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDMailboxPersistence;
  v12 = -[EDMailboxPersistence init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mailboxProvider, a3);
    objc_storeStrong((id *)&v13->_database, a4);
    objc_storeStrong((id *)&v13->_hookRegistry, a5);
    objc_msgSend(v9, "setDelegate:", v13);
    v13->_changeObserversByIdentifierLock._os_unfair_lock_opaque = 0;
    v14 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E0D1E138]);
    analyticsCollector = v13->_analyticsCollector;
    v13->_analyticsCollector = v14;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[EDMailboxPersistence _stopReportingPersistenceStatistics](self, "_stopReportingPersistenceStatistics");
  v3.receiver = self;
  v3.super_class = (Class)EDMailboxPersistence;
  -[EDMailboxPersistence dealloc](&v3, sel_dealloc);
}

- (id)initForTesting:(BOOL)a3
{
  void *v6;
  objc_super v7;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMailboxPersistence.m"), 60, CFSTR("%s can only be called from unit tests"), "-[EDMailboxPersistence initForTesting:]");

  }
  v7.receiver = self;
  v7.super_class = (Class)EDMailboxPersistence;
  return -[EDMailboxPersistence init](&v7, sel_init);
}

- (void)test_tearDown
{
  void *v4;
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMailboxPersistence.m"), 65, CFSTR("%s can only be called from unit tests"), "-[EDMailboxPersistence test_tearDown]");

  }
  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

  -[EDMailboxPersistence _stopReportingPersistenceStatistics](self, "_stopReportingPersistenceStatistics");
}

- (void)mailboxListInvalidated
{
  os_unfair_lock_s *p_changeObserversByIdentifierLock;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_changeObserversByIdentifierLock = &self->_changeObserversByIdentifierLock;
  os_unfair_lock_lock(&self->_changeObserversByIdentifierLock);
  -[EDMailboxPersistence changeObserversByIdentifier](self, "changeObserversByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_changeObserversByIdentifierLock);
  -[EDMailboxPersistence allMailboxes](self, "allMailboxes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "mailboxListChanged:", v6, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)userCreatedMailboxObjectIDs
{
  void *v2;
  void *v3;

  -[EDMailboxPersistence allMailboxes](self, "allMailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __51__EDMailboxPersistence_userCreatedMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("/Notes"));

    if ((v7 & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(v4, "url");
      v3 = (id)objc_claimAutoreleasedReturnValue();

      if (v3)
        v3 = v4;
    }

  }
  return v3;
}

- (id)legacyMailboxForMailboxURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v4);
  -[EDMailboxPersistence legacyMailboxForObjectID:](self, "legacyMailboxForObjectID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)legacyMailboxForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyMailboxForObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mailboxDatabaseIDsForMailboxObjectIDs:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6;

  v6 = a3;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:]", "EDMailboxPersistence.m", 122, "0");
}

- (id)mailboxDatabaseIDsForMailboxURLStrings:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence mailboxDatabaseIDsForMailboxURLStrings:]", "EDMailboxPersistence.m", 126, "0");
}

- (EDMailboxRowID_s)mailboxDatabaseIDForMailboxURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  EDMailboxRowID_s v12;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D824B334]();
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMailboxPersistence mailboxDatabaseIDsForMailboxURLStrings:](self, "mailboxDatabaseIDsForMailboxURLStrings:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12.var0 = objc_msgSend(v11, "unsignedLongLongValue");
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v12.var0 = 0;
  }

  return v12;
}

- (EDMailboxRowID_s)insertDatabaseRowForMailboxURL:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence insertDatabaseRowForMailboxURL:]", "EDMailboxPersistence.m", 143, "0");
}

- (id)mailboxURLForMailboxDatabaseID:(EDMailboxRowID_s)a3
{
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence mailboxURLForMailboxDatabaseID:]", "EDMailboxPersistence.m", 147, "0");
}

- (void)serverCountsForMailboxScope:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0;
  objc_msgSend(a3, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", self, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v19)
  {
    -[EDMailboxPersistence allMailboxObjectIDs](self, "allMailboxObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "minusSet:", v8);
  }
  else
  {
    v10 = v7;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), 0, 0, 0);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

}

- (BOOL)mailboxURLIsGmailLabel:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence mailboxURLIsGmailLabel:]", "EDMailboxPersistence.m", 171, "0");
}

- (EDMailboxPersistenceStatistics)statistics
{
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence statistics]", "EDMailboxPersistence.m", 177, "0");
}

- (void)_startReportingPersistenceStatistics
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];

  +[EDMailboxPersistence log](EDMailboxPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_INFO, "Starting to report mailbox persistence statistics.", buf, 2u);
  }

  -[EDMailboxPersistence statisticsReportingScheduler](self, "statisticsReportingScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", CFSTR("com.apple.mail.mailboxPersistence.statisticsReportingScheduler"));
    objc_msgSend(v4, "setQualityOfService:", 9);
    objc_msgSend(v4, "setRepeats:", 1);
    objc_msgSend(v4, "setInterval:", 86400.0);
    objc_msgSend(v4, "setTolerance:", 3600.0);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__EDMailboxPersistence__startReportingPersistenceStatistics__block_invoke;
    v5[3] = &unk_1E949CA58;
    objc_copyWeak(&v6, (id *)buf);
    objc_msgSend(v4, "scheduleWithBlock:", v5);
    -[EDMailboxPersistence setStatisticsReportingScheduler:](self, "setStatisticsReportingScheduler:", v4);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }

}

void __60__EDMailboxPersistence__startReportingPersistenceStatistics__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t);

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "statistics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reportPersistenceStatistics:", v5);

    v6[2](v6, 1);
  }

}

- (void)_reportPersistenceStatistics:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternal");

  if (v6)
  {
    +[EDMailboxPersistence log](EDMailboxPersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "debugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Collected mailbox persistence statistics.\n%@", (uint8_t *)&v16, 0xCu);

    }
  }
  objc_msgSend(v4, "mailboxesPerAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountTypePerAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailboxPersistence _sendCoreAnalyticsForMailboxesPerAccount:accountTypePerAccount:](self, "_sendCoreAnalyticsForMailboxesPerAccount:accountTypePerAccount:", v9, v10);

  objc_msgSend(v4, "messagesPerAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountTypePerAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailboxPersistence _sendCoreAnalyticsForMessagesPerAccount:accountTypePerAccount:](self, "_sendCoreAnalyticsForMessagesPerAccount:accountTypePerAccount:", v11, v12);

  objc_msgSend(v4, "messagesPerInbox");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountTypePerAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountPerInbox");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailboxPersistence _sendCoreAnalyticsForMessagesPerInbox:accountTypePerAccount:accountPerInbox:](self, "_sendCoreAnalyticsForMessagesPerInbox:accountTypePerAccount:accountPerInbox:", v13, v14, v15);

  -[EDMailboxPersistence _sendCoreAnalyticsForLargestMailbox:messageCountInSecondLargestMailbox:](self, "_sendCoreAnalyticsForLargestMailbox:messageCountInSecondLargestMailbox:", objc_msgSend(v4, "messagesInLargestMailbox"), objc_msgSend(v4, "messagesInSecondLargestMailbox"));
}

- (void)_sendCoreAnalyticsForMailboxesPerAccount:(id)a3 accountTypePerAccount:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = (void *)MEMORY[0x1E0CB37E8];
        v14 = (void *)MEMORY[0x1E0D1EF48];
        objc_msgSend(v7, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "roundedInteger:", objc_msgSend(v15, "count")));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("mailboxesPerAccount"));

        objc_msgSend(v18, "objectForKeyedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("accountType"));

        -[EDMailboxPersistence _sendEventToCoreAnalytics:withEventDictionary:](self, "_sendEventToCoreAnalytics:withEventDictionary:", CFSTR("com.apple.mail.MailboxStatistics.mailboxesPerAccount"), v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (void)_sendCoreAnalyticsForLargestMailbox:(int64_t)a3 messageCountInSecondLargestMailbox:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0D1EF48], "roundedInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("messageCountInLargestMailbox"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0D1EF48], "roundedInteger:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("messageCountInSecondLargestMailbox"));

  -[EDMailboxPersistence _sendEventToCoreAnalytics:withEventDictionary:](self, "_sendEventToCoreAnalytics:withEventDictionary:", CFSTR("com.apple.mail.MailboxStatistics.messagesCountInLargestMailbox"), v9);
}

- (void)_sendCoreAnalyticsForMessagesPerInbox:(id)a3 accountTypePerAccount:(id)a4 accountPerInbox:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v21 = a4;
  v22 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v15 = (void *)MEMORY[0x1E0CB37E8];
        v16 = (void *)MEMORY[0x1E0D1EF48];
        objc_msgSend(v9, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "roundedInteger:", objc_msgSend(v17, "integerValue")));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("messagesPerInbox"));

        objc_msgSend(v22, "objectForKeyedSubscript:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("accountType"));

        -[EDMailboxPersistence _sendEventToCoreAnalytics:withEventDictionary:](self, "_sendEventToCoreAnalytics:withEventDictionary:", CFSTR("com.apple.mail.MailboxStatistics.messagesPerInbox"), v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

- (void)_sendCoreAnalyticsForMessagesPerAccount:(id)a3 accountTypePerAccount:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = (void *)MEMORY[0x1E0CB37E8];
        v14 = (void *)MEMORY[0x1E0D1EF48];
        objc_msgSend(v7, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "roundedInteger:", objc_msgSend(v15, "integerValue")));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("messagesPerAccount"));

        objc_msgSend(v18, "objectForKeyedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("accountType"));

        -[EDMailboxPersistence _sendEventToCoreAnalytics:withEventDictionary:](self, "_sendEventToCoreAnalytics:withEventDictionary:", CFSTR("com.apple.mail.MailboxStatistics.messagesPerAccount"), v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (void)_sendEventToCoreAnalytics:(id)a3 withEventDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", v9, v6);
  -[EDMailboxPersistence analyticsCollector](self, "analyticsCollector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logOneTimeEvent:", v7);

}

- (void)_stopReportingPersistenceStatistics
{
  NSObject *v3;
  uint8_t v4[16];

  +[EDMailboxPersistence log](EDMailboxPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_INFO, "Stopping to report mailbox persistence statistics.", v4, 2u);
  }

  -[NSBackgroundActivityScheduler invalidate](self->_statisticsReportingScheduler, "invalidate");
}

- (NSSet)allMailboxObjectIDs
{
  void *v2;
  void *v3;

  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allMailboxObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)mailboxObjectIDsForMailboxType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxObjectIDsForMailboxType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)mailboxTypeForMailboxObjectID:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mailboxTypeForMailboxObjectID:", v4);

  return v6;
}

- (BOOL)createMailbox:(id)a3 parentMailboxID:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence createMailbox:parentMailboxID:]", "EDMailboxPersistence.m", 304, "0");
}

- (BOOL)deleteMailbox:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence deleteMailbox:]", "EDMailboxPersistence.m", 308, "0");
}

- (BOOL)moveMailbox:(id)a3 newParentMailboxID:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence moveMailbox:newParentMailboxID:]", "EDMailboxPersistence.m", 312, "0");
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence renameMailbox:newName:]", "EDMailboxPersistence.m", 316, "0");
}

- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence recordFrecencyEventWithMailboxesWithIDs:]", "EDMailboxPersistence.m", 320, "0");
}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence testRecordFrecencyEventsForAllMailboxes]", "EDMailboxPersistence.m", 324, "0");
}

- (void)testResetFrecencyForAllMailboxes
{
  -[EDMailboxPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxPersistence testResetFrecencyForAllMailboxes]", "EDMailboxPersistence.m", 328, "0");
}

- (NSBackgroundActivityScheduler)statisticsReportingScheduler
{
  return self->_statisticsReportingScheduler;
}

- (void)setStatisticsReportingScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsReportingScheduler, a3);
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setMailboxProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxProvider, a3);
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_hookRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_changeObserversByIdentifier, 0);
  objc_storeStrong((id *)&self->_statisticsReportingScheduler, 0);
}

- (unsigned)uidValidityForMailbox:(EDMailboxRowID_s)a3
{
  EDMailboxPersistence *v4;

  v4 = self;
  LODWORD(a3.var0) = sub_1D30F4BA0(a3.var0);

  return a3.var0;
}

- (void)setUidValidity:(unsigned int)a3 forMailbox:(EDMailboxRowID_s)a4
{
  sub_1D30F5508(self, (uint64_t)a2, a3, a4.var0, (uint64_t)sub_1D30FDB28);
}

- (unsigned)uidNextForMailbox:(EDMailboxRowID_s)a3
{
  EDMailboxPersistence *v4;

  v4 = self;
  LODWORD(a3.var0) = sub_1D30F5464(a3.var0);

  return a3.var0;
}

- (void)setUidNext:(unsigned int)a3 forMailbox:(EDMailboxRowID_s)a4
{
  sub_1D30F5508(self, (uint64_t)a2, a3, a4.var0, (uint64_t)sub_1D30FDB10);
}

@end
