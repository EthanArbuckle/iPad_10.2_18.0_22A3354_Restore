@implementation CSAttendingServiceClient

- (CSAttendingServiceClient)init
{
  CSAttendingServiceClient *v2;
  uint64_t v3;
  OS_dispatch_queue *xpcConnectionQueue;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CSAttendingServiceClient;
  v2 = -[CSAttendingServiceClient init](&v7, sel_init);
  if (v2)
  {
    CSLogInitIfNeeded();
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueue:qualityOfService:", CFSTR("com.apple.corespeech.attending.xpc.connection"), 33);
    v3 = objc_claimAutoreleasedReturnValue();
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v3;

  }
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSAttendingServiceClient init]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  return v2;
}

- (void)invalidate
{
  NSObject *v3;
  NSXPCConnection *attendingConnection;
  id remoteObjectProxy;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSAttendingServiceClient invalidate]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[NSXPCConnection invalidate](self->_attendingConnection, "invalidate");
  attendingConnection = self->_attendingConnection;
  self->_attendingConnection = 0;

  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[CSAttendingServiceClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSAttendingServiceClient;
  -[CSAttendingServiceClient dealloc](&v3, sel_dealloc);
}

- (void)startAttendingWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (os_log_t *)MEMORY[0x1E0D18F60];
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  if (!-[CSAttendingServiceClient _isAttendingAllowedForUseCase:](self, "_isAttendingAllowedForUseCase:", objc_msgSend(v6, "attendingType")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attending is not allowed for usecase: %lu"), objc_msgSend(v6, "attendingType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    if (v7)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18E80];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 2108, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0, v18);
    }
    goto LABEL_15;
  }
  -[CSAttendingServiceClient _setupRemoteServiceProxyObject](self, "_setupRemoteServiceProxyObject");
  if (!self->_remoteObjectProxy)
  {
    v19 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
      _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s Cannot start attending since unable to setup remoteObjectProxy", buf, 0xCu);
      if (!v7)
        goto LABEL_16;
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2101, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v6, "deviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[CSOpportuneSpeakListenerDeviceManager sharedManager](CSOpportuneSpeakListenerDeviceManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceId:", v12);

  }
  objc_msgSend(self->_remoteObjectProxy, "startAttendingWithOptions:completion:", v6, v7);
LABEL_16:

}

- (void)stopAttendingWithReason:(int64_t)a3
{
  os_log_t *v5;
  NSObject *v6;
  id remoteObjectProxy;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    remoteObjectProxy = self->_remoteObjectProxy;
    v10 = 136315394;
    v11 = "-[CSAttendingServiceClient stopAttendingWithReason:]";
    v12 = 2112;
    v13 = remoteObjectProxy;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = self->_remoteObjectProxy;
  if (v8)
  {
    objc_msgSend(v8, "stopAttendingWithReason:", a3);
  }
  else
  {
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSAttendingServiceClient stopAttendingWithReason:]";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Cannot stop attending since _remoteObjectProxy is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    if ((unint64_t)(a3 - 1) > 6)
      v7 = CFSTR("Default");
    else
      v7 = off_1E7C24D28[a3 - 1];
    v8 = v7;
    v10 = 136315394;
    v11 = "-[CSAttendingServiceClient attendingStoppedWithReason:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s [reason = %@]", (uint8_t *)&v10, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "attendingStoppedWithReason:", a3);

}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSAttendingServiceClient speechStartDetectedWithEventInfo:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "speechStartDetectedWithEventInfo:", v4);

}

- (void)speechPauseDetected
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAttendingServiceClient speechPauseDetected]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "speechPauseDetected");

}

- (void)_setupRemoteServiceProxyObject
{
  os_log_t *v3;
  NSObject *v4;
  NSXPCConnection *attendingConnection;
  void *v6;
  id remoteObjectProxy;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_remoteObjectProxy || !self->_attendingConnection)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D18F60];
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSAttendingServiceClient _setupRemoteServiceProxyObject]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    attendingConnection = self->_attendingConnection;
    if (attendingConnection
      || (-[CSAttendingServiceClient _createClientConnection](self, "_createClientConnection"),
          (attendingConnection = self->_attendingConnection) != 0))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__CSAttendingServiceClient__setupRemoteServiceProxyObject__block_invoke;
      v9[3] = &unk_1E7C285E8;
      v9[4] = self;
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](attendingConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      remoteObjectProxy = self->_remoteObjectProxy;
      self->_remoteObjectProxy = v6;
    }
    else
    {
      v8 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[CSAttendingServiceClient _setupRemoteServiceProxyObject]";
        _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s ERR: _attendingConnection is nil", buf, 0xCu);
      }
      remoteObjectProxy = self->_remoteObjectProxy;
      self->_remoteObjectProxy = 0;
    }

  }
}

- (void)_createClientConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *attendingConnection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  NSObject *v13;
  NSXPCConnection *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSXPCConnection *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.corespeechd.attending.service"), 0);
  attendingConnection = self->_attendingConnection;
  self->_attendingConnection = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7A8B00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_attendingConnection, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7A8A58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_speechStartDetectedWithEventInfo_, 0, 0);

  -[NSXPCConnection setExportedInterface:](self->_attendingConnection, "setExportedInterface:", v6);
  -[NSXPCConnection setExportedObject:](self->_attendingConnection, "setExportedObject:", self);
  -[NSXPCConnection _setQueue:](self->_attendingConnection, "_setQueue:", self->_xpcConnectionQueue);
  objc_initWeak(&location, self);
  v10 = self->_attendingConnection;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__CSAttendingServiceClient__createClientConnection__block_invoke;
  v17[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v18, &location);
  -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v17);
  v12 = self->_attendingConnection;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __51__CSAttendingServiceClient__createClientConnection__block_invoke_2;
  v15[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v16, &location);
  -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v15);
  v13 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_attendingConnection;
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSAttendingServiceClient _createClientConnection]";
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Setup connection: %@", buf, 0x16u);
  }
  -[NSXPCConnection resume](self->_attendingConnection, "resume");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (BOOL)_isAttendingAllowedForUseCase:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;

  if (a3 != 6 && a3 != 1)
    return 1;
  +[CSAttSiriMagusSupportedPolicy sharedInstance](CSAttSiriMagusSupportedPolicy, "sharedInstance", v4, v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "getIsAssetMagusSupported");

  return v8;
}

- (CSAttendingServiceDelegate)delegate
{
  return (CSAttendingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, a3);
}

- (NSXPCConnection)attendingConnection
{
  return self->_attendingConnection;
}

- (void)setAttendingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_attendingConnection, a3);
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong(&self->_remoteObjectProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_attendingConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__CSAttendingServiceClient__createClientConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "attendingConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "attendingConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSAttendingServiceClient _createClientConnection]_block_invoke";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "attendingConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "xpcConnectionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__CSAttendingServiceClient__createClientConnection__block_invoke_77;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

void __51__CSAttendingServiceClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "attendingConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "attendingConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSAttendingServiceClient _createClientConnection]_block_invoke_2";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "attendingConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "xpcConnectionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__CSAttendingServiceClient__createClientConnection__block_invoke_79;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

uint64_t __51__CSAttendingServiceClient__createClientConnection__block_invoke_79(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAttendingConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", 0);
}

uint64_t __51__CSAttendingServiceClient__createClientConnection__block_invoke_77(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "attendingConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setAttendingConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", 0);
}

void __58__CSAttendingServiceClient__setupRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v7 = v4;
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[CSAttendingServiceClient _setupRemoteServiceProxyObject]_block_invoke";
      v12 = 2050;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Attending Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v10, 0x20u);

    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = 0;

  }
}

@end
