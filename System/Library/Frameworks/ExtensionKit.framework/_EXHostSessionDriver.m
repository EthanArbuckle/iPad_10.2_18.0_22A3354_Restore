@implementation _EXHostSessionDriver

- (_EXHostSessionDriver)initWithHostViewController:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EXHostSessionDriver;
  v5 = -[_EXHostSessionDriver init](&v15, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v6;

    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v9 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v5 + 6), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v10 = *((_QWORD *)v5 + 6);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51___EXHostSessionDriver_initWithHostViewController___block_invoke;
    v12[3] = &unk_24C3E37D8;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_resume(*((dispatch_object_t *)v5 + 6));
    objc_storeWeak((id *)v5 + 8, v4);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return (_EXHostSessionDriver *)v5;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2_0();
}

- (void)resume
{
  _EXHostViewControllerSession *v3;
  _EXHostViewControllerSession *v4;
  BOOL v5;
  void *v6;
  char v7;
  _EXHostViewControllerSession *v8;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v3 = self->_session;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = -[_EXHostViewControllerSession detached](v3, "detached");
    v4 = v8;
    if (!v5)
    {
      -[_EXHostViewControllerSession configuration](v8, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "beginHostingImmediately");

      v4 = v8;
      if ((v7 & 1) == 0)
      {
        -[_EXHostViewControllerSession resume](v8, "resume");
        v4 = v8;
      }
    }
  }
  self->_active = 1;

}

- (void)startSessionWithProcessConfiguration:(id)a3 configuration:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  _EXHostConfiguration *retryProcessConfiguration;
  _EXHostViewControllerSessionConfiguration *retrySessionConfiguration;
  _EXHostViewControllerSession **p_session;
  _EXHostViewControllerSession *session;
  _EXHostViewControllerSession *v16;
  _EXHostViewControllerSession *v17;
  id *p_activeSession;
  int v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  _EXHostViewControllerSession *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  _EXHostViewControllerSession *activeSession;
  _EXHostViewControllerSession *v36;
  unint64_t v37;
  uint8_t buf[4];
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v8 && v6 | v7)
  {
    _EXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:].cold.5();

  }
  _EXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:].cold.4();

  retryProcessConfiguration = self->_retryProcessConfiguration;
  self->_retryProcessConfiguration = 0;

  retrySessionConfiguration = self->_retrySessionConfiguration;
  self->_retrySessionConfiguration = 0;

  p_session = &self->_session;
  session = self->_session;
  v16 = session;
  v17 = v16;
  p_activeSession = (id *)&self->_activeSession;
  if (!self->_activeSession)
  {
    v37 = v7;
    v19 = v9;
    v20 = v6;
    -[_EXHostViewControllerSession extensionProcess](v16, "extensionProcess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extensionIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "requiresUIKitSceneHosting")
      && (-[_EXHostViewControllerSession sceneViewController](v17, "sceneViewController"),
          (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

      v6 = v20;
      v9 = v19;
      v7 = v37;
    }
    else
    {
      -[_EXHostViewControllerSession remoteViewController](v17, "remoteViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v20;
      v9 = v19;
      v7 = v37;
      if (!v24)
        goto LABEL_21;
    }
    objc_storeStrong((id *)&self->_activeSession, session);
  }
LABEL_21:
  if (v17)
  {
    if (-[_EXHostViewControllerSession state](v17, "state") >= 2)
      -[_EXHostSessionDriver notifyHostViewControllerWillDeactivate:](self, "notifyHostViewControllerWillDeactivate:", v17);
    -[_EXHostViewControllerSession setDelegate:](v17, "setDelegate:", 0);
    if (v17 != *p_activeSession)
    {
      _EXDefaultLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:].cold.3((uint64_t)v17, v25, v26);

      -[_EXHostViewControllerSession invalidate](v17, "invalidate");
    }
  }
  if (v9)
  {
    v27 = -[_EXHostViewControllerSession initWithProcessConfiguration:configuration:]([_EXHostViewControllerSession alloc], "initWithProcessConfiguration:configuration:", v6, v7);
    -[_EXHostViewControllerSession setDelegate:](v27, "setDelegate:", self);
    objc_storeStrong((id *)&self->_session, v27);
    -[_EXHostViewControllerSession setDetached:](v27, "setDetached:", 1);
    -[_EXHostSessionDriver hostViewController](self, "hostViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSession:", self->_session);

    -[_EXHostViewControllerSession setDetached:](self->_session, "setDetached:", 0);
    -[_EXHostViewControllerSession configuration](self->_session, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "beginHostingImmediately");

    if (v30)
    {
      _EXDefaultLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v7;
        _os_log_impl(&dword_20AE73000, v31, OS_LOG_TYPE_DEFAULT, "Client has requested immediate hosting for configuration: %{public}@", buf, 0xCu);
      }

      goto LABEL_42;
    }
    if (self->_active)
LABEL_42:
      -[_EXHostViewControllerSession resume](*p_session, "resume");
  }
  else
  {
    _EXDefaultLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:].cold.2();

    -[_EXHostViewControllerSession invalidate](*p_session, "invalidate");
    v33 = *p_activeSession;
    if (*p_activeSession != *p_session)
    {
      _EXDefaultLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:].cold.1();

      objc_msgSend(*p_activeSession, "invalidate");
      v33 = *p_activeSession;
    }
    if (v33)
    {
      -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:](self, "notifyHostViewControllerDidEndHosting:");
      activeSession = self->_activeSession;
    }
    else
    {
      activeSession = 0;
    }
    self->_activeSession = 0;

    v36 = self->_session;
    self->_session = 0;

    -[_EXHostSessionDriver hostViewController](self, "hostViewController");
    v27 = (_EXHostViewControllerSession *)objc_claimAutoreleasedReturnValue();
    -[_EXHostViewControllerSession embedViewController:](v27, "embedViewController:", 0);
  }

}

- (_EXHostViewControllerSession)session
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  return self->_session;
}

- (void)setSession:(id)a3
{
  _EXHostViewControllerSession *v5;
  NSObject *v6;
  _EXHostViewControllerSession *session;
  _EXHostViewControllerSession **p_session;
  _EXHostViewControllerSession *v9;
  _EXHostConfiguration *retryProcessConfiguration;
  _EXHostViewControllerSessionConfiguration *retrySessionConfiguration;
  NSObject *v12;
  _EXHostViewControllerSession *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _EXHostViewControllerSession *activeSession;
  _EXHostViewControllerSession **p_activeSession;
  _EXHostViewControllerSession *v21;
  NSObject *v22;
  uint64_t v23;
  _EXHostViewControllerSession *v24;
  void *v25;

  v5 = (_EXHostViewControllerSession *)a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _EXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_EXHostSessionDriver setSession:].cold.5();

  p_session = &self->_session;
  session = self->_session;
  if (session == v5)
  {
    _EXDefaultLog();
    v9 = (_EXHostViewControllerSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEBUG))
      -[_EXHostSessionDriver setSession:].cold.1();
  }
  else
  {
    v9 = session;
    retryProcessConfiguration = self->_retryProcessConfiguration;
    self->_retryProcessConfiguration = 0;

    retrySessionConfiguration = self->_retrySessionConfiguration;
    self->_retrySessionConfiguration = 0;

    if (v9)
    {
      if (-[_EXHostViewControllerSession state](v9, "state") >= 2)
        -[_EXHostSessionDriver notifyHostViewControllerWillDeactivate:](self, "notifyHostViewControllerWillDeactivate:", v5);
      -[_EXHostViewControllerSession setDelegate:](v9, "setDelegate:", 0);
      if (v9 != self->_activeSession && !-[_EXHostViewControllerSession detached](v9, "detached"))
      {
        _EXDefaultLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[_EXHostSessionDriver setSession:].cold.4();

        -[_EXHostViewControllerSession invalidate](v9, "invalidate");
      }
    }
    v13 = *p_session;
    *p_session = 0;

    if (v5)
    {
      -[_EXHostViewControllerSession extensionProcess](v5, "extensionProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "extensionIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "requiresUIKitSceneHosting"))
      {
        -[_EXHostViewControllerSession sceneViewController](v5, "sceneViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {

LABEL_19:
          objc_storeStrong((id *)&self->_session, a3);
          -[_EXHostSessionDriver hostSessionViewControllerReady:](self, "hostSessionViewControllerReady:", v5);
          goto LABEL_35;
        }
      }
      -[_EXHostViewControllerSession remoteViewController](v5, "remoteViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_19;
      -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:](self, "notifyHostViewControllerDidEndHosting:", v5);
    }
    if (!-[_EXHostViewControllerSession detached](v9, "detached"))
    {
      _EXDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[_EXHostSessionDriver setSession:].cold.3();

      -[_EXHostViewControllerSession invalidate](v9, "invalidate");
    }
    p_activeSession = &self->_activeSession;
    activeSession = self->_activeSession;
    v21 = v9;
    if (activeSession != v9)
    {
      if (!-[_EXHostViewControllerSession detached](activeSession, "detached", v9))
      {
        _EXDefaultLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[_EXHostSessionDriver setSession:].cold.2((uint64_t *)&self->_activeSession, v22, v23);

        -[_EXHostViewControllerSession invalidate](*p_activeSession, "invalidate");
      }
      v21 = *p_activeSession;
    }
    if (v21)
    {
      -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:](self, "notifyHostViewControllerDidEndHosting:");
      v24 = self->_activeSession;
    }
    else
    {
      v24 = 0;
    }
    self->_activeSession = 0;

    -[_EXHostSessionDriver hostViewController](self, "hostViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "embedViewController:", 0);

  }
LABEL_35:

}

- (void)scheduleInvalidations
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20AE73000, log, OS_LOG_TYPE_DEBUG, "Scheduling inactive session invalidation", v1, 2u);
}

- (void)invalidateDeactivatingSessions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  _EXHostSessionDriver *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  dispatch_source_set_timer((dispatch_source_t)self->_deactivateSessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = self;
  v3 = self->_deactivatingSessions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "detached") & 1) == 0)
        {
          _EXDefaultLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446466;
            v16 = "-[_EXHostSessionDriver invalidateDeactivatingSessions]";
            v17 = 2114;
            v18 = v8;
          }

          objc_msgSend(v8, "invalidate");
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](v10->_deactivatingSessions, "removeAllObjects");
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  _EXHostViewControllerSession *session;
  void *v5;
  NSObject *v6;
  id v7;

  session = self->_session;
  if (session)
  {
    -[_EXHostViewControllerSession _makeXPCConnectionWithError:](session, "_makeXPCConnectionWithError:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_EXHostSessionDriver makeXPCConnectionWithError:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC79A8], 6, MEMORY[0x24BDBD1B8]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    *a3 = v7;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)extensionProcess
{
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXHostSessionDriver session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79D0]), "initWithInternalExtensionProcess:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)hostSessionDidPrepareForHosting:(id)a3
{
  id v4;
  id v5;
  _EXHostViewControllerProtocol **p_hostViewController;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXHostSessionDriver session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    p_hostViewController = &self->_hostViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_hostViewController);
    objc_msgSend(v9, "placeholderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_EXHostSessionDriver hostSessionDidPrepareForHosting:].cold.2();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "hostViewControllerDidActivate:", WeakRetained);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "hostViewControllerDidActivate:", WeakRetained);
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_EXHostSessionDriver hostSessionDidPrepareForHosting:].cold.1();

    objc_msgSend(v4, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
      {
LABEL_14:

        return;
      }
      objc_msgSend(v4, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hostViewController:didPrepareToHost:", WeakRetained, v13);
    }

    goto LABEL_14;
  }
  _EXDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[_EXHostSessionDriver hostSessionDidPrepareForHosting:].cold.3();

  __break(1u);
}

- (void)hostSessionViewControllerReady:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  _EXHostViewControllerSession **p_activeSession;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  _EXHostViewControllerSession *activeSession;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXHostSessionDriver session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.6();
    goto LABEL_32;
  }
  -[_EXHostSessionDriver session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "requiresUIKitSceneHosting");

  if (v9)
  {
    objc_msgSend(v4, "sceneViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      _EXDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.1();
LABEL_32:

      __break(1u);
      return;
    }
  }
  else
  {
    objc_msgSend(v4, "remoteViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      _EXDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.5();
      goto LABEL_32;
    }
  }
  _EXDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.4();

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_activeSession = &self->_activeSession;
  if (self->_activeSession)
  {
    if (objc_msgSend(v4, "maxState") == 4)
    {
      _EXDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.3();

      -[_EXHostViewControllerSession configuration](*p_activeSession, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        -[_EXHostViewControllerSession configuration](*p_activeSession, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_EXHostViewControllerSession error](*p_activeSession, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hostViewController:didEndHosting:error:", WeakRetained, v18, v20);

LABEL_16:
      }
    }
    -[NSMutableArray addObject:](self->_deactivatingSessions, "addObject:", self->_activeSession);
    -[_EXHostSessionDriver scheduleInvalidations](self, "scheduleInvalidations");
    activeSession = self->_activeSession;
    self->_activeSession = 0;

  }
  _EXDefaultLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.2();

  objc_msgSend(v4, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_23;
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    objc_msgSend(v4, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hostViewController:didBeginHosting:", WeakRetained, v23);
LABEL_23:

  }
  -[_EXHostSessionDriver session](self, "session");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "extensionProcess");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "extensionIdentity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "requiresUIKitSceneHosting");

  -[_EXHostSessionDriver hostViewController](self, "hostViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v4, "sceneViewController");
  else
    objc_msgSend(v4, "remoteViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "embedViewController:", v30);

}

- (void)notifyHostViewControllerWillDeactivate:(id)a3
{
  id v4;
  _EXHostViewControllerProtocol **p_hostViewController;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  p_hostViewController = &self->_hostViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)p_hostViewController);
  objc_msgSend(v8, "placeholderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _EXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_EXHostSessionDriver notifyHostViewControllerWillDeactivate:].cold.1();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostViewControllerWillDeactivate:error:", WeakRetained, v11);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hostViewControllerWillDeactivate:error:", WeakRetained, v12);

  }
}

- (void)notifyHostViewControllerDidEndHosting:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char v13;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "maxState") == 4)
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:].cold.1();

    objc_msgSend(v4, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v4, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hostViewController:didEndHosting:error:", WeakRetained, v8, v10);
LABEL_13:

LABEL_14:
    }
  }
  else
  {
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _EXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:].cold.2();

      objc_msgSend(v4, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v4, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hostViewController:didFailToHost:error:", WeakRetained, v8, v10);
        goto LABEL_13;
      }
    }
  }

}

- (void)hostSessionDidInvalidate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  _EXHostConfiguration *v9;
  _EXHostConfiguration *retryProcessConfiguration;
  _EXHostViewControllerSessionConfiguration *v11;
  _EXHostViewControllerSessionConfiguration *retrySessionConfiguration;
  _EXHostConfiguration *v13;
  void *v14;
  double v15;
  dispatch_time_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXHostSessionDriver session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_EXHostSessionDriver setSession:](self, "setSession:", 0);
    -[_EXHostSessionDriver notifyHostViewControllerWillDeactivate:](self, "notifyHostViewControllerWillDeactivate:", v4);
    -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:](self, "notifyHostViewControllerDidEndHosting:", v4);
    -[_EXHostSessionDriver hostViewController](self, "hostViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embedViewController:", 0);

    objc_msgSend(v4, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "retryOnHostingFailure");

    if (v8)
    {
      objc_msgSend(v4, "processConfiguration");
      v9 = (_EXHostConfiguration *)objc_claimAutoreleasedReturnValue();
      retryProcessConfiguration = self->_retryProcessConfiguration;
      self->_retryProcessConfiguration = v9;

      objc_msgSend(v4, "configuration");
      v11 = (_EXHostViewControllerSessionConfiguration *)objc_claimAutoreleasedReturnValue();
      retrySessionConfiguration = self->_retrySessionConfiguration;
      self->_retrySessionConfiguration = v11;
    }
    else
    {
      v13 = self->_retryProcessConfiguration;
      self->_retryProcessConfiguration = 0;

      retrySessionConfiguration = self->_retrySessionConfiguration;
      self->_retrySessionConfiguration = 0;
    }

    if (self->_retryProcessConfiguration)
    {
      if (self->_retrySessionConfiguration)
      {
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x24BDC79B8], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "defaultRetryFailedSessionDelay");
        v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __49___EXHostSessionDriver_hostSessionDidInvalidate___block_invoke;
        block[3] = &unk_24C3E3930;
        objc_copyWeak(&v20, &location);
        block[4] = self;
        v17 = (void *)MEMORY[0x24BDAC9B8];
        dispatch_after(v16, MEMORY[0x24BDAC9B8], block);

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }

  }
  else
  {
    _EXDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[_EXHostSessionDriver hostSessionDidInvalidate:].cold.1();

    __break(1u);
  }
}

- (id)hostSessionHostView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id result;
  NSObject *v9;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXHostSessionDriver session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_EXHostSessionDriver hostViewController](self, "hostViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXHostSessionDriver hostSessionHostView:].cold.1();

    __break(1u);
  }
  return result;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  NSObject *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "shouldAcceptXPCConnection:", v4);
  }
  else
  {
    _EXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_EXHostSessionDriver shouldAcceptXPCConnection:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (void)addShieldView
{
  id v2;

  -[_EXHostSessionDriver hostViewController](self, "hostViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addShieldView");

}

- (void)removeShieldView
{
  id v2;

  -[_EXHostSessionDriver hostViewController](self, "hostViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeShieldView");

}

- (_EXHostViewControllerSession)activeSession
{
  return (_EXHostViewControllerSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (_EXHostConfiguration)retryProcessConfiguration
{
  return (_EXHostConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRetryProcessConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (_EXHostViewControllerSessionConfiguration)retrySessionConfiguration
{
  return (_EXHostViewControllerSessionConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRetrySessionConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_source)deactivateSessionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeactivateSessionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)deactivatingSessions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeactivatingSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_EXHostViewControllerProtocol)hostViewController
{
  return (_EXHostViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_deactivatingSessions, 0);
  objc_storeStrong((id *)&self->_deactivateSessionTimer, 0);
  objc_storeStrong((id *)&self->_retrySessionConfiguration, 0);
  objc_storeStrong((id *)&self->_retryProcessConfiguration, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "-[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]";
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_0();
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "-[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]";
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_0();
}

- (void)startSessionWithProcessConfiguration:(uint64_t)a3 configuration:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = "-[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]";
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_2_0();
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, v0, v1, "EXHostViewController: start session with configuration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.5()
{
  uint8_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_0();
  v7 = v0;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10();
}

- (void)setSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, v0, v1, "EXHostViewController: session to current active session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)setSession:(uint64_t)a3 .cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315394;
  v5 = "-[_EXHostSessionDriver setSession:]";
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_2_0();
}

- (void)setSession:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0();
}

- (void)setSession:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0();
}

- (void)setSession:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, v0, v1, "EXHostViewController: set session : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)makeXPCConnectionWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AE73000, log, OS_LOG_TYPE_ERROR, "Attempt to make XPC connection with nil session", v1, 2u);
}

- (void)hostSessionDidPrepareForHosting:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AE73000, v0, (uint64_t)v0, "EXHostViewController: Will try to call delegate %p 'hostViewController:didPrepareToHost:' for session: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostSessionDidPrepareForHosting:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AE73000, v0, (uint64_t)v0, "EXHostViewController: Will try to call delegate %p 'hostViewControllerDidActivate:' for session: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostSessionDidPrepareForHosting:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
}

- (void)hostSessionViewControllerReady:.cold.1()
{
  uint8_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_0();
  v7 = v0;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20AE73000, v1, v2, "%s - %s:%d: Unexpected nil scene view controller", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_10();
}

- (void)hostSessionViewControllerReady:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AE73000, v0, (uint64_t)v0, "EXHostViewController: Will try to call delegate %p 'hostViewController:didBeginHosting:' for session: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostSessionViewControllerReady:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_4(&dword_20AE73000, v0, (uint64_t)v0, "EXHostViewController: Will try to call delegate %p 'hostViewController:didEndHosting:error:' for session: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostSessionViewControllerReady:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, v0, v1, "EXHostViewController: host session view controller ready for session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostSessionViewControllerReady:.cold.5()
{
  uint8_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_0();
  v7 = v0;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20AE73000, v1, v2, "%s - %s:%d: Unexpected nil view controller", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_10();
}

- (void)hostSessionViewControllerReady:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
}

- (void)notifyHostViewControllerWillDeactivate:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AE73000, v0, (uint64_t)v0, "EXHostViewController: Will try to call delegate %p 'hostViewControllerWillDeactivate:error:' for session: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)notifyHostViewControllerDidEndHosting:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AE73000, v0, (uint64_t)v0, "EXHostViewController: Will try to call delegate %p 'hostViewController:didEndHosting:error:' for session: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)notifyHostViewControllerDidEndHosting:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AE73000, v0, (uint64_t)v0, "EXHostViewController: Will try to call delegate %p 'hostViewController:didFailToHost:error:' for session: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostSessionDidInvalidate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
}

- (void)hostSessionHostView:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
}

- (void)shouldAcceptXPCConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
}

@end
