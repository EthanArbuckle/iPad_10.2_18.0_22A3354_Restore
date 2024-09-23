@implementation EDDaemonInterfaceFactory

- (id)newClientResumerWithClientState:(id)a3
{
  id v4;
  EDClientResumer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EDClientResumer *v10;

  v4 = a3;
  v5 = [EDClientResumer alloc];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  EFBundleIdentifierForXPCConnection();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hookRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EDClientResumer initWithClientBundleIdentifier:hookRegistry:clientState:](v5, "initWithClientBundleIdentifier:hookRegistry:clientState:", v7, v9, v4);

  return v10;
}

- (id)newMailboxRepository
{
  EDMailboxRepository *v3;
  void *v4;
  void *v5;
  EDMailboxRepository *v6;

  v3 = [EDMailboxRepository alloc];
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDMailboxRepository initWithMailboxPersistence:](v3, "initWithMailboxPersistence:", v5);

  return v6;
}

- (id)newActivityRegistry
{
  EDActivityRegistry *v3;
  void *v4;
  void *v5;
  EDActivityRegistry *v6;

  v3 = [EDActivityRegistry alloc];
  -[EDPersistence hookRegistry](self->_persistence, "hookRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence activityPersistence](self->_persistence, "activityPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDActivityRegistry initWithHookRegistry:activityPersistence:](v3, "initWithHookRegistry:activityPersistence:", v4, v5);

  return v6;
}

- (id)newDiagnosticInfoGathererWithServerRemoteClientsProvider:(id)a3
{
  id v4;
  EDDiagnosticInfoGatherer *v5;
  id v6;
  void *v7;
  EDDiagnosticInfoGatherer *v8;

  v4 = a3;
  v5 = [EDDiagnosticInfoGatherer alloc];
  v6 = -[EDDaemonInterfaceFactory newFetchController](self, "newFetchController");
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDDiagnosticInfoGatherer initWithFetchController:remoteClientsProvider:persistence:](v5, "initWithFetchController:remoteClientsProvider:persistence:", v6, v4, v7);

  return v8;
}

- (id)newAccountRepository
{
  EDAccountRepository *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EDAccountRepository *v8;

  v3 = [EDAccountRepository alloc];
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hookRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDAccountRepository initWithAccountsProvider:hookRegistry:](v3, "initWithAccountsProvider:hookRegistry:", v5, v7);

  return v8;
}

- (id)newMessageRepositoryWithResumable:(id)a3
{
  EDMessageRepository *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  EDMessageRepository *v12;
  uint64_t v14;
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
  id v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;

  v55 = a3;
  v4 = [EDMessageRepository alloc];
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "messagePersistence");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "conversationPersistence");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "threadPersistence");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "remoteContentPersistence");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "messageChangeManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "richLinkPersistence");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "attachmentPersistenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "categoryPersistence");
  v6 = objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "senderPersistence");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activityPersistence");
  v7 = objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "businessPersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hookRegistry");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mailboxPersistence");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "searchProvider");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "userProfileProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "vipManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[EDDaemonInterfaceFactory newFetchController](self, "newFetchController");
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "remoteContentManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "remoteContentCacheConfiguration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "blockedSenderManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "listUnsubscribeHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "remindMeNotificationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountsProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v7;
  v14 = v7;
  v11 = (void *)v6;
  v12 = -[EDMessageRepository initWithMessagePersistence:conversationPersistence:threadPersistence:remoteContentPersistence:messageChangeManager:richLinkPersistence:attachmentPersistenceManager:categoryPersistence:senderPersistence:activityPersistence:businessPersistence:hookRegistry:mailboxPersistence:searchProvider:userProfileProvider:vipManager:fetchController:observerResumer:remoteContentManager:remoteContentCacheConfiguration:blockedSenderManager:listUnsubscribeHandler:remindMeNotificationController:accountsProvider:](v4, "initWithMessagePersistence:conversationPersistence:threadPersistence:remoteContentPersistence:messageChangeManager:richLinkPersistence:attachmentPersistenceManager:categoryPersistence:senderPersistence:activityPersistence:businessPersistence:hookRegistry:mailboxPersistence:searchProvider:userProfileProvider:vipManager:fetchController:observerResumer:remoteContentManager:remoteContentCacheConfiguration:blockedSenderManager:listUnsubscribeHandler:remindMeNotificationController:accountsProvider:", v54, v45, v53, v42, v40, v38, v5, v6, v34, v14, v8, v30, v52,
          v51,
          v9,
          v50,
          v25,
          v55,
          v49,
          v48,
          v21,
          v19,
          v17,
          v10);

  return v12;
}

- (EDPersistence)persistence
{
  return self->_persistence;
}

- (EDDaemonInterfaceFactory)initWithPersistence:(id)a3 categorySubsystem:(id)a4
{
  id v7;
  id v8;
  EDDaemonInterfaceFactory *v9;
  EDDaemonInterfaceFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDDaemonInterfaceFactory;
  v9 = -[EDDaemonInterfaceFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistence, a3);
    objc_storeStrong((id *)&v10->_categorySubsystem, a4);
  }

  return v10;
}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDDaemonInterfaceFactory.m"), 47, CFSTR("%s can only be called from unit tests"), "-[EDDaemonInterfaceFactory test_tearDown]");

  }
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

}

- (id)newFetchController
{
  return 0;
}

- (id)newOutgoingMessageRepository
{
  -[EDDaemonInterfaceFactory doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDDaemonInterfaceFactory newOutgoingMessageRepository]", "EDDaemonInterfaceFactory.m", 98, "0");
}

- (id)newSenderRepository
{
  EDSenderRepository *v3;
  void *v4;
  void *v5;
  EDSenderRepository *v6;

  v3 = [EDSenderRepository alloc];
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDSenderRepository initWithSenderPersistence:](v3, "initWithSenderPersistence:", v5);

  return v6;
}

- (id)newSearchableIndex
{
  void *v2;
  void *v3;
  void *v4;

  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableIndexManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "enableIndexingAndBeginScheduling:", 0);
  objc_msgSend(v3, "index");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sharedInteractionLogger
{
  void *v2;
  void *v3;

  -[EDDaemonInterfaceFactory categorySubsystem](self, "categorySubsystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newVIPManagerInterface
{
  EDVIPManagerProxy *v3;
  void *v4;
  void *v5;
  EDVIPManagerProxy *v6;

  v3 = [EDVIPManagerProxy alloc];
  -[EDDaemonInterfaceFactory persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vipManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDVIPManagerProxy initWithVIPManager:](v3, "initWithVIPManager:", v5);

  return v6;
}

- (EDCategorySubsystem)categorySubsystem
{
  return self->_categorySubsystem;
}

- (void)setCategorySubsystem:(id)a3
{
  objc_storeStrong((id *)&self->_categorySubsystem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorySubsystem, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
}

@end
