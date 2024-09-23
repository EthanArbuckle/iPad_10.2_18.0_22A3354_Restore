@implementation AFAudioSessionAssertionConnection

- (AFAudioSessionAssertionConnection)initWithInstanceContext:(id)a3 acquisitionContext:(id)a4 relinquishmentHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFAudioSessionAssertionConnection *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  AFInstanceContext *v18;
  AFInstanceContext *instanceContext;
  uint64_t v20;
  AFAssertionContext *acquisitionContext;
  AFTwoArgumentSafetyBlock *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  AFTwoArgumentSafetyBlock *relinquishmentHandler;
  NSObject *v27;
  _QWORD block[4];
  AFAudioSessionAssertionConnection *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  AFAudioSessionAssertionConnection *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)AFAudioSessionAssertionConnection;
  v11 = -[AFAudioSessionAssertionConnection init](&v34, sel_init);
  if (v11)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[AFAudioSessionAssertionConnection initWithInstanceContext:acquisitionContext:relinquishmentHandler:]";
      v37 = 2048;
      v38 = v11;
      v39 = 2112;
      v40 = v8;
      v41 = 2112;
      v42 = v9;
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@, acquisitionContext = %@", buf, 0x2Au);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    AFAudioSessionAssertionGetConnectionWorkloop();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create_with_target_V2("com.apple.assistant.audio-session-assertion.client-connection", v14, v15);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    if (v8)
    {
      v18 = (AFInstanceContext *)v8;
    }
    else
    {
      +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
      v18 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v18;

    v20 = objc_msgSend(v9, "copy");
    acquisitionContext = v11->_acquisitionContext;
    v11->_acquisitionContext = (AFAssertionContext *)v20;

    v22 = [AFTwoArgumentSafetyBlock alloc];
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke;
    v32[3] = &unk_1E3A2DC88;
    v33 = v10;
    +[AFError errorWithCode:](AFError, "errorWithCode:", 40);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[AFTwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:](v22, "initWithBlock:defaultValue1:defaultValue2:", v32, 0, v24);
    relinquishmentHandler = v11->_relinquishmentHandler;
    v11->_relinquishmentHandler = (AFTwoArgumentSafetyBlock *)v25;

    v27 = v11->_queue;
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke_2;
    block[3] = &unk_1E3A36FC8;
    v30 = v11;
    v31 = v9;
    dispatch_async(v27, block);

  }
  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFAudioSessionAssertionConnection;
  -[AFAudioSessionAssertionConnection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {uuid = %@, instanceContext = %@, acquisitionContext = %@}"), v4, self->_uuid, self->_instanceContext, self->_acquisitionContext);

  return (NSString *)v5;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  AFAudioSessionAssertionConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[AFAudioSessionAssertionConnection dealloc]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ is deallocated without relinquishment and finalization."), self);
  +[AFError errorWithCode:description:](AFError, "errorWithCode:description:", 41, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFAudioSessionAssertionConnection _finalizeWithContext:error:](self, "_finalizeWithContext:error:", 0, v5);

  v6.receiver = self;
  v6.super_class = (Class)AFAudioSessionAssertionConnection;
  -[AFAudioSessionAssertionConnection dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFAudioSessionAssertionConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFAudioSessionAssertionConnection invalidate]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AFAudioSessionAssertionConnection_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  AFAudioSessionAssertionConnection *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    AFAssertionRelinquishmentOptionsGetNames(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v16 = "-[AFAudioSessionAssertionConnection relinquishWithContext:options:]";
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@, options = %@", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AFAudioSessionAssertionConnection_relinquishWithContext_options___block_invoke;
  block[3] = &unk_1E3A353E8;
  block[4] = self;
  v13 = v6;
  v14 = a4;
  v11 = v6;
  dispatch_async(queue, block);

}

- (void)relinquishWithError:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  AFAudioSessionAssertionConnection *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v10 = v7;
    AFAssertionRelinquishmentOptionsGetNames(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v16 = "-[AFAudioSessionAssertionConnection relinquishWithError:options:]";
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v11;
    _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s %p error = %@, options = %@", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AFAudioSessionAssertionConnection_relinquishWithError_options___block_invoke;
  block[3] = &unk_1E3A353E8;
  block[4] = self;
  v13 = v6;
  v14 = a4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)_acquireWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *v9;
  void *v10;
  OS_dispatch_queue *v11;
  _QWORD v12[4];
  OS_dispatch_queue *v13;
  id v14;
  _QWORD v15[4];
  OS_dispatch_queue *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  AFAudioSessionAssertionConnection *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[AFAudioSessionAssertionConnection _acquireWithContext:]";
    v20 = 2048;
    v21 = self;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  v6 = self->_queue;
  objc_initWeak((id *)buf, self);
  -[AFAudioSessionAssertionConnection _xpcConnection](self, "_xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke;
  v15[3] = &unk_1E3A36E38;
  v9 = v6;
  v16 = v9;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_3;
  v12[3] = &unk_1E3A2DCB0;
  v11 = v9;
  v13 = v11;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v10, "acquireAudioSessionWithContext:relinquishmentHandler:", v4, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

- (void)_relinquishWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  AFAudioSessionAssertionConnection *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[AFAudioSessionAssertionConnection _relinquishWithContext:error:options:]";
    v20 = 2048;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s %p context = %@, error = %@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  -[AFAudioSessionAssertionConnection _xpcConnection](self, "_xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke;
  v16[3] = &unk_1E3A36E60;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke_16;
  v14[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v13, "relinquishAudioSessionWithContext:error:options:completion:", v8, v9, a5, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)_finalizeWithContext:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  AFAudioSessionAssertionConnection *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[AFTwoArgumentSafetyBlock invokeWithValue:andValue:](self->_relinquishmentHandler, "invokeWithValue:andValue:", v6, v7))
  {
    v8 = AFSiriLogContextConnection;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315650;
        v10 = "-[AFAudioSessionAssertionConnection _finalizeWithContext:error:]";
        v11 = 2048;
        v12 = self;
        v13 = 2112;
        v14 = v7;
        _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v9, 0x20u);
      }
    }
    else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315650;
      v10 = "-[AFAudioSessionAssertionConnection _finalizeWithContext:error:]";
      v11 = 2048;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@", (uint8_t *)&v9, 0x20u);
    }
  }
  -[AFAudioSessionAssertionConnection _clearXPCConnection](self, "_clearXPCConnection");

}

- (void)handleXPCConnectionInterrupted
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  AFAudioSessionAssertionConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFAudioSessionAssertionConnection handleXPCConnectionInterrupted]";
    v6 = 2048;
    v7 = self;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  -[AFAudioSessionAssertionConnection invalidate](self, "invalidate");
}

- (void)handleXPCConnectionInvalidated
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  AFAudioSessionAssertionConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFAudioSessionAssertionConnection handleXPCConnectionInvalidated]";
    v6 = 2048;
    v7 = self;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  -[AFAudioSessionAssertionConnection invalidate](self, "invalidate");
}

- (id)_xpcConnection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  id v10;
  NSObject *v11;
  NSXPCConnection *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSXPCConnection *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](self->_instanceContext, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.audio-session-assertion"), 0);
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_queue);
    objc_initWeak(&location, self);
    v6 = self->_xpcConnection;
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke;
    v16[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v16);
    v8 = self->_xpcConnection;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke_2;
    v14[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v14);
    v9 = self->_xpcConnection;
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4325B8);
    -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v13 = self->_xpcConnection;
      *(_DWORD *)buf = 136315394;
      v20 = "-[AFAudioSessionAssertionConnection _xpcConnection]";
      v21 = 2048;
      v22 = v13;
      _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s Create XPC connection %p.", buf, 0x16u);
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (void)_clearXPCConnection
{
  NSXPCConnection *xpcConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  int v6;
  const char *v7;
  __int16 v8;
  NSXPCConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "-[AFAudioSessionAssertionConnection _clearXPCConnection]";
      v8 = 2048;
      v9 = xpcConnection;
      _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Destroy XPC connection %p.", (uint8_t *)&v6, 0x16u);
      xpcConnection = self->_xpcConnection;
    }
    -[NSXPCConnection setExportedObject:](xpcConnection, "setExportedObject:", 0);
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (AFAssertionContext)context
{
  return self->_acquisitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_relinquishmentHandler, 0);
  objc_storeStrong((id *)&self->_acquisitionContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __51__AFAudioSessionAssertionConnection__xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[AFAudioSessionAssertionConnection _relinquishWithContext:error:options:]_block_invoke";
    v9 = 2048;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v7, 0x20u);

  }
}

void __74__AFAudioSessionAssertionConnection__relinquishWithContext_error_options___block_invoke_16(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 136315394;
    v6 = "-[AFAudioSessionAssertionConnection _relinquishWithContext:error:options:]_block_invoke";
    v7 = 2048;
    v8 = WeakRetained;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v5, 0x16u);

  }
}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_2;
  v6[3] = &unk_1E3A33A28;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_4;
  block[3] = &unk_1E3A340A8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finalizeWithContext:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __57__AFAudioSessionAssertionConnection__acquireWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finalizeWithContext:error:", 0, *(_QWORD *)(a1 + 32));

}

uint64_t __65__AFAudioSessionAssertionConnection_relinquishWithError_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_relinquishWithContext:error:options:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __67__AFAudioSessionAssertionConnection_relinquishWithContext_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_relinquishWithContext:error:options:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __47__AFAudioSessionAssertionConnection_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ is invalidated without relinquishment and finalization."), v1);
  +[AFError errorWithCode:description:](AFError, "errorWithCode:description:", 42, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_finalizeWithContext:error:", 0, v2);

}

uint64_t __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __102__AFAudioSessionAssertionConnection_initWithInstanceContext_acquisitionContext_relinquishmentHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acquireWithContext:", *(_QWORD *)(a1 + 40));
}

@end
