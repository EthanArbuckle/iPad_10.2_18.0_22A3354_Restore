@implementation JXURLConnectionOperation

- (void)dealloc
{
  objc_super v3;

  -[JXURLConnectionOperation stopConnection](self, "stopConnection");
  v3.receiver = self;
  v3.super_class = (Class)JXURLConnectionOperation;
  -[JXOperation dealloc](&v3, sel_dealloc);
}

- (JXURLConnectionOperation)init
{
  JXURLConnectionOperation *v2;
  JXURLConnectionOperation *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JXURLConnectionOperation;
  v2 = -[JXOperation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[JXURLConnectionOperation setConnection:](v2, "setConnection:", 0);
    -[JXURLConnectionOperation setRequest:](v3, "setRequest:", 0);
    -[JXURLConnectionOperation setResponse:](v3, "setResponse:", 0);
    -[JXURLConnectionOperation setError:](v3, "setError:", 0);
    -[JXURLConnectionOperation setBytesDownloaded:](v3, "setBytesDownloaded:", 0);
    -[JXURLConnectionOperation setBytesUploaded:](v3, "setBytesUploaded:", 0);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToMemory");
    -[JXURLConnectionOperation setOutputStream:](v3, "setOutputStream:", v4);

  }
  return v3;
}

- (JXURLConnectionOperation)initWithURL:(id)a3
{
  id v4;
  JXURLConnectionOperation *v5;
  void *v6;

  v4 = a3;
  v5 = -[JXURLConnectionOperation init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", v4);
    -[JXURLConnectionOperation setRequest:](v5, "setRequest:", v6);

  }
  return v5;
}

- (void)main
{
  if ((-[JXURLConnectionOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[JXURLConnectionOperation startConnection](self, "startConnection");
}

- (void)willFinish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JXURLConnectionOperation;
  -[JXOperation willFinish](&v3, sel_willFinish);
  -[JXURLConnectionOperation stopConnection](self, "stopConnection");
}

- (void)startConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "networkThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    if ((-[JXURLConnectionOperation isCancelled](self, "isCancelled") & 1) != 0)
      return;
    -[JXURLConnectionOperation outputStream](self, "outputStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDBCB80];
    objc_msgSend(v5, "scheduleInRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

    v8 = objc_alloc(MEMORY[0x24BDB7478]);
    -[JXURLConnectionOperation request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithRequest:delegate:startImmediately:", v9, self, 0);
    -[JXURLConnectionOperation setConnection:](self, "setConnection:", v10);

    -[JXURLConnectionOperation connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheduleInRunLoop:forMode:", v12, v7);

    -[JXURLConnectionOperation connection](self, "connection");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "start");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "networkThread");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[JXURLConnectionOperation performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_startConnection);
  }

}

- (void)stopConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "networkThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    -[JXURLConnectionOperation connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDBCB80];
    objc_msgSend(v5, "unscheduleFromRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

    -[JXURLConnectionOperation connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

    -[JXURLConnectionOperation outputStream](self, "outputStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromRunLoop:forMode:", v10, v7);

    -[JXURLConnectionOperation outputStream](self, "outputStream");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "close");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "networkThread");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[JXURLConnectionOperation performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_stopConnection);
  }

}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;

  v5 = a4;
  if ((-[JXURLConnectionOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[JXURLConnectionOperation setError:](self, "setError:", v5);
    -[JXOperation finish](self, "finish");
  }

}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((-[JXURLConnectionOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[JXURLConnectionOperation setResponse:](self, "setResponse:", v6);
    -[JXURLConnectionOperation outputStream](self, "outputStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "open");

  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  if ((-[JXURLConnectionOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[JXURLConnectionOperation outputStream](self, "outputStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasSpaceAvailable");

    if (v6)
    {
      -[JXURLConnectionOperation outputStream](self, "outputStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_retainAutorelease(v10);
      v9 = objc_msgSend(v7, "write:maxLength:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

      if (v9 != -1)
        -[JXURLConnectionOperation setBytesDownloaded:](self, "setBytesDownloaded:", -[JXURLConnectionOperation bytesDownloaded](self, "bytesDownloaded") + v9);
    }
  }

}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  if ((-[JXURLConnectionOperation isCancelled](self, "isCancelled", a3, a4, a5, a6) & 1) == 0)
    -[JXURLConnectionOperation setBytesUploaded:](self, "setBytesUploaded:", -[JXURLConnectionOperation bytesUploaded](self, "bytesUploaded") + a4);
}

- (void)connectionDidFinishLoading:(id)a3
{
  if ((-[JXURLConnectionOperation isCancelled](self, "isCancelled", a3) & 1) == 0)
    -[JXOperation finish](self, "finish");
}

- (NSMutableURLRequest)request
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 272, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 280, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 288, 1);
}

- (void)setOutputStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (int64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(int64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (int64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(int64_t)a3
{
  self->_bytesUploaded = a3;
}

- (NSURLConnection)connection
{
  return (NSURLConnection *)objc_getProperty(self, a2, 312, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (id)networkThread
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__JXURLConnectionOperation_networkThread__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (networkThread_predicate != -1)
    dispatch_once(&networkThread_predicate, block);
  return (id)networkThread_thread;
}

+ (void)runLoopForever
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", CFSTR("JXHTTP"));

  v3 = *MEMORY[0x24BDBCA90];
  while (1)
  {
    v4 = (void *)MEMORY[0x22E315218]();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runMode:beforeDate:", v3, v6);

    objc_autoreleasePoolPop(v4);
  }
}

uint64_t __41__JXURLConnectionOperation_networkThread__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_runLoopForever, 0);
  v2 = (void *)networkThread_thread;
  networkThread_thread = v1;

  return objc_msgSend((id)networkThread_thread, "start");
}

@end
