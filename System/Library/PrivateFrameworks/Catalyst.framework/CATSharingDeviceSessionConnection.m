@implementation CATSharingDeviceSessionConnection

- (CATSharingDeviceSessionConnection)initWithDeviceSession:(id)a3 timerSource:(id)a4
{
  id v7;
  id v8;
  CATSharingDeviceSessionConnection *v9;
  CATSharingDeviceSessionConnection *v10;
  uint64_t v11;
  CATOperationQueue *mOutgoingQueue;
  uint64_t v13;
  CATOperationQueue *mCatalystQueue;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CATSharingDeviceSessionConnection;
  v9 = -[CATSharingDeviceSessionConnection init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mDeviceSession, a3);
    objc_storeStrong((id *)&v10->mTimerSource, a4);
    -[CATSharingDeviceSessionConnection addDeviceSessionHandlers](v10, "addDeviceSessionHandlers");
    v11 = objc_opt_new();
    mOutgoingQueue = v10->mOutgoingQueue;
    v10->mOutgoingQueue = (CATOperationQueue *)v11;

    v13 = objc_opt_new();
    mCatalystQueue = v10->mCatalystQueue;
    v10->mCatalystQueue = (CATOperationQueue *)v13;

    CATGetCatalystQueue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setUnderlyingQueue:](v10->mCatalystQueue, "setUnderlyingQueue:", v15);

  }
  return v10;
}

- (CATSharingDevice)remoteDevice
{
  return (CATSharingDevice *)-[CATSharingDeviceSession remoteDevice](self->mDeviceSession, "remoteDevice");
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__CATSharingDeviceSessionConnection_sendData_completion___block_invoke;
  v13[3] = &unk_24C1C5BB0;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = v13;
  CATGetCatalystQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_3;
  block[3] = &unk_24C1C5998;
  v19 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __57__CATSharingDeviceSessionConnection_sendData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_sendData:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)close
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD block[4];
  id v9;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__CATSharingDeviceSessionConnection_close__block_invoke;
  v5[3] = &unk_24C1C58B0;
  objc_copyWeak(&v6, &location);
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_3;
  block[3] = &unk_24C1C5998;
  v9 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__CATSharingDeviceSessionConnection_close__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_close");

}

- (void)_sendData:(id)a3 completion:(id)a4
{
  void (**v6)(id, CATSharingSentMessage *);
  NSObject *v7;
  CATSharingSentMessage *v8;
  CATSharingMessage *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, CATSharingSentMessage *))a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  if (self->mIsClosing || -[CATSharingDeviceSessionConnection isClosed](self, "isClosed"))
  {
    CATErrorWithCodeAndUserInfo(100, 0);
    v8 = (CATSharingSentMessage *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
  }
  else
  {
    v8 = -[CATSharingSentMessage initWithContent:]([CATSharingSentMessage alloc], "initWithContent:", v10);
    v9 = -[CATSharingMessage initWithContentMessage:]([CATSharingMessage alloc], "initWithContentMessage:", v8);
    -[CATSharingDeviceSessionConnection sendMessage:completion:](self, "sendMessage:completion:", v9, v6);

  }
}

- (void)_close
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (!-[CATSharingDeviceSessionConnection isClosed](self, "isClosed") && !self->mIsClosing)
    -[CATSharingDeviceSessionConnection closeWithError:reportToRemote:](self, "closeWithError:reportToRemote:", 0, 1);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  uint64_t *p_mDeviceSession;
  CATSendDeviceSessionMessageOperation *v11;
  void *v12;
  CATSendDeviceSessionMessageOperation *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  CATSendDeviceSessionMessageOperation *v22;
  void (**v23)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  if (-[CATSharingDeviceSessionConnection isClosed](self, "isClosed"))
  {
    v9 = 100;
LABEL_8:
    CATErrorWithCodeAndUserInfo(v9, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);

    goto LABEL_9;
  }
  p_mDeviceSession = (uint64_t *)&self->mDeviceSession;
  if ((-[CATSharingDeviceSession isReady](self->mDeviceSession, "isReady") & 1) == 0)
  {
    _CATLogGeneral_1();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CATSharingDeviceSessionConnection sendMessage:completion:].cold.1(p_mDeviceSession, v15, v16);

    v9 = 504;
    goto LABEL_8;
  }
  v11 = -[CATSendDeviceSessionMessageOperation initWithDeviceSession:message:]([CATSendDeviceSessionMessageOperation alloc], "initWithDeviceSession:message:", self->mDeviceSession, v6);
  v12 = (void *)MEMORY[0x24BDD1478];
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke;
  v21 = &unk_24C1C5D08;
  v22 = v11;
  v23 = v7;
  v13 = v11;
  objc_msgSend(v12, "blockOperationWithBlock:", &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addDependency:", v13, v18, v19, v20, v21);
  -[CATOperationQueue addOperation:](self->mOutgoingQueue, "addOperation:", v13);
  -[CATOperationQueue addOperation:](self->mCatalystQueue, "addOperation:", v14);

LABEL_9:
}

void __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;

  CATGetCatalystQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v2);

  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v3)
  {
    _CATLogGeneral_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke_cold_1(v3, v4);

  }
}

- (void)closeWithError:(id)a3 reportToRemote:(BOOL)a4
{
  NSObject *v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  if (!-[CATSharingDeviceSessionConnection isClosed](self, "isClosed") && !self->mIsClosing)
  {
    self->mIsClosing = 1;
    if (a4)
      -[CATSharingDeviceSessionConnection sendTearDownMessageWithError:](self, "sendTearDownMessageWithError:", v7);
    else
      -[CATSharingDeviceSessionConnection tombstoneWithError:](self, "tombstoneWithError:", v7);
  }

}

- (void)tombstoneWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (!-[CATSharingDeviceSessionConnection isClosed](self, "isClosed"))
  {
    -[CATSharingDeviceSessionConnection setClosed:](self, "setClosed:", 1);
    self->mIsClosing = 0;
    -[CATOperationQueue cancelAllOperations](self->mOutgoingQueue, "cancelAllOperations");
    -[CATSharingDeviceSessionConnection removeDeviceSessionHandlers](self, "removeDeviceSessionHandlers");
    -[CATSharingDeviceSession deactivate](self->mDeviceSession, "deactivate");
    -[CATSharingDeviceSessionConnection setClosedError:](self, "setClosedError:", v6);
    -[CATSharingDeviceSessionConnection delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectionClosed:", self);

  }
}

- (void)addDeviceSessionHandlers
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke;
  v7[3] = &unk_24C1C5C28;
  objc_copyWeak(&v8, &location);
  v4 = (void *)MEMORY[0x20BD10A78](v7);
  -[CATSharingDeviceSession setDeviceSessionInvalidatedHandler:](self->mDeviceSession, "setDeviceSessionInvalidatedHandler:", v4);
  -[CATSharingDeviceSession setDeviceSessionErrorHandler:](self->mDeviceSession, "setDeviceSessionErrorHandler:", v4);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_3;
  v5[3] = &unk_24C1C5C50;
  objc_copyWeak(&v6, &location);
  -[CATSharingDeviceSession setMessageReceivedHandler:](self->mDeviceSession, "setMessageReceivedHandler:", v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isClosed") & 1) == 0)
  {
    v6 = (void *)v5[6];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_2;
    v7[3] = &unk_24C1C5C00;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

uint64_t __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeWithError:reportToRemote:", *(_QWORD *)(a1 + 40), 0);
}

void __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isClosed") & 1) == 0)
  {
    v6 = (void *)v5[6];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_4;
    v7[3] = &unk_24C1C5C00;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

uint64_t __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveMessage:", *(_QWORD *)(a1 + 40));
}

- (void)removeDeviceSessionHandlers
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATSharingDeviceSession setDeviceSessionInvalidatedHandler:](self->mDeviceSession, "setDeviceSessionInvalidatedHandler:", 0);
  -[CATSharingDeviceSession setDeviceSessionInvalidatedHandler:](self->mDeviceSession, "setDeviceSessionInvalidatedHandler:", 0);
}

- (void)didReceiveMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  +[CATSharingMessage instanceWithDictionary:](CATSharingMessage, "instanceWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "messageType");
    objc_msgSend(v7, "contentDictionaryValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == 1)
    {
      -[CATSharingDeviceSessionConnection handleSentMessage:](self, "handleSentMessage:", v9);
    }
    else if (v8 == 2)
    {
      -[CATSharingDeviceSessionConnection handleCloseMessage:](self, "handleCloseMessage:", v9);
    }
    else
    {
      _CATLogGeneral_1();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CATSharingDeviceSessionConnection didReceiveMessage:].cold.1(v8, v10);

      -[CATSharingDeviceSessionConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v9);
    }

  }
  else
  {
    -[CATSharingDeviceSessionConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v4);
  }

}

- (void)handleUnparsableMessageDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  if (!-[CATSharingDeviceSessionConnection isClosed](self, "isClosed"))
  {
    _CATLogGeneral_1();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CATSharingDeviceSessionConnection handleUnparsableMessageDictionary:].cold.1((uint64_t)v4, v6, v7);

    CATErrorWithCodeAndUserInfo(300, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATSharingDeviceSessionConnection closeWithError:reportToRemote:](self, "closeWithError:reportToRemote:", v8, !self->mIsClosing);

  }
}

- (void)handleCloseMessage:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  +[CATSharingCloseMessage instanceWithDictionary:](CATSharingCloseMessage, "instanceWithDictionary:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!self->mIsClosing)
    {
      objc_msgSend(v5, "closeError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATSharingDeviceSessionConnection closeWithError:reportToRemote:](self, "closeWithError:reportToRemote:", v7, 0);

    }
  }
  else
  {
    -[CATSharingDeviceSessionConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v8);
  }

}

- (void)handleSentMessage:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  +[CATSharingSentMessage instanceWithDictionary:](CATSharingSentMessage, "instanceWithDictionary:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CATSharingDeviceSessionConnection delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connection:receivedData:", self, v7);

  }
  else
  {
    -[CATSharingDeviceSessionConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v8);
  }

}

- (void)sendTearDownMessageWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CATSharingCloseMessage *v8;
  CATSharingMessage *v9;
  uint64_t v10;
  CATTimerSource *mTimerSource;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  CATTimer *v16;
  CATTimer *mTombstoneTimer;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  _QWORD v22[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    CATErrorWithCodeAndUserInfo(103, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = -[CATSharingCloseMessage initWithError:]([CATSharingCloseMessage alloc], "initWithError:", v6);
  v9 = -[CATSharingMessage initWithContentMessage:]([CATSharingMessage alloc], "initWithContentMessage:", v8);
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke;
  v22[3] = &unk_24C1C5D30;
  v22[4] = self;
  -[CATSharingDeviceSessionConnection sendMessage:completion:](self, "sendMessage:completion:", v9, v22);
  objc_initWeak(&location, self);
  mTimerSource = self->mTimerSource;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CATGetCatalystQueue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_9;
  v18[3] = &unk_24C1C5A88;
  objc_copyWeak(&v20, &location);
  v15 = v5;
  v19 = v15;
  -[CATTimerSource scheduleOneShotTimerWithIdentifier:timeInterval:queue:fireHandler:](mTimerSource, "scheduleOneShotTimerWithIdentifier:timeInterval:queue:fireHandler:", v13, v14, v18, 0.5);
  v16 = (CATTimer *)objc_claimAutoreleasedReturnValue();
  mTombstoneTimer = self->mTombstoneTimer;
  self->mTombstoneTimer = v16;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _CATLogGeneral_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_cold_1(a1, v3, v4);

  }
}

void __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isClosed");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "tombstoneWithError:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (CATSharingConnectionDelegate)delegate
{
  return (CATSharingConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (NSError)closedError
{
  return self->_closedError;
}

- (void)setClosedError:(id)a3
{
  objc_storeStrong((id *)&self->_closedError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closedError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mCatalystQueue, 0);
  objc_storeStrong((id *)&self->mOutgoingQueue, 0);
  objc_storeStrong((id *)&self->mTombstoneTimer, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong((id *)&self->mDeviceSession, 0);
}

- (void)sendMessage:(uint64_t)a3 completion:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_209592000, a2, a3, "deviceSession: %{public}@ is not ready, refusing to send it messages.", (uint8_t *)&v4);
}

void __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_209592000, a2, v4, "Error sending message: %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

- (void)didReceiveMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_209592000, a2, v4, "Unknown message type: %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

- (void)handleUnparsableMessageDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_209592000, a2, a3, "Message was unable to be parsed as %{public}@", (uint8_t *)&v3);
}

void __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_209592000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Error sending close message: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
