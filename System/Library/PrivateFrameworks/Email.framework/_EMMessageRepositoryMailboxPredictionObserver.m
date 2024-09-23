@implementation _EMMessageRepositoryMailboxPredictionObserver

- (_EMMessageRepositoryMailboxPredictionObserver)initWithMessageObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _EMMessageRepositoryMailboxPredictionObserver *v8;
  uint64_t v9;
  NSArray *messageObjectIDs;
  uint64_t v11;
  id completionHandler;
  EFCancelationToken *v13;
  EFCancelationToken *cancelationToken;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EMMessageRepositoryMailboxPredictionObserver;
  v8 = -[_EMMessageRepositoryMailboxPredictionObserver init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    messageObjectIDs = v8->_messageObjectIDs;
    v8->_messageObjectIDs = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v11;

    v13 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    cancelationToken = v8->_cancelationToken;
    v8->_cancelationToken = v13;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[_EMMessageRepositoryMailboxPredictionObserver cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_EMMessageRepositoryMailboxPredictionObserver;
  -[_EMMessageRepositoryMailboxPredictionObserver dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  id v2;

  -[_EMMessageRepositoryMailboxPredictionObserver cancelationToken](self, "cancelationToken");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)performWithRemoteConnection:(id)a3
{
  -[_EMMessageRepositoryMailboxPredictionObserver _performWithRemoteConnection:forRecovery:](self, "_performWithRemoteConnection:forRecovery:", a3, 0);
}

- (void)recoverWithRemoteConnection:(id)a3
{
  -[_EMMessageRepositoryMailboxPredictionObserver _performWithRemoteConnection:forRecovery:](self, "_performWithRemoteConnection:forRecovery:", a3, 1);
}

- (void)_performWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v6 = a3;
  -[_EMMessageRepositoryMailboxPredictionObserver cancelationToken](self, "cancelationToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isCanceled") & 1) == 0)
  {
    if (v4)
      objc_msgSend(v7, "removeAllCancelationBlocks");
    objc_msgSend(v6, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMMessageRepositoryMailboxPredictionObserver messageObjectIDs](self, "messageObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90___EMMessageRepositoryMailboxPredictionObserver__performWithRemoteConnection_forRecovery___block_invoke;
    v10[3] = &unk_1E70F2B90;
    v11 = v7;
    objc_msgSend(v8, "predictMailboxForMovingMessages:withObserver:completionHandler:", v9, self, v10);

  }
}

- (void)mailboxWasPredicted:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[_EMMessageRepositoryMailboxPredictionObserver cancelationToken](self, "cancelationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCanceled");

  if ((v5 & 1) == 0)
  {
    -[_EMMessageRepositoryMailboxPredictionObserver cancelationToken](self, "cancelationToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[_EMMessageRepositoryMailboxPredictionObserver completionHandler](self, "completionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (NSArray)messageObjectIDs
{
  return self->_messageObjectIDs;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messageObjectIDs, 0);
}

@end
