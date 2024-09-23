@implementation AFDeviceContextConnection

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFDeviceContextConnection;
  -[AFDeviceContextConnection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {instanceContext = %@}"), v4, self->_instanceContext);

  return (NSString *)v5;
}

- (void)dealloc
{
  NSObject *v3;
  AFInstanceContext *instanceContext;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFDeviceContextConnection *v9;
  __int16 v10;
  AFInstanceContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    instanceContext = self->_instanceContext;
    *(_DWORD *)buf = 136315650;
    v7 = "-[AFDeviceContextConnection dealloc]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = instanceContext;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@", buf, 0x20u);
  }
  v5.receiver = self;
  v5.super_class = (Class)AFDeviceContextConnection;
  -[AFDeviceContextConnection dealloc](&v5, sel_dealloc);
}

- (AFDeviceContextConnection)initWithQueue:(id)a3 instanceContext:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFDeviceContextConnection *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v14;
  id v15;
  AFInstanceContext *v16;
  AFInstanceContext *instanceContext;
  NSObject *v18;
  AFInstanceContext *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  AFDeviceContextConnection *v25;
  __int16 v26;
  AFInstanceContext *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AFDeviceContextConnection;
  v11 = -[AFDeviceContextConnection init](&v21, sel_init);
  if (v11)
  {
    if (v8)
    {
      v12 = (OS_dispatch_queue *)v8;
      queue = v11->_queue;
      v11->_queue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      queue = v11->_queue;
      v11->_queue = v14;
    }

    if (v9)
    {
      v16 = (AFInstanceContext *)v9;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v16 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v16;

    objc_storeWeak((id *)&v11->_delegate, v10);
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v19 = v11->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v23 = "-[AFDeviceContextConnection initWithQueue:instanceContext:delegate:]";
      v24 = 2048;
      v25 = v11;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@", buf, 0x20u);
    }
  }

  return v11;
}

- (void)getLocalDeviceContextWithCompletion:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t v9;

  if (!a3)
  {
    v8 = v3;
    v9 = v4;
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__AFDeviceContextConnection_getLocalDeviceContextWithCompletion___block_invoke;
    v6[3] = &unk_1E3A36FA0;
    v6[4] = self;
    v7 = 0;
    dispatch_async(queue, v6);

  }
}

- (void)beginUpdateLocalDeviceContext
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AFDeviceContextConnection_beginUpdateLocalDeviceContext__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endUpdateLocalDeviceContext
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AFDeviceContextConnection_endUpdateLocalDeviceContext__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __118__AFDeviceContextConnection_donateSerializedContextMapByPrivacyClass_withMetadataMap_forType_pushToRemote_completion___block_invoke;
  v21[3] = &unk_1E3A36C58;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v26 = a6;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(queue, v21);

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AFDeviceContextConnection_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_xpcConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  id v11;
  NSXPCConnection *v12;
  _AFDeviceContextServiceDelegateProxy *v13;
  NSXPCConnection *v14;
  uint64_t v15;
  NSXPCConnection *v16;
  NSObject *v17;
  NSXPCConnection *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  AFDeviceContextConnection *v28;
  __int16 v29;
  NSXPCConnection *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[AFDeviceContextConnection _xpcConnection]";
      v27 = 2048;
      v28 = self;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
    v4 = 0;
  }
  else
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](self->_instanceContext, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.device-context"), 0);
      v6 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
      v7 = self->_xpcConnection;
      self->_xpcConnection = v6;

      -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_queue);
      v8 = self->_xpcConnection;
      AFDeviceContextServiceGetXPCInterface();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

      v10 = self->_xpcConnection;
      v11 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE417710);
      -[NSXPCConnection setExportedInterface:](v10, "setExportedInterface:", v11);

      v12 = self->_xpcConnection;
      v13 = -[_AFDeviceContextServiceDelegateProxy initWithConnection:]([_AFDeviceContextServiceDelegateProxy alloc], "initWithConnection:", self);
      -[NSXPCConnection setExportedObject:](v12, "setExportedObject:", v13);

      objc_initWeak(&location, self);
      v14 = self->_xpcConnection;
      v15 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __43__AFDeviceContextConnection__xpcConnection__block_invoke;
      v22[3] = &unk_1E3A35AE0;
      objc_copyWeak(&v23, &location);
      -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v22);
      v16 = self->_xpcConnection;
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __43__AFDeviceContextConnection__xpcConnection__block_invoke_2;
      v20[3] = &unk_1E3A35AE0;
      objc_copyWeak(&v21, &location);
      -[NSXPCConnection setInterruptionHandler:](v16, "setInterruptionHandler:", v20);
      -[NSXPCConnection resume](self->_xpcConnection, "resume");
      v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v18 = self->_xpcConnection;
        *(_DWORD *)buf = 136315650;
        v26 = "-[AFDeviceContextConnection _xpcConnection]";
        v27 = 2048;
        v28 = self;
        v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", buf, 0x20u);
      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      xpcConnection = self->_xpcConnection;
    }
    v4 = xpcConnection;
  }
  return v4;
}

- (void)_handleXPCConnectionInvalidation
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  int v5;
  const char *v6;
  __int16 v7;
  AFDeviceContextConnection *v8;
  __int16 v9;
  NSXPCConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    v5 = 136315650;
    v6 = "-[AFDeviceContextConnection _handleXPCConnectionInvalidation]";
    v7 = 2048;
    v8 = self;
    v9 = 2112;
    v10 = xpcConnection;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }
  -[AFDeviceContextConnection _invalidate](self, "_invalidate");
}

- (void)_handleXPCConnectionInterruption
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  int v5;
  const char *v6;
  __int16 v7;
  AFDeviceContextConnection *v8;
  __int16 v9;
  NSXPCConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    v5 = 136315650;
    v6 = "-[AFDeviceContextConnection _handleXPCConnectionInterruption]";
    v7 = 2048;
    v8 = self;
    v9 = 2112;
    v10 = xpcConnection;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }
  -[AFDeviceContextConnection _invalidate](self, "_invalidate");
}

- (void)_clearXPCConnection
{
  NSXPCConnection *xpcConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  int v6;
  const char *v7;
  __int16 v8;
  AFDeviceContextConnection *v9;
  __int16 v10;
  NSXPCConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v6 = 136315650;
      v7 = "-[AFDeviceContextConnection _clearXPCConnection]";
      v8 = 2048;
      v9 = self;
      v10 = 2112;
      v11 = xpcConnection;
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v6, 0x20u);
      xpcConnection = self->_xpcConnection;
    }
    -[NSXPCConnection invalidate](xpcConnection, "invalidate");
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
}

- (void)_invalidate
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  AFDeviceContextConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AFDeviceContextConnection _endUpdateLocalDeviceContext](self, "_endUpdateLocalDeviceContext");
  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v5 = 136315394;
      v6 = "-[AFDeviceContextConnection _invalidate]";
      v7 = 2048;
      v8 = self;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deviceContextConnectionDidInvalidate:", self);

    objc_storeWeak((id *)&self->_delegate, 0);
  }
  -[AFDeviceContextConnection _clearXPCConnection](self, "_clearXPCConnection");
}

- (id)_remoteServiceWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  AFDeviceContextConnection *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isInvalid)
  {
    -[AFDeviceContextConnection _xpcConnection](self, "_xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__AFDeviceContextConnection__remoteServiceWithErrorHandler___block_invoke;
    v9[3] = &unk_1E3A35B08;
    v10 = v4;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[AFDeviceContextConnection _remoteServiceWithErrorHandler:]";
    v13 = 2048;
    v14 = self;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    if (v4)
      goto LABEL_4;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if (!v4)
    goto LABEL_8;
LABEL_4:
  +[AFError errorWithCode:](AFError, "errorWithCode:", 23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v4 + 2))(v4, v6);
  v7 = 0;
LABEL_6:

LABEL_9:
  return v7;
}

- (void)_fetchLocalDeviceContextWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  AFDeviceContextConnection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = AFSiriLogContextConnection;
  if (self->_isInvalid)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]";
      v15 = 2048;
      v16 = self;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
      if (!v4)
        goto LABEL_8;
      goto LABEL_4;
    }
    if (v4)
LABEL_4:
      v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]";
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke;
    v11[3] = &unk_1E3A36E60;
    objc_copyWeak(&v12, (id *)buf);
    -[AFDeviceContextConnection _remoteServiceWithErrorHandler:](self, "_remoteServiceWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke_11;
    v8[3] = &unk_1E3A351A0;
    objc_copyWeak(&v10, (id *)buf);
    v9 = v4;
    objc_msgSend(v7, "getLocalDeviceContextWithReply:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
LABEL_8:

}

- (void)_beginUpdateLocalDeviceContext
{
  NSObject *v3;
  AFDeviceContext *localDeviceContext;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  AFDeviceContextConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]";
      v17 = 2048;
      v18 = self;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
  }
  else if (!self->_isUpdatingLocalDeviceContext)
  {
    self->_isUpdatingLocalDeviceContext = 1;
    localDeviceContext = self->_localDeviceContext;
    self->_localDeviceContext = 0;

    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]";
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke;
    v13[3] = &unk_1E3A36E60;
    objc_copyWeak(&v14, (id *)buf);
    -[AFDeviceContextConnection _remoteServiceWithErrorHandler:](self, "_remoteServiceWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = 3221225472;
    v10 = __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke_13;
    v11 = &unk_1E3A35AE0;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v7, "beginUpdateLocalDeviceContextWithReply:", &v8);

    -[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:](self, "_fetchLocalDeviceContextWithCompletion:", 0, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_endUpdateLocalDeviceContext
{
  NSObject *v3;
  AFDeviceContext *localDeviceContext;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  AFDeviceContextConnection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[AFDeviceContextConnection _endUpdateLocalDeviceContext]";
      v11 = 2048;
      v12 = self;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
  }
  else if (self->_isUpdatingLocalDeviceContext)
  {
    self->_isUpdatingLocalDeviceContext = 0;
    localDeviceContext = self->_localDeviceContext;
    self->_localDeviceContext = 0;

    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[AFDeviceContextConnection _endUpdateLocalDeviceContext]";
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__AFDeviceContextConnection__endUpdateLocalDeviceContext__block_invoke;
    v7[3] = &unk_1E3A36E60;
    objc_copyWeak(&v8, (id *)buf);
    -[AFDeviceContextConnection _remoteServiceWithErrorHandler:](self, "_remoteServiceWithErrorHandler:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endUpdateLocalDeviceContext");

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_updateLocalDeviceContext:(id)a3
{
  id v4;
  AFDeviceContext *v5;
  AFDeviceContext *v6;
  AFDeviceContext *v7;
  BOOL v8;
  void *v9;
  AFDeviceContext *localDeviceContext;
  NSObject *v11;
  void *v12;
  void *v13;
  AFDeviceContext *v14;
  AFDeviceContext *v15;
  id WeakRetained;
  char v17;
  id v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  AFDeviceContextConnection *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = self->_localDeviceContext;
  v6 = (AFDeviceContext *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v8 = -[AFDeviceContext isEqual:](v5, "isEqual:", v6);

      if (v8)
        goto LABEL_13;
    }
    else
    {

    }
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      localDeviceContext = self->_localDeviceContext;
      v11 = v9;
      -[AFDeviceContext identifier](localDeviceContext, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFDeviceContext identifier](v7, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315906;
      v21 = "-[AFDeviceContextConnection _updateLocalDeviceContext:]";
      v22 = 2048;
      v23 = self;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p localDeviceContext (old) = %@ (new) = %@", (uint8_t *)&v20, 0x2Au);

    }
    v14 = (AFDeviceContext *)-[AFDeviceContext copy](v7, "copy");
    v15 = self->_localDeviceContext;
    self->_localDeviceContext = v14;

    if (self->_isUpdatingLocalDeviceContext)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        v19 = (void *)-[AFDeviceContext copy](self->_localDeviceContext, "copy");
        objc_msgSend(v18, "deviceContextConnection:didUpdateLocalDeviceContext:", self, v19);

      }
    }
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceDelegateProxy, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __57__AFDeviceContextConnection__endUpdateLocalDeviceContext__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 136315650;
    v8 = "-[AFDeviceContextConnection _endUpdateLocalDeviceContext]_block_invoke";
    v9 = 2048;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v7, 0x20u);

  }
}

void __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = 136315650;
    v9 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]_block_invoke";
    v10 = 2048;
    v11 = WeakRetained;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "_endUpdateLocalDeviceContext");

}

void __59__AFDeviceContextConnection__beginUpdateLocalDeviceContext__block_invoke_13(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 136315394;
    v7 = "-[AFDeviceContextConnection _beginUpdateLocalDeviceContext]_block_invoke";
    v8 = 2048;
    v9 = WeakRetained;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p reply", (uint8_t *)&v6, 0x16u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "_endUpdateLocalDeviceContext");

}

void __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 136315650;
    v8 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]_block_invoke";
    v9 = 2048;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v7, 0x20u);

  }
}

void __68__AFDeviceContextConnection__fetchLocalDeviceContextWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[AFDeviceContextConnection _fetchLocalDeviceContextWithCompletion:]_block_invoke";
    v12 = 2048;
    v13 = WeakRetained;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p localDeviceContext = %@", (uint8_t *)&v10, 0x20u);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "_updateLocalDeviceContext:", v3);

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

uint64_t __60__AFDeviceContextConnection__remoteServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __43__AFDeviceContextConnection__xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleXPCConnectionInvalidation");

}

void __43__AFDeviceContextConnection__xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleXPCConnectionInterruption");

}

uint64_t __39__AFDeviceContextConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __118__AFDeviceContextConnection_donateSerializedContextMapByPrivacyClass_withMetadataMap_forType_pushToRemote_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 48))
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "-[AFDeviceContextConnection donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:com"
           "pletion:]_block_invoke";
      v7 = 2048;
      v8 = v1;
      _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_remoteServiceWithErrorHandler:", &__block_literal_global_36520);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

  }
}

void __118__AFDeviceContextConnection_donateSerializedContextMapByPrivacyClass_withMetadataMap_forType_pushToRemote_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFDeviceContextConnection donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:compl"
         "etion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __56__AFDeviceContextConnection_endUpdateLocalDeviceContext__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endUpdateLocalDeviceContext");
}

uint64_t __58__AFDeviceContextConnection_beginUpdateLocalDeviceContext__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginUpdateLocalDeviceContext");
}

void __65__AFDeviceContextConnection_getLocalDeviceContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 49) && *(_QWORD *)(v1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (id)objc_msgSend(*(id *)(v1 + 56), "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchLocalDeviceContextWithCompletion:", *(_QWORD *)(a1 + 40));
  }
}

@end
