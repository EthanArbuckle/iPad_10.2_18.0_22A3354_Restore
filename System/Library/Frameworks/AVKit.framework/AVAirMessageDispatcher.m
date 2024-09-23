@implementation AVAirMessageDispatcher

uint64_t __32__AVAirMessageDispatcher_shared__block_invoke()
{
  AVAirMessageDispatcher *v0;
  void *v1;

  v0 = objc_alloc_init(AVAirMessageDispatcher);
  v1 = (void *)shared__shared;
  shared__shared = (uint64_t)v0;

  +[AVAirMessageParts registerClass:forMessageVersion:](AVAirMessageParts, "registerClass:forMessageVersion:", objc_opt_class(), CFSTR("AVKitAir/1"));
  return +[AVAirMessageParts registerClass:forMessageVersion:](AVAirMessageParts, "registerClass:forMessageVersion:", objc_opt_class(), CFSTR("AVKitAirResponse/1"));
}

- (AVAirMessageDispatcher)init
{
  AVAirMessageDispatcher *v3;
  AVBonjourServiceClient *v4;
  AVBonjourServiceClient *bonjourServiceClient;
  AVAirMessageDispatcher *v6;
  objc_super v8;

  if (+[AVAirMessageDispatcher _isDispatcherEnabled](AVAirMessageDispatcher, "_isDispatcherEnabled"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVAirMessageDispatcher;
    v3 = -[AVAirMessageDispatcher init](&v8, sel_init);
    if (v3)
    {
      v4 = -[AVBonjourServiceClient initWithNetServiceType:]([AVBonjourServiceClient alloc], "initWithNetServiceType:", CFSTR("_avairtvui._tcp."));
      bonjourServiceClient = v3->_bonjourServiceClient;
      v3->_bonjourServiceClient = v4;

      -[AVBonjourServiceClient setDelegate:](v3->_bonjourServiceClient, "setDelegate:", v3);
      -[AVBonjourServiceClient beginDiscovery](v3->_bonjourServiceClient, "beginDiscovery");
    }
    self = v3;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourServiceClient, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_currentNetService, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)shared
{
  if (shared_onceToken[0] != -1)
    dispatch_once(shared_onceToken, &__block_literal_global_5556);
  return (id)shared__shared;
}

+ (BOOL)_isDispatcherEnabled
{
  return +[AVAirMessage isAirMessagingEnabled](AVAirMessage, "isAirMessagingEnabled");
}

- (NSString)description
{
  AVAirMessageDispatcherClientDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p>"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAirMessageDispatcher bonjourServiceClient](self, "bonjourServiceClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAirMessageDispatcher channel](self, "channel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %p: serviceClient=%@, channel=%@; delegate=%@>"),
    v13,
    self,
    v14,
    v15,
    v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (BOOL)haveAirPlayService
{
  void *v2;
  BOOL v3;

  -[AVAirMessageDispatcher channel](self, "channel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(a4, "copy");
  -[AVAirMessageDispatcher channel](self, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AVAirMessageDispatcher channel](self, "channel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isReadyToSend");

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _avairlog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[AVAirMessageDispatcher sendMessage:completion:]";
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s telling channel to sendObject (%@)", buf, 0x16u);
      }

      -[AVAirMessageDispatcher channel](self, "channel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __49__AVAirMessageDispatcher_sendMessage_completion___block_invoke;
      v16[3] = &unk_1E5BB1698;
      v17 = v7;
      objc_msgSend(v13, "sendObject:receiveResponse:", v6, v16);

    }
    else
    {
      _avairlog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[AVAirMessageDispatcher sendMessage:completion:]";
        _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "%s cannot send message yet; please wait for output stream to finish opening!",
          buf,
          0xCu);
      }

      v7[2](v7, 0, -1903);
    }
  }
  else
  {
    _avairlog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[AVAirMessageDispatcher sendMessage:completion:]";
      _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s cannot send message; we don't have a channel to the AirPlay receiver (if there is one).",
        buf,
        0xCu);
    }

    v7[2](v7, 0, -1901);
  }

}

- (void)didConnectToBonjourService:(id)a3 channel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _avairlog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AVAirMessageDispatcher delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[AVAirMessageDispatcher didConnectToBonjourService:channel:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s channel = %@; delegate = %@", (uint8_t *)&v13, 0x20u);

  }
  -[AVAirMessageDispatcher setCurrentNetService:](self, "setCurrentNetService:", v7);

  +[AVDataValueTransformer messageTransformerWithClass:](AVDataValueTransformer, "messageTransformerWithClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStreamDataTransformer:", v10);

  objc_msgSend(v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _avairlog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[AVAirMessageDispatcher didConnectToBonjourService:channel:]";
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s the channel.delegate is already set", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(v6, "setDelegate:", self);
  -[AVAirMessageDispatcher setChannel:](self, "setChannel:", v6);
  objc_msgSend(v6, "open");

}

- (void)airTransportOutputDidOpen:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[AVAirMessageDispatcher airTransportOutputDidOpen:]";
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  -[AVAirMessageDispatcher delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didChangeTargetForAirMessageDispatcher:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("AVAirMessageDispatcherDidChangeTargetNotification"), self);

}

- (void)airTransportInputDidClose:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AVAirMessageDispatcher airTransportInputDidClose:]";
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

}

- (void)airTransport:(id)a3 didReceiveObject:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[AVAirMessageDispatcher airTransport:didReceiveObject:]";
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s (call unexpected! message will be dropped)", (uint8_t *)&v5, 0xCu);
  }

}

- (AVAirMessageDispatcherClientDelegate)delegate
{
  return (AVAirMessageDispatcherClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNetService)currentNetService
{
  return self->_currentNetService;
}

- (void)setCurrentNetService:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetService, a3);
}

- (AVAirTransport)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (AVBonjourServiceClient)bonjourServiceClient
{
  return self->_bonjourServiceClient;
}

void __49__AVAirMessageDispatcher_sendMessage_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _avairlog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[AVAirMessageDispatcher sendMessage:completion:]_block_invoke";
    v13 = 1024;
    v14 = a3;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s sendObject completed with status = %d; response message: %@",
      (uint8_t *)&v11,
      0x1Cu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  if ((objc_msgSend(v8, "isIncomplete") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "airMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
      objc_msgSend(v10, "status");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
