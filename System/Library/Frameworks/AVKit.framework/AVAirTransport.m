@implementation AVAirTransport

- (id)_initPrivate
{
  AVAirTransport *v2;
  NSMutableArray *v3;
  NSMutableArray *outputQueue;
  NSMutableArray *v5;
  NSMutableArray *requestCompletions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAirTransport;
  v2 = -[AVAirTransport init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    outputQueue = v2->_outputQueue;
    v2->_outputQueue = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestCompletions = v2->_requestCompletions;
    v2->_requestCompletions = v5;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[AVAirTransport invalidate](self, "invalidate");
  _avairlog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[AVAirTransport dealloc]";
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s bye bye", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAirTransport;
  -[AVAirTransport dealloc](&v4, sel_dealloc);
}

- (void)close
{
  -[AVAirTransport invalidate](self, "invalidate");
  -[AVAirTransport terminatePendingRequests](self, "terminatePendingRequests");
}

- (id)description
{
  AVAirTransportDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;

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
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("nil");
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %p: delegate=%@>"), v13, self, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)requestCompletions
{
  return self->_requestCompletions;
}

- (void)terminatePendingRequests
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__AVAirTransport_terminatePendingRequests__block_invoke;
  v2[3] = &unk_1E5BB4CA0;
  v2[4] = self;
  -[AVAirTransport performOnAirChannelQueueSync:](self, "performOnAirChannelQueueSync:", v2);
}

- (int64_t)_writeData:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("_writeData must be implmemented by subclass"));
  return -1;
}

- (void)writeMore
{
  __int128 v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  __int128 v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (-[AVAirTransport canWrite](self, "canWrite"))
  {
    *(_QWORD *)&v3 = 136315138;
    v12 = v3;
    do
    {
      if (!-[NSMutableArray count](self->_outputQueue, "count", v12))
        return;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[NSMutableArray firstObject](self->_outputQueue, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = -[AVAirTransport _writeData:](self, "_writeData:", v4);
        _avairlog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "-[AVAirTransport writeMore]";
          v15 = 2048;
          v16 = v5;
          _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s wrote %ld bytes", buf, 0x16u);
        }

        if (v5 == objc_msgSend(v4, "length"))
        {
          -[NSMutableArray removeObject:](self->_outputQueue, "removeObject:", v4);
        }
        else
        {
          if (v5 < 1)
          {
            _avairlog();
            v8 = objc_claimAutoreleasedReturnValue();
            v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
            if (v5 < 0)
            {
              if (v9)
              {
                *(_DWORD *)buf = v12;
                v14 = "-[AVAirTransport writeMore]";
                v10 = v8;
                v11 = "%s write error occurred";
LABEL_16:
                _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
              }
            }
            else if (v9)
            {
              *(_DWORD *)buf = v12;
              v14 = "-[AVAirTransport writeMore]";
              v10 = v8;
              v11 = "%s write error: stream closed";
              goto LABEL_16;
            }

            goto LABEL_18;
          }
          objc_msgSend(v4, "subdataWithRange:", v5, objc_msgSend(v4, "length") - v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray setObject:atIndexedSubscript:](self->_outputQueue, "setObject:atIndexedSubscript:", v7, 0);

        }
      }
LABEL_18:
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");

    }
    while (-[AVAirTransport canWrite](self, "canWrite"));
  }
}

- (void)writeData:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _avairlog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[AVAirTransport writeData:]";
    v9 = 2048;
    v10 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s writing %ld bytes...", buf, 0x16u);
  }

  -[NSMutableArray addObject:](self->_outputQueue, "addObject:", v4);
  if (-[AVAirTransport canWrite](self, "canWrite"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__AVAirTransport_writeData___block_invoke;
    v6[3] = &unk_1E5BB4CA0;
    v6[4] = self;
    +[AVAirTransport performAsync:](AVAirTransport, "performAsync:", v6);
  }

}

- (BOOL)isReadyToSend
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("isReadyToSend should be implemented by subclass"));
  return 0;
}

- (void)performOnAirChannelQueueSync:(id)a3
{
  void *v3;
  NSObject *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  if (+[AVAirTransport _isRunningOnAirChannelQueue](AVAirTransport, "_isRunningOnAirChannelQueue"))
  {
    v5[2]();
  }
  else
  {
    v3 = (void *)objc_msgSend(v5, "copy");

    +[AVAirTransport airTransportQueue](AVAirTransport, "airTransportQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, v3);

    v5 = (void (**)(void))v3;
  }

}

- (void)sendObject:(id)a3 receiveResponse:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  -[AVAirTransport open](self, "open");
  +[AVAirTransport airTransportQueue](AVAirTransport, "airTransportQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AVAirTransport_sendObject_receiveResponse___block_invoke;
  block[3] = &unk_1E5BB4C38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)sendResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[AVAirTransport streamDataTransformer](self, "streamDataTransformer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataForMessage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (objc_msgSend(v6, "length"))
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __31__AVAirTransport_sendResponse___block_invoke;
        v8[3] = &unk_1E5BB3D20;
        v8[4] = self;
        v9 = v6;
        +[AVAirTransport performSync:](AVAirTransport, "performSync:", v8);

      }
    }
    else
    {
      _avairlog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[AVAirTransport sendResponse:]";
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s failed to transform response object (%@)", buf, 0x16u);
      }

    }
  }

}

- (AVAirTransportTransformationProtocol)streamDataTransformer
{
  return self->_streamDataTransformer;
}

- (void)setStreamDataTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_streamDataTransformer, a3);
}

- (AVAirTransportDelegate)delegate
{
  return (AVAirTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)receiveResponseBlocks
{
  return self->_receiveResponseBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveResponseBlocks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamDataTransformer, 0);
  objc_storeStrong((id *)&self->_requestCompletions, 0);
  objc_storeStrong((id *)&self->_leftoverInputData, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
}

uint64_t __31__AVAirTransport_sendResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeData:", *(_QWORD *)(a1 + 40));
}

void __45__AVAirTransport_sendObject_receiveResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "streamDataTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "receiveResponseBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1AF43E9B8](*(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "addObject:", v5);

    _avairlog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[AVAirTransport sendObject:receiveResponse:]_block_invoke";
      v14 = 2048;
      v15 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s sending %ld bytes...", buf, 0x16u);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__AVAirTransport_sendObject_receiveResponse___block_invoke_121;
    v10[3] = &unk_1E5BB3D20;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    +[AVAirTransport performSync:](AVAirTransport, "performSync:", v10);
    _avairlog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[AVAirTransport sendObject:receiveResponse:]_block_invoke_2";
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s ...succeeded, now waiting for/reading the response...", buf, 0xCu);
    }

  }
  else
  {
    _avairlog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v13 = "-[AVAirTransport sendObject:receiveResponse:]_block_invoke";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s failed to transform message object (%@)", buf, 0x16u);
    }

  }
}

uint64_t __45__AVAirTransport_sendObject_receiveResponse___block_invoke_121(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeData:", *(_QWORD *)(a1 + 40));
}

uint64_t __28__AVAirTransport_writeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeMore");
}

void __42__AVAirTransport_terminatePendingRequests__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "receiveResponseBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        _avairlog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "-[AVAirTransport terminatePendingRequests]_block_invoke";
          _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s response never received", buf, 0xCu);
        }

        (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, 0, -3);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "receiveResponseBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

+ (void)startEventThreadIfNecessary
{
  if (startEventThreadIfNecessary_onceToken != -1)
    dispatch_once(&startEventThreadIfNecessary_onceToken, &__block_literal_global_5426);
}

+ (void)__performBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

+ (void)performSync:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (isRunningEventThread())
  {
    v6[2]();
  }
  else
  {
    v4 = _eventThread;
    v5 = MEMORY[0x1AF43E9B8](v6);

    objc_msgSend(a1, "performSelector:onThread:withObject:waitUntilDone:", sel___performBlock_, v4, v5, 1);
    v6 = (void (**)(void))v5;
  }

}

+ (void)performAsync:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  v4 = _eventThread;
  v5 = (void *)MEMORY[0x1AF43E9B8]();
  objc_msgSend(a1, "performSelector:onThread:withObject:waitUntilDone:", sel___performBlock_, v4, v5, 0);

}

+ (NSThread)eventThread
{
  return (NSThread *)(id)_eventThread;
}

+ (NSRunLoop)eventRunLoop
{
  objc_msgSend(a1, "startEventThreadIfNecessary");
  return (NSRunLoop *)(id)_eventRunLoop;
}

+ (id)airTransportQueue
{
  if (airTransportQueue_onceToken != -1)
    dispatch_once(&airTransportQueue_onceToken, &__block_literal_global_106);
  return (id)airTransportQueue__queue;
}

+ (BOOL)_isRunningOnAirChannelQueue
{
  return dispatch_get_specific((const void *)AirChannelQueueSpecificKey) == (void *)AirChannelQueueIsCurrentValue;
}

void __35__AVAirTransport_airTransportQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.avkit.AirChannel", attr);
  v2 = (void *)airTransportQueue__queue;
  airTransportQueue__queue = (uint64_t)v1;

  dispatch_queue_set_specific((dispatch_queue_t)airTransportQueue__queue, (const void *)AirChannelQueueSpecificKey, (void *)AirChannelQueueIsCurrentValue, 0);
}

uint64_t __45__AVAirTransport_startEventThreadIfNecessary__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithBlock:", &__block_literal_global_93_5427);
  v1 = (void *)_eventThread;
  _eventThread = v0;

  objc_msgSend((id)_eventThread, "setName:", CFSTR("com.apple.avkit.AirChannel"));
  objc_msgSend((id)_eventThread, "start");
  return +[AVAirTransport performSync:](AVAirTransport, "performSync:", &__block_literal_global_103_5429);
}

void __45__AVAirTransport_startEventThreadIfNecessary__block_invoke_102()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_eventRunLoop;
  _eventRunLoop = v0;

}

void __45__AVAirTransport_startEventThreadIfNecessary__block_invoke_2()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1AF43E7CC]();
  _avairlog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "+[AVAirTransport startEventThreadIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1AC4B1000, v1, OS_LOG_TYPE_DEFAULT, "%s Starting event thread..", (uint8_t *)&v9, 0xCu);
  }

  v2 = (void *)MEMORY[0x1E0C99E88];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  objc_msgSend(v2, "timerWithTimeInterval:repeats:block:", 1, &__block_literal_global_98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTimer:forMode:", v4, *MEMORY[0x1E0C99860]);

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "run");

  _avairlog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "+[AVAirTransport startEventThreadIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s Ending event thread..", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)_eventThread;
  _eventThread = 0;

  objc_autoreleasePoolPop(v0);
}

+ (id)channelWithInput:(id)a3 output:(id)a4
{
  id v5;
  id v6;
  AVAirTransportStreams *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AVAirTransportStreams initWithInput:output:]([AVAirTransportStreams alloc], "initWithInput:output:", v6, v5);

  return v7;
}

@end
