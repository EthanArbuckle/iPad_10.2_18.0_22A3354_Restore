@implementation _EMOneTimeCodeObserver

- (_EMOneTimeCodeObserver)initWithObserver:(id)a3
{
  id v4;
  _EMOneTimeCodeObserver *v5;
  _EMOneTimeCodeObserver *v6;
  EFCancelationToken *v7;
  EFCancelationToken *token;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EMOneTimeCodeObserver;
  v5 = -[_EMOneTimeCodeObserver init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v7 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    token = v6->_token;
    v6->_token = v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_token, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_EMOneTimeCodeObserver;
  -[_EMOneTimeCodeObserver dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  -[EFCancelationToken cancel](self->_token, "cancel");
}

- (void)performWithRemoteConnection:(id)a3
{
  -[_EMOneTimeCodeObserver _performWithRemoteConnection:forRecovery:](self, "_performWithRemoteConnection:forRecovery:", a3, 0);
}

- (void)recoverWithRemoteConnection:(id)a3
{
  -[_EMOneTimeCodeObserver _performWithRemoteConnection:forRecovery:](self, "_performWithRemoteConnection:forRecovery:", a3, 1);
}

- (void)_performWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  EFCancelationToken *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _BYTE buf[12];
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_token;
  if ((-[EFCancelationToken isCanceled](v7, "isCanceled") & 1) == 0)
  {
    if (v4)
    {
      +[EMMessageRepository log](EMMessageRepository, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        v15 = 2114;
        v16 = WeakRetained;
        _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] Recovering one-time code observer: %{public}@", buf, 0x16u);

      }
      -[EFCancelationToken removeAllCancelationBlocks](v7, "removeAllCancelationBlocks");
    }
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    objc_msgSend(v6, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)&self->_observer);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67___EMOneTimeCodeObserver__performWithRemoteConnection_forRecovery___block_invoke;
    v12[3] = &unk_1E70F5308;
    objc_copyWeak(&v13, (id *)buf);
    objc_msgSend(v10, "startObservingOneTimeCode:completionHandler:", v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
