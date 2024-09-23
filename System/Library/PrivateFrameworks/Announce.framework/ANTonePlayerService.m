@implementation ANTonePlayerService

- (ANTonePlayerService)init
{
  ANTonePlayerService *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)ANTonePlayerService;
  v2 = -[ANTonePlayerService init](&v8, sel_init);
  if (v2)
  {
    ANLogHandleTonePlayerService();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = &stru_24D370F00;
      v11 = 2112;
      v12 = CFSTR("com.apple.announced.toneplayer");
      _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to Service: %@", buf, 0x16u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.announced.toneplayer"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE8B90);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_11);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_48);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

void __27__ANTonePlayerService_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  ANLogHandleTonePlayerService();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = &stru_24D370F00;
    _os_log_impl(&dword_2156FF000, v0, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was interrupted", (uint8_t *)&v1, 0xCu);
  }

}

void __27__ANTonePlayerService_init__block_invoke_47()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  ANLogHandleTonePlayerService();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = &stru_24D370F00;
    _os_log_impl(&dword_2156FF000, v0, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was invalidated", (uint8_t *)&v1, 0xCu);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[ANTonePlayerService invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ANTonePlayerService;
  -[ANTonePlayerService dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v2;

  -[ANTonePlayerService connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)playTone:(unint64_t)a3 audioSessionID:(unsigned int)a4 endpointUUID:(id)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a5;
  -[ANTonePlayerService connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke;
  v19[3] = &unk_24D3701A8;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke_52;
  v17[3] = &unk_24D3701A8;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "playTone:audioSessionID:endpointUUID:completionHandler:", a3, v7, v11, v17);

}

void __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  ANLogHandleTonePlayerService();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412802;
    v7 = &stru_24D370F00;
    v8 = 2080;
    v9 = "-[ANTonePlayerService playTone:audioSessionID:endpointUUID:completionHandler:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke_52(uint64_t a1, void *a2)
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
    ANLogHandleTonePlayerService();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412802;
      v7 = &stru_24D370F00;
      v8 = 2080;
      v9 = "-[ANTonePlayerService playTone:audioSessionID:endpointUUID:completionHandler:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
