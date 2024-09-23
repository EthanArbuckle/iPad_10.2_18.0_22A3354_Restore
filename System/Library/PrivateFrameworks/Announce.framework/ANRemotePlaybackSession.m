@implementation ANRemotePlaybackSession

- (ANRemotePlaybackSession)init
{
  ANRemotePlaybackSession *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  ANRemotePlaybackSessionServiceClientInterfaceProxy *delegateProxy;
  ANXPCManager *v17;
  ANXPCManager *xpcManager;
  objc_super v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)ANRemotePlaybackSession;
  v2 = -[ANRemotePlaybackSession init](&v20, sel_init);
  if (v2)
  {
    ANLogHandleRemotePlaybackSession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = &stru_24D370F00;
      v23 = 2112;
      v24 = CFSTR("com.apple.announced.remoteplaybacksession");
      _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to Service: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE8950);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_lastPlayedAnnouncementInfoForEndpointID_completionHandler_, 0, 1);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE5100);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_didUpdateAnnouncements_forGroupID_, 0, 0);
    objc_msgSend(v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didReceiveAnnouncement_forGroupID_, 0, 0);
    v15 = objc_opt_new();
    delegateProxy = v2->_delegateProxy;
    v2->_delegateProxy = (ANRemotePlaybackSessionServiceClientInterfaceProxy *)v15;

    -[ANRemotePlaybackSessionServiceClientInterfaceProxy setDelegate:](v2->_delegateProxy, "setDelegate:", v2);
    v17 = -[ANXPCManager initWithMachServiceName:remoteObjectInterface:exportedInterface:exportedObject:]([ANXPCManager alloc], "initWithMachServiceName:remoteObjectInterface:exportedInterface:exportedObject:", CFSTR("com.apple.announced.remoteplaybacksession"), v4, v11, v2->_delegateProxy);
    xpcManager = v2->_xpcManager;
    v2->_xpcManager = v17;

    -[ANXPCManager setDelegate:](v2->_xpcManager, "setDelegate:", v2);
    -[ANXPCManager setCheckInProvider:](v2->_xpcManager, "setCheckInProvider:", v2);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ANRemotePlaybackSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ANRemotePlaybackSession;
  -[ANRemotePlaybackSession dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  id v4;

  -[ANRemotePlaybackSession setDelegate:](self, "setDelegate:", 0);
  -[ANRemotePlaybackSession setHandler:](self, "setHandler:", 0);
  -[ANRemotePlaybackSession setHandlerQueue:](self, "setHandlerQueue:", 0);
  -[ANRemotePlaybackSession xpcManager](self, "xpcManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)setPlaybackStartedForAnnouncement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ANRemotePlaybackSession xpcManager](self, "xpcManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackStartedForAnnouncement:", v4);

}

void __61__ANRemotePlaybackSession_setPlaybackStartedForAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  ANLogHandleRemotePlaybackSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412802;
    v5 = &stru_24D370F00;
    v6 = 2080;
    v7 = "-[ANRemotePlaybackSession setPlaybackStartedForAnnouncement:]_block_invoke";
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }

}

- (void)setPlaybackStoppedForAnnouncement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ANRemotePlaybackSession xpcManager](self, "xpcManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_91);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackStoppedForAnnouncement:", v4);

}

void __61__ANRemotePlaybackSession_setPlaybackStoppedForAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  ANLogHandleRemotePlaybackSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412802;
    v5 = &stru_24D370F00;
    v6 = 2080;
    v7 = "-[ANRemotePlaybackSession setPlaybackStoppedForAnnouncement:]_block_invoke";
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }

}

- (void)lastPlayedAnnouncementInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ANRemotePlaybackSession xpcManager](self, "xpcManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__ANRemotePlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke;
  v9[3] = &unk_24D3701A8;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPlayedAnnouncementInfoForEndpointID:completionHandler:", 0, v7);

}

void __68__ANRemotePlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ANLogHandleRemotePlaybackSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANRemotePlaybackSession lastPlayedAnnouncementInfoWithCompletion:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)startSessionForGroupID:(id)a3 announcementsHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = a4;
  -[ANRemotePlaybackSession setHandler:](self, "setHandler:", v7);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  -[ANRemotePlaybackSession xpcManager](self, "xpcManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke;
  v20[3] = &unk_24D370788;
  v12 = v8;
  v21 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke_92;
  v17[3] = &unk_24D3707B0;
  v19 = &v22;
  v14 = v12;
  v18 = v14;
  objc_msgSend(v13, "startSessionForGroupID:reply:", v6, v17);

  v15 = dispatch_time(0, 2000000000);
  dispatch_group_wait(v14, v15);
  LOBYTE(v9) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)v9;
}

void __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ANLogHandleRemotePlaybackSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANRemotePlaybackSession startSessionForGroupID:announcementsHandler:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke_92(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)endSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  -[ANRemotePlaybackSession xpcManager](self, "xpcManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __37__ANRemotePlaybackSession_endSession__block_invoke;
  v15[3] = &unk_24D370788;
  v7 = v3;
  v16 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __37__ANRemotePlaybackSession_endSession__block_invoke_94;
  v12[3] = &unk_24D3707B0;
  v14 = &v17;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "endSessionWithReply:", v12);

  v10 = dispatch_time(0, 2000000000);
  dispatch_group_wait(v9, v10);
  LOBYTE(v4) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v4;
}

void __37__ANRemotePlaybackSession_endSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ANLogHandleRemotePlaybackSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANRemotePlaybackSession endSession]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __37__ANRemotePlaybackSession_endSession__block_invoke_94(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_callHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ANRemotePlaybackSession handlerQueue](self, "handlerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ANRemotePlaybackSession handlerQueue](self, "handlerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__ANRemotePlaybackSession__callHandler___block_invoke;
    v8[3] = &unk_24D3707D8;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v6, v8);

  }
  else
  {
    -[ANRemotePlaybackSession handler](self, "handler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v4);

  }
}

void __40__ANRemotePlaybackSession__callHandler___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ANLogHandleRemotePlaybackSession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = &stru_24D370F00;
    v12 = 2080;
    v13 = "-[ANRemotePlaybackSession didReceiveAnnouncement:forGroupID:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2156FF000, v6, OS_LOG_TYPE_DEFAULT, "%@%s, did receive announcement: %@", (uint8_t *)&v10, 0x20u);
  }

  -[ANRemotePlaybackSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_254DE89B0))
    goto LABEL_6;
  -[ANRemotePlaybackSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[ANRemotePlaybackSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "session:didReceiveAnnouncement:", self, v5);
LABEL_6:

  }
}

- (void)managerDidInterruptConnection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[ANRemotePlaybackSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ANRemotePlaybackSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionInterrupted");

  }
  -[ANRemotePlaybackSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[ANRemotePlaybackSession delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionInterrupted:", self);

  }
}

- (void)managerDidInvalidateConnection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[ANRemotePlaybackSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ANRemotePlaybackSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionInvalidated");

  }
  -[ANRemotePlaybackSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[ANRemotePlaybackSession delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionInvalidated:", self);

  }
}

- (void)checkInWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ANRemotePlaybackSession xpcManager](self, "xpcManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke;
  v13[3] = &unk_24D3701A8;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_24D370248;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "resumeWithEndpointID:completionHandler:", 0, v11);

}

uint64_t __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)handlerQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_handlerQueue);
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeWeak((id *)&self->_handlerQueue, a3);
}

- (ANRemotePlaybackSessionDelegate)delegate
{
  return (ANRemotePlaybackSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ANRemotePlaybackSessionServiceClientInterfaceProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (ANXPCManager)xpcManager
{
  return self->_xpcManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcManager, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_handlerQueue);
}

@end
