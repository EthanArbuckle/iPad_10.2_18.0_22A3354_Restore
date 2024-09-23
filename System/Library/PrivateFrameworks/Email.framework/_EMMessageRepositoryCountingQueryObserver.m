@implementation _EMMessageRepositoryCountingQueryObserver

- (void)_performQueryWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  EMMailboxScope *serverCountMailboxScope;
  _QWORD v10[5];

  v4 = a4;
  v6 = a3;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    if (v4)
      -[EFCancelationToken removeAllCancelationBlocks](self->_token, "removeAllCancelationBlocks");
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFPair first](self->_queryIdentifier, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    serverCountMailboxScope = self->_serverCountMailboxScope;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91___EMMessageRepositoryCountingQueryObserver__performQueryWithRemoteConnection_forRecovery___block_invoke;
    v10[3] = &unk_1E70F2B90;
    v10[4] = self;
    objc_msgSend(v7, "startCountingQuery:includingServerCountsForMailboxScope:withObserver:completionHandler:", v8, serverCountMailboxScope, self, v10);

  }
}

- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  EMMessageRepository *repository;
  void *v11;
  void *v12;
  void *v13;
  EMMessageRepository *v14;
  void *v15;
  int v16;
  _EMMessageRepositoryCountingQueryObserver *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[_EMMessageRepositoryCountingQueryObserver queryIdentifier](self, "queryIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218498;
    v17 = self;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Acknowledging count update for %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(v6, "invoke");
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (WeakRetained)
    {
      repository = self->_repository;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMMessageRepositoryCountingQueryObserver queryIdentifier](self, "queryIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageRepository setQueryCount:forQueryIdentifier:](repository, "setQueryCount:forQueryIdentifier:", v11, v12);

      -[EMRepository trampoliningObserverForObserver:](self->_repository, "trampoliningObserverForObserver:", WeakRetained);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_repository;
      -[EFPair first](self->_queryIdentifier, "first");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messageRepository:query:countDidChange:", v14, v15, a3);

    }
    else
    {
      -[_EMMessageRepositoryCountingQueryObserver cancel](self, "cancel");
    }

  }
}

- (EFPair)queryIdentifier
{
  return (EFPair *)objc_getProperty(self, a2, 48, 1);
}

- (void)performWithRemoteConnection:(id)a3
{
  -[_EMMessageRepositoryCountingQueryObserver _performQueryWithRemoteConnection:forRecovery:](self, "_performQueryWithRemoteConnection:forRecovery:", a3, 0);
}

- (_EMMessageRepositoryCountingQueryObserver)initWithRepository:(id)a3 queryIdentifier:(id)a4 includingServerCountsForMailboxScope:(id)a5 observer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _EMMessageRepositoryCountingQueryObserver *v15;
  _EMMessageRepositoryCountingQueryObserver *v16;
  EFCancelationToken *v17;
  EFCancelationToken *token;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_EMMessageRepositoryCountingQueryObserver;
  v15 = -[_EMMessageRepositoryCountingQueryObserver init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_repository, a3);
    objc_storeStrong((id *)&v16->_serverCountMailboxScope, a5);
    objc_storeWeak((id *)&v16->_observer, v14);
    v17 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    token = v16->_token;
    v16->_token = v17;

    objc_storeStrong((id *)&v16->_queryIdentifier, a4);
  }

  return v16;
}

- (void)cancel
{
  -[EFCancelationToken cancel](self->_token, "cancel");
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_token, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_EMMessageRepositoryCountingQueryObserver;
  -[_EMMessageRepositoryCountingQueryObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_serverCountMailboxScope, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

- (void)recoverWithRemoteConnection:(id)a3
{
  -[_EMMessageRepositoryCountingQueryObserver _performQueryWithRemoteConnection:forRecovery:](self, "_performQueryWithRemoteConnection:forRecovery:", a3, 1);
}

@end
