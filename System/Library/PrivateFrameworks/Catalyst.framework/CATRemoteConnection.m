@implementation CATRemoteConnection

- (__SecTrust)peerTrust
{
  void *v2;
  __SecTrust *v3;

  -[CATRemoteConnection inputStream](self, "inputStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__SecTrust *)objc_msgSend(v2, "propertyForKey:", *MEMORY[0x24BDB77A8]);

  return v3;
}

+ (void)createConnectionPairWithConnection:(id *)a3 andConnection:(id *)a4
{
  objc_msgSend(a1, "createConnectionPairWithConnection:andConnection:bufferSize:", a3, a4, *MEMORY[0x24BDB03C8]);
}

+ (void)createConnectionPairWithConnection:(id *)a3 andConnection:(id *)a4 bufferSize:(unint64_t)a5
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATRemoteConnection.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection1"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATRemoteConnection.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection2"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v19 = 0;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDBCF30], "getBoundStreamsWithBufferSize:inputStream:outputStream:", a5, &v20, &v19);
  v10 = v20;
  v11 = v19;
  v17 = 0;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDBCF30], "getBoundStreamsWithBufferSize:inputStream:outputStream:", a5, &v18, &v17);
  v12 = v18;
  v13 = v17;
  *a3 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithInputStream:outputStream:bufferSize:", v10, v13, a5);
  v14 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithInputStream:outputStream:bufferSize:", v12, v11, a5);

  *a4 = v14;
}

- (CATRemoteConnection)initWithNetService:(id)a3
{
  id v5;
  CATRemoteConnection *v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  CATRemoteConnection *v10;
  void *v12;
  objc_super v13;
  id v14;
  id v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("netService"));

  }
  v14 = 0;
  v15 = 0;
  if (objc_msgSend(v5, "getInputStream:outputStream:", &v15, &v14))
  {
    v6 = -[CATRemoteConnection initWithInputStream:outputStream:](self, "initWithInputStream:outputStream:", v15, v14);
    if (v6)
    {
      objc_msgSend(v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v8;

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CATRemoteConnection;
    v6 = -[CATRemoteConnection init](&v13, sel_init);
  }
  v10 = v6;

  return v10;
}

- (CATRemoteConnection)initWithInputStream:(id)a3 outputStream:(id)a4
{
  return -[CATRemoteConnection initWithInputStream:outputStream:bufferSize:](self, "initWithInputStream:outputStream:bufferSize:", a3, a4, *MEMORY[0x24BDB03C8]);
}

- (CATRemoteConnection)initWithInputStream:(id)a3 outputStream:(id)a4 bufferSize:(unint64_t)a5
{
  id v10;
  id v11;
  void *v12;
  CATRemoteConnection *v13;
  CATRemoteConnection *v14;
  uint64_t v15;
  CATHTTPMessageParser *mMessageParser;
  uint64_t v17;
  NSMutableArray *mPendingSendContexts;
  uint64_t v19;
  CATSerialOperationQueue *mStreamEventQueue;
  void *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputStream"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputStream"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)CATRemoteConnection;
  v13 = -[CATRemoteConnection init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_inputStream, a3);
    objc_storeStrong((id *)&v14->_outputStream, a4);
    v14->_connectionTimeoutInterval = -1.0;
    v14->_bufferSize = a5;
    v15 = objc_opt_new();
    mMessageParser = v14->mMessageParser;
    v14->mMessageParser = (CATHTTPMessageParser *)v15;

    -[CATHTTPMessageParser setDelegate:](v14->mMessageParser, "setDelegate:", v14);
    v17 = objc_opt_new();
    mPendingSendContexts = v14->mPendingSendContexts;
    v14->mPendingSendContexts = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    mStreamEventQueue = v14->mStreamEventQueue;
    v14->mStreamEventQueue = (CATSerialOperationQueue *)v19;

    -[CATSerialOperationQueue setName:](v14->mStreamEventQueue, "setName:", CFSTR("Stream Event Queue"));
    CATGetCatalystQueue();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setUnderlyingQueue:](v14->mStreamEventQueue, "setUnderlyingQueue:", v21);

    -[CATSerialOperationQueue setSuspended:](v14->mStreamEventQueue, "setSuspended:", 1);
    v14->mState = 1;
  }

  return v14;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->mState != 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 208, CFSTR("%@ cannot dealloc while receiver is still valid."), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)CATRemoteConnection;
  -[CATRemoteConnection dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATRemoteConnection name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = %@ } >"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)sendData:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  _CATRemoteConnectionSendDataContext *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_CATRemoteConnectionSendDataContext initWithData:userInfo:]([_CATRemoteConnectionSendDataContext alloc], "initWithData:userInfo:", v7, v6);

  -[CATRemoteConnection enqueueSendContext:](self, "enqueueSendContext:", v8);
}

- (void)sendDataWithStream:(id)a3 length:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  _CATRemoteConnectionSendDataWithStreamContext *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[_CATRemoteConnectionSendDataWithStreamContext initWithStream:length:bufferSize:userInfo:]([_CATRemoteConnectionSendDataWithStreamContext alloc], "initWithStream:length:bufferSize:userInfo:", v9, a4, -[CATRemoteConnection bufferSize](self, "bufferSize"), v8);

  -[CATRemoteConnection enqueueSendContext:](self, "enqueueSendContext:", v10);
}

- (void)secureUsingClientIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4
{
  NSObject *v6;
  id v7;

  v7 = a4;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  -[CATRemoteConnection secureUsingIdentity:trustedCertificates:isServer:](self, "secureUsingIdentity:trustedCertificates:isServer:", a3, v7, 0);
}

- (void)secureUsingServerIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4
{
  NSObject *v6;
  id v7;

  v7 = a4;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  -[CATRemoteConnection secureUsingIdentity:trustedCertificates:isServer:](self, "secureUsingIdentity:trustedCertificates:isServer:", a3, v7, 1);
}

- (void)open
{
  NSObject *v4;
  int64_t mState;
  NSError *mInterruptionError;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *mConnectionTimeoutTimer;
  OS_dispatch_source *v35;
  double v36;
  NSObject *v37;
  NSObject *v38;
  double v39;
  NSObject *v40;
  OS_dispatch_source *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD handler[4];
  NSObject *v47;
  id v48;
  id location;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mState = self->mState;
  if (mState == 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 249, CFSTR("%@ cannot call %@ when invalidated."), self, v44);

    mState = self->mState;
  }
  if (mState == 3)
  {
    self->mState = 1;
    mInterruptionError = self->mInterruptionError;
    self->mInterruptionError = 0;

    mState = self->mState;
  }
  if (!mState)
  {
    CATErrorWithCodeAndUserInfo(104, 0);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:");

    return;
  }
  -[CATRemoteConnection inputStream](self, "inputStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "streamError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v52 = *MEMORY[0x24BDD1398];
    -[CATRemoteConnection inputStream](self, "inputStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "streamError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 101;
LABEL_11:
    CATErrorWithCodeAndUserInfo(v12, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v15);

    return;
  }
  -[CATRemoteConnection outputStream](self, "outputStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "streamError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v50 = *MEMORY[0x24BDD1398];
    -[CATRemoteConnection outputStream](self, "outputStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "streamError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 102;
    goto LABEL_11;
  }
  -[CATRemoteConnection inputStream](self, "inputStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[CATRemoteConnection outputStream](self, "outputStream");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  -[CATRemoteConnection socketOptions](self, "socketOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "adaptiveWriteTimeout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CATRemoteConnection socketOptions](self, "socketOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "adaptiveWriteTimeout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    if (v22 >= 1)
    {
      -[CATRemoteConnection inputStream](self, "inputStream");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BDB7648];
      objc_msgSend(v23, "setProperty:forKey:", v24, *MEMORY[0x24BDB7648]);

      -[CATRemoteConnection outputStream](self, "outputStream");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setProperty:forKey:", v27, v25);

    }
  }
  -[CATRemoteConnection inputStream](self, "inputStream");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "streamStatus");

  if (!v29)
  {
    -[CATRemoteConnection inputStream](self, "inputStream");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "open");

  }
  -[CATRemoteConnection outputStream](self, "outputStream");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "streamStatus");

  if (!v32)
  {
    -[CATRemoteConnection outputStream](self, "outputStream");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "open");

  }
  mConnectionTimeoutTimer = self->mConnectionTimeoutTimer;
  if (mConnectionTimeoutTimer)
  {
    dispatch_source_cancel(mConnectionTimeoutTimer);
    v35 = self->mConnectionTimeoutTimer;
    self->mConnectionTimeoutTimer = 0;

  }
  -[CATRemoteConnection connectionTimeoutInterval](self, "connectionTimeoutInterval");
  if (v36 > 0.0)
  {
    CATGetCatalystQueue();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v37);

    -[CATRemoteConnection connectionTimeoutInterval](self, "connectionTimeoutInterval");
    dispatch_source_set_timer(v38, 0, (unint64_t)(v39 * 1000000000.0), 0);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __27__CATRemoteConnection_open__block_invoke;
    handler[3] = &unk_24C1C5D58;
    v40 = v38;
    v47 = v40;
    objc_copyWeak(&v48, &location);
    dispatch_source_set_event_handler(v40, handler);
    v41 = self->mConnectionTimeoutTimer;
    self->mConnectionTimeoutTimer = (OS_dispatch_source *)v40;
    v42 = v40;

    dispatch_resume((dispatch_object_t)self->mConnectionTimeoutTimer);
    objc_destroyWeak(&v48);

    objc_destroyWeak(&location);
  }
}

void __27__CATRemoteConnection_open__block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (!dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 32)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "connectionTimedOut");

  }
}

- (void)close
{
  NSObject *v3;
  int64_t mState;
  NSObject *mConnectionTimeoutTimer;
  OS_dispatch_source *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CATHTTPMessageParser *mMessageParser;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  mState = self->mState;
  if (mState != 4)
  {
    mConnectionTimeoutTimer = self->mConnectionTimeoutTimer;
    if (mConnectionTimeoutTimer)
    {
      dispatch_source_cancel(mConnectionTimeoutTimer);
      v6 = self->mConnectionTimeoutTimer;
      self->mConnectionTimeoutTimer = 0;

      mState = self->mState;
    }
    if (mState >= 1)
      -[CATRemoteConnection unscheduleStreams](self, "unscheduleStreams");
    -[CATRemoteConnection inputStream](self, "inputStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    -[CATRemoteConnection outputStream](self, "outputStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", 0);

    -[CATRemoteConnection inputStream](self, "inputStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "close");

    -[CATRemoteConnection outputStream](self, "outputStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "close");

    -[CATRemoteConnection setInputStream:](self, "setInputStream:", 0);
    -[CATRemoteConnection setOutputStream:](self, "setOutputStream:", 0);
    -[CATHTTPMessageParser setDelegate:](self->mMessageParser, "setDelegate:", 0);
    mMessageParser = self->mMessageParser;
    self->mMessageParser = 0;

    self->mState = 4;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->mPendingSendContexts;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
          CATErrorWithCodeAndUserInfo(100, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CATRemoteConnection sendDidFail:withError:](self, "sendDidFail:withError:", v17, v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    -[CATSerialOperationQueue cancelAllOperations](self->mStreamEventQueue, "cancelAllOperations");
    -[CATSerialOperationQueue setSuspended:](self->mStreamEventQueue, "setSuspended:", 0);
    -[NSMutableArray removeAllObjects](self->mPendingSendContexts, "removeAllObjects");
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __28__CATRemoteConnection_close__block_invoke;
    v20[3] = &unk_24C1C5A60;
    v20[4] = self;
    objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setName:", CFSTR("Connection did close"));
    -[CATSerialOperationQueue addOperation:](self->mStreamEventQueue, "addOperation:", v19);

  }
}

uint64_t __28__CATRemoteConnection_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delegateDidClose");
}

- (void)scheduleStreams
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATSerialOperationQueue setSuspended:](self->mStreamEventQueue, "setSuspended:", 0);
  -[CATRemoteConnection inputStream](self, "inputStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATGetCatalystQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x20BD10544](v4, v5);

  -[CATRemoteConnection outputStream](self, "outputStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CATGetCatalystQueue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x20BD10580](v6, v7);

  -[CATRemoteConnection inputStream](self, "inputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(CFSTR("_scheduleInCFRunLoop:forMode:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CATRemoteConnection inputStream](self, "inputStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "streamStatus") == 2)
    {
      -[CATRemoteConnection inputStream](self, "inputStream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasBytesAvailable");

      if (!v11)
        goto LABEL_7;
      -[CATRemoteConnection inputStream](self, "inputStream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFReadStreamSignalEvent();
    }
    else
    {

    }
  }

LABEL_7:
  -[CATRemoteConnection outputStream](self, "outputStream");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(CFSTR("_scheduleInCFRunLoop:forMode:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CATRemoteConnection outputStream](self, "outputStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "streamStatus") == 2)
    {
      -[CATRemoteConnection outputStream](self, "outputStream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasSpaceAvailable");

      if (!v14)
        return;
      -[CATRemoteConnection outputStream](self, "outputStream");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      CFWriteStreamSignalEvent();
    }
    else
    {

    }
  }

}

- (void)unscheduleStreams
{
  NSObject *v3;
  void *v4;
  id v5;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATSerialOperationQueue setSuspended:](self->mStreamEventQueue, "setSuspended:", 1);
  -[CATRemoteConnection inputStream](self, "inputStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x20BD10544](v4, 0);

  -[CATRemoteConnection outputStream](self, "outputStream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x20BD10580](v5, 0);

}

- (BOOL)secureUsingIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4 isServer:(BOOL)a5
{
  _BOOL8 v5;
  NSArray *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *mTrustedCertificates;
  void *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  char v27;
  BOOL v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v5 = a5;
  v34[1] = *MEMORY[0x24BDAC8D0];
  v9 = (NSArray *)a4;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v10);

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 398, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

  }
  if (self->mState == 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 399, CFSTR("%@ cannot call %@ when invalidated."), self, v33);

  }
  -[CATRemoteConnection inputStream](self, "inputStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDB77B0];
  objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BDB77B0]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x24BDBD1B8];
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDB7810]);

  objc_msgSend(v17, "addEntriesFromDictionary:", v16);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BDB7828], *MEMORY[0x24BDB77F8]);
  v34[0] = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDB77E0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9 == 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDB7818]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDB77F0]);

  mTrustedCertificates = self->mTrustedCertificates;
  self->mTrustedCertificates = v9;

  -[CATRemoteConnection inputStream](self, "inputStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATRemoteConnection setUsesSSL:](self, "setUsesSSL:", objc_msgSend(v23, "setProperty:forKey:", v17, v12));

  v24 = -[CATRemoteConnection usesSSL](self, "usesSSL");
  v25 = -[CATRemoteConnection usesSSL](self, "usesSSL");
  if (!v9 || !v25 || !v5)
  {
    if (v24)
      goto LABEL_11;
LABEL_13:
    CATErrorWithCodeAndUserInfo(107, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v29);

    v28 = 0;
    goto LABEL_14;
  }
  -[CATRemoteConnection inputStream](self, "inputStream");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "setProperty:forKey:", &unk_24C1D8E00, *MEMORY[0x24BDB7640]);

  if ((v27 & 1) == 0)
    goto LABEL_13;
LABEL_11:
  -[CATRemoteConnection delegateWillSecure](self, "delegateWillSecure");
  v28 = 1;
LABEL_14:

  return v28;
}

- (void)tryEvaluatingPeerTrustWithStream:(id)a3
{
  id v4;
  NSObject *v5;
  __SecTrust *v6;
  OSStatus v7;
  OSStatus TrustResult;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  CATRemoteConnectionTrustDecision *v16;
  void *v17;
  char v18;
  void *v19;
  SecTrustResultType result;
  uint64_t v21;
  void *v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  v6 = (__SecTrust *)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BDB77A8]);
  if (v6)
  {
    result = kSecTrustResultInvalid;
    v7 = SecTrustSetAnchorCertificates(v6, (CFArrayRef)self->mTrustedCertificates);
    if (v7
      || (v7 = SecTrustSetAnchorCertificatesOnly(v6, 1u)) != 0
      || (v7 = -[CATRemoteConnection applyCustomEvaluationPoliciesToTrust:](self, "applyCustomEvaluationPoliciesToTrust:", v6)) != 0)
    {
      TrustResult = v7;
      v9 = 0;
    }
    else
    {
      *(_QWORD *)buf = 0;
      if (SecTrustEvaluateWithError(v6, (CFErrorRef *)buf))
        v9 = 0;
      else
        v9 = *(void **)buf;
      TrustResult = SecTrustGetTrustResult(v6, &result);
    }
    if (_CATLogGeneral_onceToken_5 != -1)
      dispatch_once(&_CATLogGeneral_onceToken_5, &__block_literal_global_9);
    v10 = (void *)_CATLogGeneral_logObj_5;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_5, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = result;
      v13 = v10;
      objc_msgSend(v11, "numberWithUnsignedInt:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_209592000, v13, OS_LOG_TYPE_INFO, "trust result: %@", buf, 0xCu);

    }
    if (!TrustResult)
    {
      switch(result)
      {
        case kSecTrustResultProceed:
          goto LABEL_16;
        case kSecTrustResultRecoverableTrustFailure:
          self->mPeerTrustState = 3;
          v16 = -[CATRemoteConnectionTrustDecision initWithConnection:trust:]([CATRemoteConnectionTrustDecision alloc], "initWithConnection:trust:", self, v6);
          -[CATRemoteConnection delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_opt_respondsToSelector();

          if ((v18 & 1) != 0)
          {
            -[CATRemoteConnection delegate](self, "delegate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "connection:encounteredTrustDecisionWhileTryingToSecure:", self, v16);

          }
          goto LABEL_19;
        case kSecTrustResultUnspecified:
LABEL_16:
          self->mPeerTrustState = 1;
          -[CATRemoteConnection delegateDidSecure](self, "delegateDidSecure");
LABEL_20:

          return;
      }
    }
    if (v9)
    {
      v21 = *MEMORY[0x24BDD1398];
      v22 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(106, v15);
      v16 = (CATRemoteConnectionTrustDecision *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CATErrorWithCodeAndUserInfo(106, 0);
      v16 = (CATRemoteConnectionTrustDecision *)objc_claimAutoreleasedReturnValue();
    }
    self->mPeerTrustState = 2;
    -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v16);
LABEL_19:

    goto LABEL_20;
  }
}

- (int)applyCustomEvaluationPoliciesToTrust:(__SecTrust *)a3
{
  void *v4;
  OSStatus v5;

  -[CATRemoteConnection customTrustEvaluationPolicies](self, "customTrustEvaluationPolicies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = SecTrustSetPolicies(a3, v4);
  else
    v5 = 0;

  return v5;
}

- (void)trustDecisionDidRespondWithDecisionToAllowUntrustedConnection:(BOOL)a3
{
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD block[4];
  id v9;

  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__CATRemoteConnection_trustDecisionDidRespondWithDecisionToAllowUntrustedConnection___block_invoke;
  v6[3] = &unk_24C1C5D80;
  v7 = a3;
  v6[4] = self;
  v4 = v6;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_5;
  block[3] = &unk_24C1C5998;
  v9 = v4;
  dispatch_async(v5, block);

}

void __85__CATRemoteConnection_trustDecisionDidRespondWithDecisionToAllowUntrustedConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    *(_QWORD *)(v2 + 64) = 1;
    objc_msgSend(*(id *)(a1 + 32), "delegateDidSecure");
    objc_msgSend(*(id *)(a1 + 32), "connectionShouldSendData");
    objc_msgSend(*(id *)(a1 + 32), "connectionDidReceiveData");
  }
  else
  {
    *(_QWORD *)(v2 + 64) = 2;
    v3 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(106, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connectionDidInterruptWithError:", v4);

  }
}

- (void)configureStreamSocketOptions
{
  NSObject *v3;
  __CFReadStream *v4;
  const __CFData *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  CATAddress *v10;
  void *v11;
  void *v12;
  void *v13;
  signed int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  socklen_t v37;
  UInt8 buffer[4];
  CFRange v39;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATRemoteConnection inputStream](self, "inputStream");
  v4 = (__CFReadStream *)objc_claimAutoreleasedReturnValue();
  v5 = (const __CFData *)CFReadStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x24BDBD5D8]);

  if (v5)
  {
    *(_DWORD *)buffer = 0;
    v39.location = 0;
    v39.length = 4;
    CFDataGetBytes(v5, v39, buffer);
    CFRelease(v5);
    -[CATRemoteConnection name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 28);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v7, "length");
      v8 = *(_DWORD *)buffer;
      v9 = objc_retainAutorelease(v7);
      if (!getpeername(v8, (sockaddr *)objc_msgSend(v9, "mutableBytes"), &v37))
      {
        objc_msgSend(v9, "setLength:", v37);
        v10 = -[CATAddress initWithData:]([CATAddress alloc], "initWithData:", v9);
        -[CATAddress address](v10, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CATRemoteConnection setName:](self, "setName:", v11);

      }
    }
    -[CATRemoteConnection socketOptions](self, "socketOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keepAliveEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    v37 = v14;
    if (v14 >= 1)
    {
      if (setsockopt(*(int *)buffer, 0xFFFF, 8, &v37, 4u) < 0)
        goto LABEL_16;
      -[CATRemoteConnection socketOptions](self, "socketOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "keepAliveDelay");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[CATRemoteConnection socketOptions](self, "socketOptions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "keepAliveDelay");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");

        v36 = v19;
        if (setsockopt(*(int *)buffer, 6, 16, &v36, 4u) < 0)
          goto LABEL_16;
      }
      -[CATRemoteConnection socketOptions](self, "socketOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "keepAliveInterval");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[CATRemoteConnection socketOptions](self, "socketOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "keepAliveInterval");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        v36 = v24;
        if (setsockopt(*(int *)buffer, 6, 257, &v36, 4u) < 0)
          goto LABEL_16;
      }
      -[CATRemoteConnection socketOptions](self, "socketOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "keepAliveCount");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[CATRemoteConnection socketOptions](self, "socketOptions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "keepAliveCount");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "intValue");

        v36 = v29;
        if (setsockopt(*(int *)buffer, 6, 258, &v36, 4u) < 0)
          goto LABEL_16;
      }
      -[CATRemoteConnection socketOptions](self, "socketOptions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "netServiceType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[CATRemoteConnection socketOptions](self, "socketOptions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "netServiceType");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "intValue");

        v36 = v34;
        if (setsockopt(*(int *)buffer, 0xFFFF, 4374, &v36, 4u) < 0)
        {
LABEL_16:
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v35);

        }
      }
    }
  }
}

- (void)connectionTimedOut
{
  NSObject *v3;
  id v4;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  CATErrorWithCodeAndUserInfo(105, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v4);

}

- (void)connectionShouldSendData
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[NSMutableArray lastObject](self->mPendingSendContexts, "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = 0;
    while (1)
    {
      v7 = v6;
      v10 = v6;
      v8 = -[CATRemoteConnection trySendingDataWithContext:error:](self, "trySendingDataWithContext:error:", v5, &v10);
      v6 = v10;

      if (!v8)
        break;
      if ((objc_msgSend(v5, "hasBytesRemaining") & 1) == 0)
      {
        -[NSMutableArray removeLastObject](self->mPendingSendContexts, "removeLastObject");
        -[CATRemoteConnection sendDidSucceed:](self, "sendDidSucceed:", v5);
        -[NSMutableArray lastObject](self->mPendingSendContexts, "lastObject");
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v9;
        if (v9)
          continue;
      }
      goto LABEL_8;
    }
    -[CATRemoteConnection sendDidFail:withError:](self, "sendDidFail:withError:", v5, v6);
LABEL_8:

  }
}

- (void)enqueueSendContext:(id)a3
{
  NSObject *v4;
  int64_t mState;
  uint64_t v6;
  NSError *v7;
  NSError *v8;
  id v9;

  v9 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mState = self->mState;
  if (mState)
  {
    if (mState == 3)
    {
      v7 = self->mInterruptionError;
      goto LABEL_11;
    }
    if (mState == 4)
    {
      v6 = 100;
    }
    else
    {
      if (!-[CATRemoteConnection usesSSL](self, "usesSSL") || self->mPeerTrustState != 2)
        goto LABEL_13;
      v6 = 106;
    }
  }
  else
  {
    v6 = 104;
  }
  CATErrorWithCodeAndUserInfo(v6, 0);
  v7 = (NSError *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v8 = v7;
  if (v7)
  {
    -[CATRemoteConnection sendDidFail:withError:](self, "sendDidFail:withError:", v9, v7);

    goto LABEL_16;
  }
LABEL_13:
  -[NSMutableArray insertObject:atIndex:](self->mPendingSendContexts, "insertObject:atIndex:", v9, 0);
  if (!-[CATRemoteConnection usesSSL](self, "usesSSL") || self->mPeerTrustState == 1)
    -[CATRemoteConnection connectionShouldSendData](self, "connectionShouldSendData");
LABEL_16:

}

- (BOOL)trySendingDataWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  v26 = 0;
  objc_msgSend(v6, "bufferedDataWithError:", &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  if (objc_msgSend(v8, "length"))
  {
    while (1)
    {
      -[CATRemoteConnection outputStream](self, "outputStream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasSpaceAvailable");

      if (!v11)
        break;
      -[CATRemoteConnection outputStream](self, "outputStream");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_retainAutorelease(v8);
      v14 = objc_msgSend(v12, "write:maxLength:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

      if (v14 < 1)
      {
        if ((v14 & 0x8000000000000000) == 0)
        {
          v8 = v13;
          break;
        }
        -[CATRemoteConnection outputStream](self, "outputStream");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "streamError");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v29 = *MEMORY[0x24BDD1398];
          -[CATRemoteConnection outputStream](self, "outputStream");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "streamError");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v23;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          CATErrorWithCodeAndUserInfo(102, v24);
          v18 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          CATErrorWithCodeAndUserInfo(102, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }

        if (a4)
          goto LABEL_16;
        goto LABEL_17;
      }
      objc_msgSend(v6, "setBytesWritten:", objc_msgSend(v6, "bytesWritten") + v14);
      v25 = v9;
      objc_msgSend(v6, "bufferedDataWithError:", &v25);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;

      if (objc_msgSend(v6, "clientBytesWritten"))
        -[CATRemoteConnection delegateDidWriteDataForContextIfNeeded:](self, "delegateDidWriteDataForContextIfNeeded:", v6);
      v9 = v15;
      if (!objc_msgSend(v8, "length"))
      {
        if (!v8)
          goto LABEL_12;
        goto LABEL_8;
      }
    }
  }
  v15 = v9;
  if (v8)
  {
LABEL_8:
    v16 = 1;
  }
  else
  {
LABEL_12:
    if (v15)
    {
      v27 = *MEMORY[0x24BDD1398];
      v28 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(102, v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CATErrorWithCodeAndUserInfo(102, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
    v9 = v15;
    if (a4)
    {
LABEL_16:
      v18 = objc_retainAutorelease(v18);
      *a4 = v18;
    }
LABEL_17:

    v16 = 0;
    v8 = v13;
    v15 = v9;
  }

  return v16;
}

- (void)sendDidSucceed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection delegateDidSendData:userInfo:](self, "delegateDidSendData:userInfo:", v5, v6);
  }
  else
  {
    objc_msgSend(v7, "stream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection delegateDidSendDataWithStream:userInfo:](self, "delegateDidSendDataWithStream:userInfo:", v5, v6);
  }

}

- (void)sendDidFail:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection delegateDidFailToSendData:userInfo:error:](self, "delegateDidFailToSendData:userInfo:error:", v8, v9, v6);
  }
  else
  {
    objc_msgSend(v10, "stream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection delegateDidFailToSendDataWithStream:userInfo:error:](self, "delegateDidFailToSendDataWithStream:userInfo:error:", v8, v9, v6);
  }

}

- (void)connectionDidReceiveData
{
  NSObject *v3;
  void *v4;
  int v5;
  NSMutableData *v6;
  NSMutableData *mReadBuffer;
  void *v8;
  uint64_t v9;
  CATHTTPMessageParser *mMessageParser;
  id v11;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATRemoteConnection inputStream](self, "inputStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasBytesAvailable");

  if (v5)
  {
    if (!self->mReadBuffer)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", -[CATRemoteConnection bufferSize](self, "bufferSize"));
      v6 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      mReadBuffer = self->mReadBuffer;
      self->mReadBuffer = v6;

    }
    -[CATRemoteConnection inputStream](self, "inputStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "read:maxLength:", -[NSMutableData mutableBytes](self->mReadBuffer, "mutableBytes"), -[NSMutableData length](self->mReadBuffer, "length"));

    if (v9 >= 1)
    {
      mMessageParser = self->mMessageParser;
      if (mMessageParser)
      {
        if (!-[CATHTTPMessageParser appendBytes:length:](mMessageParser, "appendBytes:length:", -[NSMutableData bytes](self->mReadBuffer, "bytes"), v9))
        {
          CATErrorWithCodeAndUserInfo(300, 0);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v11);

        }
      }
    }
  }
}

- (void)connectionDidInterruptWithError:(id)a3
{
  id v6;
  NSObject *v7;
  int64_t mState;
  NSObject *mConnectionTimeoutTimer;
  OS_dispatch_source *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  mState = self->mState;
  if ((unint64_t)(mState - 3) >= 2)
  {
    if (mState)
    {
      objc_storeStrong((id *)&self->mInterruptionError, a3);
      self->mState = 3;
    }
    mConnectionTimeoutTimer = self->mConnectionTimeoutTimer;
    if (mConnectionTimeoutTimer)
    {
      dispatch_source_cancel(mConnectionTimeoutTimer);
      v10 = self->mConnectionTimeoutTimer;
      self->mConnectionTimeoutTimer = 0;

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->mPendingSendContexts;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          -[CATRemoteConnection sendDidFail:withError:](self, "sendDidFail:withError:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), v6);
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    -[NSMutableArray removeAllObjects](self->mPendingSendContexts, "removeAllObjects");
    -[CATRemoteConnection delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v6);
  }

}

- (void)delegateWillSecure
{
  void *v3;
  char v4;
  id v5;

  -[CATRemoteConnection delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectionWillSecure:", self);

  }
}

- (void)delegateDidSecure
{
  void *v3;
  char v4;
  id v5;

  -[CATRemoteConnection delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectionDidSecure:", self);

  }
}

- (void)delegateDidSendData:(id)a3 userInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  -[CATRemoteConnection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection:didSendData:userInfo:", self, v11, v6);

  }
}

- (void)delegateDidFailToSendData:(id)a3 userInfo:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v10);

  -[CATRemoteConnection delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connection:didFailToSendData:userInfo:error:", self, v14, v8, v9);

  }
}

- (void)delegateDidReceiveData:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[CATRemoteConnection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection:didReceiveData:", self, v8);

  }
}

- (void)delegateDidReceiveDataRequestWithURL:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[CATRemoteConnection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection:didReceiveDataRequestWithURL:", self, v8);

  }
}

- (void)delegateDidWriteDataForContextIfNeeded:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v10;
    objc_msgSend(v5, "stream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "clientBytesWritten");
    v8 = objc_msgSend(v5, "dataLength");
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CATRemoteConnection delegateDidWriteDataFromStream:totalBytesWritten:totalBytesExpectedToWrite:userInfo:](self, "delegateDidWriteDataFromStream:totalBytesWritten:totalBytesExpectedToWrite:userInfo:", v6, v7, v8, v9);
  }

}

- (void)delegateDidWriteDataFromStream:(id)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5 userInfo:(id)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a6;
  CATGetCatalystQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v11);

  -[CATRemoteConnection delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "connection:didWriteDataFromStream:totalBytesWritten:totalBytesExpectedToWrite:userInfo:", self, v15, a4, a5, v10);

  }
}

- (void)delegateDidSendDataWithStream:(id)a3 userInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  -[CATRemoteConnection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection:didSendDataWithStream:userInfo:", self, v11, v6);

  }
}

- (void)delegateDidFailToSendDataWithStream:(id)a3 userInfo:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v10);

  -[CATRemoteConnection delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connection:didFailToSendDataWithStream:userInfo:error:", self, v14, v8, v9);

  }
}

- (void)delegateDidReceiveStreamData:(id)a3 moreComing:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  -[CATRemoteConnection delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connection:didReceiveStreamData:moreComing:", self, v10, v4);

  }
}

- (void)delegateDidOpen
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATRemoteConnection delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionDidOpen:", self);

  }
}

- (void)delegateDidClose
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATRemoteConnection delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionDidClose:", self);

  }
}

- (void)delegateDidInterruptWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[CATRemoteConnection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATRemoteConnection delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection:didInterruptWithError:", self, v8);

  }
}

- (void)messageParser:(id)a3 didParseRequestData:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  if (self->mState != 4)
    -[CATRemoteConnection delegateDidReceiveData:](self, "delegateDidReceiveData:", v6);

}

- (void)messageParser:(id)a3 didParseResponseData:(id)a4 moreComing:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v7;
  id v8;

  v5 = a5;
  v8 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  if (self->mState != 4)
    -[CATRemoteConnection delegateDidReceiveStreamData:moreComing:](self, "delegateDidReceiveStreamData:moreComing:", v8, v5);

}

- (void)messageParser:(id)a3 didParseRequestWithURL:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  if (self->mState != 4)
    -[CATRemoteConnection delegateDidReceiveDataRequestWithURL:](self, "delegateDidReceiveDataRequestWithURL:", v6);

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  NSObject *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  _QWORD block[4];
  id v16;

  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__CATRemoteConnection_stream_handleEvent___block_invoke;
  v12[3] = &unk_24C1C5DA8;
  v12[4] = self;
  v13 = v6;
  v14 = a4;
  v8 = v12;
  v9 = v6;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v8;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_5;
  block[3] = &unk_24C1C5998;
  v16 = v11;
  dispatch_async(v10, block);

}

void __42__CATRemoteConnection_stream_handleEvent___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __42__CATRemoteConnection_stream_handleEvent___block_invoke_2;
  v7[3] = &unk_24C1C5DA8;
  v2 = (void *)a1[5];
  v7[4] = a1[4];
  v3 = (void *)MEMORY[0x24BDD1478];
  v7[1] = 3221225472;
  v4 = v2;
  v5 = a1[6];
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "blockOperationWithBlock:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", CFSTR("Handle Stream Event Operation"));
  objc_msgSend(*(id *)(a1[4] + 72), "addOperation:", v6);

}

_QWORD *__42__CATRemoteConnection_stream_handleEvent___block_invoke_2(_QWORD *a1)
{
  _QWORD *result;

  result = (_QWORD *)a1[4];
  if (result[2] != 4)
    return (_QWORD *)objc_msgSend(result, "_stream:handleEvent:", a1[5], a1[6]);
  return result;
}

- (void)_stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  switch(a4)
  {
    case 1uLL:
      if (self->mState == 1)
      {
        -[CATRemoteConnection inputStream](self, "inputStream");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v8, "streamStatus") <= 1)
          goto LABEL_26;
        -[CATRemoteConnection outputStream](self, "outputStream");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "streamStatus");

        if (v10 >= 2)
        {
          self->mState = 2;
          -[CATRemoteConnection configureStreamSocketOptions](self, "configureStreamSocketOptions");
          -[CATRemoteConnection delegateDidOpen](self, "delegateDidOpen");
        }
      }
      goto LABEL_27;
    case 2uLL:
      if (-[CATRemoteConnection usesSSL](self, "usesSSL") && !self->mPeerTrustState)
        -[CATRemoteConnection tryEvaluatingPeerTrustWithStream:](self, "tryEvaluatingPeerTrustWithStream:", v6);
      if (!-[CATRemoteConnection usesSSL](self, "usesSSL") || self->mPeerTrustState == 1)
        -[CATRemoteConnection connectionDidReceiveData](self, "connectionDidReceiveData");
      goto LABEL_27;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_27;
    case 4uLL:
      if (-[CATRemoteConnection usesSSL](self, "usesSSL") && !self->mPeerTrustState)
        -[CATRemoteConnection tryEvaluatingPeerTrustWithStream:](self, "tryEvaluatingPeerTrustWithStream:", v6);
      if (!-[CATRemoteConnection usesSSL](self, "usesSSL") || self->mPeerTrustState == 1)
        -[CATRemoteConnection connectionShouldSendData](self, "connectionShouldSendData");
      goto LABEL_27;
    case 8uLL:
      -[CATRemoteConnection inputStream](self, "inputStream");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v6)
      {
        v20 = *MEMORY[0x24BDD1398];
        -[CATRemoteConnection inputStream](self, "inputStream");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "streamError");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 101;
        goto LABEL_25;
      }
      -[CATRemoteConnection outputStream](self, "outputStream");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v6)
      {
        v18 = *MEMORY[0x24BDD1398];
        -[CATRemoteConnection outputStream](self, "outputStream");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "streamError");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 102;
LABEL_25:
        CATErrorWithCodeAndUserInfo(v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v17);

        goto LABEL_26;
      }
LABEL_27:

      return;
    default:
      if (a4 == 16)
      {
        -[CATRemoteConnection inputStream](self, "inputStream");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v6)
        {
          CATErrorWithCodeAndUserInfo(103, 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:", v8);
LABEL_26:

        }
      }
      goto LABEL_27;
  }
}

- (CATRemoteConnectionDelegate)delegate
{
  return (CATRemoteConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)usesSSL
{
  return self->_usesSSL;
}

- (void)setUsesSSL:(BOOL)a3
{
  self->_usesSSL = a3;
}

- (double)connectionTimeoutInterval
{
  return self->_connectionTimeoutInterval;
}

- (void)setConnectionTimeoutInterval:(double)a3
{
  self->_connectionTimeoutInterval = a3;
}

- (CATRemoteConnectionSocketOptions)socketOptions
{
  return self->_socketOptions;
}

- (void)setSocketOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)customTrustEvaluationPolicies
{
  return self->_customTrustEvaluationPolicies;
}

- (void)setCustomTrustEvaluationPolicies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
  objc_storeStrong((id *)&self->_inputStream, a3);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_outputStream, a3);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_customTrustEvaluationPolicies, 0);
  objc_storeStrong((id *)&self->_socketOptions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mStreamEventQueue, 0);
  objc_storeStrong((id *)&self->mTrustedCertificates, 0);
  objc_storeStrong((id *)&self->mReadBuffer, 0);
  objc_storeStrong((id *)&self->mInterruptionError, 0);
  objc_storeStrong((id *)&self->mConnectionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->mPendingSendContexts, 0);
  objc_storeStrong((id *)&self->mMessageParser, 0);
}

@end
