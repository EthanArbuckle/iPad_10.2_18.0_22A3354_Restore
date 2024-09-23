@implementation ENAFURLConnectionOperation

- (ENAFURLConnectionOperation)initWithRequest:(id)a3
{
  id v4;
  ENAFURLConnectionOperation *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ENAFURLConnectionOperation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENAFURLConnectionOperation;
  v5 = -[ENAFURLConnectionOperation init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1788]);
    -[ENAFURLConnectionOperation setLock:](v5, "setLock:", v6);

    -[ENAFURLConnectionOperation lock](v5, "lock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("com.alamofire.networking.operation.lock"));

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BDBCB80]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation setRunLoopModes:](v5, "setRunLoopModes:", v8);

    -[ENAFURLConnectionOperation setRequest:](v5, "setRequest:", v4);
    objc_msgSend(MEMORY[0x24BDBCF08], "outputStreamToMemory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation setOutputStream:](v5, "setOutputStream:", v9);

    -[ENAFURLConnectionOperation setState:](v5, "setState:", 1);
    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  NSOutputStream *outputStream;
  NSOutputStream *v4;
  objc_super v5;

  outputStream = self->_outputStream;
  if (outputStream)
  {
    -[NSOutputStream close](outputStream, "close");
    v4 = self->_outputStream;
    self->_outputStream = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ENAFURLConnectionOperation;
  -[ENAFURLConnectionOperation dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ENAFURLConnectionOperation state](self, "state") + 1;
  if (v6 > 4)
    v7 = CFSTR("state");
  else
    v7 = off_24F8B0D48[v6];
  if (-[ENAFURLConnectionOperation isCancelled](self, "isCancelled"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[ENAFURLConnectionOperation request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAFURLConnectionOperation response](self, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, state: %@, cancelled: %@ request: %@, response: %@>"), v5, self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  -[ENAFURLConnectionOperation lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (v4)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__ENAFURLConnectionOperation_setCompletionBlock___block_invoke;
    v8[3] = &unk_24F8B5A00;
    v9 = v4;
    objc_copyWeak(&v10, &location);
    v7.receiver = self;
    v7.super_class = (Class)ENAFURLConnectionOperation;
    -[ENAFURLConnectionOperation setCompletionBlock:](&v7, sel_setCompletionBlock_, v8);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ENAFURLConnectionOperation;
    -[ENAFURLConnectionOperation setCompletionBlock:](&v12, sel_setCompletionBlock_, 0);
  }
  -[ENAFURLConnectionOperation lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (NSInputStream)inputStream
{
  void *v2;
  void *v3;

  -[ENAFURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HTTPBodyStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSInputStream *)v3;
}

- (void)setInputStream:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ENAFURLConnectionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputStream"));
  -[ENAFURLConnectionOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setHTTPBodyStream:", v4);
  -[ENAFURLConnectionOperation setRequest:](self, "setRequest:", v6);
  -[ENAFURLConnectionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputStream"));

}

- (void)setOutputStream:(id)a3
{
  NSOutputStream *v5;
  NSOutputStream **p_outputStream;
  NSOutputStream *v7;

  v5 = (NSOutputStream *)a3;
  p_outputStream = &self->_outputStream;
  if (self->_outputStream != v5)
  {
    v7 = v5;
    -[ENAFURLConnectionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outputStream"));
    if (*p_outputStream)
      -[NSOutputStream close](*p_outputStream, "close");
    objc_storeStrong((id *)&self->_outputStream, a3);
    -[ENAFURLConnectionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputStream"));
    v5 = v7;
  }

}

- (void)setState:(signed __int16)a3
{
  int v3;
  void *v5;
  BOOL v6;
  unsigned int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  v3 = a3;
  -[ENAFURLConnectionOperation lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  LODWORD(v5) = -[ENAFURLConnectionOperation state](self, "state");
  v6 = -[ENAFURLConnectionOperation isCancelled](self, "isCancelled");
  switch((int)v5)
  {
    case -1:
      if (v3 == 1)
        goto LABEL_10;
      goto LABEL_21;
    case 1:
      if (v3 == -1 || v3 == 2 || v3 == 3 && v6)
        goto LABEL_10;
      goto LABEL_21;
    case 2:
      if (((v3 + 1) & 0xFFFFFFFB) == 0)
        goto LABEL_10;
      goto LABEL_21;
    case 3:
      goto LABEL_21;
    default:
LABEL_10:
      v7 = -[ENAFURLConnectionOperation state](self, "state") + 1;
      if (v7 > 4)
        v8 = CFSTR("state");
      else
        v8 = off_24F8B0D48[v7];
      if ((v3 + 1) > 4)
        v9 = CFSTR("state");
      else
        v9 = off_24F8B0D48[v3 + 1];
      -[ENAFURLConnectionOperation willChangeValueForKey:](self, "willChangeValueForKey:", v9);
      -[ENAFURLConnectionOperation willChangeValueForKey:](self, "willChangeValueForKey:", v8);
      self->_state = v3;
      -[ENAFURLConnectionOperation didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      -[ENAFURLConnectionOperation didChangeValueForKey:](self, "didChangeValueForKey:", v9);
      if (v3 == 3)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("com.evernote.sdk.networking.operation.finish");
      }
      else
      {
        if (v3 != 2)
          goto LABEL_21;
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("com.evernote.sdk.networking.operation.start");
      }
      objc_msgSend(v10, "postNotificationName:object:", v12, self);

LABEL_21:
      -[ENAFURLConnectionOperation lock](self, "lock");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unlock");

      return;
  }
}

- (NSString)responseString
{
  void *v3;
  void *v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  CFStringEncoding v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;

  -[ENAFURLConnectionOperation lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!self->_responseString)
  {
    -[ENAFURLConnectionOperation response](self, "response");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[ENAFURLConnectionOperation responseData](self, "responseData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[ENAFURLConnectionOperation response](self, "response");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textEncodingName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10
          || (-[ENAFURLConnectionOperation response](self, "response"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v11, "textEncodingName"),
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue(),
              v13 = CFStringConvertIANACharSetNameToEncoding(v12),
              v12,
              v11,
              v13 == -1))
        {
          v14 = 4;
        }
        else
        {
          v14 = CFStringConvertEncodingToNSStringEncoding(v13);
        }
        v15 = objc_alloc(MEMORY[0x24BDD17C8]);
        -[ENAFURLConnectionOperation responseData](self, "responseData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithData:encoding:", v16, v14);
        -[ENAFURLConnectionOperation setResponseString:](self, "setResponseString:", v17);

      }
    }
  }
  -[ENAFURLConnectionOperation lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return self->_responseString;
}

- (void)pause
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!-[ENAFURLConnectionOperation isPaused](self, "isPaused")
    && !-[ENAFURLConnectionOperation isFinished](self, "isFinished")
    && !-[ENAFURLConnectionOperation isCancelled](self, "isCancelled"))
  {
    -[ENAFURLConnectionOperation lock](self, "lock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");

    if (-[ENAFURLConnectionOperation isExecuting](self, "isExecuting"))
    {
      -[ENAFURLConnectionOperation connection](self, "connection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "networkRequestThread");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENAFURLConnectionOperation runLoopModes](self, "runLoopModes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performSelector:onThread:withObject:waitUntilDone:modes:", sel_cancel, v5, 0, 0, v7);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.evernote.sdk.networking.operation.finish"), self);

    }
    -[ENAFURLConnectionOperation setState:](self, "setState:", 0xFFFFFFFFLL);
    -[ENAFURLConnectionOperation lock](self, "lock");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

  }
}

- (BOOL)isPaused
{
  return -[ENAFURLConnectionOperation state](self, "state") == -1;
}

- (void)resume
{
  void *v3;
  id v4;

  if (-[ENAFURLConnectionOperation isPaused](self, "isPaused"))
  {
    -[ENAFURLConnectionOperation lock](self, "lock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");

    -[ENAFURLConnectionOperation setState:](self, "setState:", 1);
    -[ENAFURLConnectionOperation start](self, "start");
    -[ENAFURLConnectionOperation lock](self, "lock");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unlock");

  }
}

- (BOOL)isReady
{
  objc_super v4;

  if (-[ENAFURLConnectionOperation state](self, "state") != 1)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)ENAFURLConnectionOperation;
  return -[ENAFURLConnectionOperation isReady](&v4, sel_isReady);
}

- (BOOL)isExecuting
{
  return -[ENAFURLConnectionOperation state](self, "state") == 2;
}

- (BOOL)isFinished
{
  return -[ENAFURLConnectionOperation state](self, "state") == 3;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ENAFURLConnectionOperation lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[ENAFURLConnectionOperation isReady](self, "isReady"))
  {
    -[ENAFURLConnectionOperation setState:](self, "setState:", 2);
    objc_msgSend((id)objc_opt_class(), "networkRequestThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation runLoopModes](self, "runLoopModes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", sel_operationDidStart, v4, 0, 0, v6);

  }
  -[ENAFURLConnectionOperation lock](self, "lock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)operationDidStart
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[ENAFURLConnectionOperation lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[ENAFURLConnectionOperation isCancelled](self, "isCancelled"))
  {
    -[ENAFURLConnectionOperation finish](self, "finish");
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDB7478]);
    -[ENAFURLConnectionOperation request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithRequest:delegate:startImmediately:", v5, self, 0);
    -[ENAFURLConnectionOperation setConnection:](self, "setConnection:", v6);

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ENAFURLConnectionOperation runLoopModes](self, "runLoopModes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          -[ENAFURLConnectionOperation connection](self, "connection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "scheduleInRunLoop:forMode:", v7, v13);

          -[ENAFURLConnectionOperation outputStream](self, "outputStream");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "scheduleInRunLoop:forMode:", v7, v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[ENAFURLConnectionOperation connection](self, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "start");

  }
  -[ENAFURLConnectionOperation lock](self, "lock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

}

- (void)finish
{
  -[ENAFURLConnectionOperation setState:](self, "setState:", 3);
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[ENAFURLConnectionOperation lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!-[ENAFURLConnectionOperation isFinished](self, "isFinished")
    && !-[ENAFURLConnectionOperation isCancelled](self, "isCancelled"))
  {
    -[ENAFURLConnectionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isCancelled"));
    self->_cancelled = 1;
    v8.receiver = self;
    v8.super_class = (Class)ENAFURLConnectionOperation;
    -[ENAFURLConnectionOperation cancel](&v8, sel_cancel);
    -[ENAFURLConnectionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isCancelled"));
    objc_msgSend((id)objc_opt_class(), "networkRequestThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation runLoopModes](self, "runLoopModes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", sel_cancelConnection, v4, 0, 0, v6);

  }
  -[ENAFURLConnectionOperation lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)cancelConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ENAFURLConnectionOperation connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ENAFURLConnectionOperation connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[ENAFURLConnectionOperation request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDBCE70];
      -[ENAFURLConnectionOperation request](self, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictionaryWithObject:forKey:", v9, *MEMORY[0x24BDD1310]);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    -[ENAFURLConnectionOperation connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -999, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation performSelector:withObject:withObject:](self, "performSelector:withObject:withObject:", sel_connection_didFailWithError_, v10, v11);

  }
}

- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  char v10;
  void *v11;
  void *v12;
  int v13;

  v6 = a3;
  v7 = a4;
  -[ENAFURLConnectionOperation authenticationAgainstProtectionSpace](self, "authenticationAgainstProtectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ENAFURLConnectionOperation authenticationAgainstProtectionSpace](self, "authenticationAgainstProtectionSpace");
    v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v6, v7);

  }
  else
  {
    objc_msgSend(v7, "authenticationMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB7410]))
    {

    }
    else
    {
      objc_msgSend(v7, "authenticationMethod");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDB73D8]);

      if (!v13)
      {
        v10 = 1;
        goto LABEL_8;
      }
    }
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[ENAFURLConnectionOperation authenticationChallenge](self, "authenticationChallenge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ENAFURLConnectionOperation authenticationChallenge](self, "authenticationChallenge");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v18, v6);
  }
  else if (objc_msgSend(v6, "previousFailureCount"))
  {
    objc_msgSend(v6, "sender");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "continueWithoutCredentialForAuthenticationChallenge:", v6);
  }
  else
  {
    -[ENAFURLConnectionOperation request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)CFURLCopyUserName((CFURLRef)objc_msgSend(v9, "URL"));

    -[ENAFURLConnectionOperation request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (__CFString *)CFURLCopyPassword((CFURLRef)objc_msgSend(v11, "URL"));

    if (v10 && v12)
    {
      objc_msgSend(MEMORY[0x24BDB7480], "credentialWithUser:password:persistence:", v10, v12, 0);
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDB7488], "sharedCredentialStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "protectionSpace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v13, "credentialsForProtectionSpace:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v10);
        v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v13, "defaultCredentialForProtectionSpace:", v14);
        v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      }

    }
    objc_msgSend(v6, "sender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v8)
      objc_msgSend(v16, "useCredential:forAuthenticationChallenge:", v8, v6);
    else
      objc_msgSend(v16, "continueWithoutCredentialForAuthenticationChallenge:", v6);

  }
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ENAFURLConnectionOperation redirectResponse](self, "redirectResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ENAFURLConnectionOperation redirectResponse](self, "redirectResponse");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v12)[2](v12, v8, v9, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v9;
  }

  return v13;
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  void *v10;
  _QWORD v11[8];

  -[ENAFURLConnectionOperation uploadProgress](self, "uploadProgress", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __101__ENAFURLConnectionOperation_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
    v11[3] = &unk_24F8B0D28;
    v11[4] = self;
    v11[5] = a4;
    v11[6] = a5;
    v11[7] = a6;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v5;

  -[ENAFURLConnectionOperation setResponse:](self, "setResponse:", a4);
  -[ENAFURLConnectionOperation outputStream](self, "outputStream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "open");

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[8];

  v5 = a4;
  -[ENAFURLConnectionOperation setTotalBytesRead:](self, "setTotalBytesRead:", -[ENAFURLConnectionOperation totalBytesRead](self, "totalBytesRead") + objc_msgSend(v5, "length"));
  -[ENAFURLConnectionOperation outputStream](self, "outputStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSpaceAvailable");

  if (v7)
  {
    v8 = objc_retainAutorelease(v5);
    v9 = objc_msgSend(v8, "bytes");
    -[ENAFURLConnectionOperation outputStream](self, "outputStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "write:maxLength:", v9, objc_msgSend(v8, "length"));

  }
  -[ENAFURLConnectionOperation downloadProgress](self, "downloadProgress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v5, "length");
    v13 = -[ENAFURLConnectionOperation totalBytesRead](self, "totalBytesRead");
    -[ENAFURLConnectionOperation response](self, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "expectedContentLength");

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__ENAFURLConnectionOperation_connection_didReceiveData___block_invoke;
    v16[3] = &unk_24F8B0D28;
    v16[4] = self;
    v16[5] = v12;
    v16[6] = v13;
    v16[7] = v15;
    dispatch_async(MEMORY[0x24BDAC9B8], v16);
  }

}

- (void)connectionDidFinishLoading:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ENAFURLConnectionOperation outputStream](self, "outputStream", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BDBCB88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAFURLConnectionOperation setResponseData:](self, "setResponseData:", v5);

  -[ENAFURLConnectionOperation outputStream](self, "outputStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");

  -[ENAFURLConnectionOperation finish](self, "finish");
  -[ENAFURLConnectionOperation setConnection:](self, "setConnection:", 0);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  void *v5;

  -[ENAFURLConnectionOperation setError:](self, "setError:", a4);
  -[ENAFURLConnectionOperation outputStream](self, "outputStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "close");

  -[ENAFURLConnectionOperation finish](self, "finish");
  -[ENAFURLConnectionOperation setConnection:](self, "setConnection:", 0);
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v6 = a3;
  v7 = a4;
  -[ENAFURLConnectionOperation cacheResponse](self, "cacheResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ENAFURLConnectionOperation cacheResponse](self, "cacheResponse");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (-[ENAFURLConnectionOperation isCancelled](self, "isCancelled"))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (ENAFURLConnectionOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ENAFURLConnectionOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ENAFURLConnectionOperation *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ENAFURLConnectionOperation initWithRequest:](self, "initWithRequest:", v5);
  if (v6)
  {
    -[ENAFURLConnectionOperation setState:](v6, "setState:", (__int16)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state")));
    -[ENAFURLConnectionOperation setCancelled:](v6, "setCancelled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCancelled")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("response"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation setResponse:](v6, "setResponse:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation setError:](v6, "setError:", v8);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("responseData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation setResponseData:](v6, "setResponseData:", v9);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("totalBytesRead"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAFURLConnectionOperation setTotalBytesRead:](v6, "setTotalBytesRead:", objc_msgSend(v10, "longLongValue"));

    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[ENAFURLConnectionOperation pause](self, "pause");
  -[ENAFURLConnectionOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("request"));

  v5 = -[ENAFURLConnectionOperation state](self, "state");
  v6 = 1;
  if (v5 != -1 && v5 != 2)
    v6 = -[ENAFURLConnectionOperation state](self, "state", 1);
  objc_msgSend(v11, "encodeInteger:forKey:", v6, CFSTR("state"));
  objc_msgSend(v11, "encodeBool:forKey:", -[ENAFURLConnectionOperation isCancelled](self, "isCancelled"), CFSTR("isCancelled"));
  -[ENAFURLConnectionOperation response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("response"));

  -[ENAFURLConnectionOperation error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("error"));

  -[ENAFURLConnectionOperation responseData](self, "responseData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("responseData"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[ENAFURLConnectionOperation totalBytesRead](self, "totalBytesRead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("totalBytesRead"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ENAFURLConnectionOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithRequest:", v5);

  -[ENAFURLConnectionOperation uploadProgress](self, "uploadProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUploadProgress:", v7);

  -[ENAFURLConnectionOperation downloadProgress](self, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDownloadProgress:", v8);

  -[ENAFURLConnectionOperation authenticationAgainstProtectionSpace](self, "authenticationAgainstProtectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthenticationAgainstProtectionSpace:", v9);

  -[ENAFURLConnectionOperation authenticationChallenge](self, "authenticationChallenge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthenticationChallenge:", v10);

  -[ENAFURLConnectionOperation cacheResponse](self, "cacheResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCacheResponse:", v11);

  -[ENAFURLConnectionOperation redirectResponse](self, "redirectResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRedirectResponse:", v12);

  return v6;
}

- (signed)state
{
  return self->_state;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSURLConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSSet)runLoopModes
{
  return self->_runLoopModes;
}

- (void)setRunLoopModes:(id)a3
{
  objc_storeStrong((id *)&self->_runLoopModes, a3);
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (void)setResponseString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (int64_t)totalBytesRead
{
  return self->_totalBytesRead;
}

- (void)setTotalBytesRead:(int64_t)a3
{
  self->_totalBytesRead = a3;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (id)uploadProgress
{
  return self->_uploadProgress;
}

- (void)setUploadProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (id)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (id)authenticationAgainstProtectionSpace
{
  return self->_authenticationAgainstProtectionSpace;
}

- (void)setAuthenticationAgainstProtectionSpace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (id)authenticationChallenge
{
  return self->_authenticationChallenge;
}

- (void)setAuthenticationChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (id)cacheResponse
{
  return self->_cacheResponse;
}

- (void)setCacheResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (id)redirectResponse
{
  return self->_redirectResponse;
}

- (void)setRedirectResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_redirectResponse, 0);
  objc_storeStrong(&self->_cacheResponse, 0);
  objc_storeStrong(&self->_authenticationChallenge, 0);
  objc_storeStrong(&self->_authenticationAgainstProtectionSpace, 0);
  objc_storeStrong(&self->_downloadProgress, 0);
  objc_storeStrong(&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_responseString, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_runLoopModes, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __56__ENAFURLConnectionOperation_connection_didReceiveData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "downloadProgress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __101__ENAFURLConnectionOperation_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "uploadProgress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __49__ENAFURLConnectionOperation_setCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCompletionBlock:", 0);

}

+ (void)networkRequestThreadEntryPoint:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  while (1)
  {
    v4 = (void *)MEMORY[0x22E315218](v3);
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "run");

    objc_autoreleasePoolPop(v4);
  }
}

+ (id)networkRequestThread
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ENAFURLConnectionOperation_networkRequestThread__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (networkRequestThread_oncePredicate != -1)
    dispatch_once(&networkRequestThread_oncePredicate, block);
  return (id)networkRequestThread__networkRequestThread;
}

uint64_t __50__ENAFURLConnectionOperation_networkRequestThread__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_networkRequestThreadEntryPoint_, 0);
  v2 = (void *)networkRequestThread__networkRequestThread;
  networkRequestThread__networkRequestThread = v1;

  return objc_msgSend((id)networkRequestThread__networkRequestThread, "start");
}

@end
