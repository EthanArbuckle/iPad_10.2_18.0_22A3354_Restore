@implementation CSAudioPowerServiceClient

- (CSAudioPowerServiceClient)initWithQueue:(id)a3 frequency:(int64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  CSAudioPowerServiceClient *v11;
  CSAudioPowerServiceClient *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioPowerServiceClient;
  v11 = -[CSAudioPowerServiceClient init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    v12->_frequency = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)beginUpdate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSAudioPowerServiceClient_beginUpdate__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endUpdate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSAudioPowerServiceClient_endUpdate__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CSAudioPowerServiceClient_invalidate__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_beginUpdate
{
  NSObject *v3;
  int64_t frequency;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *timer;
  NSObject *v10;
  _QWORD handler[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    frequency = self->_frequency;
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSAudioPowerServiceClient _beginUpdate]";
    v15 = 2048;
    v16 = frequency;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Begin power update with frequency : %ld", buf, 0x16u);
  }
  v5 = +[CSAudioPowerServiceClient _getTimeIntervalFromFrequency:](CSAudioPowerServiceClient, "_getTimeIntervalFromFrequency:", self->_frequency);
  if (self->_timer)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    v7 = v5;
    v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v8;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, v7, 0);
    objc_initWeak((id *)buf, self);
    v10 = self->_timer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __41__CSAudioPowerServiceClient__beginUpdate__block_invoke;
    handler[3] = &unk_1E6880FD0;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_endUpdate
{
  NSObject *v3;
  NSObject *timer;
  OS_dispatch_source *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSAudioPowerServiceClient _endUpdate]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v5 = self->_timer;
    self->_timer = 0;

  }
}

- (void)_invalidate
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CSAudioPowerServiceClient _endUpdate](self, "_endUpdate");
  objc_storeWeak((id *)&self->_delegate, 0);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection setInvalidationHandler:](xpcConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;

    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSAudioPowerServiceClient _invalidate]";
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s XPC connection invalidated", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_fetchPowerLevels
{
  void *v3;
  _QWORD v4[5];

  -[CSAudioPowerServiceClient _service](self, "_service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CSAudioPowerServiceClient__fetchPowerLevels__block_invoke;
  v4[3] = &unk_1E687FCE8;
  v4[4] = self;
  objc_msgSend(v3, "getAudioPowerUpdateWithCompletion:", v4);

}

- (id)_newConnection
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.audiopowerupdate.xpc"), 0);
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF119A28);
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "setExportedObject:", self);
  objc_msgSend(v3, "_setQueue:", self->_queue);
  return v3;
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSAudioPowerServiceClient _connection]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection...", buf, 0xCu);
    }
    v5 = -[CSAudioPowerServiceClient _newConnection](self, "_newConnection");
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    objc_initWeak((id *)buf, self);
    v7 = self->_xpcConnection;
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__CSAudioPowerServiceClient__connection__block_invoke;
    v16[3] = &unk_1E6880FD0;
    objc_copyWeak(&v17, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v16);
    v9 = self->_xpcConnection;
    v11 = v8;
    v12 = 3221225472;
    v13 = __40__CSAudioPowerServiceClient__connection__block_invoke_3;
    v14 = &unk_1E6880FD0;
    objc_copyWeak(&v15, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", &v11);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (id)_service
{
  void *v2;
  void *v3;

  -[CSAudioPowerServiceClient _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__CSAudioPowerServiceClient__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAudioPowerServiceClient _connection]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("com.apple.siri.audiopowerupdate.xpc");
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 5), "invalidate");
    v5 = (void *)v4[5];
    v4[5] = 0;

  }
}

void __40__CSAudioPowerServiceClient__connection__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAudioPowerServiceClient _connection]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("com.apple.siri.audiopowerupdate.xpc");
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 5);
    *((_QWORD *)WeakRetained + 5) = 0;

  }
}

void __46__CSAudioPowerServiceClient__fetchPowerLevels__block_invoke(uint64_t a1, uint64_t a2, float a3, float a4)
{
  id WeakRetained;
  double v9;
  double v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    *(float *)&v9 = a3;
    *(float *)&v10 = a4;
    objc_msgSend(v11, "audioPowerDidUpdateWithType:averagePower:peakPower:", a2, v9, v10);

  }
}

void __41__CSAudioPowerServiceClient__beginUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

uint64_t __39__CSAudioPowerServiceClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __38__CSAudioPowerServiceClient_endUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endUpdate");
}

uint64_t __40__CSAudioPowerServiceClient_beginUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginUpdate");
}

+ (unint64_t)_getTimeIntervalFromFrequency:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_1B50D7550[a3 - 1];
}

@end
