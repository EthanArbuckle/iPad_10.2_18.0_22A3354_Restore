@implementation ANLocalPlaybackSession

- (ANLocalPlaybackSession)init
{
  return -[ANLocalPlaybackSession initWithEndpointIdentifier:](self, "initWithEndpointIdentifier:", 0);
}

- (ANLocalPlaybackSession)initWithEndpointIdentifier:(id)a3
{
  id v5;
  ANLocalPlaybackSession *v6;
  ANLocalPlaybackSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  ANLocalPlaybackSessionInterfaceDelegateProxy *delegateProxy;
  ANXPCManager *v19;
  ANXPCManager *xpcManager;
  objc_super v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ANLocalPlaybackSession;
  v6 = -[ANLocalPlaybackSession init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointIdentifier, a3);
    ANLogHandleLocalPlaybackSession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_24D370F00;
      v25 = 2112;
      v26 = CFSTR("com.apple.announced.localplaybacksession");
      _os_log_impl(&dword_2156FF000, v8, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to Service: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE8468);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_lastPlayedAnnouncementInfoForEndpointID_completionHandler_, 0, 1);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE3628);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didReceiveAnnouncement_forGroupID_, 0, 0);
    v17 = objc_opt_new();
    delegateProxy = v7->_delegateProxy;
    v7->_delegateProxy = (ANLocalPlaybackSessionInterfaceDelegateProxy *)v17;

    -[ANLocalPlaybackSessionInterfaceDelegateProxy setDelegate:](v7->_delegateProxy, "setDelegate:", v7);
    v19 = -[ANXPCManager initWithMachServiceName:remoteObjectInterface:exportedInterface:exportedObject:]([ANXPCManager alloc], "initWithMachServiceName:remoteObjectInterface:exportedInterface:exportedObject:", CFSTR("com.apple.announced.localplaybacksession"), v9, v16, v7->_delegateProxy);
    xpcManager = v7->_xpcManager;
    v7->_xpcManager = v19;

    -[ANXPCManager setDelegate:](v7->_xpcManager, "setDelegate:", v7);
    -[ANXPCManager setCheckInProvider:](v7->_xpcManager, "setCheckInProvider:", v7);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ANLocalPlaybackSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ANLocalPlaybackSession;
  -[ANLocalPlaybackSession dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  id v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[ANLocalPlaybackSession xpcManager](self, "xpcManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  ANLogHandleLocalPlaybackSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = &stru_24D370F00;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2156FF000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sendPlaybackCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ANLogHandleLocalPlaybackSession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = &stru_24D370F00;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_2156FF000, v8, OS_LOG_TYPE_DEFAULT, "%@Sending Playback Command: %{public}@", buf, 0x16u);
  }

  -[ANLocalPlaybackSession xpcManager](self, "xpcManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke;
  v18[3] = &unk_24D3701A8;
  v12 = v7;
  v19 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession endpointIdentifier](self, "endpointIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke_85;
  v16[3] = &unk_24D3701A8;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v13, "sendPlaybackCommand:forEndpointID:completionHandler:", v6, v14, v16);

}

void __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ANLogHandleLocalPlaybackSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412802;
    v7 = &stru_24D370F00;
    v8 = 2080;
    v9 = "-[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    ANLogHandleLocalPlaybackSession();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412802;
      v7 = &stru_24D370F00;
      v8 = 2080;
      v9 = "-[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)playAnnouncements
{
  -[ANLocalPlaybackSession playAnnouncementsWithOptions:completionHandler:](self, "playAnnouncementsWithOptions:completionHandler:", 0, 0);
}

- (void)playAnnouncementsWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[ANPlaybackCommand playCommandWithOptions:announcementIdentifiers:](ANPlaybackCommand, "playCommandWithOptions:announcementIdentifiers:", a3, MEMORY[0x24BDBD1A8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:](self, "sendPlaybackCommand:completionHandler:", v7, v6);

}

- (void)playAnnouncementsWithIDs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  +[ANPlaybackCommand playCommandWithOptions:announcementIdentifiers:](ANPlaybackCommand, "playCommandWithOptions:announcementIdentifiers:", a4, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:](self, "sendPlaybackCommand:completionHandler:", v9, v8);

}

- (void)playAnnouncementsWithOptions:(unint64_t)a3 startingAt:(id)a4 completionHandler:(id)a5
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v19[0] = a4;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = a5;
    v11 = a4;
    objc_msgSend(v9, "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = a5;
    v14 = 0;
    ANLogHandleLocalPlaybackSession();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = &stru_24D370F00;
      _os_log_impl(&dword_2156FF000, v15, OS_LOG_TYPE_ERROR, "%@Client did not supply a Start Announcement ID", (uint8_t *)&v17, 0xCu);
    }

    v12 = (void *)MEMORY[0x24BDBD1A8];
  }
  +[ANPlaybackCommand playCommandWithOptions:announcementIdentifiers:](ANPlaybackCommand, "playCommandWithOptions:announcementIdentifiers:", a3, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:](self, "sendPlaybackCommand:completionHandler:", v16, a5);
}

- (void)stopPlayingAnnouncements
{
  -[ANLocalPlaybackSession stopPlayingAnnouncementsWithCompletionHandler:](self, "stopPlayingAnnouncementsWithCompletionHandler:", 0);
}

- (void)stopPlayingAnnouncementsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ANPlaybackCommand stopCommand](ANPlaybackCommand, "stopCommand");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:](self, "sendPlaybackCommand:completionHandler:", v5, v4);

}

- (void)nextAnnouncementWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ANPlaybackCommand nextCommand](ANPlaybackCommand, "nextCommand");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:](self, "sendPlaybackCommand:completionHandler:", v5, v4);

}

- (void)previousAnnouncementWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ANPlaybackCommand previousCommand](ANPlaybackCommand, "previousCommand");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:](self, "sendPlaybackCommand:completionHandler:", v5, v4);

}

- (void)lastPlayedAnnouncementInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[ANLocalPlaybackSession xpcManager](self, "xpcManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__ANLocalPlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke;
  v10[3] = &unk_24D3701A8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession endpointIdentifier](self, "endpointIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPlayedAnnouncementInfoForEndpointID:completionHandler:", v9, v7);

}

void __67__ANLocalPlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleLocalPlaybackSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANLocalPlaybackSession lastPlayedAnnouncementInfoWithCompletion:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSDictionary)lastPlayedAnnouncementInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[ANLocalPlaybackSession xpcManager](self, "xpcManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke;
  v11[3] = &unk_24D3701D0;
  v11[4] = &v12;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession endpointIdentifier](self, "endpointIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke_88;
  v10[3] = &unk_24D3701F8;
  v10[4] = &v12;
  objc_msgSend(v6, "lastPlayedAnnouncementInfoForEndpointID:completionHandler:", v7, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (NSDictionary *)v8;
}

void __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ANLogHandleLocalPlaybackSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412802;
    v8 = &stru_24D370F00;
    v9 = 2080;
    v10 = "-[ANLocalPlaybackSession lastPlayedAnnouncementInfo]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1B8];

}

void __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke_88(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)stringForPlaybackState:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_24D370288[a3];
}

- (unint64_t)playbackState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  __int128 buf;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ANLogHandleLocalPlaybackSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = &stru_24D370F00;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_DEFAULT, "%@Fetching playback state", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  -[ANLocalPlaybackSession xpcManager](self, "xpcManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__ANLocalPlaybackSession_playbackState__block_invoke;
  v12[3] = &unk_24D3701D0;
  v12[4] = &buf;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession endpointIdentifier](self, "endpointIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __39__ANLocalPlaybackSession_playbackState__block_invoke_98;
  v11[3] = &unk_24D370220;
  v11[4] = &buf;
  objc_msgSend(v7, "playbackStateForEndpointID:completionHandler:", v8, v11);

  v9 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v9;
}

void __39__ANLocalPlaybackSession_playbackState__block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleLocalPlaybackSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANLocalPlaybackSession playbackState]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __39__ANLocalPlaybackSession_playbackState__block_invoke_98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)announcementsWillStartPlaying:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ANLogHandleLocalPlaybackSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = &stru_24D370F00;
    v14 = 2080;
    v15 = "-[ANLocalPlaybackSession announcementsWillStartPlaying:]";
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_2156FF000, v5, OS_LOG_TYPE_DEFAULT, "%@%s, time is %lld", (uint8_t *)&v12, 0x20u);
  }

  -[ANLocalPlaybackSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_254DE85E8))
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      goto LABEL_7;
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "announcementsWillStartPlaying:", a3);
  }

LABEL_7:
  -[ANLocalPlaybackSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_254DE85E8))
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      return;
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session:willStartPlayingAtMachTime:", self, a3);
  }

}

- (void)announcementsStateUpdate:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ANLogHandleLocalPlaybackSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = &stru_24D370F00;
    v14 = 2080;
    v15 = "-[ANLocalPlaybackSession announcementsStateUpdate:]";
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_2156FF000, v5, OS_LOG_TYPE_DEFAULT, "%@%s, state is %lu", (uint8_t *)&v12, 0x20u);
  }

  -[ANLocalPlaybackSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_254DE85E8))
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      goto LABEL_7;
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "announcementsStateUpdate:", a3);
  }

LABEL_7:
  -[ANLocalPlaybackSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_254DE85E8))
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      return;
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session:didUpdatePlaybackState:", self, a3);
  }

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
  ANLogHandleLocalPlaybackSession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = &stru_24D370F00;
    v12 = 2080;
    v13 = "-[ANLocalPlaybackSession didReceiveAnnouncement:forGroupID:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2156FF000, v6, OS_LOG_TYPE_DEFAULT, "%@%s, did receive announcement: %@", (uint8_t *)&v10, 0x20u);
  }

  -[ANLocalPlaybackSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_254DE85E8))
    goto LABEL_6;
  -[ANLocalPlaybackSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
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

  -[ANLocalPlaybackSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionInterrupted");

  }
  -[ANLocalPlaybackSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
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

  -[ANLocalPlaybackSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionInvalidated");

  }
  -[ANLocalPlaybackSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[ANLocalPlaybackSession delegate](self, "delegate");
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
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[ANLocalPlaybackSession xpcManager](self, "xpcManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke;
  v14[3] = &unk_24D3701A8;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANLocalPlaybackSession endpointIdentifier](self, "endpointIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_24D370248;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "resumeWithEndpointID:completionHandler:", v10, v12);

}

uint64_t __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSUUID)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (ANLocalPlaybackSessionDelegate)delegate
{
  return (ANLocalPlaybackSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ANLocalPlaybackSessionInterfaceDelegateProxy)delegateProxy
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
}

@end
