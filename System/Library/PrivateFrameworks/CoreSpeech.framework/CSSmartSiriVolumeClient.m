@implementation CSSmartSiriVolumeClient

- (CSSmartSiriVolumeClient)init
{
  CSSmartSiriVolumeClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CSSmartSiriVolumeClient;
  v2 = -[CSSmartSiriVolumeClient init](&v7, sel_init);
  if (v2)
  {
    CSLogInitIfNeeded();
    v3 = dispatch_queue_create("com.apple.CoreSpeech.Connection.Listener", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSmartSiriVolumeClient init]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating SmartSiriVolume connection", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *ssvConnection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_ssvConnection, "invalidate");
  ssvConnection = self->_ssvConnection;
  self->_ssvConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSSmartSiriVolumeClient;
  -[CSSmartSiriVolumeClient dealloc](&v4, sel_dealloc);
}

- (id)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3680;
  v19 = __Block_byref_object_dispose__3681;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke;
  v11[3] = &unk_1E7C26290;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a3;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  NSObject *queue;
  _QWORD v4[5];
  float v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CSSmartSiriVolumeClient_setSmartSiriVolumePercentage___block_invoke;
  v4[3] = &unk_1E7C27848;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CSSmartSiriVolumeClient_setSmartSiriVolumeDirection___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CSSmartSiriVolumeClient_setPermanentVolumeOffsetWithDirection___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)didTTSVolumeChangeForReason:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CSSmartSiriVolumeClient_didTTSVolumeChangeForReason___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)_getRemoteServiceProxyObject
{
  NSXPCConnection *ssvConnection;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ssvConnection = self->_ssvConnection;
  if (ssvConnection
    || (-[CSSmartSiriVolumeClient _createClientConnection](self, "_createClientConnection"),
        (ssvConnection = self->_ssvConnection) != 0))
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](ssvConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3672);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CSSmartSiriVolumeClient _getRemoteServiceProxyObject]";
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s ERR: SmartSiriVolume ssvConnection is nil", (uint8_t *)&v6, 0xCu);
    }
    return 0;
  }
}

- (void)_createClientConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *ssvConnection;
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

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.corespeechd.ssv.service"), 4096);
  ssvConnection = self->_ssvConnection;
  self->_ssvConnection = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C5690);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_ssvConnection, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF790940);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_ssvConnection, "setExportedInterface:", v6);

  -[NSXPCConnection setExportedObject:](self->_ssvConnection, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v7 = self->_ssvConnection;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke;
  v12[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
  v9 = self->_ssvConnection;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_2;
  v10[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v10);
  -[NSXPCConnection resume](self->_ssvConnection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (CSSmartSiriVolumeClientDelegate)delegate
{
  return (CSSmartSiriVolumeClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)ssvConnection
{
  return self->_ssvConnection;
}

- (void)setSsvConnection:(id)a3
{
  objc_storeStrong((id *)&self->_ssvConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ssvConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke(uint64_t a1)
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
  v2 = (void *)*MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "ssvConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "ssvConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSSmartSiriVolumeClient _createClientConnection]_block_invoke";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ssvConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_21;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

void __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_2(uint64_t a1)
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
  v2 = (void *)*MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "ssvConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "ssvConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSSmartSiriVolumeClient _createClientConnection]_block_invoke_2";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ssvConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_22;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

uint64_t __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSsvConnection:", 0);
}

uint64_t __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_21(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "ssvConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setSsvConnection:", 0);
}

void __55__CSSmartSiriVolumeClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)*MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = objc_msgSend(v2, "code");
      objc_msgSend(v2, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315650;
      v8 = "-[CSSmartSiriVolumeClient _getRemoteServiceProxyObject]_block_invoke";
      v9 = 2050;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s ERR: SmartSiriVolume Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v7, 0x20u);

    }
  }

}

void __55__CSSmartSiriVolumeClient_didTTSVolumeChangeForReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v9 = 136315394;
    v10 = "-[CSSmartSiriVolumeClient didTTSVolumeChangeForReason:]_block_invoke";
    v11 = 1026;
    v12 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume didChangeForReason: %{public}d", (uint8_t *)&v9, 0x12u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v8, "didSmartSiriVolumeChangeForReason:", *(_QWORD *)(a1 + 40));

    }
  }
}

void __65__CSSmartSiriVolumeClient_setPermanentVolumeOffsetWithDirection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setPermanentVolumeOffsetWithDirection:", *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    v4 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSSmartSiriVolumeClient setPermanentVolumeOffsetWithDirection:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __55__CSSmartSiriVolumeClient_setSmartSiriVolumeDirection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setSmartSiriVolumeDirection:", *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    v4 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSSmartSiriVolumeClient setSmartSiriVolumeDirection:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __56__CSSmartSiriVolumeClient_setSmartSiriVolumePercentage___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 40);
    objc_msgSend(v2, "setSmartSiriVolumePercentage:", v3);
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CSSmartSiriVolumeClient setSmartSiriVolumePercentage:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", (uint8_t *)&v6, 0xCu);
    }
  }

}

void __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke_3;
    v7[3] = &unk_1E7C245C8;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 56);
    v7[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "getVolumeForTTSType:withContext:reply:", v5, v4, v7);
  }
  else
  {
    v6 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSmartSiriVolumeClient getVolumeForTTSType:withContext:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", buf, 0xCu);
    }
  }

}

void __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[CSSmartSiriVolumeClient getVolumeForTTSType:withContext:]_block_invoke";
      v10 = 2114;
      v11 = v6;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Failed to get estimate with %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

@end
