@implementation AVAirMessageNotificationCenter

- (AVAirMessageNotificationCenter)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("do not create your own AVAirMessageNotificationCenter"));

  return 0;
}

- (id)_initPrivate
{
  AVAirMessageNotificationCenter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableSet *activeChannels;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAirMessageNotificationCenter;
  v2 = -[AVAirMessageNotificationCenter init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.avkit.AirMessageNotificationCenter", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    activeChannels = v2->_activeChannels;
    v2->_activeChannels = (NSMutableSet *)v5;

    -[AVBonjourService setDelegate:](v2->_mainService, "setDelegate:", v2);
    +[AVAirMessageParts registerClass:forMessageVersion:](AVAirMessageParts, "registerClass:forMessageVersion:", objc_opt_class(), CFSTR("AVKitAir/1"));
    +[AVAirMessageParts registerClass:forMessageVersion:](AVAirMessageParts, "registerClass:forMessageVersion:", objc_opt_class(), CFSTR("AVKitAirResponse/1"));
    -[AVBonjourService start](v2->_mainService, "start");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AVAirMessageNotificationCenter stop](self, "stop");
  -[AVBonjourService stop](self->_mainService, "stop");
  v3.receiver = self;
  v3.super_class = (Class)AVAirMessageNotificationCenter;
  -[AVAirMessageNotificationCenter dealloc](&v3, sel_dealloc);
}

- (void)start
{
  if (!self->_started)
    self->_started = 1;
}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_started)
  {
    -[AVAirMessageNotificationCenter activeChannels](self, "activeChannels");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAirMessageNotificationCenter setActiveChannels:](self, "setActiveChannels:", v5);

    self->_started = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "invalidate", (_QWORD)v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)playerItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    -[AVAirMessageNotificationCenter nowPlayingPlayerItem](self, "nowPlayingPlayerItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "avkitACMIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v4))
        v8 = v6;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)handleCommandMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(a4, "copy");
  -[AVAirMessageNotificationCenter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _avairlog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[AVAirMessageNotificationCenter handleCommandMessage:completion:]";
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s received message %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v10 = objc_msgSend(v6, "type");
    if (v10 <= 209)
    {
      if (v10 != 100 && v10 != 200)
        goto LABEL_13;
    }
    else if (v10 != 210 && v10 != 400 && v10 != 300)
    {
LABEL_13:
      v7[2](v7, -1999, 0);
      goto LABEL_14;
    }
    -[AVAirMessageNotificationCenter delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "airTrafficController:didReceiveMessage:completion:", self, v6, v7);

  }
  else
  {
    v7[2](v7, -1, 0);
  }
LABEL_14:

}

- (void)bonjourService:(id)a3 didAcceptConnectionChannel:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _avairlog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[AVAirMessageNotificationCenter activeChannels](self, "activeChannels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[AVAirMessageNotificationCenter bonjourService:didAcceptConnectionChannel:]";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s new channel %@; activeChannels has %@",
      (uint8_t *)&v10,
      0x20u);

  }
  -[AVAirMessageNotificationCenter activeChannels](self, "activeChannels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v5);

  +[AVDataValueTransformer messageTransformerWithClass:](AVDataValueTransformer, "messageTransformerWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStreamDataTransformer:", v9);

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "open");

}

- (id)bonjourServiceAdditionalTXTRecordInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[AVAirMessageNotificationCenter delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "airTrafficControllerCurrentItemIdentifier:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v8 = CFSTR("currentItemIdentifier");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)bonjourService:(id)a3 didCloseChannel:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _avairlog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVAirMessageNotificationCenter bonjourService:didCloseChannel:]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v5, "setDelegate:", 0);
  objc_msgSend(v5, "close");
  -[AVAirMessageNotificationCenter activeChannels](self, "activeChannels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

}

- (void)airTransport:(id)a3 didReceiveObject:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  char isKindOfClass;
  _BOOL4 v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AVAirMessageNotificationCenter activeChannels](self, "activeChannels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (!v9)
  {
    _avairlog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly received object from inactive channel (%@)", buf, 0x16u);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    -[NSObject airMessage](v10, "airMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __64__AVAirMessageNotificationCenter_airTransport_didReceiveObject___block_invoke;
        v18[3] = &unk_1E5BB0BB8;
        v19 = v6;
        -[AVAirMessageNotificationCenter handleCommandMessage:completion:](self, "handleCommandMessage:completion:", v11, v18);
        v12 = v19;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      _avairlog();
      v12 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if ((isKindOfClass & 1) != 0)
      {
        if (!v17)
          goto LABEL_17;
        *(_DWORD *)buf = 136315138;
        v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
        v13 = "%s unexpectedly received a response -- expected a message only";
      }
      else
      {
        if (!v17)
          goto LABEL_17;
        *(_DWORD *)buf = 136315138;
        v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
        v13 = "%s I just received something, I know not what";
      }
      v14 = v12;
      v15 = 12;
    }
    else
    {
      _avairlog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      *(_DWORD *)buf = 136315394;
      v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
      v22 = 2114;
      v23 = v10;
      v13 = "%s unable to receive message : %{public}@";
      v14 = v12;
      v15 = 22;
    }
    _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_17;
  }
LABEL_19:

}

- (void)airTransportInputDidClose:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVAirMessageNotificationCenter activeChannels](self, "activeChannels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    _avairlog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[AVAirMessageNotificationCenter airTransportInputDidClose:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s Removing channel from active list (%@)", (uint8_t *)&v9, 0x16u);
    }

    -[AVAirMessageNotificationCenter activeChannels](self, "activeChannels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v4);

  }
}

- (AVAirMessageNotificationCenterDelegate)delegate
{
  return (AVAirMessageNotificationCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVBonjourService)mainService
{
  return self->_mainService;
}

- (AVPlayerItem)nowPlayingPlayerItem
{
  return self->_nowPlayingPlayerItem;
}

- (void)setNowPlayingPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingPlayerItem, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)activeChannels
{
  return self->_activeChannels;
}

- (void)setActiveChannels:(id)a3
{
  objc_storeStrong((id *)&self->_activeChannels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeChannels, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nowPlayingPlayerItem, 0);
  objc_storeStrong((id *)&self->_mainService, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__AVAirMessageNotificationCenter_airTransport_didReceiveObject___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  AVAirMessageResponse *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]_block_invoke";
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s responding with result %d", (uint8_t *)&v6, 0x12u);
  }

  v5 = -[AVAirMessageResponse initWithStatus:localizedDescription:]([AVAirMessageResponse alloc], "initWithStatus:localizedDescription:", a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "sendResponse:", v5);

}

+ (BOOL)_isNotificationCenterEnabled
{
  +[AVAirMessage isAirMessagingEnabled](AVAirMessage, "isAirMessagingEnabled");
  return 0;
}

+ (void)prepare
{
  if (prepare_onceToken != -1)
    dispatch_once(&prepare_onceToken, &__block_literal_global_1610);
}

+ (BOOL)isPrepared
{
  return _shared != 0;
}

+ (id)shared
{
  return (id)_shared;
}

void __41__AVAirMessageNotificationCenter_prepare__block_invoke()
{
  id v0;
  void *v1;

  if (+[AVAirMessageNotificationCenter _isNotificationCenterEnabled](AVAirMessageNotificationCenter, "_isNotificationCenterEnabled"))
  {
    v0 = -[AVAirMessageNotificationCenter _initPrivate]([AVAirMessageNotificationCenter alloc], "_initPrivate");
    v1 = (void *)_shared;
    _shared = (uint64_t)v0;

  }
}

@end
