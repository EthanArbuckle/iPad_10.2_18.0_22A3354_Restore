@implementation EDRemoteClient

void __35__EDRemoteClient_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1E150], "remoteObjectInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_exportedInterface;
  exportedInterface_exportedInterface = v0;

}

- (void)getOutgoingMessageRepositoryInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient outgoingMessageRepository](self, "outgoingMessageRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (EDOutgoingMessageRepository)outgoingMessageRepository
{
  os_unfair_lock_s *p_lock;
  EDOutgoingMessageRepository *outgoingMessageRepository;
  void *v5;
  EDOutgoingMessageRepository *v6;
  EDOutgoingMessageRepository *v7;
  EDOutgoingMessageRepository *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  outgoingMessageRepository = self->_outgoingMessageRepository;
  if (!outgoingMessageRepository)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EDOutgoingMessageRepository *)objc_msgSend(v5, "newOutgoingMessageRepository");
    v7 = self->_outgoingMessageRepository;
    self->_outgoingMessageRepository = v6;

    outgoingMessageRepository = self->_outgoingMessageRepository;
  }
  v8 = outgoingMessageRepository;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)getMailboxRepositoryInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient mailboxRepository](self, "mailboxRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (EDMailboxRepository)mailboxRepository
{
  os_unfair_lock_s *p_lock;
  EDMailboxRepository *mailboxRepository;
  void *v5;
  EDMailboxRepository *v6;
  EDMailboxRepository *v7;
  EDMailboxRepository *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mailboxRepository = self->_mailboxRepository;
  if (!mailboxRepository)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EDMailboxRepository *)objc_msgSend(v5, "newMailboxRepository");
    v7 = self->_mailboxRepository;
    self->_mailboxRepository = v6;

    mailboxRepository = self->_mailboxRepository;
  }
  v8 = mailboxRepository;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)launchForAppLaunch:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = (void (**)(_QWORD))a3;
  +[EDRemoteClient log](EDRemoteClient, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "app requested early daemon launch", v7, 2u);
  }

  v4[2](v4);
  -[EDDaemonInterfaceFactory persistence](self->_daemonInterfaceFactory, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDTruncateMailboxUpgradeStep presentNeedlessAlertIfNecessaryWithPersistence:](EDTruncateMailboxUpgradeStep, "presentNeedlessAlertIfNecessaryWithPersistence:", v6);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__EDRemoteClient_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_72 != -1)
    dispatch_once(&log_onceToken_72, block);
  return (OS_os_log *)(id)log_log_72;
}

- (void)getFetchControllerInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient fetchController](self, "fetchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (EDFetchController)fetchController
{
  os_unfair_lock_s *p_lock;
  EDFetchController *fetchController;
  void *v5;
  EDFetchController *v6;
  EDFetchController *v7;
  EDFetchController *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchController = self->_fetchController;
  if (!fetchController)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EDFetchController *)objc_msgSend(v5, "newFetchController");
    v7 = self->_fetchController;
    self->_fetchController = v6;

    fetchController = self->_fetchController;
  }
  v8 = fetchController;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)getActivityRegistryInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient activityRegistry](self, "activityRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (EDActivityRegistry)activityRegistry
{
  os_unfair_lock_s *p_lock;
  EDActivityRegistry *activityRegistry;
  void *v5;
  EDActivityRegistry *v6;
  EDActivityRegistry *v7;
  EDActivityRegistry *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  activityRegistry = self->_activityRegistry;
  if (!activityRegistry)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EDActivityRegistry *)objc_msgSend(v5, "newActivityRegistry");
    v7 = self->_activityRegistry;
    self->_activityRegistry = v6;

    activityRegistry = self->_activityRegistry;
  }
  v8 = activityRegistry;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)getMessageRepositoryInterface:(id)a3
{
  EDMessageRepository *messageRepository;
  EDRemoteClientResumer *v5;
  void *v6;
  EDMessageRepository *v7;
  EDMessageRepository *v8;
  EDMessageRepository *v9;
  void (**v10)(id, id);

  v10 = (void (**)(id, id))a3;
  os_unfair_lock_lock(&self->_lock);
  messageRepository = self->_messageRepository;
  if (!messageRepository)
  {
    v5 = -[EDRemoteClientResumer initWithRemoteClient:]([EDRemoteClientResumer alloc], "initWithRemoteClient:", self);
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (EDMessageRepository *)objc_msgSend(v6, "newMessageRepositoryWithResumable:", v5);
    v8 = self->_messageRepository;
    self->_messageRepository = v7;

    messageRepository = self->_messageRepository;
  }
  v9 = messageRepository;
  os_unfair_lock_unlock(&self->_lock);
  v10[2](v10, v9);

}

- (void)getDiagnosticInfoGathererInterface:(id)a3
{
  EDDiagnosticInfoGatherer *diagnosticInfoGatherer;
  void *v5;
  void *v6;
  EDDiagnosticInfoGatherer *v7;
  EDDiagnosticInfoGatherer *v8;
  EDDiagnosticInfoGatherer *v9;
  void (**v10)(id, id);

  v10 = (void (**)(id, id))a3;
  os_unfair_lock_lock(&self->_lock);
  diagnosticInfoGatherer = self->_diagnosticInfoGatherer;
  if (!diagnosticInfoGatherer)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDRemoteClient serverRemoteClientsProvider](self, "serverRemoteClientsProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (EDDiagnosticInfoGatherer *)objc_msgSend(v5, "newDiagnosticInfoGathererWithServerRemoteClientsProvider:", v6);
    v8 = self->_diagnosticInfoGatherer;
    self->_diagnosticInfoGatherer = v7;

    diagnosticInfoGatherer = self->_diagnosticInfoGatherer;
  }
  v9 = diagnosticInfoGatherer;
  os_unfair_lock_unlock(&self->_lock);
  v10[2](v10, v9);

}

- (EDServerRemoteClientsProvider)serverRemoteClientsProvider
{
  return (EDServerRemoteClientsProvider *)objc_loadWeakRetained((id *)&self->_serverRemoteClientsProvider);
}

- (EDAccountRepository)accountRepository
{
  os_unfair_lock_s *p_lock;
  EDAccountRepository *accountRepository;
  void *v5;
  EDAccountRepository *v6;
  EDAccountRepository *v7;
  EDAccountRepository *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  accountRepository = self->_accountRepository;
  if (!accountRepository)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EDAccountRepository *)objc_msgSend(v5, "newAccountRepository");
    v7 = self->_accountRepository;
    self->_accountRepository = v6;

    accountRepository = self->_accountRepository;
  }
  v8 = accountRepository;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (EDDaemonInterfaceFactory)daemonInterfaceFactory
{
  return self->_daemonInterfaceFactory;
}

- (void)setAllowsBackgroundResume:(BOOL)a3
{
  EDClientResumer *clientResumer;
  EDClientResumer *v5;
  EDDaemonInterfaceFactory *daemonInterfaceFactory;
  EDClientResumer *v7;
  EDClientResumer *v8;
  EDClientResumer *v9;

  clientResumer = self->_clientResumer;
  if (!a3)
  {
    -[EDClientResumer invalidate](clientResumer, "invalidate");
    v5 = self->_clientResumer;
    self->_clientResumer = 0;
LABEL_6:

    return;
  }
  if (!clientResumer)
  {
    daemonInterfaceFactory = self->_daemonInterfaceFactory;
    -[EDRemoteClient clientState](self, "clientState");
    v9 = (EDClientResumer *)objc_claimAutoreleasedReturnValue();
    v7 = -[EDDaemonInterfaceFactory newClientResumerWithClientState:](daemonInterfaceFactory, "newClientResumerWithClientState:");
    v8 = self->_clientResumer;
    self->_clientResumer = v7;

    v5 = v9;
    goto LABEL_6;
  }
}

- (void)getClientStateInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient clientState](self, "clientState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (EDClientState)clientState
{
  return self->_clientState;
}

- (void)getAccountRepositoryInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient accountRepository](self, "accountRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (EDRemoteClient)initWithConnection:(id)a3 daemonInterfaceFactory:(id)a4 serverRemoteClientsProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDRemoteClient *v12;
  EDRemoteClient *v13;
  uint64_t v14;
  EDClientState *clientState;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDRemoteClient;
  v12 = -[EDRemoteClient init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_clientConnection, a3);
    objc_storeStrong((id *)&v13->_daemonInterfaceFactory, a4);
    objc_storeWeak((id *)&v13->_serverRemoteClientsProvider, v11);
    +[EDClientState sharedInstance](EDClientState, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    clientState = v13->_clientState;
    v13->_clientState = (EDClientState *)v14;

  }
  return v13;
}

+ (NSXPCInterface)exportedInterface
{
  if (exportedInterface_onceToken != -1)
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_55);
  return (NSXPCInterface *)(id)exportedInterface_exportedInterface;
}

void __21__EDRemoteClient_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_72;
  log_log_72 = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[EDClientResumer invalidate](self->_clientResumer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)EDRemoteClient;
  -[EDRemoteClient dealloc](&v3, sel_dealloc);
}

- (void)test_tearDown
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDRemoteClient.m"), 102, CFSTR("%s can only be called from unit tests"), "-[EDRemoteClient test_tearDown]");

  }
  -[EDMessageRepository test_tearDown](self->_messageRepository, "test_tearDown");
}

- (EDSenderRepository)senderRepository
{
  os_unfair_lock_s *p_lock;
  EDSenderRepository *senderRepository;
  void *v5;
  EDSenderRepository *v6;
  EDSenderRepository *v7;
  EDSenderRepository *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  senderRepository = self->_senderRepository;
  if (!senderRepository)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EDSenderRepository *)objc_msgSend(v5, "newSenderRepository");
    v7 = self->_senderRepository;
    self->_senderRepository = v6;

    senderRepository = self->_senderRepository;
  }
  v8 = senderRepository;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (EDSearchableIndex)searchableIndex
{
  os_unfair_lock_s *p_lock;
  EDSearchableIndex *searchableIndex;
  void *v5;
  EDSearchableIndex *v6;
  EDSearchableIndex *v7;
  EDSearchableIndex *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  searchableIndex = self->_searchableIndex;
  if (!searchableIndex)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EDSearchableIndex *)objc_msgSend(v5, "newSearchableIndex");
    v7 = self->_searchableIndex;
    self->_searchableIndex = v6;

    searchableIndex = self->_searchableIndex;
  }
  v8 = searchableIndex;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (EDInteractionLogger)interactionLogger
{
  os_unfair_lock_s *p_lock;
  EDInteractionLogger *interactionLogger;
  void *v5;
  EDInteractionLogger *v6;
  EDInteractionLogger *v7;
  EDInteractionLogger *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionLogger = self->_interactionLogger;
  if (!interactionLogger)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedInteractionLogger");
    v6 = (EDInteractionLogger *)objc_claimAutoreleasedReturnValue();
    v7 = self->_interactionLogger;
    self->_interactionLogger = v6;

    interactionLogger = self->_interactionLogger;
  }
  v8 = interactionLogger;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (EMVIPManagerInterface)vipManagerInterface
{
  os_unfair_lock_s *p_lock;
  EMVIPManagerInterface *vipManagerInterface;
  void *v5;
  EMVIPManagerInterface *v6;
  EMVIPManagerInterface *v7;
  EMVIPManagerInterface *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  vipManagerInterface = self->_vipManagerInterface;
  if (!vipManagerInterface)
  {
    -[EDRemoteClient daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (EMVIPManagerInterface *)objc_msgSend(v5, "newVIPManagerInterface");
    v7 = self->_vipManagerInterface;
    self->_vipManagerInterface = v6;

    vipManagerInterface = self->_vipManagerInterface;
  }
  v8 = vipManagerInterface;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)getSearchableIndexInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient searchableIndex](self, "searchableIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)getInteractionLoggerInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient interactionLogger](self, "interactionLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)getVIPManagerInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient vipManagerInterface](self, "vipManagerInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)launchForEarlyRecovery:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  +[EDRemoteClient log](EDRemoteClient, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "app requested early recovery path", v5, 2u);
  }

  v3[2](v3);
}

- (void)getSenderRepositoryInterface:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[EDRemoteClient senderRepository](self, "senderRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)messageReconciliationQueries
{
  void *v2;
  void *v3;

  -[EDRemoteClient messageRepository](self, "messageRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageReconciliationQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)threadReconciliationQueries
{
  void *v2;
  void *v3;

  -[EDRemoteClient messageRepository](self, "messageRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadReconciliationQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (EDMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (EDClientResumer)clientResumer
{
  return self->_clientResumer;
}

- (EDDiagnosticInfoGatherer)diagnosticInfoGatherer
{
  return self->_diagnosticInfoGatherer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticInfoGatherer, 0);
  objc_storeStrong((id *)&self->_clientResumer, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_destroyWeak((id *)&self->_serverRemoteClientsProvider);
  objc_storeStrong((id *)&self->_daemonInterfaceFactory, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_activityRegistry, 0);
  objc_storeStrong((id *)&self->_vipManagerInterface, 0);
  objc_storeStrong((id *)&self->_interactionLogger, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_accountRepository, 0);
}

@end
