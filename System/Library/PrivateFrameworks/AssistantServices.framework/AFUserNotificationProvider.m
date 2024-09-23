@implementation AFUserNotificationProvider

- (AFUserNotificationProvider)init
{
  AFUserNotificationProvider *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *responseHandlersByNotificationID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AFUserNotificationProvider;
  v2 = -[AFUserNotificationProvider init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AFUserNotificationProvider", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    responseHandlersByNotificationID = v2->_responseHandlersByNotificationID;
    v2->_responseHandlersByNotificationID = v6;

  }
  return v2;
}

- (void)postNotificationRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke;
    v11[3] = &unk_1E3A346A0;
    v14 = v7;
    v11[4] = self;
    v12 = v8;
    v13 = v6;
    dispatch_async(queue, v11);

  }
  else
  {
    v10 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[AFUserNotificationProvider postNotificationRequest:responseHandler:]";
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s No identifier specified for %@", buf, 0x16u);
    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)withdrawNotificationRequestWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[AFUserNotificationProvider _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__AFUserNotificationProvider_withdrawNotificationRequestWithIdentifier___block_invoke;
  v7[3] = &unk_1E3A36A00;
  v7[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "withdrawNotificationRequestWithIdentifier:", v4);

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assistant.notification_service"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_queue);
    v6 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4320D8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3F0000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    objc_initWeak(&location, self);
    v10 = self->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__AFUserNotificationProvider__connection__block_invoke;
    v16[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v16);
    v12 = self->_connection;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __41__AFUserNotificationProvider__connection__block_invoke_15;
    v14[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v14);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)receivedNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_responseHandlersByNotificationID, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v4);
  }
  else
  {
    v10 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[AFUserNotificationProvider receivedNotificationResponse:]";
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s No response handler for %@", (uint8_t *)&v11, 0x16u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_responseHandlersByNotificationID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__AFUserNotificationProvider__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[AFUserNotificationProvider _connection]_block_invoke";
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s Connection to assistantd for notification interrupted", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

}

void __41__AFUserNotificationProvider__connection__block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[AFUserNotificationProvider _connection]_block_invoke";
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s Connection to assistantd for notification invalidated", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

}

void __72__AFUserNotificationProvider_withdrawNotificationRequestWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[AFUserNotificationProvider withdrawNotificationRequestWithIdentifier:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Error connecting to assistantd for notification service: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = 0;

}

void __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_2;
  v13[3] = &unk_1E3A2DE40;
  v3 = *(id *)(a1 + 56);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v4 = (void *)MEMORY[0x1A1AC0C3C](v13);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = (void *)MEMORY[0x1A1AC0C3C]();
  objc_msgSend(v5, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_4;
  v12[3] = &unk_1E3A36A00;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 48);
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_4;
  v10[3] = &unk_1E3A36A00;
  v11 = v9;
  objc_msgSend(v8, "postNotificationRequest:completion:", v11, v10);

}

void __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(v5, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_3;
  v12[3] = &unk_1E3A36FC8;
  v12[4] = v9;
  v13 = v8;
  v11 = v8;
  dispatch_async(v10, v12);

}

void __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[AFUserNotificationProvider postNotificationRequest:responseHandler:]_block_invoke_4";
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Error connecting to assistantd for notification service: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = 0;

}

{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[AFUserNotificationProvider postNotificationRequest:responseHandler:]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Error posting notification %@: %@", (uint8_t *)&v6, 0x20u);
    }
  }

}

uint64_t __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

@end
