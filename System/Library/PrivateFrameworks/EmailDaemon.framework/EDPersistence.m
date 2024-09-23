@implementation EDPersistence

- (EFXPCAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (void)setVipManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setListUnsubscribeHandler:(id)a3
{
  objc_storeStrong((id *)&self->_listUnsubscribeHandler, a3);
}

- (EDActivityPersistence)activityPersistence
{
  return (EDActivityPersistence *)objc_getProperty(self, a2, 96, 1);
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return (EDPersistenceHookRegistry *)objc_getProperty(self, a2, 40, 1);
}

- (EDVIPManager)vipManager
{
  return (EDVIPManager *)objc_getProperty(self, a2, 72, 1);
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EDListUnsubscribeHandler)listUnsubscribeHandler
{
  return self->_listUnsubscribeHandler;
}

- (EDPersistence)init
{
  EDPersistence *v2;
  EDPersistence *v3;
  EDGmailLabelPersistence *v4;
  EDGmailLabelPersistence *gmailLabelPersistence;
  EDPersistenceHookRegistry *v6;
  EDPersistenceHookRegistry *hookRegistry;
  EDActivityPersistence *v8;
  EDActivityPersistence *activityPersistence;
  EMBlockedSenderManager *v10;
  EMBlockedSenderManager *blockedSenderManager;
  uint64_t v12;
  EFXPCAlarmScheduler *alarmScheduler;
  objc_super v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)EDPersistence;
  v2 = -[EDPersistence init](&v16, sel_init);
  if (!v2)
    return 0;
  v15.receiver = v2;
  v15.super_class = (Class)EDPersistence;
  v3 = -[EDPersistence init](&v15, sel_init);
  if (v3)
  {
    v4 = objc_alloc_init(EDGmailLabelPersistence);
    gmailLabelPersistence = v3->_gmailLabelPersistence;
    v3->_gmailLabelPersistence = v4;

    v6 = objc_alloc_init(EDPersistenceHookRegistry);
    hookRegistry = v3->_hookRegistry;
    v3->_hookRegistry = v6;

    v8 = -[EDActivityPersistence initWithHookResponder:]([EDActivityPersistence alloc], "initWithHookResponder:", v3->_hookRegistry);
    activityPersistence = v3->_activityPersistence;
    v3->_activityPersistence = v8;

    v10 = (EMBlockedSenderManager *)objc_alloc_init(MEMORY[0x1E0D1E0F0]);
    blockedSenderManager = v3->_blockedSenderManager;
    v3->_blockedSenderManager = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F098]), "initGlobalInstance");
    alarmScheduler = v3->_alarmScheduler;
    v3->_alarmScheduler = (EFXPCAlarmScheduler *)v12;

  }
  return v3;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__EDPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_62 != -1)
    dispatch_once(&log_onceToken_62, block);
  return (OS_os_log *)(id)log_log_62;
}

void __20__EDPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_62;
  log_log_62 = (uint64_t)v1;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EDPersistence remoteContentURLSession](self, "remoteContentURLSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndCancel:", 1);

  v4.receiver = self;
  v4.super_class = (Class)EDPersistence;
  -[EDPersistence dealloc](&v4, sel_dealloc);
}

- (void)test_tearDown
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistence.m"), 68, CFSTR("%s can only be called from unit tests"), "-[EDPersistence test_tearDown]");

  }
  -[EDPersistence remindMeNotificationController](self, "remindMeNotificationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

  -[EDPersistence messageChangeManager](self, "messageChangeManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "test_tearDown");

  -[EDPersistence senderPersistence](self, "senderPersistence");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "test_tearDown");

  -[EDPersistence blockedSenderManager](self, "blockedSenderManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "test_tearDown");

  -[EDPersistence remoteContentManager](self, "remoteContentManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "test_tearDown");

  -[EDPersistence remoteContentPersistence](self, "remoteContentPersistence");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "test_tearDown");

  -[EDPersistence searchableIndexManager](self, "searchableIndexManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "test_tearDown");

  -[EDPersistence mailboxPersistence](self, "mailboxPersistence");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "test_tearDown");

  -[EDPersistence messagePersistence](self, "messagePersistence");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "test_tearDown");

  -[EDPersistence bimiManager](self, "bimiManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "test_tearDown");

  -[EDPersistence database](self, "database");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "test_tearDown");

}

- (void)scheduleRecurringActivity
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  -[EDPersistence database](self, "database");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleRecurringActivity");

  -[EDPersistence searchableIndexManager](self, "searchableIndexManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleRecurringActivity");

  -[EDPersistence remoteContentManager](self, "remoteContentManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleRecurringActivity");

  -[EDPersistence bimiManager](self, "bimiManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleRecurringActivity");

  -[EDPersistence senderPersistence](self, "senderPersistence");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduleRecurringActivity");

  -[EDPersistence readLaterPersistence](self, "readLaterPersistence");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleRecurringActivity");

  -[EDPersistence mailboxPersistence](self, "mailboxPersistence");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scheduleRecurringActivity");

  -[EDPersistence diagnosticsController](self, "diagnosticsController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scheduleRecurringActivity");

}

- (EDPersistenceDatabase)database
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence database]", "EDPersistence.m", 95, "0");
}

- (EDServerMessagePersistenceFactory)serverMessagePersistenceFactory
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence serverMessagePersistenceFactory]", "EDPersistence.m", 99, "0");
}

- (EDConversationPersistence)conversationPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence conversationPersistence]", "EDPersistence.m", 103, "0");
}

- (EDLocalActionPersistence)localActionPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence localActionPersistence]", "EDPersistence.m", 107, "0");
}

- (EDMessageChangeManager)messageChangeManager
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence messageChangeManager]", "EDPersistence.m", 111, "0");
}

- (EDDataDetectionPersistence)dataDetectionPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence dataDetectionPersistence]", "EDPersistence.m", 121, "0");
}

- (EDReadLaterPersistence)readLaterPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence readLaterPersistence]", "EDPersistence.m", 125, "0");
}

- (EDRichLinkPersistence)richLinkPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence richLinkPersistence]", "EDPersistence.m", 129, "0");
}

- (EDBusinessPersistence)businessPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence businessPersistence]", "EDPersistence.m", 133, "0");
}

- (EDSearchableIndexManager)searchableIndexManager
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence searchableIndexManager]", "EDPersistence.m", 137, "0");
}

- (EDThreadPersistence)threadPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence threadPersistence]", "EDPersistence.m", 141, "0");
}

- (EDRemoteContentManager)remoteContentManager
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence remoteContentManager]", "EDPersistence.m", 145, "0");
}

- (EDRemoteContentPersistence)remoteContentPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence remoteContentPersistence]", "EDPersistence.m", 149, "0");
}

- (EDAttachmentPersistenceManager)attachmentPersistenceManager
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence attachmentPersistenceManager]", "EDPersistence.m", 153, "0");
}

- (EDMailboxActionPersistence)mailboxActionPersistence
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence mailboxActionPersistence]", "EDPersistence.m", 157, "0");
}

- (id)persistenceStatistics
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence persistenceStatistics]", "EDPersistence.m", 161, "0");
}

- (id)searchableIndexStatistics
{
  -[EDPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistence searchableIndexStatistics]", "EDPersistence.m", 165, "0");
}

- (id)persistenceStateWithStatistics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = *MEMORY[0x1E0D1DF38];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E0D1DF28];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "messageData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = *MEMORY[0x1E0D1DF40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "messagesDeleted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E0D1DF30];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "messageDataDeleted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return (EDGmailLabelPersistence *)objc_getProperty(self, a2, 8, 1);
}

- (EDSenderPersistence)senderPersistence
{
  return (EDSenderPersistence *)objc_getProperty(self, a2, 16, 1);
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDMessagePersistence)messagePersistence
{
  return (EDMessagePersistence *)objc_getProperty(self, a2, 32, 1);
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDRemoteContentCacheConfiguration)remoteContentCacheConfiguration
{
  return self->_remoteContentCacheConfiguration;
}

- (EMRemoteContentURLCache)remoteContentURLCache
{
  return self->_remoteContentURLCache;
}

- (void)setRemoteContentURLCache:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentURLCache, a3);
}

- (EMRemoteContentURLSession)remoteContentURLSession
{
  return self->_remoteContentURLSession;
}

- (void)setRemoteContentURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentURLSession, a3);
}

- (MEContentRuleListManager)contentRuleListManager
{
  return self->_contentRuleListManager;
}

- (EDCategoryPersistence)categoryPersistence
{
  return (EDCategoryPersistence *)objc_getProperty(self, a2, 136, 1);
}

- (EDBusinessCloudStorage)businessCloudStorage
{
  return self->_businessCloudStorage;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EDSearchableIndexDiagnosticsController)diagnosticsController
{
  return self->_diagnosticsController;
}

- (EDBIMIManager)bimiManager
{
  return self->_bimiManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bimiManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_businessCloudStorage, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_contentRuleListManager, 0);
  objc_storeStrong((id *)&self->_remoteContentURLSession, 0);
  objc_storeStrong((id *)&self->_remoteContentURLCache, 0);
  objc_storeStrong((id *)&self->_remoteContentCacheConfiguration, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_listUnsubscribeHandler, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);
}

@end
