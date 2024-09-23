@implementation ANAnnounce

- (ANAnnounce)init
{
  return -[ANAnnounce initWithEndpointIdentifier:](self, "initWithEndpointIdentifier:", 0);
}

- (ANAnnounce)initWithEndpointIdentifier:(id)a3
{
  id v5;
  ANAnnounce *v6;
  NSObject *v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSXPCConnection *v14;
  uint64_t v15;
  NSXPCConnection *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ANAnnounce;
  v6 = -[ANAnnounce init](&v22, sel_init);
  if (v6)
  {
    ANLogHandleAnnounce();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_24D370F00;
      v25 = 2112;
      v26 = CFSTR("com.apple.announced.server");
      _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_endpointIdentifier, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.announced.server"), 4096);
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v8;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE8840);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getReceivedAnnouncementsForEndpointID_completionHandler_, 0, 1);
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getUnplayedAnnouncementsForEndpointID_completionHandler_, 0, 1);
    objc_msgSend(v10, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendRequest_completion_, 0, 1);
    objc_msgSend(v10, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendRequestLegacy_completion_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](v6->_connection, "setRemoteObjectInterface:", v10);
    objc_initWeak((id *)buf, v6);
    v14 = v6->_connection;
    v15 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __41__ANAnnounce_initWithEndpointIdentifier___block_invoke;
    v20[3] = &unk_24D3702A8;
    objc_copyWeak(&v21, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v14, "setInterruptionHandler:", v20);
    v16 = v6->_connection;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_87;
    v18[3] = &unk_24D3702A8;
    objc_copyWeak(&v19, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v18);
    -[NSXPCConnection resume](v6->_connection, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

  }
  return v6;
}

void __41__ANAnnounce_initWithEndpointIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ANLogHandleAnnounce();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = &stru_24D370F00;
    _os_log_impl(&dword_2156FF000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was interrupted", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInterrupted");

}

void __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ANLogHandleAnnounce();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = &stru_24D370F00;
    _os_log_impl(&dword_2156FF000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was invalidated", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInvalidated");

}

- (void)dealloc
{
  objc_super v3;

  -[ANAnnounce invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ANAnnounce;
  -[ANAnnounce dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[ANAnnounce connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)localParticipant:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__ANAnnounce_localParticipant___block_invoke;
  v8[3] = &unk_24D3701A8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localParticipant:", v6);

}

void __31__ANAnnounce_localParticipant___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412802;
    v8 = &stru_24D370F00;
    v9 = 2080;
    v10 = "-[ANAnnounce localParticipant:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ANLogHandleAnnounce();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = &stru_24D370F00;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2156FF000, v8, OS_LOG_TYPE_DEFAULT, "%@Sending Request: %@", buf, 0x16u);
  }

  connection = self->_connection;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __37__ANAnnounce_sendRequest_completion___block_invoke;
  v16[3] = &unk_24D3701A8;
  v11 = v7;
  v17 = v11;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __37__ANAnnounce_sendRequest_completion___block_invoke_92;
  v14[3] = &unk_24D3702D0;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "sendRequest:completion:", v6, v14);

}

void __37__ANAnnounce_sendRequest_completion___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412802;
    v7 = &stru_24D370F00;
    v8 = 2080;
    v9 = "-[ANAnnounce sendRequest:completion:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __37__ANAnnounce_sendRequest_completion___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ANLogHandleAnnounce();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412802;
      v10 = &stru_24D370F00;
      v11 = 2080;
      v12 = "-[ANAnnounce sendRequest:completion:]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)sendAnnouncement:(id)a3 toHomeWithName:(id)a4 completion:(id)a5
{
  -[ANAnnounce sendAnnouncement:toRoomsWithNames:andZonesWithNames:inHomeWithName:completion:](self, "sendAnnouncement:toRoomsWithNames:andZonesWithNames:inHomeWithName:completion:", a3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], a4, a5);
}

- (void)sendAnnouncement:(id)a3 toRoomsWithNames:(id)a4 andZonesWithNames:(id)a5 inHomeWithName:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  +[ANAnnouncementContent contentWithAudioFileURL:](ANAnnouncementContent, "contentWithAudioFileURL:", a3);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementDestination destinationWithHomeName:zoneNames:roomNames:](ANAnnouncementDestination, "destinationWithHomeName:zoneNames:roomNames:", v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANAnnouncementRequest requestWithContent:destination:](ANAnnouncementRequest, "requestWithContent:destination:", v18, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce _sendRequestLegacy:completion:](self, "_sendRequestLegacy:completion:", v17, v12);

}

- (void)sendAnnouncement:(id)a3 toHomeWithID:(id)a4 completion:(id)a5
{
  -[ANAnnounce sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:](self, "sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:", a3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], a4, a5);
}

- (void)sendAnnouncement:(id)a3 toRoomsWithIDs:(id)a4 andZonesWithIDs:(id)a5 inHomeWithID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  +[ANAnnouncementContent contentWithAudioFileURL:](ANAnnouncementContent, "contentWithAudioFileURL:", a3);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementDestination destinationWithHomeIdentifier:zoneIdentifiers:roomIdentifiers:](ANAnnouncementDestination, "destinationWithHomeIdentifier:zoneIdentifiers:roomIdentifiers:", v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANAnnouncementRequest requestWithContent:destination:](ANAnnouncementRequest, "requestWithContent:destination:", v18, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce _sendRequestLegacy:completion:](self, "_sendRequestLegacy:completion:", v17, v12);

}

- (void)sendReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  +[ANAnnouncementContent contentWithAudioFileURL:](ANAnnouncementContent, "contentWithAudioFileURL:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANAnnouncementDestination destinationWithReplyToAnnouncementIdentifier:](ANAnnouncementDestination, "destinationWithReplyToAnnouncementIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setReplyToSender:", 1);
  +[ANAnnouncementRequest requestWithContent:destination:](ANAnnouncementRequest, "requestWithContent:destination:", v13, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce _sendRequestLegacy:completion:](self, "_sendRequestLegacy:completion:", v12, v8);

}

- (void)broadcastReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce broadcastReply:forAnnouncementID:completion:](self, "broadcastReply:forAnnouncementID:completion:", v9, v10, v8);

}

- (void)broadcastReply:(id)a3 forAnnouncementID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  +[ANAnnouncementContent contentWithAudioFileURL:](ANAnnouncementContent, "contentWithAudioFileURL:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementDestination destinationWithReplyToAnnouncementIdentifier:](ANAnnouncementDestination, "destinationWithReplyToAnnouncementIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANAnnouncementRequest requestWithContent:destination:](ANAnnouncementRequest, "requestWithContent:destination:", v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce _sendRequestLegacy:completion:](self, "_sendRequestLegacy:completion:", v11, v8);

}

- (void)broadcastReply:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  +[ANAnnouncementContent contentWithAudioFileURL:](ANAnnouncementContent, "contentWithAudioFileURL:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementDestination destinationWithReplyToAnnouncementIdentifier:](ANAnnouncementDestination, "destinationWithReplyToAnnouncementIdentifier:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementRequest requestWithContent:destination:](ANAnnouncementRequest, "requestWithContent:destination:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce _sendRequestLegacy:completion:](self, "_sendRequestLegacy:completion:", v8, v6);

}

- (void)receivedAnnouncementIDs:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__ANAnnounce_receivedAnnouncementIDs___block_invoke;
  v9[3] = &unk_24D3701A8;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce endpointIdentifier](self, "endpointIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receivedAnnouncementIdentifiersForEndpointID:reply:", v8, v6);

}

void __38__ANAnnounce_receivedAnnouncementIDs___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce receivedAnnouncementIDs:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)receivedAnnouncementIDs
{
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v3 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__ANAnnounce_receivedAnnouncementIDs__block_invoke;
  v10[3] = &unk_24D3701D0;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce endpointIdentifier](self, "endpointIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __37__ANAnnounce_receivedAnnouncementIDs__block_invoke_97;
  v9[3] = &unk_24D3702F8;
  v9[4] = &v11;
  objc_msgSend(v5, "receivedAnnouncementIdentifiersForEndpointID:reply:", v6, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __37__ANAnnounce_receivedAnnouncementIDs__block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412802;
    v8 = &stru_24D370F00;
    v9 = 2080;
    v10 = "-[ANAnnounce receivedAnnouncementIDs]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1A8];

}

void __37__ANAnnounce_receivedAnnouncementIDs__block_invoke_97(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)announcementForID:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  connection = self->_connection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __38__ANAnnounce_announcementForID_reply___block_invoke;
  v12[3] = &unk_24D3701A8;
  v13 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce endpointIdentifier](self, "endpointIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "announcementForID:endpointID:reply:", v9, v11, v8);

}

void __38__ANAnnounce_announcementForID_reply___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce announcementForID:reply:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)announcementForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce endpointIdentifier](self, "endpointIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__ANAnnounce_announcementForID___block_invoke_99;
  v9[3] = &unk_24D370360;
  v9[4] = &v10;
  objc_msgSend(v5, "announcementForID:endpointID:reply:", v4, v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __32__ANAnnounce_announcementForID___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412802;
    v5 = &stru_24D370F00;
    v6 = 2080;
    v7 = "-[ANAnnounce announcementForID:]_block_invoke";
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __32__ANAnnounce_announcementForID___block_invoke_99(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getReceivedAnnouncementsWithCompletionHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__ANAnnounce_getReceivedAnnouncementsWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D3701A8;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce endpointIdentifier](self, "endpointIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getReceivedAnnouncementsForEndpointID:completionHandler:", v8, v6);

}

void __60__ANAnnounce_getReceivedAnnouncementsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce getReceivedAnnouncementsWithCompletionHandler:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSArray)receivedAnnouncements
{
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v3 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__ANAnnounce_receivedAnnouncements__block_invoke;
  v10[3] = &unk_24D3701D0;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce endpointIdentifier](self, "endpointIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __35__ANAnnounce_receivedAnnouncements__block_invoke_101;
  v9[3] = &unk_24D3702F8;
  v9[4] = &v11;
  objc_msgSend(v5, "getReceivedAnnouncementsForEndpointID:completionHandler:", v6, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v7;
}

void __35__ANAnnounce_receivedAnnouncements__block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412802;
    v8 = &stru_24D370F00;
    v9 = 2080;
    v10 = "-[ANAnnounce receivedAnnouncements]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1A8];

}

void __35__ANAnnounce_receivedAnnouncements__block_invoke_101(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSArray)unplayedAnnouncements
{
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v3 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__ANAnnounce_unplayedAnnouncements__block_invoke;
  v10[3] = &unk_24D3701D0;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounce endpointIdentifier](self, "endpointIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __35__ANAnnounce_unplayedAnnouncements__block_invoke_102;
  v9[3] = &unk_24D3702F8;
  v9[4] = &v11;
  objc_msgSend(v5, "getUnplayedAnnouncementsForEndpointID:completionHandler:", v6, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v7;
}

void __35__ANAnnounce_unplayedAnnouncements__block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412802;
    v8 = &stru_24D370F00;
    v9 = 2080;
    v10 = "-[ANAnnounce unplayedAnnouncements]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1A8];

}

void __35__ANAnnounce_unplayedAnnouncements__block_invoke_102(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)mockAnnouncement:(id)a3 forHomeWithName:(id)a4 playbackDeadline:(id)a5 completion:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  connection = self->_connection;
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke;
  v21[3] = &unk_24D3701A8;
  v13 = v10;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke_103;
  v19[3] = &unk_24D370388;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "mockAnnouncement:forHomeWithName:playbackDeadline:completion:", v16, v15, v14, v19);

}

void __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412802;
    v7 = &stru_24D370F00;
    v8 = 2080;
    v9 = "-[ANAnnounce mockAnnouncement:forHomeWithName:playbackDeadline:completion:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ANLogHandleAnnounce();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412802;
      v10 = &stru_24D370F00;
      v11 = 2080;
      v12 = "-[ANAnnounce mockAnnouncement:forHomeWithName:playbackDeadline:completion:]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)getScanningDeviceCandidates:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__ANAnnounce_getScanningDeviceCandidates___block_invoke;
  v8[3] = &unk_24D3701A8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getScanningDeviceCandidates:", v6);

}

void __42__ANAnnounce_getScanningDeviceCandidates___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412802;
    v8 = &stru_24D370F00;
    v9 = 2080;
    v10 = "-[ANAnnounce getScanningDeviceCandidates:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (id)contextFromAnnouncement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_105);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__ANAnnounce_contextFromAnnouncement___block_invoke_106;
  v8[3] = &unk_24D3703D0;
  v8[4] = &v9;
  objc_msgSend(v5, "contextFromAnnouncement:reply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __38__ANAnnounce_contextFromAnnouncement___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412802;
    v5 = &stru_24D370F00;
    v6 = 2080;
    v7 = "-[ANAnnounce contextFromAnnouncement:]_block_invoke";
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __38__ANAnnounce_contextFromAnnouncement___block_invoke_106(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)homeNamesForContext:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
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

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34__ANAnnounce_homeNamesForContext___block_invoke;
  v11[3] = &unk_24D3701D0;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34__ANAnnounce_homeNamesForContext___block_invoke_108;
  v10[3] = &unk_24D3702F8;
  v10[4] = &v12;
  objc_msgSend(v7, "homeNamesForContext:reply:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __34__ANAnnounce_homeNamesForContext___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412802;
    v8 = &stru_24D370F00;
    v9 = 2080;
    v10 = "-[ANAnnounce homeNamesForContext:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1A8];

}

void __34__ANAnnounce_homeNamesForContext___block_invoke_108(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isLocalDeviceInRoom:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__ANAnnounce_isLocalDeviceInRoom___block_invoke;
  v10[3] = &unk_24D3701D0;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __34__ANAnnounce_isLocalDeviceInRoom___block_invoke_109;
  v9[3] = &unk_24D3703F8;
  v9[4] = &v11;
  objc_msgSend(v7, "isLocalDeviceInRoom:reply:", v4, v9);

  LOBYTE(v7) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v7;
}

void __34__ANAnnounce_isLocalDeviceInRoom___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce isLocalDeviceInRoom:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __34__ANAnnounce_isLocalDeviceInRoom___block_invoke_109(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke;
  v13[3] = &unk_24D3701D0;
  v13[4] = &v14;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke_111;
  v12[3] = &unk_24D3703F8;
  v12[4] = &v14;
  objc_msgSend(v10, "isEndpointWithUUID:inRoomWithName:reply:", v6, v7, v12);

  LOBYTE(v10) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)v10;
}

void __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce isEndpointWithUUID:inRoomWithName:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke_111(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAnnounceEnabledForAnyAccessoryInHome:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke;
  v10[3] = &unk_24D3701D0;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke_112;
  v9[3] = &unk_24D3703F8;
  v9[4] = &v11;
  objc_msgSend(v7, "isAnnounceEnabledForAnyAccessoryInHome:reply:", v4, v9);

  LOBYTE(v7) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v7;
}

void __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce isAnnounceEnabledForAnyAccessoryInHome:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke_112(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAnnounceEnabledForAnyAccessoryOrUserInHome:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke;
  v10[3] = &unk_24D3701D0;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke_113;
  v9[3] = &unk_24D3703F8;
  v9[4] = &v11;
  objc_msgSend(v7, "isAnnounceEnabledForAnyAccessoryOrUserInHome:reply:", v4, v9);

  LOBYTE(v7) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v7;
}

void __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce isAnnounceEnabledForAnyAccessoryOrUserInHome:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke_113(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)prewarmWithHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__ANAnnounce_prewarmWithHandler___block_invoke;
  v12[3] = &unk_24D3701A8;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __33__ANAnnounce_prewarmWithHandler___block_invoke_114;
  v10[3] = &unk_24D3701A8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "prewarm:", v10);

}

void __33__ANAnnounce_prewarmWithHandler___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412802;
    v7 = &stru_24D370F00;
    v8 = 2080;
    v9 = "-[ANAnnounce prewarmWithHandler:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __33__ANAnnounce_prewarmWithHandler___block_invoke_114(uint64_t a1, void *a2)
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
    ANLogHandleAnnounce();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412802;
      v7 = &stru_24D370F00;
      v8 = 2080;
      v9 = "-[ANAnnounce prewarmWithHandler:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)_sendRequestLegacy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ANLogHandleAnnounce();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = &stru_24D370F00;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2156FF000, v8, OS_LOG_TYPE_DEFAULT, "%@Sending Request (Legacy): %@", buf, 0x16u);
  }

  connection = self->_connection;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __44__ANAnnounce__sendRequestLegacy_completion___block_invoke;
  v16[3] = &unk_24D3701A8;
  v11 = v7;
  v17 = v11;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __44__ANAnnounce__sendRequestLegacy_completion___block_invoke_115;
  v14[3] = &unk_24D370388;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "sendRequestLegacy:completion:", v6, v14);

}

void __44__ANAnnounce__sendRequestLegacy_completion___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412802;
    v7 = &stru_24D370F00;
    v8 = 2080;
    v9 = "-[ANAnnounce _sendRequestLegacy:completion:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __44__ANAnnounce__sendRequestLegacy_completion___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ANLogHandleAnnounce();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412802;
      v10 = &stru_24D370F00;
      v11 = 2080;
      v12 = "-[ANAnnounce _sendRequestLegacy:completion:]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)sendAnnouncement:(id)a3 toRoomsWithNames:(id)a4 inHomeWithName:(id)a5 completion:(id)a6
{
  -[ANAnnounce sendAnnouncement:toRoomsWithNames:andZonesWithNames:inHomeWithName:completion:](self, "sendAnnouncement:toRoomsWithNames:andZonesWithNames:inHomeWithName:completion:", a3, a4, MEMORY[0x24BDBD1A8], a5, a6);
}

- (void)sendAnnouncement:(id)a3 toZonesWithNames:(id)a4 inHomeWithName:(id)a5 completion:(id)a6
{
  -[ANAnnounce sendAnnouncement:toRoomsWithNames:andZonesWithNames:inHomeWithName:completion:](self, "sendAnnouncement:toRoomsWithNames:andZonesWithNames:inHomeWithName:completion:", a3, MEMORY[0x24BDBD1A8], a4, a5, a6);
}

- (void)sendAnnouncement:(id)a3 toRoomsWithIDs:(id)a4 inHomeWithID:(id)a5 completion:(id)a6
{
  -[ANAnnounce sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:](self, "sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:", a3, a4, MEMORY[0x24BDBD1A8], a5, a6);
}

- (void)sendAnnouncement:(id)a3 toZonesWithIDs:(id)a4 inHomeWithID:(id)a5 completion:(id)a6
{
  -[ANAnnounce sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:](self, "sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:", a3, MEMORY[0x24BDBD1A8], a4, a5, a6);
}

- (void)lastPlayedAnnouncementInfo:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__ANAnnounce_lastPlayedAnnouncementInfo___block_invoke;
  v8[3] = &unk_24D3701A8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPlayedAnnouncementInfo:", v6);

}

void __41__ANAnnounce_lastPlayedAnnouncementInfo___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleAnnounce();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412802;
    v6 = &stru_24D370F00;
    v7 = 2080;
    v8 = "-[ANAnnounce lastPlayedAnnouncementInfo:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (ANAnnounceDelegate)delegate
{
  return (ANAnnounceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSUUID)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
