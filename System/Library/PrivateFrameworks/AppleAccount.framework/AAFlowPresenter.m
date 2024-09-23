@implementation AAFlowPresenter

- (void)launchProcessWithUserInfo:(id)a3
{
  void *v4;
  id v5;
  NSXPCListener *v6;
  NSXPCListener *remoteListener;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBSRemoteAlertHandle *v13;
  SBSRemoteAlertHandle *remoteAlertHandle;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3B58];
  v5 = a3;
  objc_msgSend(v4, "anonymousListener");
  v6 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  remoteListener = self->_remoteListener;
  self->_remoteListener = v6;

  -[NSXPCListener setDelegate:](self->_remoteListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_remoteListener, "resume");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.AAUIViewService"), CFSTR("AAUIRemoteViewController"));
  v9 = (void *)objc_opt_new();
  -[NSXPCListener endpoint](self->_remoteListener, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_endpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setXpcEndpoint:", v11);

  objc_msgSend(v9, "setUserInfo:", v5);
  v12 = (void *)objc_opt_new();
  v13 = (SBSRemoteAlertHandle *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v8, v9);
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v13;

  -[SBSRemoteAlertHandle registerObserver:](self->_remoteAlertHandle, "registerObserver:", self);
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[AAFlowPresenter remoteAlertHandle](self, "remoteAlertHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Activating handle: %@", (uint8_t *)&v17, 0xCu);

  }
  -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", v12);

}

- (void)flowFinishedWithError:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, id))a4;
  -[AAFlowPresenter _callCompletionBlockWithError:](self, "_callCompletionBlockWithError:", v7);
  if (v6)
    v6[2](v6, v7);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[AAFlowPresenterHostInterface XPCInterface](AAFlowPresenterHostInterface, "XPCInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) activated.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) deactivated.", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFlowPresenter _callCompletionBlockWithError:](self, "_callCompletionBlockWithError:", v6);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DAB940]))
  {
    if (objc_msgSend(v7, "code") == 4)
    {

LABEL_6:
      _AALogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) deactivated by request.", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -1);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v9 = objc_msgSend(v7, "code");

    if (v9 == 5)
      goto LABEL_6;
  }
  else
  {

  }
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) interrupted with error: %@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", 0, v7);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v13 = (void *)v11;
  -[AAFlowPresenter _callCompletionBlockWithError:](self, "_callCompletionBlockWithError:", v11);

}

- (void)_callCompletionBlockWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[AAFlowPresenter presentationCompletion](self, "presentationCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AAFlowPresenter presentationCompletion](self, "presentationCompletion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  -[AAFlowPresenter setPresentationCompletion:](self, "setPresentationCompletion:", 0);

}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated.", (uint8_t *)&v2, 0xCu);
}

- (id)presentationCompletion
{
  return self->presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
  objc_storeStrong((id *)&self->_remoteListener, a3);
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong(&self->presentationCompletion, 0);
}

@end
