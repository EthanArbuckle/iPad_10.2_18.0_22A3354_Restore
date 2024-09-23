@implementation EMDaemonInterface

- (id)generateProxyForProtocol:(id)a3 error:(id *)a4
{
  -[EMDaemonInterface _connectionForProtocol:error:](self, "_connectionForProtocol:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_connectionForProtocol:(id)a3 error:(id *)a4
{
  id v6;
  const char *Value;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  if (_connectionForProtocol_error__onceToken != -1)
    dispatch_once(&_connectionForProtocol_error__onceToken, &__block_literal_global_9);
  Value = (const char *)CFDictionaryGetValue((CFDictionaryRef)_connectionForProtocol_error__map, v6);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  -[EMDaemonInterface proxyCreator](self, "proxyCreator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_312;
  v22[3] = &unk_1E70F29F8;
  v22[4] = &v23;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_2;
  v15[3] = &unk_1E70F2A20;
  v15[4] = &v16;
  v11 = (void *)MEMORY[0x1BCCC8C10](v15);
  objc_msgSend(v10, Value, v11);
  v12 = (void *)v17[5];
  if (v12)
  {
    -[EMDaemonInterface handleDaemonAvailability](self, "handleDaemonAvailability");
    v12 = (void *)v17[5];
  }
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v24[5]);
    v12 = (void *)v17[5];
  }
  v13 = v12;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (NSXPCProxyCreating)proxyCreator
{
  return (NSXPCProxyCreating *)self->_connection;
}

- (void)handleDaemonAvailability
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EMDaemonInterface_handleDaemonAvailability__block_invoke;
  block[3] = &unk_1E70F1FA0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (EMMessageRepository)messageRepository
{
  return (EMMessageRepository *)objc_getProperty(self, a2, 64, 1);
}

void __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "remoteObjectProxy");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (EMMailboxRepository)mailboxRepository
{
  return (EMMailboxRepository *)objc_getProperty(self, a2, 80, 1);
}

- (EMFetchController)fetchController
{
  return (EMFetchController *)objc_getProperty(self, a2, 104, 1);
}

- (EMAccountRepository)accountRepository
{
  return (EMAccountRepository *)objc_getProperty(self, a2, 88, 1);
}

- (EMOutgoingMessageRepository)outgoingMessageRepository
{
  return (EMOutgoingMessageRepository *)objc_getProperty(self, a2, 72, 1);
}

- (EMClientState)clientState
{
  return (EMClientState *)objc_getProperty(self, a2, 112, 1);
}

- (EMActivityRegistry)activityRegistry
{
  return (EMActivityRegistry *)objc_getProperty(self, a2, 128, 1);
}

void __50__EMDaemonInterface__connectionForProtocol_error___block_invoke()
{
  __CFDictionary *Mutable;
  void *v1;
  void *v2;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  +[EMAccountRepository remoteInterface](EMAccountRepository, "remoteInterface");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "protocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v2, sel_getAccountRepositoryInterface_);

  +[EMClientState remoteInterface](EMClientState, "remoteInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v4, sel_getClientStateInterface_);

  +[EMFetchController remoteInterface](EMFetchController, "remoteInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v6, sel_getFetchControllerInterface_);

  +[EMInteractionLogger remoteInterface](EMInteractionLogger, "remoteInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "protocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v8, sel_getInteractionLoggerInterface_);

  +[EMMailboxRepository remoteInterface](EMMailboxRepository, "remoteInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v10, sel_getMailboxRepositoryInterface_);

  +[EMMessageRepository remoteInterface](EMMessageRepository, "remoteInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v12, sel_getMessageRepositoryInterface_);

  +[EMOutgoingMessageRepository remoteInterface](EMOutgoingMessageRepository, "remoteInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "protocol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v14, sel_getOutgoingMessageRepositoryInterface_);

  +[EMSenderRepository remoteInterface](EMSenderRepository, "remoteInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "protocol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v16, sel_getSenderRepositoryInterface_);

  +[EMSearchableIndex remoteInterface](EMSearchableIndex, "remoteInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "protocol");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v18, sel_getSearchableIndexInterface_);

  +[EMVIPManager remoteInterface](EMVIPManager, "remoteInterface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "protocol");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v20, sel_getVIPManagerInterface_);

  +[EMActivityRegistry remoteInterface](EMActivityRegistry, "remoteInterface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "protocol");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v22, sel_getActivityRegistryInterface_);

  +[EMDiagnosticInfoGatherer remoteInterface](EMDiagnosticInfoGatherer, "remoteInterface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "protocol");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, v24, sel_getDiagnosticInfoGathererInterface_);

  _connectionForProtocol_error__map = (uint64_t)Mutable;
}

+ (NSXPCInterface)remoteObjectInterface
{
  void *v2;
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

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FEB0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMAccountRepository remoteInterface](EMAccountRepository, "remoteInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_getAccountRepositoryInterface_, 0, 1);

  +[EMClientState remoteInterface](EMClientState, "remoteInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_getClientStateInterface_, 0, 1);

  +[EMFetchController remoteInterface](EMFetchController, "remoteInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getFetchControllerInterface_, 0, 1);

  +[EMInteractionLogger remoteInterface](EMInteractionLogger, "remoteInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_getInteractionLoggerInterface_, 0, 1);

  +[EMMailboxRepository remoteInterface](EMMailboxRepository, "remoteInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_getMailboxRepositoryInterface_, 0, 1);

  +[EMMessageRepository remoteInterface](EMMessageRepository, "remoteInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_getMessageRepositoryInterface_, 0, 1);

  +[EMOutgoingMessageRepository remoteInterface](EMOutgoingMessageRepository, "remoteInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_getOutgoingMessageRepositoryInterface_, 0, 1);

  +[EMSenderRepository remoteInterface](EMSenderRepository, "remoteInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v10, sel_getSenderRepositoryInterface_, 0, 1);

  +[EMSearchableIndex remoteInterface](EMSearchableIndex, "remoteInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_getSearchableIndexInterface_, 0, 1);

  +[EMVIPManager remoteInterface](EMVIPManager, "remoteInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_getVIPManagerInterface_, 0, 1);

  +[EMActivityRegistry remoteInterface](EMActivityRegistry, "remoteInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_getActivityRegistryInterface_, 0, 1);

  +[EMDiagnosticInfoGatherer remoteInterface](EMDiagnosticInfoGatherer, "remoteInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_getDiagnosticInfoGathererInterface_, 0, 1);

  return (NSXPCInterface *)v2;
}

- (id)_initByAdoptingConnection:(id)a3 useNegotiatedConnection:(BOOL)a4 configureBlockedSenderManager:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  EMDaemonInterface *v9;
  EMDaemonInterface *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  EFCancelable *daemonLaunchToken;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  uint64_t v22;
  NSHashTable *connections;
  EMAccountRepository *v24;
  void *v25;
  uint64_t v26;
  EMAccountRepository *accountRepository;
  EMMailboxRepository *v28;
  void *v29;
  uint64_t v30;
  EMMailboxRepository *mailboxRepository;
  EMVIPManager *v32;
  void *v33;
  uint64_t v34;
  EMVIPManager *vipManager;
  EMMessageRepository *v36;
  void *v37;
  uint64_t v38;
  EMMessageRepository *messageRepository;
  EMSenderRepository *v40;
  void *v41;
  uint64_t v42;
  EMSenderRepository *senderRepository;
  EMFetchController *v44;
  void *v45;
  uint64_t v46;
  EMFetchController *fetchController;
  EMOutgoingMessageRepository *v48;
  void *v49;
  uint64_t v50;
  EMOutgoingMessageRepository *outgoingMessageRepository;
  EMClientState *v52;
  void *v53;
  uint64_t v54;
  EMClientState *clientState;
  EMSearchableIndex *v56;
  void *v57;
  uint64_t v58;
  EMSearchableIndex *searchableIndex;
  EMInteractionLogger *v60;
  void *v61;
  uint64_t v62;
  EMInteractionLogger *interactionLogger;
  EMActivityRegistry *v64;
  void *v65;
  uint64_t v66;
  EMActivityRegistry *activityRegistry;
  EMDiagnosticInfoGatherer *v68;
  void *v69;
  uint64_t v70;
  EMDiagnosticInfoGatherer *diagnosticInfoGatherer;
  EMBlockedSenderManager *v72;
  EMBlockedSenderManager *blockedSenderManager;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  id location;
  objc_super v82;

  v5 = a5;
  v8 = a3;
  v82.receiver = self;
  v82.super_class = (Class)EMDaemonInterface;
  v9 = -[EMDaemonInterface init](&v82, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    +[EMDaemonInterface remoteObjectInterface](EMDaemonInterface, "remoteObjectInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v10->_connection, "setRemoteObjectInterface:", v11);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v12 = MEMORY[0x1E0C809B0];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke;
    v79[3] = &unk_1E70F1F78;
    objc_copyWeak(&v80, &location);
    objc_msgSend(v8, "setInterruptionHandler:", v79);
    v77[0] = v12;
    v77[1] = 3221225472;
    v77[2] = __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_6;
    v77[3] = &unk_1E70F1F78;
    objc_copyWeak(&v78, &location);
    objc_msgSend(v8, "setInvalidationHandler:", v77);
    objc_msgSend(v8, "resume");
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableOnNotifyTokenWithName:", CFSTR("com.apple.email.maild.launched"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.maild.launched"), 17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "debounceWithTimeInterval:scheduler:", v14, 0.05);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v12;
    v75[1] = 3221225472;
    v75[2] = __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_9;
    v75[3] = &unk_1E70F29D0;
    objc_copyWeak(&v76, &location);
    objc_msgSend(v15, "subscribeWithResultBlock:", v75);
    v16 = objc_claimAutoreleasedReturnValue();
    daemonLaunchToken = v10->_daemonLaunchToken;
    v10->_daemonLaunchToken = (EFCancelable *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create_with_target_V2("com.apple.email.EMDaemonInterface", v18, v19);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v20;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    connections = v10->_connections;
    v10->_connections = (NSHashTable *)v22;

    v24 = [EMAccountRepository alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25F8C8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[EMAccountRepository initWithRemoteConnection:](v24, "initWithRemoteConnection:", v25);
    accountRepository = v10->_accountRepository;
    v10->_accountRepository = (EMAccountRepository *)v26;

    v28 = [EMMailboxRepository alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FB50);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[EMMailboxRepository initWithRemoteConnection:accountRepository:](v28, "initWithRemoteConnection:accountRepository:", v29, v10->_accountRepository);
    mailboxRepository = v10->_mailboxRepository;
    v10->_mailboxRepository = (EMMailboxRepository *)v30;

    v32 = [EMVIPManager alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FBB0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[EMVIPManager initWithRemoteConnection:](v32, "initWithRemoteConnection:", v33);
    vipManager = v10->_vipManager;
    v10->_vipManager = (EMVIPManager *)v34;

    v36 = [EMMessageRepository alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FC10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[EMMessageRepository initWithRemoteConnection:mailboxRepository:vipManager:](v36, "initWithRemoteConnection:mailboxRepository:vipManager:", v37, v10->_mailboxRepository, v10->_vipManager);
    messageRepository = v10->_messageRepository;
    v10->_messageRepository = (EMMessageRepository *)v38;

    v40 = [EMSenderRepository alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FC70);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[EMRepository initWithRemoteConnection:](v40, "initWithRemoteConnection:", v41);
    senderRepository = v10->_senderRepository;
    v10->_senderRepository = (EMSenderRepository *)v42;

    v44 = [EMFetchController alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FCD0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[EMFetchController initWithRemoteConnection:](v44, "initWithRemoteConnection:", v45);
    fetchController = v10->_fetchController;
    v10->_fetchController = (EMFetchController *)v46;

    v48 = [EMOutgoingMessageRepository alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FD30);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[EMOutgoingMessageRepository initWithRemoteConnection:](v48, "initWithRemoteConnection:", v49);
    outgoingMessageRepository = v10->_outgoingMessageRepository;
    v10->_outgoingMessageRepository = (EMOutgoingMessageRepository *)v50;

    v52 = [EMClientState alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25F988);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[EMClientState initWithRemoteConnection:](v52, "initWithRemoteConnection:", v53);
    clientState = v10->_clientState;
    v10->_clientState = (EMClientState *)v54;

    v56 = [EMSearchableIndex alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FD90);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[EMSearchableIndex initWithRemoteConnection:](v56, "initWithRemoteConnection:", v57);
    searchableIndex = v10->_searchableIndex;
    v10->_searchableIndex = (EMSearchableIndex *)v58;

    v60 = [EMInteractionLogger alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FDF0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[EMInteractionLogger initWithRemoteConnection:](v60, "initWithRemoteConnection:", v61);
    interactionLogger = v10->_interactionLogger;
    v10->_interactionLogger = (EMInteractionLogger *)v62;

    v64 = [EMActivityRegistry alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25F928);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[EMActivityRegistry initWithRemoteConnection:](v64, "initWithRemoteConnection:", v65);
    activityRegistry = v10->_activityRegistry;
    v10->_activityRegistry = (EMActivityRegistry *)v66;

    v68 = [EMDiagnosticInfoGatherer alloc];
    -[EMDaemonInterface connectionForProtocol:](v10, "connectionForProtocol:", &unk_1EF25FE50);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[EMDiagnosticInfoGatherer initWithRemoteConnection:](v68, "initWithRemoteConnection:", v69);
    diagnosticInfoGatherer = v10->_diagnosticInfoGatherer;
    v10->_diagnosticInfoGatherer = (EMDiagnosticInfoGatherer *)v70;

    atomic_store(0, (unsigned __int8 *)&v10->_invalidated);
    if (v5)
    {
      v72 = objc_alloc_init(EMBlockedSenderManager);
      blockedSenderManager = v10->_blockedSenderManager;
      v10->_blockedSenderManager = v72;

    }
    objc_destroyWeak(&v76);

    objc_destroyWeak(&v78);
    objc_destroyWeak(&v80);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)connectionForProtocol:(id)a3
{
  id v4;
  EMRemoteConnection *v5;

  v4 = a3;
  v5 = -[EMRemoteConnection initWithProtocol:proxyGenerator:]([EMRemoteConnection alloc], "initWithProtocol:proxyGenerator:", v4, self);
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_connections, "addObject:", v5);
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (EMInteractionLogger)interactionLogger
{
  return (EMInteractionLogger *)objc_getProperty(self, a2, 120, 1);
}

- (EMVIPManager)vipManager
{
  return (EMVIPManager *)objc_getProperty(self, a2, 136, 1);
}

- (EMSenderRepository)senderRepository
{
  return (EMSenderRepository *)objc_getProperty(self, a2, 96, 1);
}

void __45__EMDaemonInterface_handleDaemonAvailability__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == 1;
  +[EMDaemonInterface log](EMDaemonInterface, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v23 = v5;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Daemon re-launched, recovering remote connections", buf, 0xCu);
    }

    v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 52);
    os_unfair_lock_lock(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v6);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = v7;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "recover", (_QWORD)v17);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v11 = *(_BYTE **)(a1 + 32);
    if (v11[48])
    {
      objc_msgSend(v11, "proxyCreator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "remoteObjectProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsBackgroundResume:", 1);

    }
    +[EMDaemonInterface log](EMDaemonInterface, "log", (_QWORD)v17);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_1B99BB000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished recovery", buf, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  else if (v4)
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v23 = v16;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping recovery", buf, 0xCu);
  }

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__EMDaemonInterface_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1)
    dispatch_once(&log_onceToken_11, block);
  return (OS_os_log *)(id)log_log_11;
}

+ (void)setCachedMailAppIsInstalled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mailUninstalledFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v8, "removeItemAtURL:error:", v5, 0);
  }
  else
  {
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createFileAtPath:contents:attributes:", v6, v7, 0);

  }
}

+ (BOOL)cachedMailAppIsInstalled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mailUninstalledFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5) ^ 1;

  return v6;
}

+ (id)_mailUninstalledFile
{
  void *v2;
  void *v3;

  +[EMPersistenceLayoutManager mailDataDirectory](EMPersistenceLayoutManager, "mailDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("uninstalled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)initAndConfigureBlockedSenderManager:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.email.maild"), 4096);
  v6 = -[EMDaemonInterface _initByAdoptingConnection:useNegotiatedConnection:configureBlockedSenderManager:](self, "_initByAdoptingConnection:useNegotiatedConnection:configureBlockedSenderManager:", v5, 0, v3);

  return v6;
}

- (void)launchDaemon
{
  void *v2;
  id v3;

  -[EMDaemonInterface proxyCreator](self, "proxyCreator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchForAppLaunch:", &__block_literal_global_316);

}

- (void)setAllowsBackgroundResume:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_allowsBackgroundResume != a3)
  {
    v3 = a3;
    self->_allowsBackgroundResume = a3;
    -[EMDaemonInterface proxyCreator](self, "proxyCreator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsBackgroundResume:", v3);

  }
}

- (EMDiagnosticInfoGatherer)diagnosticInfoGatherer
{
  return (EMDiagnosticInfoGatherer *)objc_getProperty(self, a2, 152, 1);
}

void __24__EMDaemonInterface_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;

}

- (EMDaemonInterface)init
{
  return (EMDaemonInterface *)-[EMDaemonInterface initAndConfigureBlockedSenderManager:](self, "initAndConfigureBlockedSenderManager:", 0);
}

- (EMDaemonInterface)initWithListenerEndpoint:(id)a3
{
  id v4;
  void *v5;
  EMDaemonInterface *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
  v6 = -[EMDaemonInterface _initByAdoptingConnection:useNegotiatedConnection:configureBlockedSenderManager:](self, "_initByAdoptingConnection:useNegotiatedConnection:configureBlockedSenderManager:", v5, 0, 0);

  return v6;
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[EMDaemonInterface log](EMDaemonInterface, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_cold_1((uint64_t)WeakRetained, v2);

    objc_msgSend(WeakRetained, "resetProtocolConnections");
  }

}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[EMDaemonInterface log](EMDaemonInterface, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_6_cold_1((uint64_t)WeakRetained, v2);

  }
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleDaemonAvailability");

}

- (id)initForTesting
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMDaemonInterface;
  result = -[EMDaemonInterface init](&v3, sel_init);
  if (result)
    atomic_store(0, (unsigned __int8 *)result + 56);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[EMDaemonInterface _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)EMDaemonInterface;
  -[EMDaemonInterface dealloc](&v3, sel_dealloc);
}

- (void)_invalidate
{
  BOOL *p_invalidated;
  EMAccountRepository *accountRepository;
  EMMailboxRepository *mailboxRepository;
  EMVIPManager *vipManager;
  EMBlockedSenderManager *blockedSenderManager;
  EMMessageRepository *messageRepository;
  EMFetchController *fetchController;
  EMOutgoingMessageRepository *outgoingMessageRepository;
  EMSenderRepository *senderRepository;
  EMClientState *clientState;
  EMSearchableIndex *searchableIndex;
  EMInteractionLogger *interactionLogger;
  EMActivityRegistry *activityRegistry;
  EMDiagnosticInfoGatherer *diagnosticInfoGatherer;
  NSXPCConnection *connection;
  EFCancelable *daemonLaunchToken;

  p_invalidated = &self->_invalidated;
  while (!__ldaxr((unsigned __int8 *)p_invalidated))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_invalidated))
    {
      accountRepository = self->_accountRepository;
      self->_accountRepository = 0;

      mailboxRepository = self->_mailboxRepository;
      self->_mailboxRepository = 0;

      vipManager = self->_vipManager;
      self->_vipManager = 0;

      blockedSenderManager = self->_blockedSenderManager;
      self->_blockedSenderManager = 0;

      messageRepository = self->_messageRepository;
      self->_messageRepository = 0;

      fetchController = self->_fetchController;
      self->_fetchController = 0;

      outgoingMessageRepository = self->_outgoingMessageRepository;
      self->_outgoingMessageRepository = 0;

      senderRepository = self->_senderRepository;
      self->_senderRepository = 0;

      clientState = self->_clientState;
      self->_clientState = 0;

      searchableIndex = self->_searchableIndex;
      self->_searchableIndex = 0;

      interactionLogger = self->_interactionLogger;
      self->_interactionLogger = 0;

      activityRegistry = self->_activityRegistry;
      self->_activityRegistry = 0;

      diagnosticInfoGatherer = self->_diagnosticInfoGatherer;
      self->_diagnosticInfoGatherer = 0;

      -[NSXPCConnection invalidate](self->_connection, "invalidate");
      connection = self->_connection;
      self->_connection = 0;

      -[EFCancelable cancel](self->_daemonLaunchToken, "cancel");
      daemonLaunchToken = self->_daemonLaunchToken;
      self->_daemonLaunchToken = 0;

      return;
    }
  }
  __clrex();
}

- (void)test_tearDown
{
  void *v4;
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMDaemonInterface.m"), 223, CFSTR("%s can only be called from unit tests"), "-[EMDaemonInterface test_tearDown]");

  }
  -[EMDaemonInterface blockedSenderManager](self, "blockedSenderManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

  -[EMDaemonInterface _invalidate](self, "_invalidate");
}

- (NSXPCConnection)test_connection
{
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMDaemonInterface.m"), 229, CFSTR("%s can only be called from unit tests"), "-[EMDaemonInterface test_connection]");

  }
  return self->_connection;
}

void __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_312(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)resetProtocolConnections
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EMDaemonInterface_resetProtocolConnections__block_invoke;
  block[3] = &unk_1E70F1FA0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__EMDaemonInterface_resetProtocolConnections__block_invoke(uint64_t a1)
{
  _BOOL4 v1;
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  void *v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == 0;
  +[EMDaemonInterface log](EMDaemonInterface, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v30 = v5;
      _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting remote connections", buf, 0xCu);
    }

    v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 52);
    os_unfair_lock_lock(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v6);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v2 = v7;
    v8 = 0;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v9)
    {
      v11 = *(_QWORD *)v26;
      *(_QWORD *)&v10 = 138543618;
      v22 = v10;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v2);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v13, "reset", v22);
          if (objc_msgSend(v13, "prefersImmediateActivity"))
          {
            +[EMDaemonInterface log](EMDaemonInterface, "log");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = v22;
              v30 = v15;
              v31 = 2114;
              v32 = v13;
              _os_log_impl(&dword_1B99BB000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ prefers immediate recovery, will force daemon relaunch", buf, 0x16u);
            }

            v8 = 1;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v9);
    }

    +[EMDaemonInterface log](EMDaemonInterface, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_impl(&dword_1B99BB000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting for daemon re-launch", buf, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    if ((v8 & 1) != 0)
    {
      +[EMDaemonInterface log](EMDaemonInterface, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v30 = v19;
        _os_log_impl(&dword_1B99BB000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending early launch recovery message", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "proxyCreator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "remoteObjectProxy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __45__EMDaemonInterface_resetProtocolConnections__block_invoke_315;
      v24[3] = &unk_1E70F1FA0;
      v24[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v21, "launchForEarlyRecovery:", v24);

    }
  }
  else if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v30 = v4;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Already waiting for daemon re-launch", buf, 0xCu);
  }

}

uint64_t __45__EMDaemonInterface_resetProtocolConnections__block_invoke_315(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDaemonAvailability");
}

- (BOOL)allowsBackgroundResume
{
  return self->_allowsBackgroundResume;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return (EMBlockedSenderManager *)objc_getProperty(self, a2, 144, 1);
}

- (EMSearchableIndex)searchableIndex
{
  return (EMSearchableIndex *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoGatherer, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_activityRegistry, 0);
  objc_storeStrong((id *)&self->_interactionLogger, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
  objc_storeStrong((id *)&self->_accountRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_daemonLaunchToken, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Connection Interrupted (recoverable)", (uint8_t *)&v3, 0xCu);
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_6_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_FAULT, "%{public}@: Connection Invalidated", (uint8_t *)&v3, 0xCu);
}

@end
