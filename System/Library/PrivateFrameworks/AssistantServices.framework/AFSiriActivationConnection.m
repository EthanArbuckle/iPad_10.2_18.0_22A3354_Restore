@implementation AFSiriActivationConnection

- (AFSiriActivationConnection)init
{
  return -[AFSiriActivationConnection initWithServicePort:](self, "initWithServicePort:", 0);
}

- (AFSiriActivationConnection)initWithServicePort:(int64_t)a3
{
  AFSiriActivationConnection *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AFSiriActivationConnection;
  v4 = -[AFSiriActivationConnection init](&v10, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.siri.activation.connection", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v4->_servicePort = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[AFSiriActivationConnection _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFSiriActivationConnection;
  -[AFSiriActivationConnection dealloc](&v3, sel_dealloc);
}

- (void)prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFSiriActivationConnection prewarmWithRequestInfo:context:completion:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(queue, v16);

}

- (void)activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFSiriActivationConnection activateWithRequestInfo:context:completion:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(queue, v16);

}

- (void)deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    if ((unint64_t)a3 > 0x14)
      v14 = CFSTR("(unknown)");
    else
      v14 = off_1E3A31D98[a3];
    v15 = v14;
    AFSiriDeactivationOptionsGetNames(a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v26 = "-[AFSiriActivationConnection deactivateForReason:options:context:completion:]";
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s reason = %@, options = %@, context = %@", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke;
  block[3] = &unk_1E3A32DD8;
  v22 = v11;
  v23 = a3;
  v24 = a4;
  block[4] = self;
  v21 = v10;
  v18 = v10;
  v19 = v11;
  dispatch_async(queue, block);

}

- (void)handleContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
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
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFSiriActivationConnection handleContext:completion:]";
    v17 = 2048;
    v18 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s context = %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]";
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s intent = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(queue, v16);

}

- (void)handleIntentForwardingAction:(id)a3 inBackgroundApplicationWithBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[AFSiriActivationConnection handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionHandler:]";
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s intent = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(queue, v16);

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AFSiriActivationConnection_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  int64_t servicePort;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  NSXPCConnection *v17;
  NSXPCConnection *v18;
  NSXPCConnection *v19;
  void *v20;
  NSXPCConnection *v21;
  uint64_t v22;
  NSXPCConnection *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    servicePort = self->_servicePort;
    if ((unint64_t)(servicePort - 4) >= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v11 = off_1E3A2D978[servicePort];
        *(_DWORD *)buf = 136315394;
        v33 = "-[AFSiriActivationConnection _connection]";
        v34 = 2112;
        v35 = v11;
        _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s servicePort = %@ (incoming, effective)", buf, 0x16u);

      }
    }
    else
    {
      if (AFIsHorseman_onceToken != -1)
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
      if (AFIsHorseman_isHorseman)
        servicePort = 2;
      else
        servicePort = 1;
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v6 = self->_servicePort;
        v7 = v5;
        if (v6 > 3)
          v8 = CFSTR("(unknown)");
        else
          v8 = off_1E3A2D978[v6];
        v12 = v8;
        *(_DWORD *)buf = 136315394;
        v33 = "-[AFSiriActivationConnection _connection]";
        v34 = 2112;
        v35 = v12;
        _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s servicePort = %@ (incoming)", buf, 0x16u);

        v5 = AFSiriLogContextConnection;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v13 = v5;
        v14 = off_1E3A2D978[servicePort];
        *(_DWORD *)buf = 136315394;
        v33 = "-[AFSiriActivationConnection _connection]";
        v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s servicePort = %@ (effective)", buf, 0x16u);

      }
    }
    AFSiriActivationServiceGetMachServiceName(servicePort);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[AFSiriActivationConnection _connection]";
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s machServiceName = %@", buf, 0x16u);
    }
    v17 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v15, 0);
    v18 = self->_xpcConnection;
    self->_xpcConnection = v17;

    -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_queue);
    v19 = self->_xpcConnection;
    AFSiriActivationServiceGetXPCInterface();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v19, "setRemoteObjectInterface:", v20);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", 0);
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", 0);
    objc_initWeak((id *)buf, self);
    v21 = self->_xpcConnection;
    v22 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __41__AFSiriActivationConnection__connection__block_invoke;
    v30[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v31, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v21, "setInterruptionHandler:", v30);
    v23 = self->_xpcConnection;
    v25 = v22;
    v26 = 3221225472;
    v27 = __41__AFSiriActivationConnection__connection__block_invoke_2;
    v28 = &unk_1E3A35AE0;
    objc_copyWeak(&v29, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v23, "setInvalidationHandler:", &v25);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v25, v26, v27, v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (void)_connectionInterrupted
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFSiriActivationConnection _connectionInterrupted]";
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AFSiriActivationConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_connectionInvalidated
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFSiriActivationConnection _connectionInvalidated]";
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AFSiriActivationConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection setExportedObject:](xpcConnection, "setExportedObject:", 0);
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __52__AFSiriActivationConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __52__AFSiriActivationConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __41__AFSiriActivationConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __41__AFSiriActivationConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

uint64_t __40__AFSiriActivationConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_1E3A35B08;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_17;
  v7[3] = &unk_1E3A32F20;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionHandler:", v5, v6, v7);

}

void __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSiriActivationConnection handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completio"
         "nHandler:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v6 = 136315394;
      v7 = "-[AFSiriActivationConnection handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:complet"
           "ionHandler:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s intentForwardingActionResponse = %@", (uint8_t *)&v6, 0x16u);
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2;
  v9[3] = &unk_1E3A35B08;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_15;
  v7[3] = &unk_1E3A2DAE8;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleIntent:inBackgroundAppWithBundleId:reply:", v5, v6, v7);

}

void __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 136315394;
      v11 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s intentResponse = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v6)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

void __55__AFSiriActivationConnection_handleContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2;
  v8[3] = &unk_1E3A35B08;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2_14;
  v6[3] = &unk_1E3A35680;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "handleContext:completion:", v5, v6);

}

void __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFSiriActivationConnection handleContext:completion:]_block_invoke_2";
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke_13;
    v7[3] = &unk_1E3A32DB0;
    v8 = v3;
    v6 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v7);
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

void __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFSiriActivationConnection handleContext:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __55__AFSiriActivationConnection_handleContext_completion___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setError:", *(_QWORD *)(a1 + 32));
}

void __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2;
  v10[3] = &unk_1E3A35B08;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2_12;
  v8[3] = &unk_1E3A35680;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "deactivateForReason:options:context:completion:", v5, v6, v7, v8);

}

void __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFSiriActivationConnection deactivateForReason:options:context:completion:]_block_invoke_2";
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_11;
    v7[3] = &unk_1E3A32DB0;
    v8 = v3;
    v6 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v7);
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

void __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFSiriActivationConnection deactivateForReason:options:context:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setError:", *(_QWORD *)(a1 + 32));
}

void __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2;
  v9[3] = &unk_1E3A35B08;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2_10;
  v7[3] = &unk_1E3A35680;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "activateWithRequestInfo:context:completion:", v5, v6, v7);

}

void __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFSiriActivationConnection activateWithRequestInfo:context:completion:]_block_invoke_2";
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_9;
    v7[3] = &unk_1E3A32DB0;
    v8 = v3;
    v6 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v7);
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

void __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFSiriActivationConnection activateWithRequestInfo:context:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setError:", *(_QWORD *)(a1 + 32));
}

void __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2;
  v9[3] = &unk_1E3A35B08;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2_6;
  v7[3] = &unk_1E3A35680;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "prewarmWithRequestInfo:context:completion:", v5, v6, v7);

}

void __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFSiriActivationConnection prewarmWithRequestInfo:context:completion:]_block_invoke_2";
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_3;
    v7[3] = &unk_1E3A32DB0;
    v8 = v3;
    v6 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v7);
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

void __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFSiriActivationConnection prewarmWithRequestInfo:context:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setError:", *(_QWORD *)(a1 + 32));
}

@end
