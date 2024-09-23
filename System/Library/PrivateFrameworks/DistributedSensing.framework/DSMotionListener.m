@implementation DSMotionListener

- (DSMotionListener)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  DSMotionListener *v8;
  OS_dispatch_queue *v9;
  NSObject *clientQueue;
  const char *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *v13;
  DSClientMotionDataOptions *v14;
  DSClientMotionDataOptions *motionDataOptions;
  uint64_t v16;
  DSMotionStateListenerProxy *sharedListener;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DSMotionListener;
  v8 = -[DSMotionListener init](&v19, sel_init);
  if (v8)
  {
    if (v7)
    {
      v9 = (OS_dispatch_queue *)v7;
      clientQueue = v8->_clientQueue;
      v8->_clientQueue = v9;
    }
    else
    {
      v11 = (const char *)objc_msgSend(CFSTR("com.apple.distributedsensing.clientQueue"), "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      clientQueue = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_queue_create(v11, clientQueue);
      v13 = v8->_clientQueue;
      v8->_clientQueue = (OS_dispatch_queue *)v12;

    }
    v8->_isSubscribed = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    v14 = objc_alloc_init(DSClientMotionDataOptions);
    motionDataOptions = v8->_motionDataOptions;
    v8->_motionDataOptions = v14;

    v8->_isTestMode = 0;
    +[DSMotionStateListenerProxy sharedInstance](DSMotionStateListenerProxy, "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    sharedListener = v8->_sharedListener;
    v8->_sharedListener = (DSMotionStateListenerProxy *)v16;

  }
  return v8;
}

- (NSArray)activeProviders
{
  return -[DSListener activeProviders](self->_sharedListener, "activeProviders");
}

- (void)startMotionDataListenerWithOptions:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  const __CFString **v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FC8];
    v22[0] = CFSTR("Unsupported feature");
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (const __CFString **)v22;
    v11 = &v21;
LABEL_14:
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    v14 = 5;
LABEL_15:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSMotionListener failedToStartListenerWithError:](self, "failedToStartListenerWithError:", v15);
    goto LABEL_16;
  }
  v5 = objc_msgSend(v4, "deviceType");
  v6 = objc_msgSend(v4, "dataSubType");
  if ((v5 & 2) != 0)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0FC8];
    v20 = CFSTR("Unrelated devices not supported");
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v20;
    v11 = &v19;
    goto LABEL_14;
  }
  v7 = v6;
  if ((v5 & 1) != 0)
    -[DSClientMotionDataOptions setDeviceType:](self->_motionDataOptions, "setDeviceType:", -[DSClientMotionDataOptions deviceType](self->_motionDataOptions, "deviceType") | 1);
  if ((v7 & 1) != 0)
    -[DSClientMotionDataOptions setDataSubType:](self->_motionDataOptions, "setDataSubType:", -[DSClientMotionDataOptions dataSubType](self->_motionDataOptions, "dataSubType") | 1);
  if (!-[DSClientMotionDataOptions dataSubType](self->_motionDataOptions, "dataSubType")
    || !-[DSClientMotionDataOptions deviceType](self->_motionDataOptions, "deviceType"))
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18 = CFSTR("Invalid options");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    v14 = 2;
    goto LABEL_15;
  }
  if (self->_isTestMode)
    -[DSListener setIsTestMode:](self->_sharedListener, "setIsTestMode:", 1);
  -[DSMotionStateListenerProxy startMotionStateListenerWithObserver:](self->_sharedListener, "startMotionStateListenerWithObserver:", self);
LABEL_16:

}

- (void)stopMotionDataListener
{
  id v3;

  if (-[DSMotionListener isSubscribed](self, "isSubscribed"))
  {
    -[DSMotionListener sharedListener](self, "sharedListener");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopMotionStateListenerWithObserver:", self);

  }
}

- (void)requestMotionData
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!-[DSMotionListener isSubscribed](self, "isSubscribed"))
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dsLogger");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSMotionListener] can't request motion data before listener is started\n", v5, 2u);
    }

  }
  -[DSMotionStateListenerProxy requestMotionState](self->_sharedListener, "requestMotionState");
}

- (void)failedToStartListenerWithError:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__DSMotionListener_failedToStartListenerWithError___block_invoke;
  v7[3] = &unk_24D9110F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __51__DSMotionListener_failedToStartListenerWithError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dsmotion:didFailToStartListenerWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)startedListener
{
  NSObject *clientQueue;
  _QWORD block[5];

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__DSMotionListener_startedListener__block_invoke;
  block[3] = &unk_24D9109C0;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

void __35__DSMotionListener_startedListener__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setIsSubscribed:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dsmotionDidStartListener:", *(_QWORD *)(a1 + 32));

  }
}

- (void)receivedData:(id)a3 fromProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__DSMotionListener_receivedData_fromProvider___block_invoke;
  block[3] = &unk_24D910EA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __46__DSMotionListener_receivedData_fromProvider___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isSubscribed") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dsmotion:didReceiveMotionData:fromProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    }
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dsLogger");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "[DSMotionListner] recieved data when not subscribed\n", buf, 2u);
    }

  }
}

- (void)updateProviders:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__DSMotionListener_updateProviders___block_invoke;
  v7[3] = &unk_24D9110F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __36__DSMotionListener_updateProviders___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isSubscribed") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dsmotion:didUpdateProviders:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dsLogger");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "[DSMotionListner] recieved updated provider list when not subscribed\n", buf, 2u);
    }

  }
}

- (void)stoppedListener
{
  NSObject *clientQueue;
  _QWORD block[5];

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__DSMotionListener_stoppedListener__block_invoke;
  block[3] = &unk_24D9109C0;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

void __35__DSMotionListener_stoppedListener__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setIsSubscribed:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dsmotionDidStopListener:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)isTestMode
{
  return self->_isTestMode;
}

- (void)setIsTestMode:(BOOL)a3
{
  self->_isTestMode = a3;
}

- (DSClientMotionDataOptions)motionDataOptions
{
  return self->_motionDataOptions;
}

- (void)setMotionDataOptions:(id)a3
{
  objc_storeStrong((id *)&self->_motionDataOptions, a3);
}

- (DSMotionListenerDelegate)delegate
{
  return (DSMotionListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (DSMotionStateListenerProxy)sharedListener
{
  return self->_sharedListener;
}

- (void)setSharedListener:(id)a3
{
  objc_storeStrong((id *)&self->_sharedListener, a3);
}

- (BOOL)isSubscribed
{
  return self->_isSubscribed;
}

- (void)setIsSubscribed:(BOOL)a3
{
  self->_isSubscribed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedListener, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_motionDataOptions, 0);
}

@end
