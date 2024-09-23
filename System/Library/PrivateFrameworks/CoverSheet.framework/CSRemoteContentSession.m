@implementation CSRemoteContentSession

- (CSRemoteContentSession)initWithDefinition:(id)a3 authenticationStatusProvider:(id)a4
{
  id v6;
  id v7;
  CSRemoteContentSession *v8;
  uint64_t v9;
  SBSRemoteContentDefinition *definition;
  void *v11;
  uint64_t v12;
  NSString *sessionID;
  void *v14;
  uint64_t v15;
  CSDashBoardRemoteContentSettings *remoteContentSettings;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSRemoteContentSession;
  v8 = -[CSRemoteContentSession init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    definition = v8->_definition;
    v8->_definition = (SBSRemoteContentDefinition *)v9;

    objc_storeStrong((id *)&v8->_authenticationStatusProvider, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v12;

    v8->_valid = 1;
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dashBoardRemoteContentSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    remoteContentSettings = v8->_remoteContentSettings;
    v8->_remoteContentSettings = (CSDashBoardRemoteContentSettings *)v15;

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  CSRemoteContentHostViewController *hostViewController;
  objc_super v5;

  -[CSRemoteContentViewControllerProtocol setHostViewController:](self->_containerViewController, "setHostViewController:", 0);
  -[CSRemoteContentHostViewController setDelegate:](self->_hostViewController, "setDelegate:", 0);
  v3 = -[_UIRemoteViewController disconnect](self->_hostViewController, "disconnect");
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)CSRemoteContentSession;
  -[CSRemoteContentSession dealloc](&v5, sel_dealloc);
}

- (void)activate
{
  NSObject *v3;
  NSString *sessionID;
  _QWORD v5[5];
  uint8_t buf[4];
  CSRemoteContentSession *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_activated && self->_valid)
  {
    self->_activated = 1;
    SBLogDashBoard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      *(_DWORD *)buf = 138543618;
      v7 = self;
      v8 = 2114;
      v9 = sessionID;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Activate session %{public}@", buf, 0x16u);
    }

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__CSRemoteContentSession_activate__block_invoke;
    v5[3] = &unk_1E8E2F4C0;
    v5[4] = self;
    -[CSRemoteContentSession _requestRemoteViewControllerWithConnectionHandler:](self, "_requestRemoteViewControllerWithConnectionHandler:", v5);
  }
}

uint64_t __34__CSRemoteContentSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateRemoteViewController:remoteError:", a2, a3);
}

- (void)forceDisconnect
{
  CSRemoteContentViewControllerProtocol *containerViewController;
  id v4;
  CSRemoteContentHostViewController *hostViewController;

  BSDispatchQueueAssertMain();
  *(_WORD *)&self->_activated = 0;
  self->_valid = 0;
  -[CSRemoteContentViewControllerProtocol setHostViewController:](self->_containerViewController, "setHostViewController:", 0);
  -[CSRemoteContentViewControllerProtocol setDelegate:](self->_containerViewController, "setDelegate:", 0);
  containerViewController = self->_containerViewController;
  self->_containerViewController = 0;

  -[CSRemoteContentHostViewController setDelegate:](self->_hostViewController, "setDelegate:", 0);
  v4 = -[_UIRemoteViewController disconnect](self->_hostViewController, "disconnect");
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

}

- (void)_requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[SBSRemoteContentDefinition viewControllerClassName](self->_definition, "viewControllerClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteContentDefinition serviceName](self->_definition, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](CSRemoteContentHostViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v4, v5, v7);

}

- (void)_activateRemoteViewController:(id)a3 remoteError:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _BOOL4 activated;
  _BOOL4 valid;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  dispatch_time_t v21;
  NSString *sessionID;
  NSObject *v23;
  NSString *v24;
  _QWORD block[5];
  uint8_t buf[4];
  CSRemoteContentSession *v27;
  __int16 v28;
  _WORD v29[9];

  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t)a4;
  BSDispatchQueueAssertMain();
  if (self->_activated && self->_valid)
  {
    v8 = objc_opt_class();
    v9 = v6;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (!(v7 | v11))
    {
      SBLogDashBoard();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = self;
        _os_log_impl(&dword_1D0337000, v14, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Failed to activate remote view controller", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSRemoteContentSessionErrorDomain"), 0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    SBLogDashBoard();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v7)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CSRemoteContentSession _activateRemoteViewController:remoteError:].cold.1((uint64_t)self, (void *)v7, v16);

      objc_msgSend((id)v7, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D22820]))
      {
        v20 = objc_msgSend(v18, "code");

        if (v20 == 6)
        {
          v21 = dispatch_time(0, 1000000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __68__CSRemoteContentSession__activateRemoteViewController_remoteError___block_invoke;
          block[3] = &unk_1E8E2DB38;
          block[4] = self;
          dispatch_after(v21, MEMORY[0x1E0C80D38], block);
LABEL_29:

          goto LABEL_30;
        }
      }
      else
      {

      }
      -[CSRemoteContentSession _invalidateWithError:](self, "_invalidateWithError:", v7);
      goto LABEL_29;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      *(_QWORD *)v29 = sessionID;
      _os_log_impl(&dword_1D0337000, v16, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Successfully activated remote view controller for session %{public}@!", buf, 0x16u);
    }

    if (self->_hostViewController)
      -[CSRemoteContentViewControllerProtocol setHostViewController:](self->_containerViewController, "setHostViewController:", 0);
    objc_storeStrong((id *)&self->_hostViewController, v10);
    -[CSRemoteContentHostViewController setDelegate:](self->_hostViewController, "setDelegate:", self);
    self->_waitingForPreferences = 1;
    SBLogDashBoard();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_sessionID;
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      *(_QWORD *)v29 = v24;
      _os_log_impl(&dword_1D0337000, v23, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Configuring remote view controller and waiting for preferences for session %{public}@", buf, 0x16u);
    }

    -[CSRemoteContentHostViewController configureWithDefinition:](self->_hostViewController, "configureWithDefinition:", self->_definition);
  }
  else
  {
    SBLogDashBoard();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      activated = self->_activated;
      valid = self->_valid;
      *(_DWORD *)buf = 138543874;
      v27 = self;
      v28 = 1024;
      *(_DWORD *)v29 = activated;
      v29[2] = 1024;
      *(_DWORD *)&v29[3] = valid;
      _os_log_impl(&dword_1D0337000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Not activated (%d) or not valid (%d); not continuing activation",
        buf,
        0x18u);
    }
  }
LABEL_30:

}

uint64_t __68__CSRemoteContentSession__activateRemoteViewController_remoteError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reactivate");
}

- (void)_activateHostViewControllerWithPreferences:(id)a3
{
  id v4;
  CSRemoteContentViewControllerProtocol *containerViewController;
  CSRemoteContentViewControllerProtocol *v6;
  CSRemoteContentViewControllerProtocol *v7;
  NSObject *WeakRetained;
  NSString *sessionID;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSString *v13;
  NSObject *v14;
  CSRemoteContentSession *v15;
  uint64_t v16;
  int v17;
  CSRemoteContentSession *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  containerViewController = self->_containerViewController;
  if (containerViewController)
  {
    -[CSRemoteContentViewControllerProtocol setHostViewController:](containerViewController, "setHostViewController:", self->_hostViewController);
  }
  else
  {
    -[CSRemoteContentSession _remoteContentViewControllerForPreferences:](self, "_remoteContentViewControllerForPreferences:", v4);
    v6 = (CSRemoteContentViewControllerProtocol *)objc_claimAutoreleasedReturnValue();
    v7 = self->_containerViewController;
    self->_containerViewController = v6;

    -[CSRemoteContentViewControllerProtocol setDelegate:](self->_containerViewController, "setDelegate:", self);
  }
  if (self->_presented)
  {
    SBLogDashBoard();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      v17 = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = sessionID;
      _os_log_impl(&dword_1D0337000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Successfully re-presented session %{public}@!", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_19;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  if (!-[NSObject shouldActivateRemoteContentSession:](WeakRetained, "shouldActivateRemoteContentSession:", self))
  {
    SBLogDashBoard();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CSRemoteContentSession _activateHostViewControllerWithPreferences:].cold.2();

    v15 = self;
    v16 = 3;
    goto LABEL_18;
  }
  v10 = -[NSObject remoteContentSession:presentViewController:](WeakRetained, "remoteContentSession:presentViewController:", self, self->_containerViewController);
  self->_presented = v10;
  SBLogDashBoard();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CSRemoteContentSession _activateHostViewControllerWithPreferences:].cold.1();

    v15 = self;
    v16 = 2;
LABEL_18:
    -[CSRemoteContentSession _invalidateWithErrorCode:](v15, "_invalidateWithErrorCode:", v16);
    goto LABEL_19;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_sessionID;
    v17 = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Successfully presented remote view controller for session %{public}@!", (uint8_t *)&v17, 0x16u);
  }

LABEL_19:
}

- (id)_remoteContentViewControllerForPreferences:(id)a3
{
  id v4;
  _BOOL4 v5;
  __objc2_class **v6;
  void *v7;

  v4 = a3;
  v5 = -[CSRemoteContentSession prefersInlineForPreferences:](self, "prefersInlineForPreferences:", v4);
  v6 = off_1E8E2C860;
  if (!v5)
    v6 = off_1E8E2C870;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithContentDefinition:preferences:hostViewController:authenticationStatusProvider:", self->_definition, v4, self->_hostViewController, self->_authenticationStatusProvider);

  return v7;
}

- (void)_reactivate
{
  NSObject *v3;
  int v4;
  CSRemoteContentSession *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_activated)
  {
    SBLogDashBoard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = self;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Reactivating view service.", (uint8_t *)&v4, 0xCu);
    }

    self->_activated = 0;
    -[CSRemoteContentSession activate](self, "activate");
  }
  else
  {
    -[CSRemoteContentSession _invalidateWithErrorCode:](self, "_invalidateWithErrorCode:", 1);
  }
}

- (void)_invalidateWithErrorCode:(int64_t)a3
{
  id v4;

  -[CSRemoteContentSession _errorWithCode:](self, "_errorWithCode:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSRemoteContentSession _invalidateWithError:](self, "_invalidateWithError:", v4);

}

- (void)_invalidateWithError:(id)a3
{
  -[CSRemoteContentSession _invalidateForReason:error:completion:](self, "_invalidateForReason:error:completion:", 1, a3, 0);
}

- (BOOL)_invalidateForReason:(int64_t)a3 error:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  id WeakRetained;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  CSRemoteContentSession *v25;
  id v26;
  id v27;
  int64_t v28;
  uint8_t buf[4];
  CSRemoteContentSession *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  if (!self->_valid)
  {
    v16 = 0;
    goto LABEL_14;
  }
  self->_activated = 0;
  self->_valid = 0;
  SBLogDashBoard();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSBSRemoteContentDismissType();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptionWithMultilinePrefix:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = self;
    v31 = 2114;
    v32 = v13;
    v33 = 2114;
    v34 = v14;
    v35 = 2114;
    v36 = v15;
    _os_log_error_impl(&dword_1D0337000, v12, OS_LOG_TYPE_ERROR, "[RemoteContent][Invalidate] %{public}@: %{public}@ (%{public}@): %{public}@", buf, 0x2Au);

  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSBSRemoteContentDismissType();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = self;
    v31 = 2114;
    v32 = v13;
    v33 = 2114;
    v34 = v14;
    _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "[RemoteContent][Invalidate] %{public}@: %{public}@ (%{public}@)", buf, 0x20u);
  }

LABEL_9:
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke;
  v24 = &unk_1E8E2F4E8;
  v25 = self;
  v28 = a3;
  v26 = v9;
  v27 = v10;
  v17 = MEMORY[0x1D17E1614](&v21);
  v18 = (void *)v17;
  if (a3 == 1 || !self->_presented)
  {
    (*(void (**)(uint64_t))(v17 + 16))(v17);
    v16 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
    v16 = objc_msgSend(WeakRetained, "remoteContentSession:dismissWithReason:completion:", self, a3, v18, v21, v22, v23, v24, v25, v26);

  }
LABEL_14:

  return v16;
}

uint64_t __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t result;

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "forceDisconnect");
  if (*(_QWORD *)(a1 + 56) == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "remoteContentSession:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_errorWithCode:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSRemoteContentSessionErrorDomain"), a3, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E8E2F508[a3];
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("CSRemoteContentSessionErrorDomain"), a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (BOOL)prefersInlineForPreferences:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  if (CSFeatureEnabled(0))
  {
    if (-[CSDashBoardRemoteContentSettings overrideContentPreferences](self->_remoteContentSettings, "overrideContentPreferences"))
    {
      v5 = -[CSDashBoardRemoteContentSettings prefersInlinePresentationOverride](self->_remoteContentSettings, "prefersInlinePresentationOverride");
    }
    else
    {
      v5 = objc_msgSend(v4, "prefersInlinePresentation");
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)didChangeRemotePreferences:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  NSString *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  id v13;
  NSObject *v14;
  NSString *sessionID;
  int v16;
  CSRemoteContentSession *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_preferencesProvider);
    objc_msgSend(WeakRetained, "preferencesForRemoteContentSession:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "remoteContentSession:didUpdateWithPreferences:", self, v4);
    if (self->_waitingForPreferences)
    {
      self->_waitingForPreferences = 0;
      if (-[CSRemoteContentSession prefersInlineForPreferences:](self, "prefersInlineForPreferences:", v4)
        && (-[CSRemoteContentHostViewController contentFrame](self->_hostViewController, "contentFrame"),
            !-[CSRemoteContentSession _remoteContentFrameIsValid:](self, "_remoteContentFrameIsValid:")))
      {
        SBLogDashBoard();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          sessionID = self->_sessionID;
          v16 = 138543618;
          v17 = self;
          v18 = 2114;
          v19 = sessionID;
          _os_log_impl(&dword_1D0337000, v14, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Waiting for contentFrame for session %{public}@", (uint8_t *)&v16, 0x16u);
        }

        self->_waitingForContentFrame = 1;
      }
      else
      {
        SBLogDashBoard();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = self->_sessionID;
          v16 = 138543618;
          v17 = self;
          v18 = 2114;
          v19 = v8;
          _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Received valid preferences and contentFrame for session %{public}@, presenting hostVC", (uint8_t *)&v16, 0x16u);
        }

        -[CSRemoteContentSession _activateHostViewControllerWithPreferences:](self, "_activateHostViewControllerWithPreferences:", v4);
      }
    }
    else
    {
      v9 = objc_msgSend(v4, "isEqual:", v6);
      SBLogDashBoard();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138543362;
          v17 = self;
          _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Ignoring identical remote preferences", (uint8_t *)&v16, 0xCu);
        }

      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12 = self->_sessionID;
          v16 = 138543618;
          v17 = self;
          v18 = 2114;
          v19 = v12;
          _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_INFO, "[RemoteContent] %{public}@: remoteContentDidUpdateStyle for session %{public}@", (uint8_t *)&v16, 0x16u);
        }

        -[CSRemoteContentViewControllerProtocol remoteDidChangeStyle](self->_containerViewController, "remoteDidChangeStyle");
        v13 = objc_loadWeakRetained((id *)&self->_hostDelegate);
        objc_msgSend(v13, "remoteContentDidUpdateStyle");

      }
    }

  }
}

- (void)didChangeRemoteHostContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  CSRemoteContentSession *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_waitingForContentFrame)
  {
    if (-[CSRemoteContentSession _remoteContentFrameIsValid:](self, "_remoteContentFrameIsValid:", x, y, width, height))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_preferencesProvider);
      objc_msgSend(WeakRetained, "preferencesForRemoteContentSession:", self);
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        self->_waitingForContentFrame = 0;
        SBLogDashBoard();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Have content frame; activating host VC",
            (uint8_t *)&v12,
            2u);
        }

        -[CSRemoteContentSession _activateHostViewControllerWithPreferences:](self, "_activateHostViewControllerWithPreferences:", v9);
        goto LABEL_14;
      }
      SBLogDashBoard();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CSRemoteContentSession didChangeRemoteHostContentFrame:].cold.1();
    }
    else
    {
      SBLogDashBoard();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_14:

        return;
      }
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      NSStringFromCGRect(v17);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_INFO, "[RemoteContent] %{public}@: Remote content frame is not valid: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CSRemoteContentViewControllerProtocol didChangeRemoteHostContentFrame:](self->_containerViewController, "didChangeRemoteHostContentFrame:", x, y, width, height);
}

- (BOOL)_remoteContentFrameIsValid:(CGRect)a3
{
  return (a3.size.width > 0.0) & ~CGRectIsNull(a3);
}

- (void)remoteContentHostViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSString *sessionID;
  void *v8;
  NSObject *v9;
  NSString *v10;
  int v11;
  CSRemoteContentSession *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (self->_activated && self->_valid)
  {
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      objc_msgSend(v5, "descriptionWithMultilinePrefix:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = self;
      v13 = 2114;
      v14 = sessionID;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Remote view connection lost while active in session %{public}@, reactivating immediately: %{public}@", (uint8_t *)&v11, 0x20u);

    }
    -[CSRemoteContentSession _reactivate](self, "_reactivate");
  }
  else
  {
    SBLogDashBoard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_sessionID;
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Remote view connection lost while inactive/invalid for session %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (double)remoteContentComplicationHeightInset
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  objc_msgSend(WeakRetained, "remoteContentComplicationHeightInset");
  v4 = v3;

  return v4;
}

- (BOOL)remoteContentViewController:(id)a3 requestsDismissalForType:(int64_t)a4 completion:(id)a5
{
  return -[CSRemoteContentSession _invalidateForReason:error:completion:](self, "_invalidateForReason:error:completion:", a4, 0, a5);
}

- (CSRemoteContentSessionHostDelegate)hostDelegate
{
  return (CSRemoteContentSessionHostDelegate *)objc_loadWeakRetained((id *)&self->_hostDelegate);
}

- (void)setHostDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hostDelegate, a3);
}

- (CSRemoteContentSessionPreferencesProvider)preferencesProvider
{
  return (CSRemoteContentSessionPreferencesProvider *)objc_loadWeakRetained((id *)&self->_preferencesProvider);
}

- (void)setPreferencesProvider:(id)a3
{
  objc_storeWeak((id *)&self->_preferencesProvider, a3);
}

- (SBSRemoteContentDefinition)definition
{
  return self->_definition;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (CSDashBoardRemoteContentSettings)remoteContentSettings
{
  return self->_remoteContentSettings;
}

- (void)setRemoteContentSettings:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentSettings, a3);
}

- (CSRemoteContentViewControllerProtocol)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (CSRemoteContentHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_remoteContentSettings, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_destroyWeak((id *)&self->_preferencesProvider);
  objc_destroyWeak((id *)&self->_hostDelegate);
  objc_storeStrong((id *)&self->_hostViewController, 0);
}

- (void)_activateRemoteViewController:(NSObject *)a3 remoteError:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_1(&dword_1D0337000, a3, v6, "[RemoteContent] %{public}@: Error activating remote view controller: %{public}@", (uint8_t *)&v7);

}

- (void)_activateHostViewControllerWithPreferences:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1D0337000, v0, v1, "[RemoteContent] %{public}@: Failed to present remote view controller for session %{public}@", v2);
  OUTLINED_FUNCTION_17();
}

- (void)_activateHostViewControllerWithPreferences:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1D0337000, v0, v1, "[RemoteContent] %{public}@: Not activating due to hostDelegate preventing it for session %{public}@", v2);
  OUTLINED_FUNCTION_17();
}

void __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 64);
  NSStringFromSBSRemoteContentDismissType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "descriptionWithMultilinePrefix:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544130;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  v12 = 2114;
  v13 = v6;
  v14 = 2114;
  v15 = v7;
  _os_log_error_impl(&dword_1D0337000, a2, OS_LOG_TYPE_ERROR, "[RemoteContent][Invalidate] %{public}@: finishing invalidating container and host for session %{public}@ due to (%{public}@): %{public}@", (uint8_t *)&v8, 0x2Au);

}

- (void)didChangeRemoteHostContentFrame:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1D0337000, v0, v1, "[RemoteContent] %{public}@: Missing preferences despite getting a remote host content frame for session: %{public}@", v2);
  OUTLINED_FUNCTION_17();
}

@end
