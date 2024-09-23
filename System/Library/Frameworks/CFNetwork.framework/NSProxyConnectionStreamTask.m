@implementation NSProxyConnectionStreamTask

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  NSOutputStream *v6;
  id WeakRetained;
  NSObject *v8;
  NSString *host;
  int port;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (NSOutputStream *)a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  else
    WeakRetained = 0;
  if ((NSOutputStream *)self->_inputStream == v6)
  {
    switch(a4)
    {
      case 0x10uLL:
        objc_msgSend(WeakRetained, "outboundConnectionCompleteWithError:", 0);
        break;
      case 8uLL:
        -[NSOutputStream streamError](v6, "streamError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "outboundConnectionCompleteWithError:", objc_msgSend(v11, "code"));

        break;
      case 2uLL:
        if (self->super._pendingWrites < 31)
          -[NSProxyConnectionStreamTask readFromStream]((uint64_t)self);
        else
          self->_dataAvailableForReading = 1;
        break;
    }
  }
  else if (a4 == 1 && self->_outputStream == v6)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v8 = (id)CFNLog::logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      host = self->_host;
      port = self->_port;
      v12 = 138412546;
      v13 = host;
      v14 = 1024;
      v15 = port;
      _os_log_impl(&dword_183ECA000, v8, OS_LOG_TYPE_DEFAULT, "Connected to: %@:%d", (uint8_t *)&v12, 0x12u);
    }

    objc_msgSend(WeakRetained, "connected:", 0);
  }

}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  NSInputStream *v8;
  NSOutputStream *v9;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  NSOutputStream *v12;
  NSInputStream *v13;

  v8 = (NSInputStream *)a5;
  v9 = (NSOutputStream *)a6;
  inputStream = self->_inputStream;
  self->_inputStream = v8;
  v13 = v8;

  outputStream = self->_outputStream;
  self->_outputStream = v9;
  v12 = v9;

  -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", self);
  -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", self);
  MEMORY[0x186DB62D4](self->_inputStream, self->_queue);
  -[NSInputStream open](self->_inputStream, "open");
  MEMORY[0x186DB6A90](self->_outputStream, self->_queue);
  -[NSOutputStream open](self->_outputStream, "open");

}

- (NSProxyConnectionStreamTask)initWithHost:(id)a3 port:(unsigned __int16)a4 queue:(id)a5 configuration:(id)a6
{
  unsigned int v8;
  id v11;
  id v12;
  id v13;
  NSProxyConnectionStreamTask *v14;
  NSProxyConnectionStreamTask *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSURLSessionStreamTask *streamTask;
  NSObject *queue;
  _QWORD block[4];
  NSProxyConnectionStreamTask *v26;
  objc_super v27;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)NSProxyConnectionStreamTask;
  v14 = -[NSProxyConnectionStreamTask init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    if (!_sessionConfig)
    {
      +[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)_sessionConfig;
      _sessionConfig = v16;

      objc_msgSend((id)_sessionConfig, "set_allowTCPIOConnectionStreamTask:", 1);
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSServerConfigurationOutboundConnectionProxyDictionary"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_sessionConfig, "setConnectionProxyDictionary:", v18);

    }
    v19 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v19, "setUnderlyingQueue:", v12);
    objc_msgSend(v19, "setMaxConcurrentOperationCount:", 1);
    +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", _sessionConfig, v15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "streamTaskWithHostName:port:", v11, v8);
    v21 = objc_claimAutoreleasedReturnValue();
    streamTask = v15->_streamTask;
    v15->_streamTask = (NSURLSessionStreamTask *)v21;

    objc_storeStrong((id *)&v15->_host, a3);
    v15->_port = v8;
    if (objc_msgSend((id)_sessionConfig, "_allowTCPIOConnectionStreamTask"))
    {
      -[NSURLSessionStreamTask captureStreams](v15->_streamTask, "captureStreams");
      -[NSURLSessionTask resume](v15->_streamTask, "resume");
    }
    else
    {
      queue = v15->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__NSProxyConnectionStreamTask_initWithHost_port_queue_configuration___block_invoke;
      block[3] = &unk_1E14FE118;
      v26 = v15;
      dispatch_async(queue, block);

    }
  }

  return v15;
}

- (void)read:(unint64_t)a3 handler:(id)a4
{
  const char *v6;
  id v7;
  NSURLSessionStreamTask *streamTask;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v7 = a4;
  if (self->_streamTask && !objc_getProperty(self, v6, 72, 1))
  {
    objc_initWeak(&location, self);
    streamTask = self->_streamTask;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__NSProxyConnectionStreamTask_read_handler___block_invoke;
    v9[3] = &unk_1E14FB6A8;
    v9[4] = self;
    objc_copyWeak(&v11, &location);
    v10 = v7;
    -[NSURLSessionStreamTask readDataOfMinLength:maxLength:timeout:completionHandler:](streamTask, "readDataOfMinLength:maxLength:timeout:completionHandler:", 1, a3, v9, 120.0);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)write:(id)a3 handler:(id)a4
{
  id v6;
  const char *v7;
  void (**v8)(id, uint64_t);
  NSOutputStream *outputStream;
  id v10;
  uint64_t v11;
  NSURLSessionStreamTask *streamTask;
  _QWORD v13[5];
  void (**v14)(id, uint64_t);
  id v15;
  id location;

  v6 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if (self && objc_getProperty(self, v7, 80, 1))
  {
    outputStream = self->_outputStream;
    v10 = objc_retainAutorelease(v6);
    v11 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
    if (v11 < 1)
    {
      v8[2](v8, 1);
    }
    else
    {
      if (v11 != objc_msgSend(v10, "length"))
        __assert_rtn("-[NSProxyConnectionStreamTask write:handler:]", "NSProxyConnection.m", 281, "written == [(NSData*)data length]");
      v8[2](v8, 0);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    streamTask = self->_streamTask;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__NSProxyConnectionStreamTask_write_handler___block_invoke;
    v13[3] = &unk_1E14FB6F8;
    v13[4] = self;
    objc_copyWeak(&v15, &location);
    v14 = v8;
    -[NSURLSessionStreamTask writeData:timeout:completionHandler:](streamTask, "writeData:timeout:completionHandler:", v6, v13, -1.0);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (void)cancel
{
  id v3;
  const char *v4;
  const char *v5;
  SEL v6;
  SEL v7;
  SEL v8;
  NSURLSessionStreamTask *streamTask;

  if (self->_streamTask)
  {
    v3 = objc_getProperty(self, a2, 72, 1);
    if (v3)
    {

    }
    else if (!objc_getProperty(self, v4, 80, 1))
    {
      -[NSURLSessionStreamTask closeRead](self->_streamTask, "closeRead");
      -[NSURLSessionStreamTask closeRead](self->_streamTask, "closeRead");
      goto LABEL_7;
    }
    objc_msgSend(objc_getProperty(self, v5, 72, 1), "setDelegate:", 0);
    objc_msgSend(objc_getProperty(self, v6, 80, 1), "setDelegate:", 0);
    MEMORY[0x186DB62D4](self->_inputStream, 0);
    MEMORY[0x186DB6A90](self->_outputStream, 0);
    -[NSInputStream close](self->_inputStream, "close");
    -[NSOutputStream close](self->_outputStream, "close");
    objc_setProperty_atomic(self, v7, 0, 72);
    objc_setProperty_atomic(self, v8, 0, 80);
LABEL_7:
    streamTask = self->_streamTask;
    self->_streamTask = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSProxyConnectionStreamTask cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)NSProxyConnectionStreamTask;
  -[NSProxyConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamTask, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__NSProxyConnectionStreamTask_write_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NSProxyConnectionStreamTask_write_handler___block_invoke_2;
  block[3] = &unk_1E14FB6D0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

uint64_t __45__NSProxyConnectionStreamTask_write_handler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[NSProxyConnectionStreamTask _onConnected:]((uint64_t)WeakRetained, objc_msgSend(*(id *)(a1 + 32), "code"));

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "code"));
}

- (void)_onConnected:(uint64_t)a1
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 48))
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = (id)CFNLog::logger;
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        v6 = *(_QWORD *)(a1 + 56);
        v7 = *(_DWORD *)(a1 + 64);
        v13 = 138412802;
        v14 = v6;
        v15 = 1024;
        v16 = v7;
        v17 = 1024;
        v18 = a2;
        v8 = "Failure connecting to: %@:%d error:%d";
        v9 = v4;
        v10 = 24;
LABEL_10:
        _os_log_impl(&dword_183ECA000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
    else if (v5)
    {
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(_DWORD *)(a1 + 64);
      v13 = 138412546;
      v14 = v11;
      v15 = 1024;
      v16 = v12;
      v8 = "Connected to: %@:%d";
      v9 = v4;
      v10 = 18;
      goto LABEL_10;
    }

    *(_BYTE *)(a1 + 48) = 1;
  }
}

void __44__NSProxyConnectionStreamTask_read_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = a2;
  v7 = a4;
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__NSProxyConnectionStreamTask_read_handler___block_invoke_2;
  v11[3] = &unk_1E14FB680;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v12 = v7;
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v15);
}

void __44__NSProxyConnectionStreamTask_read_handler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  dispatch_data_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[NSProxyConnectionStreamTask _onConnected:]((uint64_t)WeakRetained, objc_msgSend(*(id *)(a1 + 32), "code"));

  v3 = *(void **)(a1 + 40);
  if (v3)
    v4 = dispatch_data_create((const void *)objc_msgSend(objc_retainAutorelease(v3), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), 0, 0);
  else
    v4 = 0;
  (*(void (**)(_QWORD, dispatch_data_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4, objc_msgSend(*(id *)(a1 + 32), "code"));

}

void __69__NSProxyConnectionStreamTask_initWithHost_port_queue_configuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "resume");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  else
    WeakRetained = 0;
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "connected:", 0);

}

- (void)readFromStream
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  dispatch_data_t v4;
  id WeakRetained;
  uint8_t v6[16];
  _QWORD v7[5];
  _BYTE buffer[32768];
  uint64_t v9;

  v1 = MEMORY[0x1E0C80A78](a1);
  v9 = *MEMORY[0x1E0C80C00];
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(*(id *)(v1 + 72), "read:maxLength:", buffer, 0x8000);
    if (v3 >= 1)
    {
      v4 = dispatch_data_create(buffer, v3, 0, 0);
      ++*(_QWORD *)(v2 + 32);
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45__NSProxyConnectionStreamTask_readFromStream__block_invoke;
      v7[3] = &unk_1E14FB818;
      v7[4] = v2;
      objc_msgSend(WeakRetained, "outboundConnectionReceivedData:handler:", v4, v7);

LABEL_4:
      return;
    }
    if (!v3)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v4 = (dispatch_data_t)(id)CFNLog::logger;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, "Read returned 0", v6, 2u);
      }
      goto LABEL_4;
    }
  }
}

uint64_t __45__NSProxyConnectionStreamTask_readFromStream__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    --*(_QWORD *)(v1 + 32);
    v2 = *(_QWORD *)(result + 32);
    if (v2)
    {
      if (*(uint64_t *)(v2 + 32) <= 4 && (*(_BYTE *)(v2 + 68) & 1) != 0)
      {
        *(_BYTE *)(v2 + 68) = 0;
        return -[NSProxyConnectionStreamTask readFromStream](*(_QWORD *)(result + 32));
      }
    }
  }
  return result;
}

@end
