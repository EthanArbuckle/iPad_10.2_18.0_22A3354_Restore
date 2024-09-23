@implementation MFLegacyIMAPMailboxTaskManager

void __65__MFLegacyIMAPMailboxTaskManager__observeChangesInIdleConditions__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleIdleTransition:", objc_msgSend(v4, "BOOLValue"));

}

- (void)_scheduleIdleTransition:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  MFIMAPConnection *v7;
  int v8;
  void *v9;
  __int16 v10;
  MFLegacyIMAPMailboxTaskManager *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, "#imap-idle scheduling IDLE transition (should-use-idle %@): %@", (uint8_t *)&v8, 0x16u);

  }
  -[MFLegacyIMAPMailboxTaskManager setShouldUseIDLE:](self, "setShouldUseIDLE:", v3);
  -[NSLock lock](self->_cachedConnectionLock, "lock");
  v7 = self->_cachedConnection;
  -[NSLock unlock](self->_cachedConnectionLock, "unlock");
  if (v7)
    -[MFIMAPConnection scheduleIdleReset](v7, "scheduleIdleReset");

}

- (void)setShouldUseIDLE:(BOOL)a3
{
  self->_shouldUseIDLE = a3;
}

id __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v19;
  _BOOL4 v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(WeakRetained, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdForPersistentConnection");

  if (PCSettingsGetStyle() == 2)
  {
    v16 = v8 & (v6 ^ 1u);
  }
  else
  {
    v19 = objc_msgSend(v15, "canReceiveNewMailNotifications");
    v20 = PCSettingsGetPollInterval() == -1;
    v16 = v8 & (v6 ^ 1u);
    if ((v8 & (v6 ^ 1) & 1) == 0 && (v20 & ~v19 & 1) == 0)
    {
      if ((v12 & v14 & 1) != 0)
        v16 = 1;
      else
        v16 = (v10 | v6) ^ 1u;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)updateServerUnreadCountClosingConnection:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (a3)
    v3 = 33;
  else
    v3 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__MFLegacyIMAPMailboxTaskManager_updateServerUnreadCountClosingConnection___block_invoke;
  v4[3] = &unk_1E4E8C990;
  v4[4] = self;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, v3, 0, v4);
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *loggingPrefix;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  int64_t v27;
  NSObject *v28;
  NSString *v29;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _BYTE *v35;
  uint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[4];
  NSString *v44;
  __int16 v45;
  int64_t v46;
  uint64_t v47;
  void *v48;
  _BYTE v49[16];
  _BYTE buf[24];
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMailbox:", v8);

  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = loggingPrefix;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a5;
    *(_WORD *)&buf[22] = 2048;
    v51 = a3;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: fetchNumMessages started with options 0x%lX, numMessages = %lu", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v51 = -1;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storeForMailboxUid:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_activeFetchVsReplayLock);
  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hostname");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLegacyIMAPMailboxTaskManager fetchNumMessages:preservingUID:options:].cold.1(v17, (uint64_t)v49, v15, v16);
  }

  objc_msgSend(v14, "willFetchMessages");
  v47 = *MEMORY[0x1E0D1E9A0];
  objc_msgSend(v8, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D1E9A8], self, v19);

  if ((a5 & 0x40) != 0)
    v21 = 49;
  else
    v21 = 17;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E788]), "initWithDomain:type:", 21, 8);
  objc_msgSend(v22, "startActivity");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke;
  v32[3] = &unk_1E4E8C968;
  v32[4] = self;
  v37 = a3;
  v23 = v31;
  v33 = v23;
  v38 = a5;
  v24 = v14;
  v34 = v24;
  v35 = buf;
  v36 = &v39;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, v21, 0, v32);
  objc_msgSend(v22, "stopActivityWithSuccess:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24) >= 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D1E998], self, v19);

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reset");

  os_unfair_lock_unlock(&self->_activeFetchVsReplayLock);
  v27 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  if ((v27 & 0x8000000000000000) == 0)
    v27 = v40[3];
  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_loggingPrefix;
    *(_DWORD *)v43 = 138543618;
    v44 = v29;
    v45 = 2048;
    v46 = v27;
    _os_log_impl(&dword_1A4F90000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: fetchNumMessages finished with result %ld", v43, 0x16u);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MFLegacyIMAPMailboxTaskManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1)
    dispatch_once(&log_onceToken_11, block);
  return (OS_os_log *)(id)log_log_11;
}

- (BOOL)performOperationRequiringConnection:(BOOL)a3 withOptions:(unint64_t)a4 failedToSelectMailbox:(BOOL *)a5 operation:(id)a6
{
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  MFIMAPConnection *cachedConnection;
  MFIMAPConnection **p_cachedConnection;
  MFIMAPConnection *v17;
  int v18;
  void *v19;
  NSString **p_mailboxName;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  void (**v32)(id, id);
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  MFIMAPConnection *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v8 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v32 = (void (**)(id, id))a6;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storeForMailboxUid:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "allowsAppend"))
    v14 = a4;
  else
    v14 = a4 | 2;
  -[NSLock lock](self->_cachedConnectionLock, "lock");
  p_cachedConnection = &self->_cachedConnection;
  cachedConnection = self->_cachedConnection;
  if ((v14 & 4) != 0)
  {
    if (!-[MFIMAPConnection mf_tryLock](cachedConnection, "mf_tryLock"))
    {
      v17 = 0;
      goto LABEL_9;
    }
    cachedConnection = *p_cachedConnection;
  }
  v17 = cachedConnection;
LABEL_9:
  -[NSLock unlock](self->_cachedConnectionLock, "unlock");
  if (v17 && (v14 & 0x10) != 0)
  {
    -[MFIMAPConnection noop](v17, "noop");
  }
  else if (!v17)
  {
    goto LABEL_20;
  }
  if (-[MFConnection isValid](v17, "isValid"))
  {
    v18 = 1;
    goto LABEL_24;
  }
  if ((v14 & 4) != 0)
    -[MFIMAPConnection mf_unlock](v17, "mf_unlock");
  -[NSLock lock](self->_cachedConnectionLock, "lock");
  if (v17 == *p_cachedConnection)
  {
    *p_cachedConnection = 0;

  }
  -[NSLock unlock](self->_cachedConnectionLock, "unlock");

LABEL_20:
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connectionForMailbox:delegate:options:failedToSelectMailbox:", v19, self, v14, a5);
  v17 = (MFIMAPConnection *)objc_claimAutoreleasedReturnValue();

  -[NSLock lock](self->_cachedConnectionLock, "lock");
  if (!*p_cachedConnection && (v14 & 0x40) == 0)
    objc_storeStrong((id *)&self->_cachedConnection, v17);
  -[NSLock unlock](self->_cachedConnectionLock, "unlock");
  v18 = 0;
LABEL_24:
  p_mailboxName = &self->_mailboxName;
  if (self->_mailboxName)
  {
    if (v17)
      goto LABEL_31;
LABEL_30:
    if (v8)
      goto LABEL_53;
    goto LABEL_31;
  }
  objc_msgSend(v10, "_nameForMailboxUid:", self->_mailbox);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _MFLockGlobalLock();
  if (!*p_mailboxName)
    objc_storeStrong((id *)&self->_mailboxName, v21);
  _MFUnlockGlobalLock();

  if (!v17)
    goto LABEL_30;
LABEL_31:
  v22 = v18 ^ 1;
  if (!v17)
    v22 = 1;
  if ((v22 & 1) == 0)
  {
    if (*p_mailboxName)
    {
      -[MFIMAPConnection selectedMailbox](v17, "selectedMailbox");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        -[MFLegacyIMAPMailboxTaskManager _selectMailbox:withConnection:](self, "_selectMailbox:withConnection:", self->_mailboxName, v17);
    }
  }
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailboxName](self, "mailboxName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "redactedName:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = CFSTR("NO");
    *(_DWORD *)buf = 138544130;
    v34 = v26;
    v35 = 2048;
    if (v18)
      v28 = CFSTR("YES");
    v36 = v17;
    v37 = 2112;
    v38 = v28;
    v39 = 1024;
    v40 = v14;
    _os_log_impl(&dword_1A4F90000, v27, OS_LOG_TYPE_INFO, "performOperationRequiringConnection: mailbox='%{public}@' connection=%p cached=%@ options=%d", buf, 0x26u);
  }

  -[MFConnection startActivity](v17, "startActivity");
  v32[2](v32, v17);
  -[MFConnection stopActivity](v17, "stopActivity");

  if (v17)
  {
    if ((v14 & 4) != 0)
      -[MFIMAPConnection mf_unlock](v17, "mf_unlock");
    if ((v14 & 0x20) != 0)
    {
      if (-[MFMailboxUid mailboxType](self->_mailbox, "mailboxType") != 7)
      {
        v29 = 1;
LABEL_52:
        objc_msgSend(v10, "checkInConnection:destroy:", v17, v29);
        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v30, "isPlatform:", 2);

    }
    else
    {
      v29 = 0;
    }
    if (v17 != *p_cachedConnection || (_DWORD)v29)
      goto LABEL_52;
  }
LABEL_53:

  return v17 != 0;
}

- (IMAPAccount)account
{
  return self->_account;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (MFLegacyIMAPMailboxTaskManager)initWithMailbox:(id)a3
{
  id v5;
  MFLegacyIMAPMailboxTaskManager *v6;
  MFLegacyIMAPMailboxTaskManager *v7;
  uint64_t v8;
  IMAPAccount *account;
  void *v10;
  uint64_t v11;
  NSString *mailboxName;
  uint64_t v13;
  NSLock *cachedConnectionLock;
  EFCancelationToken *v15;
  EFCancelationToken *cancelationToken;
  EFCancelationToken *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *searchQueue;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *loggingPrefix;
  uint64_t v38;
  objc_super v40;

  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MFLegacyIMAPMailboxTaskManager;
  v6 = -[MFLegacyIMAPMailboxTaskManager init](&v40, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailbox, a3);
    objc_msgSend(v5, "account");
    v8 = objc_claimAutoreleasedReturnValue();
    account = v7->_account;
    v7->_account = (IMAPAccount *)v8;

    -[MFLegacyIMAPMailboxTaskManager account](v7, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_nameForMailboxUid:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    mailboxName = v7->_mailboxName;
    v7->_mailboxName = (NSString *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("CachedConnectionLock"), 0);
    cachedConnectionLock = v7->_cachedConnectionLock;
    v7->_cachedConnectionLock = (NSLock *)v13;

    v7->_activeFetchVsReplayLock._os_unfair_lock_opaque = 0;
    v15 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    cancelationToken = v7->_cancelationToken;
    v7->_cancelationToken = v15;

    v17 = v7->_cancelationToken;
    -[MFLegacyIMAPMailboxTaskManager _observeChangesInIdleConditions](v7, "_observeChangesInIdleConditions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFCancelationToken addCancelable:](v17, "addCancelable:", v18);

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "mailboxRowID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("com.apple.mail.imap.search.%@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_retainAutorelease(v21);
    v23 = (const char *)objc_msgSend(v22, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create(v23, v24);
    searchQueue = v7->_searchQueue;
    v7->_searchQueue = (OS_dispatch_queue *)v25;

    -[MFLegacyIMAPMailboxTaskManager mailboxName](v7, "mailboxName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "redactedName:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isInternal");

    v31 = (void *)MEMORY[0x1E0CB3940];
    if (v30)
    {
      v32 = (void *)MEMORY[0x1E0D1EF48];
      objc_msgSend(v5, "account");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "displayName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "partiallyRedactedStringForString:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@ - '%@'"), v35, v28);
      v36 = objc_claimAutoreleasedReturnValue();
      loggingPrefix = v7->_loggingPrefix;
      v7->_loggingPrefix = (NSString *)v36;

    }
    else
    {
      objc_msgSend(v5, "account");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "uniqueID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@ - '%@'"), v34, v28);
      v38 = objc_claimAutoreleasedReturnValue();
      v35 = v7->_loggingPrefix;
      v7->_loggingPrefix = (NSString *)v38;
    }

    v7->_serverCountLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSString)mailboxName
{
  NSString *v3;

  _MFLockGlobalLock();
  v3 = self->_mailboxName;
  _MFUnlockGlobalLock();
  return v3;
}

- (id)_observeChangesInIdleConditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MFLegacyIMAPMailboxTaskManager _idleConditionsObservable](self, "_idleConditionsObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D1EF30];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__MFLegacyIMAPMailboxTaskManager__observeChangesInIdleConditions__block_invoke;
  v11 = &unk_1E4E8B6E0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "observerWithResultBlock:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscribe:", v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_idleConditionsObservable
{
  void *v3;
  void *v4;
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
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowPowerModeObservable");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluggedInObservable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wifiObservable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFLockStateMonitor sharedInstance](MFLockStateMonitor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockStateObservable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFAppStateMonitor sharedInstance](MFAppStateMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appIsVisibleObservable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E0D1EF28];
  v24[0] = v19;
  v24[1] = v9;
  v24[2] = v7;
  v24[3] = v5;
  v24[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "combineLatest:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke;
  v21[3] = &unk_1E4E8B730;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v12, "map:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.message.imap (IDLE)"), 17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "distinctUntilChanged");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doOnError:", &__block_literal_global_155);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "observeOn:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v17;
}

void __37__MFLegacyIMAPMailboxTaskManager_log__block_invoke(uint64_t a1)
{
  const char *v2;
  os_log_t v3;
  void *v4;
  id v5;

  v2 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D4D878], "UTF8String");
  NSStringFromClass(*(Class *)(a1 + 32));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = os_log_create(v2, (const char *)objc_msgSend(v5, "UTF8String"));
  v4 = (void *)log_log_11;
  log_log_11 = (uint64_t)v3;

}

- (void)dealloc
{
  MFIMAPConnection *cachedConnection;
  void *v4;
  void *v5;
  objc_super v6;

  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
  cachedConnection = self->_cachedConnection;
  if (cachedConnection)
  {
    +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", sel_checkInConnection_, self->_account, cachedConnection, 0, 13, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addInvocation:", v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)MFLegacyIMAPMailboxTaskManager;
  -[MFLegacyIMAPMailboxTaskManager dealloc](&v6, sel_dealloc);
}

- (unint64_t)_fetchMessagesWithUIDs:(id)a3 connection:(id)a4 newCount:(unint64_t)a5 flagsToSet:(unint64_t)a6 queueClass:(Class)a7
{
  id v12;
  id v13;
  NSObject *v14;
  NSString *loggingPrefix;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    *(_DWORD *)buf = 138543874;
    v29 = loggingPrefix;
    v30 = 2048;
    v31 = objc_msgSend(v12, "count");
    v32 = 2048;
    v33 = a5;
    _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching skeletons for %lu uids (%lu new)", buf, 0x20u);
  }

  v16 = objc_alloc_init(a7);
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "storeForMailboxUid:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)*((_QWORD *)v16 + 6);
  *((_QWORD *)v16 + 6) = v19;

  objc_storeStrong((id *)v16 + 7, a4);
  *((_QWORD *)v16 + 8) = a5;
  *((_QWORD *)v16 + 10) = self->_highestModSequence;
  *((_QWORD *)v16 + 11) = a6;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__MFLegacyIMAPMailboxTaskManager__fetchMessagesWithUIDs_connection_newCount_flagsToSet_queueClass___block_invoke;
  v25[3] = &unk_1E4E8C8F8;
  v21 = v13;
  v26 = v21;
  v22 = v16;
  v27 = v22;
  objc_msgSend(v12, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v25);
  v23 = v22[9];

  return v23;
}

void __99__MFLegacyIMAPMailboxTaskManager__fetchMessagesWithUIDs_connection_newCount_flagsToSet_queueClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sendSkeletonResponsesForUIDs:includeTo:toQueue:");
  objc_msgSend(*(id *)(a1 + 40), "flush");

}

- (unint64_t)syncMessagesWithUIDs:(id)a3 connection:(id)a4 serverMessages:(id)a5 flagSearchResults:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSString *loggingPrefix;
  MFSyncResponseQueue *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *url;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v22 = a5;
  v12 = a6;
  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    *(_DWORD *)buf = 138543618;
    v24 = loggingPrefix;
    v25 = 2048;
    v26 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching flags for %lu uids", buf, 0x16u);
  }

  v15 = objc_alloc_init(MFSyncResponseQueue);
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "storeForMailboxUid:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "URLString");
  v19 = objc_claimAutoreleasedReturnValue();
  url = v15->super._url;
  v15->super._url = (NSString *)v19;

  objc_storeStrong((id *)&v15->super._store, v18);
  objc_storeStrong((id *)&v15->super._connection, a4);
  objc_storeStrong((id *)&v15->super._serverMessages, a5);
  v15->super._shouldCompact = 0;
  v15->super._shouldFetch = 0;
  *(&v15->super._isSearching + 1) = 1;
  objc_msgSend(v11, "sendUidAndFlagResponsesForUIDs:sequenceIdentifierProvider:flagSearchResults:toQueue:", v10, self, v12, v15);
  -[MFBufferedQueue flush](v15, "flush");

  return 0;
}

- (void)_performActionsOnConnection:(id)a3 uidsToFetch:(id *)a4 uidsToSync:(id *)a5 messagesToCompact:(id *)a6 serverMessages:(id)a7 flagSearchResults:(id)a8 shouldForce:(BOOL)a9 newUIDsToFetch:(unsigned int *)a10
{
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSString *loggingPrefix;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v31 = a7;
  v17 = a8;
  v18 = objc_msgSend(*a4, "count");
  if (a9)
  {
    if (v18)
    {
      if (*a10)
      {
        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        MFLookupLocalizedString(CFSTR("DOWNLOADING_STATUS_FORMAT"), CFSTR("Downloading %@ of %@"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDisplayName:maxCount:", v20, *a10);

        v21 = *a10;
      }
      else
      {
        v21 = 0;
      }
      -[MFLegacyIMAPMailboxTaskManager _fetchMessagesWithUIDs:connection:newCount:flagsToSet:queueClass:](self, "_fetchMessagesWithUIDs:connection:newCount:flagsToSet:queueClass:", *a4, v16, v21, 0, objc_opt_class());
    }
    *a4 = 0;
    *a10 = 0;
  }
  if (objc_msgSend(*a5, "count"))
  {
    if (a9)
    {
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "reset");

    }
    -[MFLegacyIMAPMailboxTaskManager syncMessagesWithUIDs:connection:serverMessages:flagSearchResults:](self, "syncMessagesWithUIDs:connection:serverMessages:flagSearchResults:", *a5, v16, v31, v17);
  }
  *a5 = 0;
  if (*a6 || a9)
  {
    v23 = objc_msgSend(*a6, "count");
    if (v23)
    {
      +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        loggingPrefix = self->_loggingPrefix;
        *(_DWORD *)buf = 138543618;
        v33 = loggingPrefix;
        v34 = 2048;
        v35 = v23;
        _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Compacting %lu messages during IMAP sync", buf, 0x16u);
      }

      -[MFLegacyIMAPMailboxTaskManager library](self, "library");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "messageChangeManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *a6;
      -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "reflectDeletedMessagesWithRemoteIDs:mailboxURL:", v28, v30);

    }
    *a6 = 0;
  }

}

- (id)_searchFlagsForUIDs:(id)a3 usingConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storeForMailboxUid:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "unreadCount");
  if (objc_msgSend(v6, "count") >= (unint64_t)(2 * v12))
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 1, &unk_1E4F68F80, 0);
  else
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 1, &unk_1E4F68F98, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 2, &unk_1E4F68FB0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v14);

  +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 16, &unk_1E4F68FC8, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v15);

  +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 4, &unk_1E4F68FE0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v16);

  if (self->_supportsDollarForwardedFlag)
  {
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 256, &unk_1E4F68FF8, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

  }
  if (self->_supportsForwardedFlag)
  {
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 256, &unk_1E4F69010, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v18);

  }
  if (self->_supportsFlagColorBitFlags)
  {
    v32[0] = CFSTR("KEYWORD");
    v32[1] = CFSTR("$MailFlagBit0");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 0x20000000000, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v20);

    v31[0] = CFSTR("KEYWORD");
    v31[1] = CFSTR("$MailFlagBit1");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 0x40000000000, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v22);

    v30[0] = CFSTR("KEYWORD");
    v30[1] = CFSTR("$MailFlagBit2");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:searchTerms:positiveMatch:](MFIMAPConnectionFlagSearchRequest, "requestWithMask:searchTerms:positiveMatch:", 0x80000000000, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v24);

  }
  if (objc_msgSend(v7, "supportsCapability:", 16))
  {
    v25 = objc_msgSend(v8, "count");
    if (v25 << 8)
      v26 = v25 << 8;
    else
      v26 = 2;
  }
  else
  {
    v27 = objc_msgSend(v8, "count");
    if ((unint64_t)(75 * v27) <= 2)
      v26 = 2;
    else
      v26 = 75 * v27;
  }
  if (v26 >= objc_msgSend(v6, "count"))
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v7, "searchUIDs:withFlagRequests:", v6, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (unint64_t)_fetchMessagesWithArguments:(id)a3 idRange:(id)a4 onConnection:(id)a5 synchronize:(BOOL)a6 limit:(unint64_t)a7 topUIDToCompact:(unint64_t)a8 topKnownUID:(unint64_t)a9 success:(BOOL *)a10 examinedRange:(_NSRange *)a11 fetchableUIDsFound:(unint64_t *)a12 preserveUID:(unint64_t *)a13 numFetchedUIDs:(unint64_t *)a14
{
  id v17;
  id v18;
  NSObject *v19;
  NSString *loggingPrefix;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  void *v45;
  BOOL v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  _BOOL4 v59;
  NSObject *v60;
  NSString *v61;
  unint64_t v62;
  char v63;
  void *v64;
  unsigned int v65;
  uint64_t v66;
  NSObject *v67;
  NSString *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v74;
  unsigned int v75;
  uint64_t v76;
  void *v77;
  void *v78;
  unint64_t v79;
  uint64_t v80;
  NSObject *v81;
  unint64_t v82;
  NSObject *v83;
  NSString *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  unint64_t v93;
  NSString *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  NSObject *v100;
  NSString *v101;
  uint64_t v103;
  void *v104;
  void *v105;
  _BOOL4 v106;
  void *v107;
  unsigned int v108;
  unint64_t v109;
  void *v110;
  id v111;
  void *v112;
  unint64_t v113;
  NSUInteger v114;
  void *v115;
  void *context;
  unsigned int v118;
  uint64_t v119;
  id v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  int v129;
  BOOL v130;
  _QWORD v131[2];
  _QWORD v132[2];
  uint8_t buf[4];
  unint64_t v134;
  __int16 v135;
  unint64_t v136;
  __int16 v137;
  unint64_t v138;
  __int16 v139;
  unint64_t v140;
  __int16 v141;
  unint64_t v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  NSUInteger v146;
  __int16 v147;
  unint64_t v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  unsigned int v152;
  __int16 v153;
  int v154;
  uint64_t v155;

  v106 = a6;
  v155 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v130 = 0;
  v111 = a5;
  v104 = v17;
  v105 = v18;
  objc_msgSend(v111, "searchIDSet:forTerms:success:", v18, v17, &v130);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    v21 = objc_msgSend(v115, "count");
    *(_DWORD *)buf = 138543874;
    if (v130)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v134 = (unint64_t)loggingPrefix;
    v135 = 2048;
    v136 = v21;
    v137 = 2112;
    v138 = (unint64_t)v22;
    _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Search for recent UIDs returned %lu items (success=%@)", buf, 0x20u);
  }

  *a13 = 0x7FFFFFFFFFFFFFFFLL;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "storeForMailboxUid:", v24);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v130)
  {
    v25 = objc_msgSend(v115, "count");
    if (v25)
    {
      if (v106)
      {
        -[MFLegacyIMAPMailboxTaskManager _searchFlagsForUIDs:usingConnection:](self, "_searchFlagsForUIDs:usingConnection:", v115, v111);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v110 = 0;
      }
      if (a12)
        *a12 += v25;
      objc_msgSend(v115, "objectAtIndex:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v26, "unsignedIntegerValue");

      objc_msgSend(v115, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue");

      if (v28 <= a8)
        v29 = a8;
      else
        v29 = v28;
      v30 = v29 - v114;
      if (a11)
      {
        a11->location = v114;
        a11->length = v30;
      }
      v31 = v30 + 1;
      if (v30 + 1 > a7)
        v32 = v30 + 1;
      else
        v32 = a7;
      if (v32 >= 0x100)
        v32 = 256;
      v109 = v32;
      objc_msgSend(v112, "serverMessagePersistence");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v114, v31);
      objc_msgSend(v33, "serverMessagesForIMAPUIDs:limit:returnLastEntries:", v34, v109, 1);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v122, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v35, "imapUID");

      v36 = objc_msgSend(v115, "count");
      v37 = objc_msgSend(v122, "count");
      v129 = 0;
      +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v37 - 1;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v40 = self->_loggingPrefix;
        objc_msgSend(v122, "lastObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "imapUID");
        *(_DWORD *)buf = 138545922;
        v134 = (unint64_t)v40;
        v135 = 2112;
        v136 = (unint64_t)v105;
        v137 = 2048;
        v138 = a7;
        v139 = 2048;
        v140 = a8;
        v141 = 2048;
        v142 = a9;
        v143 = 2048;
        v144 = v25;
        v145 = 2048;
        v146 = v114;
        v147 = 2048;
        v148 = v29;
        v149 = 2048;
        v150 = v39;
        v151 = 1024;
        v152 = v118;
        v153 = 1024;
        v154 = v42;
        _os_log_impl(&dword_1A4F90000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: starting UID sync idRange=%@ limit=%lu topUIDToCompact=%lu topKnownUID=%lu UIDCount=%lu lowUID=%lu highUID=%lu serverMessagesIndex=%lu serverMessagesUIDs found=%u to %u", buf, 0x68u);

      }
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v107 = 0;
      v108 = 0;
      v46 = 0;
      v113 = 0;
      v119 = v36 - 1;
      while (1)
      {
        if (v46 || v29 < v114)
        {
          if (v107)
          {
            v131[0] = CFSTR("MessageIsServerSearchResult");
            v131[1] = CFSTR("MessageIsThreadSearchResult");
            v132[0] = MEMORY[0x1E0C9AAA0];
            v132[1] = MEMORY[0x1E0C9AAA0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = (id)objc_msgSend(v112, "setFlagsLocallyFromDictionary:forMessages:", v95, v107);

          }
          if (a14)
            *a14 = v108;
          v124 = v45;
          v125 = v44;
          v123 = v43;
          LOBYTE(v103) = 1;
          -[MFLegacyIMAPMailboxTaskManager _performActionsOnConnection:uidsToFetch:uidsToSync:messagesToCompact:serverMessages:flagSearchResults:shouldForce:newUIDsToFetch:](self, "_performActionsOnConnection:uidsToFetch:uidsToSync:messagesToCompact:serverMessages:flagSearchResults:shouldForce:newUIDsToFetch:", v111, &v125, &v124, &v123, v122, v110, v103, &v129);
          v97 = v125;

          v98 = v124;
          v99 = v123;

          goto LABEL_108;
        }
        context = (void *)MEMORY[0x1A85B0E24]();
        if (v29 >= v118)
        {
          v48 = v43;
          v121 = v45;
        }
        else
        {
          v128 = v44;
          v126 = v43;
          v127 = v45;
          LOBYTE(v103) = 0;
          -[MFLegacyIMAPMailboxTaskManager _performActionsOnConnection:uidsToFetch:uidsToSync:messagesToCompact:serverMessages:flagSearchResults:shouldForce:newUIDsToFetch:](self, "_performActionsOnConnection:uidsToFetch:uidsToSync:messagesToCompact:serverMessages:flagSearchResults:shouldForce:newUIDsToFetch:", v111, &v128, &v127, &v126, v122, v110, v103, &v129);
          v47 = v128;

          v121 = v127;
          v48 = v126;

          v49 = v47;
          objc_msgSend(v112, "serverMessagePersistence");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v114, v118 - v114);
          objc_msgSend(v50, "serverMessagesForIMAPUIDs:limit:returnLastEntries:", v51, v109, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = objc_msgSend(v52, "count");
          objc_msgSend(v52, "firstObject");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = objc_msgSend(v54, "imapUID");

          v44 = v49;
          v39 = v53 - 1;
          v122 = v52;
        }
        objc_msgSend(v115, "objectAtIndexedSubscript:", v119);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "intValue");

        v59 = *a13 != 0x7FFFFFFFFFFFFFFFLL && v29 >= *a13 || a7 != 0;
        if (!a7 && v59)
        {
          +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = self->_loggingPrefix;
            v62 = *a13;
            *(_DWORD *)buf = 138543618;
            v134 = (unint64_t)v61;
            v135 = 2048;
            v136 = v62;
            _os_log_impl(&dword_1A4F90000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: preserving UID %lu!", buf, 0x16u);
          }

        }
        v63 = !v59;
        if (v29 != v56)
          v63 = 1;
        if ((v63 & 1) == 0)
          break;
        if (v39 < 0)
        {
          v76 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          objc_msgSend(v122, "objectAtIndexedSubscript:", v39);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v74, "imapUID");

          v76 = v75;
        }
        if (v76 == v29)
        {
          if (!v48)
            v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            v84 = self->_loggingPrefix;
            *(_DWORD *)buf = 138543618;
            v134 = (unint64_t)v84;
            v135 = 2048;
            v136 = v29;
            _os_log_impl(&dword_1A4F90000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@: Compacting %lu (2)", buf, 0x16u);
          }

          objc_msgSend(v122, "objectAtIndexedSubscript:", v39);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "remoteID");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v86);

          --v39;
        }
LABEL_99:
        v46 = v29 == 0;
        if (v29)
          --v29;
        else
          v29 = 0;
        v43 = v48;
        v45 = v121;
        objc_autoreleasePoolPop(context);
      }
      if (v39 < 0)
      {
LABEL_61:
        v66 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        while (1)
        {
          objc_msgSend(v122, "objectAtIndexedSubscript:", v39);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "imapUID");

          v66 = v65;
          if (v29 >= v65)
            break;
          if (!v48)
            v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v68 = self->_loggingPrefix;
            objc_msgSend(v122, "objectAtIndexedSubscript:", v39);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v69, "imapUID");
            *(_DWORD *)buf = 138543618;
            v134 = (unint64_t)v68;
            v135 = 1024;
            LODWORD(v136) = v70;
            _os_log_impl(&dword_1A4F90000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: Compacting %u (1)", buf, 0x12u);

          }
          objc_msgSend(v122, "objectAtIndexedSubscript:", v39);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "remoteID");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v72);

          if (v39-- < 1)
            goto LABEL_61;
        }
      }
      if (v66 != v29)
      {
        if (!v44)
          v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          v94 = self->_loggingPrefix;
          *(_DWORD *)buf = 138543618;
          v134 = (unint64_t)v94;
          v135 = 2048;
          v136 = v29;
          _os_log_debug_impl(&dword_1A4F90000, v81, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching %lu", buf, 0x16u);
        }

        objc_msgSend(v115, "objectAtIndexedSubscript:", v119);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v77);
        if (objc_msgSend(v77, "intValue") > a9)
        {
          ++v129;
          ++v108;
        }
        v82 = a7 - 1;
        if (!a7)
          v82 = 0;
        a7 = v82;
        ++v113;
        goto LABEL_98;
      }
      objc_msgSend(v122, "objectAtIndexedSubscript:", v39);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "serverFlags");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = MFMessageFlagsForECMessageFlags(v78);

      if ((v79 & 0x80) != 0)
      {
        LODWORD(v80) = 1;
      }
      else
      {
        v80 = (v79 >> 20) & 1;
        if (!v106 && (v79 & 0x100000) == 0)
        {
LABEL_97:
          --v39;
LABEL_98:

          --v119;
          goto LABEL_99;
        }
      }
      if (!v121)
        v121 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v134 = v29;
        _os_log_debug_impl(&dword_1A4F90000, v87, OS_LOG_TYPE_DEBUG, "Syncing %lu", buf, 0xCu);
      }

      objc_msgSend(v115, "objectAtIndexedSubscript:", v119);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "ef_insertObject:usingComparator:allowDuplicates:", v88, &__block_literal_global_37, 0);
      if ((_DWORD)v80)
      {
        -[MFLegacyIMAPMailboxTaskManager library](self, "library");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "messagePersistentID");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "messageWithLibraryID:options:inMailbox:", objc_msgSend(v90, "longLongValue"), 0, 0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        if (v91)
        {
          v92 = v107;
          if (!v107)
            v92 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v107 = v92;
          objc_msgSend(v92, "addObject:", v91);
        }

      }
      v93 = a7 - 1;
      if (!a7)
        v93 = 0;
      a7 = v93;

      ++v113;
      goto LABEL_97;
    }
  }
  v113 = 0;
  if (a11)
    *a11 = (_NSRange)xmmword_1A59996E0;
LABEL_108:
  if (a10)
    *a10 = v130;
  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v100 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    v101 = self->_loggingPrefix;
    *(_DWORD *)buf = 138543618;
    v134 = (unint64_t)v101;
    v135 = 2048;
    v136 = v113;
    _os_log_impl(&dword_1A4F90000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@: _fetchMessagesWithArguments returns %lu", buf, 0x16u);
  }

  return v113;
}

- (void)updateDeletedCountWithNotDeletedCount:(unint64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__MFLegacyIMAPMailboxTaskManager_updateDeletedCountWithNotDeletedCount___block_invoke;
  v4[3] = &unk_1E4E8C940;
  v4[4] = self;
  v4[5] = a3;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 65, 0, v4);
  os_unfair_lock_lock(&self->_serverCountLock);
  self->_settingServerCount = 0;
  os_unfair_lock_unlock(&self->_serverCountLock);
}

void __72__MFLegacyIMAPMailboxTaskManager_updateDeletedCountWithNotDeletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  v10 = 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lu:*"), objc_msgSend(v5, "minID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "countForSearchOfIDSet:forTerms:success:", v6, &unk_1E4F69028, &v10);

  v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
  os_unfair_lock_lock(v8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + v9;
  os_unfair_lock_unlock(v8);

}

- (void)updateDeletedCount
{
  -[MFLegacyIMAPMailboxTaskManager updateDeletedCountWithNotDeletedCount:](self, "updateDeletedCountWithNotDeletedCount:", 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)_shouldContinueToPreservedUID:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeForMailboxUid:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  EFStringWithUnsignedInteger();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageForRemoteID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (objc_msgSend(v8, "messageFlags") & 0x80) == 0;
  else
    v9 = 0;

  return v9;
}

- (void)growFetchWindow
{
  self->_lastHighestModSequence = 0;
  self->_highestModSequence = 0;
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  os_unfair_lock_s *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  os_unfair_lock_s *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  unint64_t v39;
  void *v40;
  os_unfair_lock_s *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  os_unfair_lock_s *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  id v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  unint64_t v76;
  void *v77;
  char v78[16];
  _BYTE buf[22];
  __int16 v80;
  id v81;
  __int16 v82;
  const __CFString *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v71 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mailboxName");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mailbox");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "selectedMailbox");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v68 || !v67 || (objc_msgSend(v68, "isEqualToString:", v67) & 1) != 0)
    goto LABEL_18;
  v3 = objc_msgSend(v71, "isValid");
  objc_msgSend(v65, "redactedName:", v68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v67);
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v62;
    v64 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[4] = v4;
    if (v3)
      v64 = CFSTR("YES");
    *(_QWORD *)&buf[14] = v62;
    v80 = 2048;
    v81 = v71;
    v82 = 2114;
    v83 = v64;
    _os_log_error_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_ERROR, "store and connection mailboxes differ: store=%@ connection=%@ (%p, valid: '%{public}@')", buf, 0x2Au);

  }
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_selectMailbox:withConnection:", v68, v71) & 1) != 0)
    {
      v6 = 0;
      goto LABEL_13;
    }
    +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_3();
  }
  else
  {
    +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_4();
  }

  v6 = 1;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInternal");

  if (v9)
  {
    +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_2();

  }
  if ((v6 & 1) == 0)
  {
LABEL_18:
    v72 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v71, "setIsFetching:", 1);
    +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hostname");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_1(v13, (uint64_t)v78, v11, v12);
    }

    v76 = 0xAAAAAAAAAAAAAAAALL;
    v14 = *(void **)(a1 + 40);
    if (v14)
      v15 = (int)objc_msgSend(v14, "intValue");
    else
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    v76 = v15;
    v16 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
    os_unfair_lock_lock(v16);
    v66 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    os_unfair_lock_unlock(v16);
    v17 = *(void **)(a1 + 48);
    v70 = *(_QWORD *)(a1 + 80);
    if ((v70 & 4) != 0)
    {
      objc_msgSend(v17, "serverMessagePersistence");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "minimumIMAPUID");

      if ((_DWORD)v19)
      {
        v20 = objc_msgSend(v71, "getMailboxIDForUID:", v19);
        if (v20)
        {
          v21 = v72;
          v66 = v20 - 1;
          if (v66 < v72)
            v21 = v20 - 1;
          v72 = v21;
        }
        else
        {
          v25 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
          os_unfair_lock_lock(v25);
          v66 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
          os_unfair_lock_unlock(v25);
        }
        v24 = (v19 - 1);
        v69 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v69 = 0x7FFFFFFFFFFFFFFFLL;
        v24 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      objc_msgSend(v17, "serverMessagePersistence");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "maximumIMAPUID");

      v24 = v23;
      v69 = v23;
    }
    objc_msgSend(*(id *)(a1 + 32), "account");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "minID");
    v28 = v72 - 1;
    if (v72 <= 1)
      v28 = 1;
    v29 = v66 - 1;
    if (v66 <= 1)
      v29 = 1;
    if (v66 <= v28)
      v30 = v29;
    else
      v30 = v28;
    if (v66 <= v28)
      v31 = v27;
    else
      v31 = v66 - v28;

    v75 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *(_OWORD *)buf = xmmword_1A59996E0;
    v74 = 0;
    if (objc_msgSend(v71, "supportsCapability:", 18))
    {
      v32 = *(_QWORD **)(a1 + 32);
      v33 = v32[7];
      if (!v33)
        goto LABEL_50;
      if (v33 != v32[6])
        goto LABEL_47;
      objc_msgSend(v32, "mailboxName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "fetchStatusForMailboxes:args:", v35, &unk_1E4F69040);

      v32 = *(_QWORD **)(a1 + 32);
      v33 = v32[7];
      if (v33)
      {
LABEL_47:
        v36 = v32[6];
        v32[6] = v33;
        if ((v70 & 4) == 0 && v33 == v36)
        {
          objc_msgSend(v71, "setIsFetching:", 0);
          goto LABEL_105;
        }
      }
      else
      {
LABEL_50:
        v32[6] = 0;
      }
    }
    v37 = 0;
    v38 = 0;
    v39 = v72;
    while (v37 != 0x7FFFFFFFFFFFFFFFLL
         && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < v72
          || v76 != 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(*(id *)(a1 + 32), "_shouldContinueToPreservedUID:")
          && *(_QWORD *)buf > v76)
         && v30
         && v75 != 0
         && !v38)
    {
      v40 = (void *)MEMORY[0x1A85B0E24]();
      v73 = 0;
      v41 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
      os_unfair_lock_lock(v41);
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      os_unfair_lock_unlock(v41);
      if (v31 + v30 >= v42)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:*"), v31);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:%lu"), v31, v31 + v30);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(*(id *)(a1 + 32), "_fetchMessagesWithArguments:idRange:onConnection:synchronize:limit:topUIDToCompact:topKnownUID:success:examinedRange:fetchableUIDsFound:preserveUID:numFetchedUIDs:", &unk_1E4F69058, v43, v71, (v70 & 8) == 0, v72 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v24, v69, &v75, buf, &v74, &v76, &v73);
      v37 = v44;
      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v44;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v73;
      objc_msgSend(*(id *)(a1 + 32), "account");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v45, "minID") == v31;

      v39 *= 2;
      if (!v38)
      {
        v46 = *(_QWORD *)buf - 1;
        if (!*(_QWORD *)buf)
          v46 = 0;
        if (*(_QWORD *)buf != 0x7FFFFFFFFFFFFFFFLL)
          v24 = v46;
        objc_msgSend(*(id *)(a1 + 32), "account");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "minID");
        v49 = v31 - 1;
        v50 = v39 - 1;
        if (!v39)
          v50 = 1;
        v51 = v31 - 2;
        if (v49 <= 1)
          v51 = 1;
        v52 = v49 > v50;
        v53 = v49 - v50;
        if (v52)
          v30 = v50;
        else
          v30 = v51;
        if (v52)
          v31 = v53;
        else
          v31 = v48;

      }
      v76 = 0x7FFFFFFFFFFFFFFFLL;

      objc_autoreleasePoolPop(v40);
    }
    objc_msgSend(v71, "setIsFetching:", 0);
    v54 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
    os_unfair_lock_lock(v54);
    if (v38 && (v55 = *(_QWORD *)(a1 + 32), v66 == *(_QWORD *)(v55 + 32)) && !*(_BYTE *)(v55 + 11))
    {
      *(_BYTE *)(v55 + 11) = 1;
      os_unfair_lock_unlock(v54);
      objc_msgSend(*(id *)(a1 + 32), "updateDeletedCountWithNotDeletedCount:", v74);
    }
    else
    {
      os_unfair_lock_unlock(v54);
    }
    v56 = *(_QWORD *)(a1 + 56);
    if (v75)
    {
      v57 = *(_QWORD *)(*(_QWORD *)(v56 + 8) + 24);
      if (v57 | v70 & 4)
      {
        if (*(_QWORD *)buf && *(_QWORD *)buf != 0x7FFFFFFFFFFFFFFFLL)
        {
          v58 = v76 - 1;
          if (*(_QWORD *)buf - 1 < v76 - 1)
            v58 = *(_QWORD *)buf - 1;
          if (v76 == 0x7FFFFFFFFFFFFFFFLL)
            v59 = *(_QWORD *)buf - 1;
          else
            v59 = v58;
          if (v57 < v72)
            v60 = 1;
          else
            v60 = (v70 >> 1) & 1;
          if (v60)
            v61 = 0;
          else
            v61 = 500;
          compactMessagesToUID(*(void **)(a1 + 32), v59, v61);
        }
      }
      else
      {
        compactMessagesToUID(*(void **)(a1 + 32), 0xFFFFFFFFLL, 0);
      }
      if (v75)
        goto LABEL_105;
      v56 = *(_QWORD *)(a1 + 56);
    }
    *(_QWORD *)(*(_QWORD *)(v56 + 8) + 24) = -1;
LABEL_105:
    if ((v70 & 0x20) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_fetchServerUnreadCountWithConnection:", v71);
  }

}

uint64_t __75__MFLegacyIMAPMailboxTaskManager_updateServerUnreadCountClosingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchServerUnreadCountWithConnection:", a2);
}

- (void)_fetchServerUnreadCountWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t serverMessageCount;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  v28 = 0;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeForMailboxUid:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_serverCountLock);
  v8 = objc_msgSend(v7, "totalCount");
  serverMessageCount = self->_serverMessageCount;
  os_unfair_lock_unlock(&self->_serverCountLock);
  if (v8 >= serverMessageCount
    || (objc_msgSend(v7, "serverMessagePersistence"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "minimumIMAPUID"),
        v10,
        v11 < 2))
  {
    -[MFLegacyIMAPMailboxTaskManager _updateServerUnreadCount:](self, "_updateServerUnreadCount:", 0);
  }
  else
  {
    objc_msgSend(v4, "messageSetForRange:", ((unint64_t)(v11 - 1) << 32) | 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "shouldUseNonDeletedForUnreadCount"))
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("UNDELETED"), 0);
    else
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("UNSEEN"), CFSTR("UNDELETED"), 0);
    v15 = (void *)v14;

    v16 = objc_msgSend(v4, "countForSearchOfUidSet:forTerms:success:", v12, v15, &v28);
    if (v28)
      -[MFLegacyIMAPMailboxTaskManager _updateServerUnreadCount:](self, "_updateServerUnreadCount:", v16);

  }
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldUseNonDeletedForUnreadCount");

  if ((v18 & 1) == 0)
  {
    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "baseAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isGmailAccount");

    if (v21)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", 0x1E4F2A1B8, 0);
      v23 = objc_alloc(MEMORY[0x1E0C99D20]);
      -[MFLegacyIMAPMailboxTaskManager mailboxName](self, "mailboxName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithObjects:", v24, 0);

      objc_msgSend(v4, "fetchStatusForMailboxes:args:", v25, v22);
      goto LABEL_16;
    }
    v26 = objc_msgSend(v4, "countForSearchOfIDSet:forTerms:success:", 0x1E4F205B8, &unk_1E4F69070, &v28);
    if (v28)
    {
      v27 = v26;
      objc_msgSend(v7, "URLString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
LABEL_17:

        goto LABEL_18;
      }
      -[MFLegacyIMAPMailboxTaskManager library](self, "library");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLastSyncAndMostRecentStatusCount:forMailbox:", v27, v22);
LABEL_16:

      goto LABEL_17;
    }
  }
LABEL_18:

}

- (void)_updateServerUnreadCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeForMailboxUid:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[MFLegacyIMAPMailboxTaskManager library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerUnreadOnlyOnServerCount:forMailbox:", a3, v8);

}

- (id)_newSearchResponseQueueForConnection:(id)a3 limit:(unsigned int)a4
{
  MFIMAPConnection *v6;
  MFSearchResponseQueue *v7;
  void *v8;
  void *v9;
  MFLibraryIMAPStore *v10;
  uint64_t v11;
  NSString *url;
  MFLibraryIMAPStore *store;
  MFLibraryIMAPStore *v14;
  MFIMAPConnection *connection;

  v6 = (MFIMAPConnection *)a3;
  v7 = objc_alloc_init(MFSearchResponseQueue);
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeForMailboxUid:", v9);
  v10 = (MFLibraryIMAPStore *)objc_claimAutoreleasedReturnValue();

  v7->limit = a4;
  -[MFLibraryStore URLString](v10, "URLString");
  v11 = objc_claimAutoreleasedReturnValue();
  url = v7->super._url;
  v7->super._url = (NSString *)v11;

  store = v7->super._store;
  v7->super._store = v10;
  v14 = v10;

  connection = v7->super._connection;
  v7->super._connection = v6;

  v7->super._shouldCompact = 0;
  v7->super._shouldFetch = 1;
  v7->super._isSearching = 1;
  return v7;
}

- (void)_fetchMessagesMatchingCriterion:(id)a3 limit:(unsigned int)a4 withOptions:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  MFLegacyIMAPMailboxTaskManager *v25;
  id v26;
  uint64_t *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v33[0] = v10;
  +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "criterionForSQL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v16 = a5 | 0x41;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __92__MFLegacyIMAPMailboxTaskManager__fetchMessagesMatchingCriterion_limit_withOptions_handler___block_invoke;
  v23 = &unk_1E4E8C9B8;
  v17 = v15;
  v24 = v17;
  v18 = v11;
  v26 = v18;
  v27 = &v29;
  v25 = self;
  v28 = a4;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, v16, 0, &v20);
  if (!*((_BYTE *)v30 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LibraryIMAPStoreErrorDomain"), 2, 0, v20, v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, void *))v18 + 2))(v18, 0x7FFFFFFFFFFFFFFFLL, 0, v19);

  }
  _Block_object_dispose(&v29, 8);

}

void __92__MFLegacyIMAPMailboxTaskManager__fetchMessagesMatchingCriterion_limit_withOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  fetchArgumentsForCriterion(*(void **)(a1 + 32), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "_newSearchResponseQueueForConnection:limit:", v8, *(unsigned int *)(a1 + 64));
    objc_msgSend(v8, "sendUidResponsesForSearchArguments:toQueue:", v4, v5);
    objc_msgSend(v5, "flush");
    v6 = v5[10];
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "_fetchMessagesWithUIDs:connection:newCount:flagsToSet:queueClass:", v6, v8, 0x7FFFFFFFFFFFFFFFLL, 128, objc_opt_class());
    objc_msgSend(v5, "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addIndexes:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "_fetchServerUnreadCountWithConnection:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LibraryIMAPStoreErrorDomain"), 1, 0);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

- (id)messageIdRollCall:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__MFLegacyIMAPMailboxTaskManager_messageIdRollCall___block_invoke;
  v8[3] = &unk_1E4E8C9E0;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 17, 0, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__MFLegacyIMAPMailboxTaskManager_messageIdRollCall___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "_uidsForMessageIDs:excludeDeleted:", *(_QWORD *)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(v3, "count");
    if (v4 != objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(v13, "fetchMessageIdsForUids:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v7, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithArray:", v9);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      goto LABEL_7;
    }
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
LABEL_7:

}

- (id)searchWithCriterion:(id)a3 limit:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *, void *);
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__12;
    v17[4] = __Block_byref_object_dispose__12;
    v18 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __60__MFLegacyIMAPMailboxTaskManager_searchWithCriterion_limit___block_invoke;
    v14 = &unk_1E4E8CA08;
    v8 = v7;
    v15 = v8;
    v16 = v17;
    -[MFLegacyIMAPMailboxTaskManager _fetchMessagesMatchingCriterion:limit:withOptions:handler:](self, "_fetchMessagesMatchingCriterion:limit:withOptions:handler:", v6, v4, 0, &v11);
    objc_msgSend(v8, "future", v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __60__MFLegacyIMAPMailboxTaskManager_searchWithCriterion_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  MFUIDSet *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v16)
  {
    v7 = (void *)objc_opt_new();
    for (i = objc_msgSend(v16, "firstIndex"); i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v16, "indexGreaterThanIndex:", i))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

    }
    v10 = *(void **)(a1 + 32);
    v11 = -[MFUIDSet initWithUIDs:]([MFUIDSet alloc], "initWithUIDs:", v7);
    objc_msgSend(v10, "finishWithResult:", v11);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v12, "finishWithError:", v7);
  }

  v13 = objc_msgSend(v6, "copy");
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

- (id)downloadSearchResults:(id)a3
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
  uint64_t v13;
  id v14;
  void *v15;
  MFUIDSet *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  MFUIDSet *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  objc_msgSend(v4, "uids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_map:", &__block_literal_global_105);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "copyMessagesWithRemoteIDs:options:inRemoteMailbox:", v8, 7346239, v10);
  objc_msgSend(v11, "ef_map:", &__block_literal_global_107);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_3;
  v25[3] = &unk_1E4E8CA90;
  v14 = v12;
  v26 = v14;
  objc_msgSend(v5, "ef_filter:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MFUIDSet initWithUIDs:]([MFUIDSet alloc], "initWithUIDs:", v5);
  if (objc_msgSend(v15, "count"))
  {
    v17 = (void *)objc_opt_new();
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_4;
    v21[3] = &unk_1E4E8CAB8;
    v21[4] = self;
    v22 = v15;
    v18 = v17;
    v23 = v18;
    v24 = v16;
    -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 0, 0, v21);
    objc_msgSend(v18, "future");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

id __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "stringValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v2, "uid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_fetchMessagesWithUIDs:connection:newCount:flagsToSet:queueClass:", *(_QWORD *)(a1 + 40), v3, 0x7FFFFFFFFFFFFFFFLL, 128, objc_opt_class());
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 56));

}

- (BOOL)canFetchMessageIDs
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeForMailboxUid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "serverMessageCount");
  LOBYTE(v6) = v6 > objc_msgSend(v5, "allNonDeletedCountIncludingServerSearch:andThreadSearch:", 1, 1);

  return v6;
}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  MFLegacyIMAPMailboxTaskManager *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  if (objc_msgSend(v6, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__MFLegacyIMAPMailboxTaskManager_fetchMessagesWithMessageIDs_andSetFlags___block_invoke;
    v9[3] = &unk_1E4E8CAE0;
    v10 = v6;
    v11 = self;
    v12 = &v14;
    v13 = a4;
    -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 1, 0, v9);

  }
  v7 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __74__MFLegacyIMAPMailboxTaskManager_fetchMessagesWithMessageIDs_andSetFlags___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "_uidsForMessageIDs:excludeDeleted:", a1[4], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[5];
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "_fetchMessagesWithUIDs:connection:newCount:flagsToSet:queueClass:", v5, v6, 0x7FFFFFFFFFFFFFFFLL, a1[7], objc_opt_class());

}

- (void)compact
{
  void *v3;
  char v4;
  _QWORD v5[5];

  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOffline");

  if ((v4 & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__MFLegacyIMAPMailboxTaskManager_compact__block_invoke;
    v5[3] = &unk_1E4E8C990;
    v5[4] = self;
    -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 1, 0, v5);
  }
}

void __41__MFLegacyIMAPMailboxTaskManager_compact__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(v10, "expunge") & 1) == 0)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("IMAP_COMPACT_FAILED"), CFSTR("Mail was unable to remove the deleted messages in the mailbox “%@” on server “%@”."), CFSTR("Delayed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "hostname");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "useGenericDescription:", v9);

    }
  }

}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  MFLegacyIMAPMailboxTaskManager *v20;
  id v21;
  id v22;
  int v23;
  BOOL v24;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeForMailboxUid:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __78__MFLegacyIMAPMailboxTaskManager_deleteMessagesOlderThanNumberOfDays_compact___block_invoke;
  v19 = &unk_1E4E8CB08;
  v20 = self;
  v23 = v5;
  v24 = v4;
  v12 = v11;
  v21 = v12;
  v13 = v9;
  v22 = v13;
  if (!-[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 1, 0, &v16))
  {
    -[MFLegacyIMAPMailboxTaskManager library](self, "library", v16, v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messagesForMailbox:olderThanNumberOfDays:", v12, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v13, "deleteMessages:moveToTrash:", v15, 0);
      if (v4)
        objc_msgSend(v13, "compactMessages:", v15);
    }

  }
}

void __78__MFLegacyIMAPMailboxTaskManager_deleteMessagesOlderThanNumberOfDays_compact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldLogDeleteActivity");

  if (v5)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_DWORD *)(a1 + 56);
      v15 = 138544130;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 1024;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_INFO, "IMAP Account %{public}@ deleting messages from store: %@ older than %d days using connection: %@", (uint8_t *)&v15, 0x26u);

    }
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "mailboxName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "_selectMailbox:withConnection:", v12, v3);

  if ((_DWORD)v11)
    objc_msgSend(v3, "deleteMessagesOlderThanNumberOfDays:", *(unsigned int *)(a1 + 56));
  if (*(_BYTE *)(a1 + 60))
    objc_msgSend(v3, "close");
  objc_msgSend(*(id *)(a1 + 32), "library");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messagesForMailbox:olderThanNumberOfDays:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "compactMessages:", v14);
}

- (id)replayAction:(id)a3
{
  id v5;
  Class *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  MFLegacyIMAPMailboxTaskManager *v17;
  uint64_t *v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  os_unfair_lock_lock(&self->_activeFetchVsReplayLock);
  v19 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (Class *)0x1E0D1E7C0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (Class *)0x1E0D1E728;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (Class *)0x1E0D1E730;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_14:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFLegacyIMAPMailboxTaskManager.m"), 1352, CFSTR("Couldn't make replayer for action %@"), v5);

          v7 = 0;
          goto LABEL_10;
        }
        v6 = (Class *)0x1E0D1E7E0;
      }
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithAction:", v5);
  if (!v7)
    goto LABEL_14;
LABEL_10:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__MFLegacyIMAPMailboxTaskManager_replayAction___block_invoke;
  v15[3] = &unk_1E4E8CB30;
  v8 = v7;
  v16 = v8;
  v17 = self;
  v18 = &v20;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 17, &v19, v15);
  if (!v21[5] && v19)
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failActionWithError:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v21[5];
    v21[5] = v10;

  }
  os_unfair_lock_unlock(&self->_activeFetchVsReplayLock);
  v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __47__MFLegacyIMAPMailboxTaskManager_replayAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setServerInterface:");
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "replayAction");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)messageDataForMessage:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFLegacyIMAPMailboxTaskManager.m"), 1369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[message isKindOfClass:[MFMailMessage class]]"));

  }
  objc_msgSend(v5, "messageDataIsComplete:downloadIfNecessary:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
    v8 = objc_msgSend(v6, "moveSupported");
  else
    v8 = 0;

  return v8;
}

- (BOOL)checkUIDValidity:(unsigned int)a3 mailboxURL:(id)a4
{
  return 1;
}

- (BOOL)errorIsIMAPError:(id)a3
{
  return 0;
}

- (id)flagsForIMAPUIDs:(id)a3 mailboxURL:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeForMailboxUid:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "serverMessagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverMessagesForIMAPUIDs:limit:returnLastEntries:", v19, *MEMORY[0x1E0D1E990], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "serverFlags");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "imapUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  return v10;
}

- (id)imapMailboxNameForMailboxURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[MFLegacyIMAPMailboxTaskManager mailboxName](self, "mailboxName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_nameForMailboxUid:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)messageDataForRemoteID:(id)a3 mailboxURL:(id)a4
{
  id v5;
  MFIMAPMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = -[MFIMAPMessage initWithFlags:size:uid:]([MFIMAPMessage alloc], "initWithFlags:size:uid:", 0, 0xFFFFFFFFLL, objc_msgSend(v5, "intValue"));
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeForMailboxUid:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPMessage setMessageStore:](v6, "setMessageStore:", v9);

  -[MFLegacyIMAPMailboxTaskManager _fetchFullMessageDataForMessage:download:](self, "_fetchFullMessageDataForMessage:download:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSUInteger v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v27;
  NSUInteger v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  MFLegacyIMAPMailboxTaskManager *v35;
  id v36;
  uint64_t *v37;
  NSUInteger v38;
  unint64_t v39;
  uint64_t v40;
  BOOL *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  objc_msgSend(v11, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("multipart"), "isEqualToString:", v13) & 1) == 0)
  {
    objc_msgSend(v11, "range");
    v15 = v14;
    objc_msgSend(v11, "mimeBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "message");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "partNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      && v17
      && (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v17, "uid")
      && (objc_msgSend(&stru_1E4F1C8F8, "isEqualToString:", v18) & 1) == 0)
    {
      -[IMAPAccount fetchLimits](self->_account, "fetchLimits");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "range");
      v28 = v19;
      v20 = objc_msgSend(v30, "fetchMinBytes");
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (location || length != v28)
        {
          if (length != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (location >= v28)
              location = v28;
            v27 = objc_msgSend(v30, "fetchMinBytes");
            v22 = objc_msgSend(v30, "minBytesLeft");
            v23 = v27;
            v21 = v28 - location;
            if (length > v27)
              v23 = length;
            if (v21 < v23)
              v23 = v28 - location;
            if (v28 - location - v23 >= v22)
              v21 = v23;
          }
        }
        else
        {
          location = 0;
        }
      }
      v24 = v21;
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E788]), "initWithDomain:type:", 21, 13);
      objc_msgSend(v29, "startActivity");
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke;
      v31[3] = &unk_1E4E8CB58;
      v32 = v17;
      v38 = location;
      v39 = v24;
      v33 = v18;
      v40 = v15;
      v37 = &v42;
      v34 = v12;
      v35 = self;
      v36 = v11;
      v41 = a5;
      -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 5, 0, v31);
      objc_msgSend(v29, "stopActivityWithSuccess:", *((unsigned __int8 *)v43 + 24));

    }
  }
  v25 = *((_BYTE *)v43 + 24);

  _Block_object_dispose(&v42, 8);
  return v25;
}

void __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  char v18;
  NSObject *v19;
  _BYTE *v20;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "uid");
  objc_msgSend(v3, "downloadCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 88);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 96))
      objc_msgSend(v5, "downloadForUid:section:expectedLength:consumer:", v4, v8, 4096, v9);
    else
      objc_msgSend(v5, "downloadForUid:section:length:consumer:", v4, v8, 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "downloadForUid:section:range:consumer:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), v7, *(_QWORD *)(a1 + 48));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "_waitForDataFromDownload:uid:downloadCache:connection:", v10, v4, v6, v3);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 64), "range");
    v13 = v12;
    v14 = objc_msgSend(v11, "bytesFetched");
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordTransportType:", objc_msgSend(v16, "transportType"));

    v17 = *(_QWORD *)(a1 + 80) + v14 == v13;
    v18 = v17;
    if (!v14 && !v17)
    {
      MFLogGeneral();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke_cold_1(v4, v19);

      v18 = 1;
    }
    v20 = *(_BYTE **)(a1 + 104);
    if (v20)
      *v20 |= v18;
  }

}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  return 0;
}

- (id)fetchDataForMessage:(id)a3 didDownload:(BOOL *)a4
{
  id v5;
  void *v6;
  id v7;
  id v9;

  v5 = a3;
  v9 = 0;
  -[MFLegacyIMAPMailboxTaskManager _fetchFullMessageDataForMessage:download:](self, "_fetchFullMessageDataForMessage:download:", v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (!v6)
    _compactMessageIfNoData(self, v7, v5);

  return v6;
}

- (id)_fetchFullMessageDataForMessage:(id)a3 download:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  MFLegacyIMAPMailboxTaskManager *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__12;
  v29 = __Block_byref_object_dispose__12;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E788]), "initWithDomain:type:", 21, 13);
  objc_msgSend(v7, "startActivity");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __75__MFLegacyIMAPMailboxTaskManager__fetchFullMessageDataForMessage_download___block_invoke;
  v14 = &unk_1E4E8CB80;
  v8 = v6;
  v15 = v8;
  v16 = self;
  v17 = &v19;
  v18 = &v25;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 5, 0, &v11);
  objc_msgSend(v7, "stopActivityWithSuccess:", v26[5] != 0, v11, v12, v13, v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v9;
}

void __75__MFLegacyIMAPMailboxTaskManager__fetchFullMessageDataForMessage_download___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "uid");
  v4 = objc_alloc_init(MEMORY[0x1E0D46068]);
  objc_msgSend(MEMORY[0x1E0D460A0], "filterWithConsumer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "downloadCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadForUid:section:length:consumer:", v3, &stru_1E4F1C8F8, objc_msgSend(*(id *)(a1 + 32), "messageSize"), v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = objc_msgSend(*(id *)(a1 + 40), "_waitForDataFromDownload:uid:downloadCache:connection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3, v6, v23);
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bytesFetched");
  v12 = objc_msgSend(*(id *)(a1 + 32), "messageSize");
  if (v11 >= v12)
    v13 = v10;
  else
    v13 = 0;
  if (v13 == 1)
    goto LABEL_5;
  objc_msgSend(v6, "downloadForUid:section:range:consumer:", v3, &stru_1E4F1C8F8, v11, v12, v5);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  v20 = objc_msgSend(*(id *)(a1 + 40), "_waitForDataFromDownload:uid:downloadCache:connection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3, v6, v23);
  v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bytesFetched");
  if (v20)
  {
    v22 = v21;
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bytesFetched") || v22 + v11 >= v12)
    {
LABEL_5:
      objc_msgSend(v4, "data");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }

}

- (BOOL)_waitForDataFromDownload:(id)a3 uid:(unsigned int)a4 downloadCache:(id)a5 connection:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  double v17;
  double v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  uint64_t v26;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMailbox:", v14);

    objc_msgSend(v12, "fetchPipeline");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "expectedLength");
    objc_msgSend(v13, "percentDone");
    v18 = v17;
    objc_msgSend(v12, "enableThroughputMonitoring:", 1);
    v19 = 0;
    v26 = (fmax(v18, 0.0) * (double)v16);
    while (1)
    {
      if ((objc_msgSend(v10, "isComplete") & 1) != 0
        || (objc_msgSend(v13, "shouldCancel") & 1) != 0
        || !objc_msgSend(v12, "isValid")
        || (objc_msgSend(v13, "error"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, v20))
      {
        objc_msgSend(v12, "enableThroughputMonitoring:", 0);
        if (objc_msgSend(v10, "isComplete"))
        {
          v23 = objc_msgSend(v10, "isSuccessful");
          objc_msgSend(v11, "cleanUpDownloadsForUid:", v8);
        }
        else
        {
          v23 = 0;
        }

        goto LABEL_28;
      }
      v21 = (void *)MEMORY[0x1A85B0E24]();
      objc_msgSend(v15, "mf_lock");
      objc_msgSend(v15, "setChunkSize:", objc_msgSend(v12, "readBufferSize"));
      if ((objc_msgSend(v15, "isFull") & 1) == 0)
      {
        objc_msgSend(v11, "addCommandsForDownload:toPipeline:", v10, v15);
        objc_msgSend(v15, "failureResponsesFromSendingCommandsWithConnection:", v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFetchResponses:", v22);

      }
      objc_msgSend(v15, "mf_unlock");
      objc_msgSend(v11, "processResultsForUid:", v8);
      if (v16)
        break;
LABEL_18:
      objc_autoreleasePoolPop(v21);
    }
    if ((v19 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v10, "allowsPartialDownloads"))
      {
        v19 = 0;
        goto LABEL_17;
      }
      if (objc_msgSend(v10, "partial"))
        v16 += objc_msgSend(v10, "expectedLength");
      else
        v16 = objc_msgSend(v10, "bytesFetched");
      objc_msgSend(v13, "setExpectedLength:", v16);
    }
    v19 = 1;
LABEL_17:
    objc_msgSend(v13, "setPercentDone:", (float)((float)(unint64_t)(objc_msgSend(v10, "bytesFetched") + v26) / (float)v16));
    goto LABEL_18;
  }
  MFLogGeneral();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    -[MFLegacyIMAPMailboxTaskManager _waitForDataFromDownload:uid:downloadCache:connection:].cold.1();

  v23 = 0;
LABEL_28:

  return v23;
}

- (id)_downloadForMessageBodyData:(id)a3 usingDownloadCache:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "downloadForMessage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsPartialDownloads:", objc_msgSend(v6, "allowsPartialDownloads"));

  objc_msgSend(v5, "setFetchBodyData:", 1);
  return v5;
}

- (id)_performBodyDataDownload:(id)a3 usingConnection:(id)a4 downloadCache:(id)a5 isPartial:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "partial");
  if (-[MFLegacyIMAPMailboxTaskManager _waitForDataFromDownload:uid:downloadCache:connection:](self, "_waitForDataFromDownload:uid:downloadCache:connection:", v10, objc_msgSend(v10, "uid"), v12, v11))
  {
    objc_msgSend(v10, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "partial");
    if (!a6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v14 = 0;
  if (a6)
LABEL_5:
    *a6 = v13;
LABEL_6:

  return v14;
}

- (id)fetchDataForMessage:(id)a3 partial:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  BOOL *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__12;
  v27 = __Block_byref_object_dispose__12;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E788]), "initWithDomain:type:", 21, 13);
  objc_msgSend(v7, "startActivity");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__MFLegacyIMAPMailboxTaskManager_fetchDataForMessage_partial___block_invoke;
  v12[3] = &unk_1E4E8CBA8;
  v14 = &v17;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v23;
  v16 = a4;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 21, 0, v12);
  objc_msgSend(v7, "stopActivityWithSuccess:", v24[5] != 0);
  v9 = (void *)v24[5];
  if (!v9)
  {
    _compactMessageIfNoData(self, (void *)v18[5], v8);
    v9 = (void *)v24[5];
  }
  v10 = v9;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __62__MFLegacyIMAPMailboxTaskManager_fetchDataForMessage_partial___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "downloadCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_downloadForMessageBodyData:usingDownloadCache:", *(_QWORD *)(a1 + 40), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "_performBodyDataDownload:usingConnection:downloadCache:isPartial:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12, v3, *(_QWORD *)(a1 + 64));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordTransportType:", objc_msgSend(v11, "transportType"));

}

- (id)fetchHeadersForMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  MFLegacyIMAPMailboxTaskManager *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__MFLegacyIMAPMailboxTaskManager_fetchHeadersForMessage___block_invoke;
  v9[3] = &unk_1E4E8CBD0;
  v12 = &v14;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v13 = &v20;
  -[MFLegacyIMAPMailboxTaskManager performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:](self, "performOperationRequiringConnection:withOptions:failedToSelectMailbox:operation:", 1, 5, 0, v9);
  v6 = (void *)v21[5];
  if (!v6)
  {
    _compactMessageIfNoData(self, (void *)v15[5], v5);
    v6 = (void *)v21[5];
  }
  v7 = v6;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __57__MFLegacyIMAPMailboxTaskManager_fetchHeadersForMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "downloadCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadForMessage:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v7
    && objc_msgSend(*(id *)(a1 + 40), "_waitForDataFromDownload:uid:downloadCache:connection:", v7, objc_msgSend(*(id *)(a1 + 32), "uid"), v3, v16))
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordTransportType:", objc_msgSend(v9, "transportType"));

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mf_rangeOfRFC822HeaderData");
    objc_msgSend(v10, "mf_subdataWithRange:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (BOOL)_selectMailbox:(id)a3 withConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "selectMailbox:withAccount:", v6, v8);

  return v9;
}

- (void)reselectMailbox
{
  void *v3;
  NSString *v4;
  NSString *mailboxName;
  id v6;

  if (self->_cachedConnection)
  {
    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_nameForMailboxUid:", self->_mailbox);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    _MFLockGlobalLock();
    v4 = (NSString *)objc_msgSend(v6, "copy");
    mailboxName = self->_mailboxName;
    self->_mailboxName = v4;

    _MFUnlockGlobalLock();
    -[MFLegacyIMAPMailboxTaskManager _selectMailbox:withConnection:](self, "_selectMailbox:withConnection:", self->_mailboxName, self->_cachedConnection);

  }
}

- (void)willRemoveDelegation:(id)a3
{
  MFIMAPConnection *cachedConnection;
  BOOL v5;
  int v6;
  MFIMAPConnection *v7;

  v7 = (MFIMAPConnection *)a3;
  -[NSLock lock](self->_cachedConnectionLock, "lock");
  cachedConnection = self->_cachedConnection;
  if (cachedConnection)
    v5 = cachedConnection == v7;
  else
    v5 = 0;
  v6 = v5;
  if (v5)
  {
    self->_cachedConnection = 0;

  }
  -[NSLock unlock](self->_cachedConnectionLock, "unlock");
  if (v6)
    -[MFIMAPConnection finishIdle](v7, "finishIdle");

}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 forCommand:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v18;
  NSString *loggingPrefix;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  MFMailboxUid *mailbox;
  const __CFString *v52;
  void *v53;
  uint8_t buf[4];
  NSString *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v45 = a4;
  v44 = a5;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeForMailboxUid:", v8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44
    && objc_msgSend(v45, "responseType") == 2
    && (objc_msgSend(v44, "command") == 13 || objc_msgSend(v44, "command") == 9))
  {
    objc_msgSend(v44, "untaggedResponses");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      *(_WORD *)&self->_supportsForwardedFlag = 0;
      self->_supportsFlagColorBitFlags = 0;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v9 = v43;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      if (v10)
      {
        v11 = 0;
        v12 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v48 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            if (objc_msgSend(v14, "responseType", v43) == 2)
            {
              objc_msgSend(v14, "responseInfo");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              switch(objc_msgSend(v14, "responseCode"))
              {
                case 5:
                  if (v15)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v16 = v15;
                      self->_supportsForwardedFlag = -[NSObject indexOfObject:](v16, "indexOfObject:", CFSTR("Forwarded")) != 0x7FFFFFFFFFFFFFFFLL;
                      self->_supportsDollarForwardedFlag = -[NSObject indexOfObject:](v16, "indexOfObject:", CFSTR("$Forwarded")) != 0x7FFFFFFFFFFFFFFFLL;
                      v17 = -[NSObject indexOfObject:](v16, "indexOfObject:", CFSTR("$MailFlagBit0")) != 0x7FFFFFFFFFFFFFFFLL
                         || -[NSObject indexOfObject:](v16, "indexOfObject:", CFSTR("$MailFlagBit1")) != 0x7FFFFFFFFFFFFFFFLL
                         || -[NSObject indexOfObject:](v16, "indexOfObject:", CFSTR("$MailFlagBit2")) != 0x7FFFFFFFFFFFFFFFLL;
                      self->_supportsFlagColorBitFlags = v17;
                      goto LABEL_24;
                    }
                  }
                  break;
                case 6:
                  objc_msgSend(v46, "setAllowsAppend:", 0);
                  break;
                case 9:
                  v18 = objc_msgSend(v15, "unsignedIntValue");
                  objc_msgSend(v46, "setUidNext:", v18);
                  +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    loggingPrefix = self->_loggingPrefix;
                    *(_DWORD *)buf = 138543618;
                    v55 = loggingPrefix;
                    v56 = 1024;
                    LODWORD(v57) = v18;
                    _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Received UIDNEXT = %u", buf, 0x12u);
                  }
LABEL_24:

                  break;
                case 10:
                  v11 = objc_msgSend(v15, "unsignedIntValue");
                  break;
                default:
                  break;
              }

            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        }
        while (v10);

        if (!(_DWORD)v11)
          goto LABEL_40;
        -[MFMailboxUid userInfoObjectForKey:](self->_mailbox, "userInfoObjectForKey:", CFSTR("UIDVALIDITY"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "intValue");

        if (v21 == (_DWORD)v11)
          goto LABEL_40;
        objc_msgSend(v46, "setUidValidity:", v11);
        if (!v21)
          goto LABEL_40;
        objc_msgSend(v46, "_flushAllMessageData");
        -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFLegacyIMAPMailboxTaskManager mailboxName](self, "mailboxName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "redactedName:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = self->_loggingPrefix;
          *(_DWORD *)buf = 138544130;
          v55 = v26;
          v56 = 2114;
          v57 = (uint64_t)v24;
          v58 = 2048;
          v59 = v21;
          v60 = 2048;
          v61 = v11;
          _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Forcing reload of '%{public}@' because of UIDVALIDITY change (old:%lu new:%lu)", buf, 0x2Au);
        }

        -[MFLegacyIMAPMailboxTaskManager library](self, "library");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "URLString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        do
        {
          v30 = (void *)MEMORY[0x1A85B0E24]();
          objc_msgSend(v27, "messagesForMailbox:limit:", v28, 1000);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v31;
          if (objc_msgSend(v31, "count"))
            objc_msgSend(v27, "compactMessages:", v31);
          objc_autoreleasePoolPop(v30);
        }
        while ((unint64_t)objc_msgSend(v31, "count") > 0x3E7);
        objc_msgSend(v46, "serverMessagePersistence");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "deleteAllServerMessagesInMailbox");

      }
      else
      {
        v24 = v9;
      }

    }
LABEL_40:

  }
  if (objc_msgSend(v45, "isAlertResponse", v43))
  {
    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "userString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleAlertResponse:", v34);

  }
  if (objc_msgSend(v45, "isResponseWithCode:", 31))
  {
    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "userString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleOverQuotaResponse:", v36);

  }
  if ((!v44 || objc_msgSend(v44, "command") == 28)
    && -[MFLegacyIMAPMailboxTaskManager shouldUseIDLE](self, "shouldUseIDLE")
    && objc_msgSend(v45, "responseType") == 9)
  {
    +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = self->_loggingPrefix;
      v39 = objc_msgSend(v45, "number");
      *(_DWORD *)buf = 138543618;
      v55 = v38;
      v56 = 2048;
      v57 = v39;
      _os_log_impl(&dword_1A4F90000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Got EXISTS = %llu", buf, 0x16u);
    }

    -[MFLegacyIMAPMailboxTaskManager setServerMessageCount:](self, "setServerMessageCount:", objc_msgSend(v45, "number"));
    if (self->_mailbox)
    {
      mailbox = self->_mailbox;
      v52 = CFSTR("MailAccountContentsDidChangeUids");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &mailbox, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "postNotificationName:object:userInfo:", CFSTR("MailAccountContentsDidChange"), self->_account, v41);

    }
  }

}

void __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke_2_cold_1(v4, v5, v3);
  }

}

- (BOOL)connection:(id)a3 shouldHandleUntaggedResponse:(id)a4 forCommand:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  NSString *loggingPrefix;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  NSString *v42;
  __int16 v43;
  _WORD v44[9];

  *(_QWORD *)&v44[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "command") == 13 || objc_msgSend(v10, "command") == 9;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storeForMailboxUid:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v9, "responseType");
  v16 = 1;
  switch(v15)
  {
    case 9:
      +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        loggingPrefix = self->_loggingPrefix;
        *(_DWORD *)buf = 138543618;
        v42 = loggingPrefix;
        v43 = 2048;
        *(_QWORD *)v44 = objc_msgSend(v9, "number");
        _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Got EXISTS = %llu", buf, 0x16u);
      }

      -[MFLegacyIMAPMailboxTaskManager setServerMessageCount:](self, "setServerMessageCount:", objc_msgSend(v9, "number"));
      v16 = v11;
      break;
    case 10:
      goto LABEL_9;
    case 11:
    case 12:
    case 14:
    case 15:
    case 16:
      break;
    case 13:
      -[MFLegacyIMAPMailboxTaskManager account](self, "account");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mailboxName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "mailboxUidForName:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "statusEntries");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", 0x1E4F2A178);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v38, "URLString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = objc_msgSend(v14, "uidNext");
          v23 = objc_msgSend(v20, "unsignedIntValue");
          if (v22 != (_DWORD)v23)
          {
            +[MFLegacyIMAPMailboxTaskManager log](MFLegacyIMAPMailboxTaskManager, "log");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = self->_loggingPrefix;
              *(_DWORD *)buf = 138543874;
              v42 = v25;
              v43 = 1024;
              *(_DWORD *)v44 = v22;
              v44[2] = 1024;
              *(_DWORD *)&v44[3] = v23;
              _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Got new UIDNEXT (old = %u, new = %u)", buf, 0x18u);
            }

            objc_msgSend(v14, "setUidNext:", v23);
          }
        }
      }
      -[MFLegacyIMAPMailboxTaskManager mailboxName](self, "mailboxName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v39, "isEqualToString:", v26);

      if (v27)
      {
        objc_msgSend(v19, "objectForKey:", 0x1E4F2A1D8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          -[MFLegacyIMAPMailboxTaskManager setHighestModSequence:](self, "setHighestModSequence:", objc_msgSend(v28, "unsignedLongLongValue"));
        objc_msgSend(v19, "objectForKey:", 0x1E4F2A1B8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v14, "URLString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            -[MFLegacyIMAPMailboxTaskManager library](self, "library");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setLastSyncAndMostRecentStatusCount:forMailbox:", objc_msgSend(v29, "unsignedIntegerValue"), v30);

          }
        }
      }
      else
      {
        v29 = v20;
      }

      goto LABEL_31;
    case 17:
      objc_msgSend(v9, "fetchResultWithType:", 8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchPipeline");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "downloadCache");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 && objc_msgSend(v10, "command") == 21 && v33 && objc_msgSend(v33, "isSending"))
        objc_msgSend(v34, "handleFetchResponse:forUid:", v9, objc_msgSend(v32, "uid"));

LABEL_31:
      v16 = 1;
      break;
    default:
      if (v15 == 24)
LABEL_9:
        v16 = 0;
      break;
  }
  if (objc_msgSend(v9, "isAlertResponse"))
  {
    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleAlertResponse:", v36);

    v16 = 0;
  }

  return v16;
}

- (id)deletedMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeForMailboxUid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFLegacyIMAPMailboxTaskManager library](self, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messagesMatchingCriterion:options:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
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
  char v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MFLegacyIMAPMailboxTaskManager mf_lock](self, "mf_lock", v8);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "intValue");

        if (v9)
          v17 = MFMessageFlagsByApplyingDictionary(v16, v9);
        else
          v17 = objc_msgSend(v14, "messageFlags");
        if ((v16 & 2) != 0)
        {
          if ((v17 & 2) != 0)
            continue;
          v18 = -1;
        }
        else
        {
          if ((v17 & 2) == 0)
            continue;
          v18 = 1;
        }
        self->_serverDeletedCount += v18;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  -[MFLegacyIMAPMailboxTaskManager mf_unlock](self, "mf_unlock");
}

- (void)close
{
  MFIMAPConnection *cachedConnection;
  MFIMAPConnection *v4;
  void *v5;
  MFIMAPConnection *v6;

  -[NSLock lock](self->_cachedConnectionLock, "lock");
  v6 = self->_cachedConnection;
  cachedConnection = self->_cachedConnection;
  self->_cachedConnection = 0;

  -[NSLock unlock](self->_cachedConnectionLock, "unlock");
  v4 = v6;
  if (v6)
  {
    -[MFIMAPConnection finishIdle](v6, "finishIdle");
    -[MFLegacyIMAPMailboxTaskManager account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkInConnection:", v6);

    v4 = v6;
  }

}

- (void)setServerMessageCount:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  unint64_t v7;
  _BOOL4 settingServerCount;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DeletedSearchLimit"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v6 = objc_msgSend(v13, "unsignedIntValue");
    if (v6)
      v7 = v6;
    else
      v7 = 0xFFFFFFFFLL;
  }
  else
  {
    v7 = 300;
  }
  os_unfair_lock_lock(&self->_serverCountLock);
  if (v7 <= a3)
  {
    self->_serverMessageCount = a3;
    os_unfair_lock_unlock(&self->_serverCountLock);
    self->_serverDeletedCount = 0;
  }
  else
  {
    settingServerCount = self->_settingServerCount;
    self->_settingServerCount = 1;
    if (settingServerCount)
    {
      os_unfair_lock_unlock(&self->_serverCountLock);
    }
    else
    {
      self->_serverMessageCount = a3;
      self->_serverDeletedCount = 0;
      os_unfair_lock_unlock(&self->_serverCountLock);
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isRemoteSearch");

      if ((v10 & 1) == 0)
      {
        +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", sel_updateDeletedCount, self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addInvocation:", v12);

      }
    }
  }

}

- (unint64_t)serverMessageCount
{
  os_unfair_lock_s *p_serverCountLock;
  unint64_t serverDeletedCount;
  unint64_t serverMessageCount;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;

  p_serverCountLock = &self->_serverCountLock;
  os_unfair_lock_lock(&self->_serverCountLock);
  serverMessageCount = self->_serverMessageCount;
  serverDeletedCount = self->_serverDeletedCount;
  v6 = serverMessageCount >= serverDeletedCount;
  v7 = serverMessageCount - serverDeletedCount;
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  os_unfair_lock_unlock(p_serverCountLock);
  return v8;
}

- (void)setHighestModSequence:(unint64_t)a3
{
  self->_highestModSequence = a3;
}

- (id)sequenceIdentifierForUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeForMailboxUid:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFLegacyIMAPMailboxTaskManager library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sequenceIdentifierForMessagesWithRemoteIDs:inMailbox:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setSequenceIdentifier:(id)a3 forUIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[MFLegacyIMAPMailboxTaskManager account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLegacyIMAPMailboxTaskManager mailbox](self, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeForMailboxUid:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFLegacyIMAPMailboxTaskManager library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSequenceIdentifier:forMessagesWithRemoteIDs:inMailbox:", v12, v6, v11);

}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (BOOL)shouldUseIDLE
{
  return self->_shouldUseIDLE;
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void)setCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_cancelationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_cachedConnectionLock, 0);
  objc_storeStrong((id *)&self->_cachedConnection, 0);
  objc_storeStrong((id *)&self->_mailboxName, 0);
}

- (void)fetchNumMessages:(NSObject *)a3 preservingUID:(void *)a4 options:.cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_1A4F90000, a2, a3, "%@: \"Connecting...\" starting", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_1A4F90000, a2, a3, "%@: \"Connecting...\" completed", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "store and connection mailboxes differ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "canceling fetch because mailbox could not be selected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "canceling fetch because connection is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_FAULT, "Download fetched 0 bytes for UID %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_9();
}

- (void)_waitForDataFromDownload:uid:downloadCache:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "failed to download data, message.remoteID may be null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#imap-idle error occurred while observing conditions for IDLE: %{public}@", buf, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end
