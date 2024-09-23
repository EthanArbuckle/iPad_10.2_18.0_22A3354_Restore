@implementation CSAttSiriServiceClient

- (CSAttSiriServiceClient)init
{
  CSAttSiriServiceClient *v3;
  CSAttSiriServiceClient *v4;
  uint64_t v5;
  id remoteSvcProxy;
  CSAttSiriServiceClient *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CSLogInitIfNeeded();
  v10.receiver = self;
  v10.super_class = (Class)CSAttSiriServiceClient;
  v3 = -[CSAttSiriServiceClient init](&v10, sel_init);
  v4 = v3;
  if (v3
    && (-[CSAttSiriServiceClient _setupAttSiriSvcXpcConnection](v3, "_setupAttSiriSvcXpcConnection"),
        -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4->_attSiriSvcConn, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_980), v5 = objc_claimAutoreleasedReturnValue(), remoteSvcProxy = v4->_remoteSvcProxy, v4->_remoteSvcProxy = (id)v5, remoteSvcProxy, !v4->_remoteSvcProxy))
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSAttSiriServiceClient init]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s _remoteSvcProxy is nil!", buf, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (void)startAttendingWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAttSiriServiceClient startAttendingWithContext:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ctx=%@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(self->_remoteSvcProxy, "startAttendingWithContext:", v4);

}

- (void)stopAttendingWithContext:(id)a3
{
  objc_msgSend(self->_remoteSvcProxy, "stopAttendingWithContext:", a3);
}

- (void)siriRequestProcessingCompleted
{
  objc_msgSend(self->_remoteSvcProxy, "siriRequestProcessingCompleted");
}

- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4
{
  objc_msgSend(self->_remoteSvcProxy, "gazeTrackerFaceTrackingMetaDataUpdate:atMachAbsTime:", a3, a4);
}

- (void)updateSiriOrbLocation:(CGRect)a3
{
  objc_msgSend(self->_remoteSvcProxy, "updateSiriOrbLocation:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)gazeEstimates:(CGPoint)a3 landmarks:(id)a4
{
  objc_msgSend(self->_remoteSvcProxy, "gazeEstimates:landmarks:", a4, a3.x, a3.y);
}

- (void)invalidate
{
  NSXPCConnection *attSiriSvcConn;

  -[NSXPCConnection invalidate](self->_attSiriSvcConn, "invalidate");
  attSiriSvcConn = self->_attSiriSvcConn;
  self->_attSiriSvcConn = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[CSAttSiriServiceClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSAttSiriServiceClient;
  -[CSAttSiriServiceClient dealloc](&v3, sel_dealloc);
}

- (void)_setupAttSiriSvcXpcConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *attSiriSvcConn;
  void *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.corespeechd.attsiri.service"), 4096);
  attSiriSvcConn = self->_attSiriSvcConn;
  self->_attSiriSvcConn = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF78B6A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_attSiriSvcConn, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF78B578);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_attSiriSvcConn, "setExportedInterface:", v6);

  -[NSXPCConnection setExportedObject:](self->_attSiriSvcConn, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v7 = self->_attSiriSvcConn;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke;
  v12[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
  v9 = self->_attSiriSvcConn;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke_72;
  v10[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v10);
  -[NSXPCConnection resume](self->_attSiriSvcConn, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)attSiriDidDetectAttendingTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  CSAttSiriServiceDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[CSAttSiriServiceClient attSiriDidDetectAttendingTrigger:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s triggerInfo: %@", (uint8_t *)&v12, 0x16u);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "attSiriDidDetectAttendingTrigger:", v4);

    }
  }

}

- (void)attSiriAttendingTimeoutTriggered
{
  NSObject *v3;
  CSAttSiriServiceDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CSAttSiriServiceClient attSiriAttendingTimeoutTriggered]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "attSiriAttendingTimeoutTriggered");

    }
  }
}

- (void)attSiriAttendingFailed
{
  NSObject *v3;
  CSAttSiriServiceDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CSAttSiriServiceClient attSiriAttendingFailed]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "attSiriAttendingFailed");

    }
  }
}

- (void)attSiriDidDetectContinuousConversation
{
  CSAttSiriServiceDelegate **p_delegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "attSiriDidDetectContinuousConversation");

    }
  }
}

- (void)attSiriDidStartAttending:(BOOL)a3 useLegacyModel:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  CSAttSiriServiceDelegate **p_delegate;
  id WeakRetained;
  void *v12;
  id v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  char v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v4 = a4;
  v5 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0D18F60];
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[CSAttSiriServiceClient attSiriDidStartAttending:useLegacyModel:]";
    v23 = 1024;
    v24 = v5;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s useGazeSignal:%u", (uint8_t *)&v21, 0x12u);
  }
  if (CSIsIOS())
  {
    if (v5)
    {
      v9 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315394;
        v22 = "-[CSAttSiriServiceClient attSiriDidStartAttending:useLegacyModel:]";
        v23 = 1024;
        v24 = v4;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s useLegacyGazeModel:%u", (uint8_t *)&v21, 0x12u);
      }
    }
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v13 = objc_loadWeakRetained((id *)p_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v15, "attSiriDidStartAttending:", v4);

    }
  }
  v16 = objc_loadWeakRetained((id *)p_delegate);
  if (v16)
  {
    v17 = v16;
    v18 = objc_loadWeakRetained((id *)p_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v20, "attSiriDidStartAttending");

    }
  }
}

- (CSAttSiriServiceDelegate)delegate
{
  return (CSAttSiriServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)attSiriSvcConn
{
  return self->_attSiriSvcConn;
}

- (void)setAttSiriSvcConn:(id)a3
{
  objc_storeStrong((id *)&self->_attSiriSvcConn, a3);
}

- (id)remoteSvcProxy
{
  return self->_remoteSvcProxy;
}

- (void)setRemoteSvcProxy:(id)a3
{
  objc_storeStrong(&self->_remoteSvcProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteSvcProxy, 0);
  objc_storeStrong((id *)&self->_attSiriSvcConn, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "attSiriSvcConn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "attSiriSvcConn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[CSAttSiriServiceClient _setupAttSiriSvcXpcConnection]_block_invoke";
    v10 = 2114;
    v11 = v4;
    v12 = 1026;
    v13 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", (uint8_t *)&v8, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "attSiriSvcConn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "attSiriSvcConn");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidate");

      objc_msgSend(WeakRetained, "setAttSiriSvcConn:", 0);
    }
  }

}

void __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke_72(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "attSiriSvcConn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "attSiriSvcConn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[CSAttSiriServiceClient _setupAttSiriSvcXpcConnection]_block_invoke";
    v9 = 2114;
    v10 = v4;
    v11 = 1026;
    v12 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", (uint8_t *)&v7, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "attSiriSvcConn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(WeakRetained, "setAttSiriSvcConn:", 0);
  }

}

void __30__CSAttSiriServiceClient_init__block_invoke(uint64_t a1, void *a2)
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
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[CSAttSiriServiceClient init]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get remote proxy object for AttSiriXPC: %@", (uint8_t *)&v4, 0x16u);
  }

}

@end
